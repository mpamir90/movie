import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import '../constants/api_path.dart';
import '../dtos/movie/out_movie_credit_dto.dart';
import '../dtos/movie/out_movie_detail_dto.dart';
import '../dtos/movie/out_movie_dto.dart';
import '../dtos/movie/out_movie_video_dto.dart';

class MoviesServices {
  late final HttpClient httpClient;

  MoviesServices({required BuildContext context}) {
    Future.delayed(Duration.zero, () {
      httpClient = WProvider.of<HttpClient>(context);
    });
  }

  Future<List<OutMovieDto>> getPopularMovies({
    HttpTransaction? transaction,
    required int paginationIndex,
  }) async {
    final response = await httpClient.get(
      ApiPath.moviePopular(paginationIndex),
      transaction: transaction,
    );

    if (response == null || !HttpClient.isSuccess(response)) {
      return [];
    }

    final List<dynamic> dataMap = jsonDecode(response.body)["results"];
    return dataMap.map((e) => OutMovieDto.fromMap(e)).toList();
  }

  Future<List<OutMovieDto>> getNowPlayingMovies({
    HttpTransaction? transaction,
    required int paginationIndex,
  }) async {
    final response = await httpClient.get(
      ApiPath.movieNowPlaying(paginationIndex),
      transaction: transaction,
    );

    if (response == null || !HttpClient.isSuccess(response)) {
      return [];
    }

    final List<dynamic> dataMap = jsonDecode(response.body)["results"];
    return dataMap.map((e) => OutMovieDto.fromMap(e)).toList();
  }

  Future<OutMovieDetailDto?> getMovieDetail({
    HttpTransaction? transaction,
    required int id,
  }) async {
    final response = await httpClient.get(
      ApiPath.movieDetail(id),
      transaction: transaction,
    );

    if (response == null || !HttpClient.isSuccess(response)) {
      return null;
    }

    return OutMovieDetailDto.fromJson(response.body);
  }

  Future<OutMovieCreditDto?> getMovieCredit({
    HttpTransaction? transaction,
    required int id,
  }) async {
    final response = await httpClient.get(
      ApiPath.movieCredit(id),
      transaction: transaction,
    );

    if (response == null || !HttpClient.isSuccess(response)) {
      return null;
    }

    return OutMovieCreditDto.fromJson(response.body);
  }

  Future<OutMovieVideoDto?> getMovieVideos({
    HttpTransaction? transaction,
    required int id,
  }) async {
    final response = await httpClient.get(
      ApiPath.movieVideos(id),
      transaction: transaction,
    );

    if (response == null || !HttpClient.isSuccess(response)) {
      return null;
    }

    return OutMovieVideoDto.fromJson(response.body);
  }

  Future<List<OutMovieDto>> searchMovie({
    HttpTransaction? transaction,
    required String query,
    required int paginationIndex,
  }) async {
    final response = await httpClient.get(
      ApiPath.movieSearch(
        page: paginationIndex,
        query: query,
      ),
      transaction: transaction,
    );

    if (response == null || !HttpClient.isSuccess(response)) {
      return [];
    }

    final List<dynamic> dataMap = jsonDecode(response.body)["results"];
    return dataMap.map((e) => OutMovieDto.fromMap(e)).toList();
  }
}
