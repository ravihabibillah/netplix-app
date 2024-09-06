import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovieCarouselList extends StatelessWidget {
  const MovieCarouselList({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Placeholder(),
              const Expanded(
                child: Placeholder(),
              ),
              SizedBox(height: 16),
              Text(itemIndex.toString()),
            ],
          ),
        );
      },
      options: CarouselOptions(
        autoPlayAnimationDuration: const Duration(milliseconds: 400),
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 1.5,
      ),
    );
  }
}
