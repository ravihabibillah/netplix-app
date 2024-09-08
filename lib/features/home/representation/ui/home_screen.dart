import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netplix_app/config/routes/app_routes.dart';
import 'package:netplix_app/config/themes/app_textstyle.dart';
import 'package:netplix_app/features/movie/presentation/widgets/popular_list.dart';
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
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Now Playing',
                style: AppTextstyle.titleStyle,
              ),
            ),
            NowPlayingList(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Popular',
                style: AppTextstyle.titleStyle,
              ),
            ),
            PopularList()
          ],
        ),
      ),
    );
  }
}
