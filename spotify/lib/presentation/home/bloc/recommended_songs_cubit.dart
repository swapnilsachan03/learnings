import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/songs/get_recommended_songs.dart';
import 'package:spotify/presentation/home/bloc/recommended_songs_state.dart';
import 'package:spotify/service_locator.dart';

class RecommendedSongsCubit extends Cubit<RecommendedSongsState> {
  RecommendedSongsCubit() : super(RecommendedSongsLoading());

  Future<void> getRecommendedSongs() async {
    var returnedSongs = await sl<GetRecommendedSongsUsecase>().call();

    returnedSongs.fold(
      (l) {
        emit(RecommendedSongsError());
      },
      (r) {
        emit(RecommendedSongsLoaded(songs: r));
      },
    );
  }
}
