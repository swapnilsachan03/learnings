import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }

  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signinUserReq);
  }
}
