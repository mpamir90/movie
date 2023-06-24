import 'package:flutter/material.dart';
import 'package:movie/pages/main/main_page/main_page_controller.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import '../../movie/movie_page/movie_page.dart';
import '../../movie/movie_search_page/movie_search_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final mainPC = WProvider.of<MainPageController>(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Text(
          "TheMovies",
          style: TextStyle(color: palette.primary),
        ),
      ),
      body: WListener(
        notifier: mainPC.currentIndex,
        builder: (context) {
          final currentIndex = mainPC.currentIndex.value;

          return IndexedStack(
            index: currentIndex,
            children: const [
              MoviePage(),
              MovieSearchPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: WListener(
        notifier: mainPC.currentIndex,
        builder: (context) {
          final currentIndex = mainPC.currentIndex.value;

          return BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: palette.blue,
            onTap: (value) => mainPC.currentIndex.value = value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
            ],
          );
        },
      ),
    );
  }
}
