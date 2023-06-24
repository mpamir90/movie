import 'package:movie/pages/movie/movie_all_page/movie_all_page.dart';
import 'package:movie/pages/movie/movie_detail_page/movie_detail_page_controller.dart';
import 'package:witt/witt.dart';

import '../main/main_page/main_page_controller.dart';

import 'movie_all_page/movie_all_page_controller.dart';
import 'movie_detail_page/movie_detail_page.dart';

class MovieRoute {
  static const movieDetailPath = "/movie-detail";
  static const movieAllPath = "/movie-all";

  static List<WPage> route() {
    return [
      WPage(
        path: movieDetailPath,
        builder: (context, args) => const MovieDetailPage(),
        providerBuilder: (context, args) => [
          WProvider(
            service: (context) => MovieDetailPageController(
              context: context,
              args: args,
            ),
          ),
        ],
      ),
      WPage(
        path: movieAllPath,
        builder: (context, args) => const MovieAllPage(),
        providerBuilder: (context, args) => [
          WProvider(
            service: (context) => MovieAllPageController(
              context: context,
              args: args,
            ),
          ),
        ],
      ),
    ];
  }
}
