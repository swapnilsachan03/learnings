import boto3

from fastapi import APIRouter, Cookie, Depends, HTTPException, Response
from db.db import get_db
from db.models.user import User
from helpers.auth_helper import get_secret_hash
from pydantic_models.auth_models import (
    ConfirmSignupRequest,
    LoginRequest,
    SignupRequest,
)
from secret_keys import SecretKeys
from sqlalchemy.orm import Session

router = APIRouter()
secret_keys = SecretKeys()

COGNITO_CLIENT_ID = secret_keys.COGNITO_CLIENT_ID
COGNITO_CLIENT_SECRET = secret_keys.COGNITO_CLIENT_SECRET

cognito_client = boto3.client(
    "cognito-idp", region_name=secret_keys.REGION_NAME
)


@router.post("/signup")
def signup_user(
    data: SignupRequest,
    db: Session = Depends(get_db),
):
    try:
        secret_hash = get_secret_hash(
            data.email,
            COGNITO_CLIENT_ID,
            COGNITO_CLIENT_SECRET,
        )

        cognito_response = cognito_client.sign_up(
            ClientId=COGNITO_CLIENT_ID,
            Username=data.email,
            Password=data.password,
            SecretHash=secret_hash,
            UserAttributes=[
                {"Name": "email", "Value": data.email},
                {"Name": "name", "Value": data.name},
            ],
        )

        cognito_sub = cognito_response.get("UserSub")

        if not cognito_sub:
            raise HTTPException(
                400,
                detail="Cognito did not return a valid user sub",
            )

        new_user = User(
            name=data.name,
            email=data.email,
            cognito_sub=cognito_sub,
        )

        db.add(new_user)
        db.commit()
        db.refresh(new_user)

        return {
            "message": "Signup successful. Please verify your email if required."
        }

    except Exception as e:
        raise HTTPException(400, f"Cognito signup exception: {e}")


@router.post("/confirm-user")
def confirm_signup(data: ConfirmSignupRequest):
    try:
        secret_hash = get_secret_hash(
            data.email,
            COGNITO_CLIENT_ID,
            COGNITO_CLIENT_SECRET,
        )

        cognito_response = cognito_client.confirm_sign_up(
            ClientId=COGNITO_CLIENT_ID,
            Username=data.email,
            ConfirmationCode=data.otp,
            SecretHash=secret_hash,
        )

        return {"message": "Your email is now verified"}

    except Exception as e:
        raise HTTPException(400, f"Cognito signup exception: {e}")


@router.post("/login")
def login_user(data: LoginRequest, response: Response):
    try:
        secret_hash = get_secret_hash(
            data.email,
            COGNITO_CLIENT_ID,
            COGNITO_CLIENT_SECRET,
        )

        cognito_response = cognito_client.initiate_auth(
            ClientId=COGNITO_CLIENT_ID,
            AuthFlow="USER_PASSWORD_AUTH",
            AuthParameters={
                "USERNAME": data.email,
                "PASSWORD": data.password,
                "SECRET_HASH": secret_hash,
            },
        )

        auth_result = cognito_response.get("AuthenticationResult")

        if not auth_result:
            raise HTTPException(400, "Bad request")

        access_token = auth_result.get("AccessToken")
        refresh_token = auth_result.get("RefreshToken")

        response.set_cookie(
            key="access_token",
            value=access_token,
            httponly=True,
            secure=True,
        )

        response.set_cookie(
            key="refresh_token",
            value=refresh_token,
            httponly=True,
            secure=True,
        )

        return {"message": "User logged in successfully"}

    except Exception as e:
        raise HTTPException(400, f"Cognito signup exception: {e}")


@router.post("/refresh")
def refresh_token(
    refresh_token: str = Cookie(None),
    user_cognito_sub: str = Cookie(None),
    response: Response = None,
):
    try:
        secret_hash = get_secret_hash(
            user_cognito_sub,
            COGNITO_CLIENT_ID,
            COGNITO_CLIENT_SECRET,
        )

        cognito_response = cognito_client.initiate_auth(
            ClientId=COGNITO_CLIENT_ID,
            AuthFlow="REFRESH_TOKEN_AUTH",
            AuthParameters={
                "REFRESH_TOKEN": refresh_token,
                "SECRET_HASH": secret_hash,
            },
        )

        auth_result = cognito_response.get("AuthenticationResult")

        if not auth_result:
            raise HTTPException(400, "Bad request")

        access_token = auth_result.get("AccessToken")

        response.set_cookie(
            key="access_token",
            value=access_token,
            httponly=True,
            secure=True,
        )

        return {"message": "Access token is refreshed"}

    except Exception as e:
        raise HTTPException(400, f"Cognito signup exception: {e}")
