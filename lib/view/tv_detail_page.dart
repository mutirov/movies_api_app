import 'package:flutter/material.dart';
import 'package:tmdb_api/models/tv_series_model.dart';

class TvDetailPage extends StatelessWidget {
  final TVSeriesModel tvSeries;
  const TvDetailPage({super.key, required this.tvSeries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TV Series Details'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                tvSeries.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Divider(color: Colors.white24, thickness: 0.5),
              const SizedBox(height: 16),
              const Text(
                'Overview',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                tvSeries.overview ,
                style: const TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}