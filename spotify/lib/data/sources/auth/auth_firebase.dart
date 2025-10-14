import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> signIn(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      return Right("User registered successfully");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == "weak-password") {
        message = "The password provided is too weak.";
      } else if (e.code == "email-already-in-use") {
        message = "The account already exists for that email.";
      } else {
        message = e.message ?? "An error occurred";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return Right("Signed in successfully");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == "invalid-credential") {
        message = "Invalid email or password.";
      } else {
        message = e.message ?? "An error occurred";
      }

      return Left(message);
    }
  }
}
