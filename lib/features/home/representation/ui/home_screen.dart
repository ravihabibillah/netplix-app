import 'package:flutter/material.dart';
import 'package:netplix_app/features/movie/presentation/widgets/movie_carousel_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Netplix'),
      ),
      body: Column(
        children: [
          MovieCarouselList(),
        ],
      ),
    );
  }
}
