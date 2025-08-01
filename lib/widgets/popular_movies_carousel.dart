import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tmdb_api/models/tmdb_model.dart';
import 'package:tmdb_api/view/detail_page.dart';

class PopularMoviesCarousel extends StatelessWidget {
  final List<Results> movies;

  const PopularMoviesCarousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Movies',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 10),
        CarouselSlider.builder(
          itemCount: movies.length,
          itemBuilder: (context, index, realIndex) {
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
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movie.title ?? 'No title',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        options: CarouselOptions(
          height: 300,                  // Carousel'in yüksekliği (px cinsinden)
          autoPlay: true,               // Otomatik olarak kaymasını sağlar
          enlargeCenterPage: true,     // Ortadaki görseli biraz büyütür, dikkat çeker
          viewportFraction: 0.6,       // Her sayfanın ekranın ne kadarını kaplayacağını belirler (1.0 = tam ekran)
          aspectRatio: 16 / 9,         // En-boy oranı (TV gibi 16:9)
          initialPage: 0,              // Başlangıçta gösterilecek sayfa (index)
        ),
        
        ),
      ],
    );
  }
}
