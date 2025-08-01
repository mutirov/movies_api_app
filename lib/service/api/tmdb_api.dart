import 'dart:core';

import 'package:dio/dio.dart';
import 'package:tmdb_api/models/tmdb_model.dart';
import 'package:tmdb_api/models/tv_series_model.dart';
import 'package:tmdb_api/tools/api_constants.dart';

class TmdbApi {
  final Dio _dio = Dio();

  Future<List<Results>> getResultsByEndpoint(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((item) => Results.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  Future<List<TVSeriesModel>> getTvSeriesByEndpoint(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((item) => TVSeriesModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load TV series: ${response.statusCode}');
    }
  }

  //   Future<List<Results>> getMoviesByEndpoint(String url) async {
  //   final response = await _dio.get(url);
  //   if (response.statusCode == 200) {
  //     return (response.data['results'] as List)
  //         .map((item) => Results.fromJson(item))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load movies: ${response.statusCode}');
  //   }
  // }

  //   Future<List<Results>> getTvShowsByEndpoint(String url) async {
  //   final response = await _dio.get(url);
  //   if (response.statusCode == 200) {
  //     return (response.data['results'] as List)
  //         .map((item) => Results.fromJson(item))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load movies: ${response.statusCode}');
  //   }
  // }

  Future<List<Results>> getPopularMovies() =>
      getResultsByEndpoint(ApiConstants.popularUrl);
  Future<List<Results>> getTopRatedMovies() =>
      getResultsByEndpoint(ApiConstants.topRatedUrl);
  Future<List<Results>> getUpcomingMovies() =>
      getResultsByEndpoint(ApiConstants.upcomingUrl);
  Future<List<Results>> getNowPlayingMovies() =>
      getResultsByEndpoint(ApiConstants.nowPlayingUrl);

  Future<List<TVSeriesModel>> getPopularTvShows() =>
      getTvSeriesByEndpoint(ApiConstants.popularTvUrl);
  Future<List<TVSeriesModel>> getTopRatedTvShows() =>
      getTvSeriesByEndpoint(ApiConstants.topRatedTvUrl);
  Future<List<TVSeriesModel>> getAiringTodayTvShows() =>
      getTvSeriesByEndpoint(ApiConstants.airingTodayTvUrl);
  Future<List<TVSeriesModel>> getOnTheAirTvShows() =>
      getTvSeriesByEndpoint(ApiConstants.onTheAirTvUrl);
}
  // Uncomment the following methods if you want to use them directly


//   Future<List<Results>> getPopularMovies() async {
//     final String url = ApiConstants.popularUrl;
//     print('Fetching popular movies from: $url');
//     final response = await _dio.get(url);
//     if (response.statusCode == 200) {
//       results = (response.data['results'] as List)
//           .map((item) => Results.fromJson(item))
//           .toList();
//     } else {
//       throw Exception('Failed to load popular movies: ${response.statusCode}');
//     }
//     return results;
//   }

//   Future<List<Results>> getTopRatedMovies() async {
//     final String url = ApiConstants.topRatedUrl;
//     final response = await _dio.get(url);
//     if (response.statusCode == 200) {
//       return (response.data['results'] as List)
//           .map((item) => Results.fromJson(item))
//           .toList();
//     } else {
//       throw Exception(
//         'Failed to load top rated movies: ${response.statusCode}',
//       );
//     }
//   }

//  Future<List<Results>> getUpcomingMovies() async {
//     final String url = ApiConstants.upcomingUrl;
//     final response = await _dio.get(url);
//     if (response.statusCode == 200) {
//       return (response.data['results'] as List)
//           .map((item) => Results.fromJson(item))
//           .toList();
//     } else {
//       throw Exception('Failed to load upcoming movies: ${response.statusCode}');
//     }
//   }

//   Future<List<Results>> getNowPlayingMovies() async {
//     final String url = ApiConstants.nowPlayingUrl;
//     final response = await _dio.get(url);
//     if (response.statusCode == 200) {
//       return (response.data['results'] as List)
//           .map((item) => Results.fromJson(item))
//           .toList();
//     } else {
//       throw Exception(
//         'Failed to load now playing movies: ${response.statusCode}',
//       );
//     }
//   }

