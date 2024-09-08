import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netplix_app/config/cons.dart';
import 'package:netplix_app/features/movie/domain/entities/movie.dart';
import 'package:netplix_app/features/movie/presentation/ui/move_detail_content.dart';

class HorizontalMovieItem extends StatelessWidget {
  const HorizontalMovieItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return MovieDetailContent(
                id: movie.id.toString(),
              );
            },
          );
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: CachedNetworkImage(
            imageUrl: '${StringCons.imageBaseUrl}${movie.posterPath}',
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
