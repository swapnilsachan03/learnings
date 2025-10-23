import 'package:spotify/domain/entities/song/song.dart';

abstract class DiscoverSongsState {}

class DiscoverSongsLoading extends DiscoverSongsState {}

class DiscoverSongsLoaded extends DiscoverSongsState {
  final List<SongEntity> songs;
  DiscoverSongsLoaded({required this.songs});
}

class DiscoverSongsError extends DiscoverSongsState {}
