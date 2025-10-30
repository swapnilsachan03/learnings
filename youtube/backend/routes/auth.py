import boto3

from fastapi import APIRouter
from helpers.auth_helper import get_secret_hash
from pydantic_models.auth_models import SignupRequest
from secret_keys import SecretKeys

router = APIRouter()
secret_keys = SecretKeys()

COGNITO_CLIENT_ID = secret_keys.COGNITO_CLIENT_ID
COGNITO_CLIENT_SECRET = secret_keys.COGNITO_CLIENT_SECRET

cognito_client = boto3.client(
    "cognito-idp", region_name=secret_keys.REGION_NAME
)


@router.post("/signup")
def signup_user(data: SignupRequest):
    secret_hash = get_secret_hash(
        data.email, COGNITO_CLIENT_ID, COGNITO_CLIENT_SECRET
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

    return {"msg": "Signup successful. Please verify your email if required."}
