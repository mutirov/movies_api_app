import 'package:flutter/material.dart';
import 'package:tmdb_api/models/tmdb_model.dart';
import 'package:tmdb_api/view/detail_page.dart';

class UpcomingMovies extends StatelessWidget {
  final List<Results> movies;
  const UpcomingMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Movies',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(movie: movie),
                    ),
                  );
                  print('Tapped on ${movie.title}');
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          fit: BoxFit.cover,
                          height: 200,
                          width: 150,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        movie.title ?? 'No title', // Placeholder title
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
