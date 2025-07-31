class ApiConstants {
  static const String apiKey = 'c64448be0c82a7854c0f652261982ebc';
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';

  static String popularUrl = '$baseUrl/popular?api_key=$apiKey&language=en-US&page=1';
  static String topRatedUrl = '$baseUrl/top_rated?api_key=$apiKey&language=en-US&page=1';
  static String upcomingUrl = '$baseUrl/upcoming?api_key=$apiKey&language=en-US&page=1';
  static String nowPlayingUrl = '$baseUrl/now_playing?api_key=$apiKey&language=en-US&page=1';
}
// https://api.themoviedb.org/3/movie/now_playing?api_key=$c64448be0c82a7854c0f652261982ebc&language=en-US&page=1