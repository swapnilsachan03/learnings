import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthRepo {
  Future<Either> signUp(CreateUserReq createUserReq);

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();
}
