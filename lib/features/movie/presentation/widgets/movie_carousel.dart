import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netplix_app/config/cons.dart';
import 'package:netplix_app/features/movie/domain/entities/movie.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key, required this.item});

  final List<Movie> item;

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.item.length,
      itemBuilder: (context, itemIndex, pageViewIndex) {
        var movie = widget.item[itemIndex];
        print(StringCons.imageBaseUrl + movie.posterPath!);
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Placeholder(),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: StringCons.imageBaseUrl + movie.posterPath!,
                    errorWidget: (context, url, error) => const Text(
                      'Gambar rusak!',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                movie.title ?? 'Tidak ada Judul',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        autoPlayAnimationDuration: const Duration(milliseconds: 400),
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 1,
      ),
    );
  }
}
