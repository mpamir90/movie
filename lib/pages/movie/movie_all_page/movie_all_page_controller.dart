import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import '../../../constants/configurations.dart';
import '../../../dtos/movie/out_movie_dto.dart';
import '../../../services/movies_services.dart';
import 'movie_all_page.dart';

enum MovieType {
  nowPlaying("Now Showing"),
  popular("Popular");

  const MovieType(this.label);

  final String label;
}

class MovieAllPageController {
  late final HttpClient httpClient;
  late final MoviesServices moviesServices;
  late final MovieAllPageArguments args;

  final loaderState = ValueNotifier(LoaderState.loading);
  int paginationIndex = 0;

  final movies = ValueNotifier(<OutMovieDto>[]);

  MovieAllPageController({
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
    paginationIndex = 1;
    movies.value.clear();

    await httpClient.httpTransactionLoaderState(
      loaderState: loaderState,
      transaction: (transaction) async {
        await onMoviesLoad(transaction: transaction);
      },
    );
  }

  Future<void> onMoviesLoad({HttpTransaction? transaction}) async {
    List<OutMovieDto> movies = [];

    switch (args.movieType) {
      case MovieType.nowPlaying:
        movies = await moviesServices.getNowPlayingMovies(
          paginationIndex: paginationIndex,
          transaction: transaction,
        );
        break;

      case MovieType.popular:
        movies = await moviesServices.getPopularMovies(
          paginationIndex: paginationIndex,
          transaction: transaction,
        );
        break;
    }

    if (movies.length < Configurations.itemPerPage) {
      paginationIndex = 0;
    } else {
      paginationIndex++;
    }

    this.movies.addAll(movies);
  }
}
