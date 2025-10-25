import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/check_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/recommended_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/recommended_songs_state.dart';

class RecommendedSongs extends StatelessWidget {
  const RecommendedSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecommendedSongsCubit()..getRecommendedSongs(),
      child: BlocBuilder<RecommendedSongsCubit, RecommendedSongsState>(
        builder: (context, state) {
          if (state is RecommendedSongsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is RecommendedSongsLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recommended songs',
                        style: TextStyle(
                          fontSize: 18,
                          fontVariations: [FontVariation("wght", 700)],
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'See more',
                          style: TextStyle(
                            fontSize: 12,
                            fontVariations: [FontVariation("wght", 500)],
                            color: context.isDarkMode
                                ? Color(0xffC6C6C6)
                                : Color(0xff131313),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  _songsList(state.songs),
                ],
              ),
            );
          } else if (state is RecommendedSongsError) {
            return Center(child: Text('Error: ${state.toString()}'));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _songsList(List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final song = songs[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.isDarkMode
                        ? AppColors.darkGrey
                        : Color(0xffE6E6E6),
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: context.isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontVariations: [FontVariation("wght", 600)],
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      song.artist,
                      style: TextStyle(
                        fontSize: 12,
                        color: context.isDarkMode
                            ? Colors.white70
                            : Colors.black54,
                        fontVariations: [FontVariation("wght", 400)],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(songs[index].duration.toString().replaceAll(".", ":")),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: context.isDarkMode ? Colors.white70 : Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 18),
      itemCount: songs.length,
    );
  }
}
