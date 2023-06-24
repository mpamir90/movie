import 'package:witt/witt.dart';

import '../movie/movie_page/movie_page_controller.dart';
import '../movie/movie_search_page/movie_search_page_controller.dart';
import 'main_page/main_page.dart';
import 'main_page/main_page_controller.dart';

class MainRoute {
  static const mainPath = "/main";

  static List<WPage> route() {
    return [
      WPage(
        path: mainPath,
        builder: (context, args) => const MainPage(),
        providerBuilder: (context, args) => [
          WProvider(service: (context) => MainPageController(context: context)),
          WProvider(
              service: (context) => MoviePageController(context: context)),
          WProvider(
              service: (context) =>
                  MovieSearchPageController(context: context)),
        ],
      ),
    ];
  }
}
