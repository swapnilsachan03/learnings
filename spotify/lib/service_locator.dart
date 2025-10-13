import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repo_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  /** repository */
  sl.registerSingleton<AuthRepo>(AuthRepoImpl());

  /** data sources */
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  /** usecases */
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
}
