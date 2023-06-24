import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import '../../../dtos/movie/out_movie_dto.dart';
import '../../../services/movies_services.dart';

class MoviePageController {
  late final HttpClient httpClient;
  late final MoviesServices moviesServices;

  final loaderState = ValueNotifier(LoaderState.loading);
  int paginationIndexFiles = 0;
  final popularMovies = ValueNotifier(<OutMovieDto>[]);
  final nowPlayingMovies = ValueNotifier(<OutMovieDto>[]);

  MoviePageController({required BuildContext context}) {
    Future.delayed(Duration.zero, () {
      httpClient = WProvider.of<HttpClient>(context);
      moviesServices = WProvider.of<MoviesServices>(context);

      initializeAsync();
    });
  }

  Future<void> initializeAsync() async {
    // paginationIndexFiles = 1;
    // paginationIndexFolders = 1;
    popularMovies.value.clear();

    await httpClient.httpTransactionLoaderState(
      loaderState: loaderState,
      transaction: (transaction) async {
        // await onDocumentsLoad();
        // await onDocumentFoldersLoad();
        final popularMovies =
            await moviesServices.getPopularMovies(paginationIndex: 1);
        this.popularMovies.addAll(popularMovies);

        final nowPlayingMovies =
            await moviesServices.getNowPlayingMovies(paginationIndex: 1);
        this.nowPlayingMovies.addAll(nowPlayingMovies);
      },
    );

    // switch (currentFilter.value) {
    //   case "Last Opened":
    //     onFilterLastOpenedPressed();
    //     break;
    //   case "Name":
    //     onFilterNamePressed();
    //     break;
    //   case "Size":
    //     onFilterSizePressed();
    //     break;
    //   default:
    // }
  }

  // Future<void> onContactLoadAsync({HttpTransaction? transaction}) async {
  //   final contacts = await contactService.getContactAsync(
  //     transaction: transaction,
  //     paginationIndex: paginationIndex,
  //   );

  //   if (contacts.length < Configurations.itemPerPage) {
  //     paginationIndex = 0;
  //   } else {
  //     paginationIndex++;
  //   }

  //   this.contacts.addAll(contacts);
  // }
}
