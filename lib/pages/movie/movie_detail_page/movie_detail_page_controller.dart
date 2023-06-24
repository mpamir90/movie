import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:movie/dtos/movie/out_movie_credit_dto.dart';
import 'package:movie/dtos/movie/out_movie_dto.dart';
import 'package:watt/watt.dart';
import 'package:collection/collection.dart';
import 'package:witt/witt.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../dtos/movie/out_movie_detail_dto.dart';
import '../../../dtos/movie/out_movie_video_dto.dart';
import '../../../services/movies_services.dart';
import 'movie_detail_page.dart';

class MovieDetailPageController {
  late final HttpClient httpClient;
  late final MovieDetailPageArguments args;
  late final MoviesServices moviesServices;

  final loaderState = ValueNotifier(LoaderState.loading);

  final movieDetail = ValueNotifier<OutMovieDetailDto?>(null);
  final movieCredit = ValueNotifier<OutMovieCreditDto?>(null);
  final movieVideos = ValueNotifier<OutMovieVideoDto?>(null);
  YoutubePlayerController ytController = YoutubePlayerController(
    initialVideoId: "",
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  MovieDetailPageController({
    required BuildContext context,
    required this.args,
  }) {
    Future.delayed(Duration.zero, () {
      httpClient = WProvider.of<HttpClient>(context);
      moviesServices = WProvider.of<MoviesServices>(context);
      initializeAsync();
    });
  }

  Future<void> initializeAsync() async {
    await httpClient.httpTransactionLoaderState(
      loaderState: loaderState,
      transaction: (transaction) async {
        movieDetail.value =
            await moviesServices.getMovieDetail(id: args.movie.id ?? 1);
        movieCredit.value =
            await moviesServices.getMovieCredit(id: args.movie.id ?? 1);
        movieVideos.value =
            await moviesServices.getMovieVideos(id: args.movie.id ?? 1);

        final movie = movieVideos.value?.results;

        if (movie == null) {
          return;
        }
        final grouped = groupBy(movie, (value) => value.site);
        final ytList = grouped["YouTube"];
        String? videoKey = "";

        if (ytList == null || ytList.isEmpty) {
          //Do Something
        } else {
          videoKey = ytList.first.key;
        }

        ytController = YoutubePlayerController(
          initialVideoId: videoKey ?? "",
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: true,
          ),
        );
      },
    );
  }
}
