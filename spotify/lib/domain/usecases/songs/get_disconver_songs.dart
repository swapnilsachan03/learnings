import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/repository/song/songs_repo_impl.dart';
import 'package:spotify/service_locator.dart';

class GetDiscoverSongsUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepoImpl>().getDiscoverSongs();
  }
}
