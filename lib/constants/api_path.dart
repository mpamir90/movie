import 'dart:convert';

class ApiPath {
  static const _baseUrl = "https://api.themoviedb.org/3";

  static const token = "043fa543567397eb0b7b403cfa07a0d2";

  static String movieNowPlaying(int page) =>
      "$_baseUrl/movie/now_playing?api_key=$token&language=en-US&page=$page";
  static String moviePopular(int page) =>
      "$_baseUrl/movie/popular?api_key=$token&language=en-US&page=$page";
  static String movieDetail(int id) =>
      "$_baseUrl/movie/$id?api_key=$token&language=en-US";
  static String movieCredit(int id) =>
      "$_baseUrl/movie/$id/credits?api_key=$token&language=en-US";
  static String movieVideos(int id) =>
      "$_baseUrl/movie/$id/videos?api_key=$token&language=en-US";
  static String movieSearch(
          {required int page,
          required String query,
          String isAdult = "false"}) =>
      "$_baseUrl/search/movie?api_key=$token&language=en-US&page=$page&include_adult=$isAdult&query=$query";
}
