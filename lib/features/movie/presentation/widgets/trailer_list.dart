import 'package:flutter/material.dart';
import 'package:netplix_app/features/movie/domain/entities/trailer.dart';
import 'package:netplix_app/features/movie/presentation/widgets/trailer_item.dart';

class TrailerList extends StatelessWidget {
  const TrailerList({super.key, required this.trailers});

  final List<Trailer> trailers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            var trailer = trailers[index];
            return TrailerItem(trailer: trailer);
          },
          separatorBuilder: (_, __) {
            return const SizedBox(
              width: 8,
            );
          },
          itemCount: trailers.length),
    );
  }
}
