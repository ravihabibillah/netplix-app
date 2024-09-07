import 'package:flutter/material.dart';
import 'package:netplix_app/features/movie/presentation/widgets/now_playing_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Netplix'),
      ),
      body: const Column(
        children: [
          NowPlayingList(),
        ],
      ),
    );
  }
}
