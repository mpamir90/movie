import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import '../../../../constants/genre.dart';
import '../../../../dtos/movie/out_movie_dto.dart';
import '../../../../widgets/genre_chip.dart';
import '../../movie_all_page/movie_all_page.dart';
import '../../movie_all_page/movie_all_page_controller.dart';
import '../../movie_detail_page/movie_detail_page.dart';
import '../../movie_route.dart';
import '../movie_page_controller.dart';

class MoviePopularMovie extends StatelessWidget {
  const MoviePopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);
    final moviePC = WProvider.of<MoviePageController>(context);

    return WListener(
      notifier: moviePC.popularMovies,
      builder: (context) {
        final popularMovies = moviePC.popularMovies.value;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: textTheme.titleLarge?.copyWith(
                    color: palette.primary,
                  ),
                ),
                GestureDetector(
                  onTap: () => WRouter.pushNamed(
                    MovieRoute.movieAllPath,
                    arguments:
                        MovieAllPageArguments(movieType: MovieType.popular),
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
            ...popularMovies.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _PopularItem(movie: e),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PopularItem extends StatelessWidget {
  const _PopularItem({required this.movie});

  final OutMovieDto movie;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () => WRouter.pushNamed(MovieRoute.movieDetailPath,
            arguments: MovieDetailPageArguments(movie: movie)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                width: 80,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? "-",
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
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
                  const SizedBox(height: 4),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: movie.genreIds
                              ?.map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: GenreChip(
                                    title: genres
                                        .firstWhere(
                                            (element) => element.id == e)
                                        .genre,
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      const SizedBox(width: 2),
                      Text("${movie.releaseDate}"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
