import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/movie/movie_all_page/movie_all_page_controller.dart';
import 'package:movie/pages/movie/movie_search_page/movie_search_page_controller.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import '../../../constants/genre.dart';
import '../../../dtos/movie/out_movie_dto.dart';
import '../../../widgets/genre_chip.dart';
import '../movie_detail_page/movie_detail_page.dart';
import '../movie_route.dart';

class MovieSearchPage extends StatelessWidget {
  const MovieSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieSearchPC = WProvider.of<MovieSearchPageController>(context);
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Movies",
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: movieSearchPC.queryC,
                        onFieldSubmitted: (value) =>
                            movieSearchPC.onSearchPressed(),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => movieSearchPC.onSearchPressed(),
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: LoaderNotifier(
              state: movieSearchPC.loaderState,
              onTryAgain: () => movieSearchPC.initializeAsync(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CustomScrollView(
                  slivers: [
                    WListener(
                      notifier: movieSearchPC.movies,
                      builder: (context) {
                        final movies = movieSearchPC.movies.value;
                        final enableLoad = movieSearchPC.paginationIndex != 0;

                        if (movies.isEmpty) {
                          return const SliverToBoxAdapter(
                              child: NoDataMessage());
                        }

                        return SliverInfiniteScroll(
                          onLoad: (value) => movieSearchPC.onMoviesLoad(),
                          enableLoad: enableLoad,
                          separatorBuilder: (context, index) =>
                              const Divider(thickness: 1),
                          itemCount: movies.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: _PopularItem(movie: movies[index]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
                errorWidget: (context, url, error) => const Text("No Image"),
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
