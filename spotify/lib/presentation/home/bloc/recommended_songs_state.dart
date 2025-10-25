import 'package:spotify/domain/entities/song/song.dart';

abstract class RecommendedSongsState {}

class RecommendedSongsLoading extends RecommendedSongsState {}

class RecommendedSongsLoaded extends RecommendedSongsState {
  final List<SongEntity> songs;
  RecommendedSongsLoaded({required this.songs});
}

class RecommendedSongsError extends RecommendedSongsState {}
