import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/songs_firebase_service.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongsRepoImpl extends SongsRepo {
  @override
  Future<Either> getDiscoverSongs() async {
    return await sl<SongsFirebaseService>().getDiscoverSongs();
  }
}
