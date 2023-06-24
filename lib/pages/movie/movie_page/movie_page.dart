import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import 'movie_page_controller.dart';
import 'widgets/movie_now_showing.dart';
import 'widgets/movie_popular_movie.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final moviePC = WProvider.of<MoviePageController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: LoaderNotifier(
        state: moviePC.loaderState,
        onTryAgain: () => moviePC.initializeAsync(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              MovieNowShowing(),
              SizedBox(height: 16),
              MoviePopularMovie(),
            ],
          ),
        ),
      ),
    );
  }
}
