import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie/dtos/movie/out_movie_dto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie/pages/movie/movie_detail_page/movie_detail_page_controller.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../dtos/movie/out_movie_credit_dto.dart';
import '../../../widgets/genre_chip.dart';

class MovieDetailPageArguments {
  final OutMovieDto movie;

  MovieDetailPageArguments({required this.movie});
}

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);
    final movieDetailPC = WProvider.of<MovieDetailPageController>(context);

    return Scaffold(
      body: LoaderNotifier(
        state: movieDetailPC.loaderState,
        child: SingleChildScrollView(
          child: WListener(
            notifier: movieDetailPC.movieDetail,
            builder: (context) {
              final detail = movieDetailPC.movieDetail.value;

              return Column(
                children: [
                  const MovieDetailTrailer(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                detail?.title ?? "-",
                                style: textTheme.titleLarge,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_outline),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: palette.yellow,
                            ),
                            const SizedBox(width: 4),
                            Text("${detail?.voteAverage ?? "-"}/10 IMDb"),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...detail?.genres
                                      ?.map(
                                        (e) => Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child:
                                              GenreChip(title: e.name ?? "-"),
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _InfoItem(
                              title: "Length",
                              subtitle: "${detail?.runtime ?? '-'}min",
                            ),
                            const SizedBox(width: 32),
                            _InfoItem(
                              title: "Language",
                              subtitle: detail?.originalLanguage ?? "-",
                            ),
                            const SizedBox(width: 32),
                            _InfoItem(
                              title: "Adut",
                              subtitle: "${detail?.adult ?? "-"} ",
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Description",
                          style: textTheme.titleLarge?.copyWith(
                            color: palette.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          detail?.overview ?? "-",
                          style: TextStyle(color: palette.gray),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cast",
                              style: textTheme.titleLarge?.copyWith(
                                color: palette.primary,
                              ),
                            ),
                            Container(
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
                          ],
                        ),
                        const SizedBox(height: 8),
                        WListener(
                          notifier: movieDetailPC.movieCredit,
                          builder: (context) {
                            final movieCredit = movieDetailPC.movieCredit.value;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: movieCredit?.cast
                                        ?.map((e) => _CreditItem(cast: e))
                                        .toList() ??
                                    [],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CreditItem extends StatelessWidget {
  const _CreditItem({required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);

    return SizedBox(
      width: 100,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: "https://image.tmdb.org/t/p/w500${cast.profilePath}",
            width: 64,
            errorWidget: (context, url, error) => const Text("No Image"),
          ),
          const SizedBox(height: 4),
          Text(
            cast.name ?? "-",
            style: TextStyle(color: palette.primary),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class MovieDetailTrailer extends StatelessWidget {
  const MovieDetailTrailer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movieDetailPC = WProvider.of<MovieDetailPageController>(context);

    return WListener(
      notifier: movieDetailPC.movieVideos,
      builder: (context) {
        final movie = movieDetailPC.movieVideos.value;

        return YoutubePlayer(
          controller: movieDetailPC.ytController,
          showVideoProgressIndicator: true,
          // videoProgressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {
            // movieDetailPC.ytController.addListener(() {

            // });
          },
        );
      },
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyLarge?.copyWith(
            color: palette.gray,
          ),
        ),
        Text(
          subtitle,
          style: textTheme.titleMedium,
        ),
      ],
    );
  }
}
