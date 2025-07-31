import 'package:dio/dio.dart';
import 'package:tmdb_api/models/tmdb_model.dart';
import 'package:tmdb_api/tools/api_constants.dart';

class TmdbApi {
  final Dio _dio = Dio();
  List<Results> results = [];


  Future<List<Results>> getMoviesByEndpoint(String url) async {
  final response = await _dio.get(url);
  if (response.statusCode == 200) {
    return (response.data['results'] as List)
        .map((item) => Results.fromJson(item))
        .toList();
  } else {
    throw Exception('Failed to load movies: ${response.statusCode}');
  }
}

Future<List<Results>> getPopularMovies() => getMoviesByEndpoint(ApiConstants.popularUrl);
Future<List<Results>> getTopRatedMovies() => getMoviesByEndpoint(ApiConstants.topRatedUrl);
Future<List<Results>> getUpcomingMovies() => getMoviesByEndpoint(ApiConstants.upcomingUrl);
Future<List<Results>> getNowPlayingMovies() => getMoviesByEndpoint(ApiConstants.nowPlayingUrl);


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
}
