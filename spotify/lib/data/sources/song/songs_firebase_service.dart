import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

abstract class SongsFirebaseService {
  Future<Either> getDiscoverSongs();
  Future<Either> getRecommendedSongs();
}

class SongsFirebaseServiceImpl implements SongsFirebaseService {
  @override
  Future<Either> getDiscoverSongs() async {
    try {
      List<SongEntity> songs = [];

      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releaseDate", descending: true)
          .limit(3)
          .get();

      for (var doc in data.docs) {
        var songModel = SongModel.fromJson(doc.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return Left("An error occurred while fetching songs");
    }
  }

  @override
  Future<Either> getRecommendedSongs() async {
    try {
      List<SongEntity> songs = [];

      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releaseDate", descending: true)
          .get();

      for (var doc in data.docs) {
        var songModel = SongModel.fromJson(doc.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return Left("An error occurred while fetching songs");
    }
  }
}
