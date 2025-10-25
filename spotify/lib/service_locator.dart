import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repo_impl.dart';
import 'package:spotify/data/repository/song/songs_repo_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/song/songs_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/songs/get_discover_songs.dart';
import 'package:spotify/domain/usecases/songs/get_recommended_songs.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  /** repository */

  sl.registerSingleton<AuthRepo>(AuthRepoImpl());
  sl.registerSingleton<SongsRepo>(SongsRepoImpl());

  /** data sources */

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SongsFirebaseService>(SongsFirebaseServiceImpl());

  /** usecases */

  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<GetDiscoverSongsUsecase>(GetDiscoverSongsUsecase());
  sl.registerSingleton<GetRecommendedSongsUsecase>(
    GetRecommendedSongsUsecase(),
  );
}
