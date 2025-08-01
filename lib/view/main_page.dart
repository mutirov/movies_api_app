import 'package:flutter/material.dart';
import 'package:tmdb_api/models/tv_series_model.dart';
import 'package:tmdb_api/service/api/tmdb_api.dart';
import 'package:tmdb_api/widgets/airing_today.dart';
import 'package:tmdb_api/widgets/now_playing.dart';
import 'package:tmdb_api/widgets/on_the_air.dart';
import 'package:tmdb_api/widgets/popular_movies_carousel.dart';
import 'package:tmdb_api/widgets/popular_tv.dart';
import 'package:tmdb_api/widgets/top_rated_movies.dart';
import 'package:tmdb_api/widgets/top_rated_tv.dart';
import 'package:tmdb_api/widgets/upcoming_movies.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final api = TmdbApi();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.jpg', height: 40),
        centerTitle: true,
        elevation: 0,
      ),

      // appBar: AppBar(
      //   title: Image.asset('assets/images/appbar_logo1.png', height: 40),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FutureBuilder(
                future: api.getPopularMovies(), // TmdbApi sınıfından
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Hata: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  } else {
                    return PopularMoviesCarousel(movies: snapshot.data!);
                  }
                },
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey[300], thickness: 1, height: 20),
              SizedBox(height: 10),
              FutureBuilder(
                future: api.getTopRatedMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No movies found.'));
                  } else {
                    return TopRatedMovies(movies: snapshot.data!);
                  }
                },
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey[300], thickness: 1, height: 20),
              SizedBox(height: 10),
              FutureBuilder(
                future: api.getNowPlayingMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No movies found.'));
                  } else {
                    return NowPlaying(movies: snapshot.data!);
                  }
                },
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey[300], thickness: 1, height: 20),
              SizedBox(height: 10),
              FutureBuilder(
                future: api.getUpcomingMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No movies found.'));
                  } else {
                    return UpcomingMovies(movies: snapshot.data!);
                  }
                },
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey[300], thickness: 1, height: 20),
              SizedBox(height: 10),
              FutureBuilder<List<TVSeriesModel>>(
                future: api.getPopularTvShows(),
                builder:
                    (context, AsyncSnapshot<List<TVSeriesModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No TV shows found.'));
                      } else {
                        return PopularTv(tvShows: snapshot.data!);
                      }
                    },
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey[300], thickness: 1, height: 20),
              SizedBox(height: 10),
              FutureBuilder<List<TVSeriesModel>>(
                future: api.getTopRatedTvShows(),
                builder:
                    (context, AsyncSnapshot<List<TVSeriesModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No TV shows found.'));
                      } else {
                        return TopRatedTv(tvShows: snapshot.data!);
                      }
                    },
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey[300], thickness: 1, height: 20),
              SizedBox(height: 10),
              FutureBuilder<List<TVSeriesModel>>(
                future: api.getAiringTodayTvShows(),
                builder:
                    (context, AsyncSnapshot<List<TVSeriesModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No TV shows found.'));
                      } else {
                        return AiringToday(tvShows: snapshot.data!);
                      }
                    },
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey[300], thickness: 1, height: 20),
              SizedBox(height: 10),
              FutureBuilder<List<TVSeriesModel>>(
                future: api.getOnTheAirTvShows(),
                builder:
                    (context, AsyncSnapshot<List<TVSeriesModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No TV shows found.'));
                      } else {
                        return OnTheAir(tvShows: snapshot.data!);
                      }
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
