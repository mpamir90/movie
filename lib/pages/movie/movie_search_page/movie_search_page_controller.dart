import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import '../../../constants/configurations.dart';
import '../../../dtos/movie/out_movie_dto.dart';
import '../../../services/movies_services.dart';

class MovieSearchPageController {
  late final HttpClient httpClient;
  late final MoviesServices moviesServices;

  final loaderState = ValueNotifier(LoaderState.loading);
  int paginationIndex = 0;
  final queryC = TextEditingController();
  String currentQuery = "";

  final movies = ValueNotifier(<OutMovieDto>[]);

  MovieSearchPageController({required BuildContext context}) {
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

  void onSearchPressed() {
    currentQuery = queryC.text;
    initializeAsync();
  }

  Future<void> onMoviesLoad({HttpTransaction? transaction}) async {
    print("object");
    List<OutMovieDto> movies = [];

    if (currentQuery.isNotEmpty) {
      movies = await moviesServices.searchMovie(
        query: currentQuery,
        paginationIndex: paginationIndex,
      );
    }

    // switch (args.movieType) {
    //   case MovieType.nowPlaying:
    //     movies = await moviesServices.getNowPlayingMovies(
    //       paginationIndex: paginationIndex,
    //       transaction: transaction,
    //     );
    //     break;

    //   case MovieType.popular:
    //     movies = await moviesServices.getPopularMovies(
    //       paginationIndex: paginationIndex,
    //       transaction: transaction,
    //     );
    //     break;
    // }

    if (movies.length < Configurations.itemPerPage) {
      paginationIndex = 0;
    } else {
      paginationIndex++;
    }

    this.movies.addAll(movies);
  }
}
