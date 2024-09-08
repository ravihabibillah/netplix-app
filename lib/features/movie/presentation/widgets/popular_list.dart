import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netplix_app/config/cons.dart';
import 'package:netplix_app/features/movie/domain/entities/movie.dart';
import 'package:netplix_app/features/movie/presentation/bloc/popular/bloc/popular_bloc.dart';
import 'package:netplix_app/features/movie/presentation/ui/move_detail_content.dart';
import 'package:netplix_app/features/movie/presentation/widgets/horizontal_movie_item.dart';
import 'package:provider/provider.dart';

class PopularList extends StatefulWidget {
  const PopularList({super.key});

  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<PopularBloc>(context, listen: false)
        .add(const FetchPopular()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(builder: (context, state) {
      if (state is PopularLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is PopularLoaded) {
        List<Movie> movies = state.result;
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return HorizontalMovieItem(movie: movie);
            },
            itemCount: movies.length,
          ),
        );
      } else if (state is PopularError) {
        return Text(state.message);
      } else {
        return const Center();
      }
    });
  }
}
