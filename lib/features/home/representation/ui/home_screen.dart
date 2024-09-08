import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netplix_app/config/routes/app_routes.dart';
import 'package:netplix_app/features/movie/presentation/widgets/now_playing_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Netplix'),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoutes.search);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const Column(
        children: [
          NowPlayingList(),
        ],
      ),
    );
  }
}
