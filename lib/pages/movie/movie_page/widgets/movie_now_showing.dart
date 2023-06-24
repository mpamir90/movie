import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import '../../../../dtos/movie/out_movie_dto.dart';
import '../../movie_all_page/movie_all_page.dart';
import '../../movie_all_page/movie_all_page_controller.dart';
import '../../movie_detail_page/movie_detail_page.dart';
import '../../movie_route.dart';
import '../movie_page_controller.dart';

class MovieNowShowing extends StatelessWidget {
  const MovieNowShowing({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);
    final moviePC = WProvider.of<MoviePageController>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Now Showing",
              style: textTheme.titleLarge?.copyWith(
                color: palette.primary,
              ),
            ),
            GestureDetector(
              onTap: () => WRouter.pushNamed(
                MovieRoute.movieAllPath,
                arguments:
                    MovieAllPageArguments(movieType: MovieType.nowPlaying),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: palette.gray),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Text(
                  "See more",
                  style: textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        WListener(
          notifier: moviePC.nowPlayingMovies,
          builder: (context) {
            final nowPlayingMovie = moviePC.nowPlayingMovies.value;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: nowPlayingMovie
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: _NowPlayingItem(movie: e),
                        ))
                    .toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _NowPlayingItem extends StatelessWidget {
  const _NowPlayingItem({required this.movie});

  final OutMovieDto movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);

    return GestureDetector(
      onTap: () => WRouter.pushNamed(MovieRoute.movieDetailPath,
          arguments: MovieDetailPageArguments(movie: movie)),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 8,
              child: CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title ?? "-",
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: palette.yellow,
                ),
                const SizedBox(width: 2),
                Text(
                  "${movie.voteAverage}/10 IMDb",
                  style: TextStyle(color: palette.gray),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
