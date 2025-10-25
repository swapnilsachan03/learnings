import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/songs/get_discover_songs.dart';
import 'package:spotify/presentation/home/bloc/discover_songs_state.dart';
import 'package:spotify/service_locator.dart';

class DiscoverSongsCubit extends Cubit<DiscoverSongsState> {
  DiscoverSongsCubit() : super(DiscoverSongsLoading());

  Future<void> getDiscoverSongs() async {
    var returnedSongs = await sl<GetDiscoverSongsUsecase>().call();

    returnedSongs.fold(
      (l) {
        emit(DiscoverSongsError());
      },
      (r) {
        emit(DiscoverSongsLoaded(songs: r));
      },
    );
  }
}
