import 'package:dartz/dartz.dart';

abstract class SongsRepo {
  Future<Either> getDiscoverSongs();
}
