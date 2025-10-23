import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/check_dark_mode.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/discover_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/discover_songs_state.dart';

class DiscoverSongs extends StatelessWidget {
  const DiscoverSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DiscoverSongsCubit()..getDiscoverSongs(),
      child: SizedBox(
        child: BlocBuilder<DiscoverSongsCubit, DiscoverSongsState>(
          builder: (context, state) {
            if (state is DiscoverSongsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (state is DiscoverSongsLoaded) {
              final songs = state.songs;
              return _songsList(songs);
            } else if (state is DiscoverSongsError) {
              return Center(child: Text('Error: ${state.toString()}'));
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _songsList(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];

        return SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "${AppUrls.firestorageCovers}${song.artist} - ${song.title}.jpg?${AppUrls.mediaAlt}",
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 28,
                      width: 28,
                      transform: Matrix4.translationValues(-8, 10, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode
                            ? Colors.black54
                            : Colors.white70,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                songs[index].title,
                style: TextStyle(
                  fontVariations: [FontVariation("wght", 600)],
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 2),
              Text(
                songs[index].artist,
                style: TextStyle(
                  fontVariations: [FontVariation("wght", 400)],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 14),
    );
  }
}
