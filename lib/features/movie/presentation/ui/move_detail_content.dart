import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netplix_app/config/themes/app_textstyle.dart';
import 'package:netplix_app/features/movie/domain/entities/genre.dart';
import 'package:netplix_app/features/movie/presentation/bloc/detail/bloc/detail_bloc.dart';
import 'package:netplix_app/features/movie/presentation/bloc/trailer/bloc/trailer_bloc.dart';
import 'package:netplix_app/features/movie/presentation/widgets/trailer_list.dart';
import 'package:provider/provider.dart';

class MovieDetailContent extends StatefulWidget {
  const MovieDetailContent({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<MovieDetailContent> createState() => _MovieDetailContentState();
}

class _MovieDetailContentState extends State<MovieDetailContent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<DetailBloc>(context, listen: false)
        .add(FetchDetail(widget.id)));
    Future.microtask(() => Provider.of<TrailerBloc>(context, listen: false)
        .add(FetchTrailer(widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              if (state is DetailEmpty) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is DetailLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DetailLoaded) {
                var movieDetail = state.result;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<TrailerBloc, TrailerState>(
                      builder: (context, state) {
                        if (state is TrailerEmpty) {
                          return SizedBox(
                            height: 200,
                            child: Center(
                              child: Text(state.message),
                            ),
                          );
                        } else if (state is TrailerLoading) {
                          return const SizedBox(
                            height: 200,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state is TrailerLoaded) {
                          return TrailerList(trailers: state.result);
                        } else if (state is TrailerEmpty) {
                          return SizedBox(
                            height: 200,
                            child: Center(
                              child: Text(state.message),
                            ),
                          );
                        } else {
                          return const Center();
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      movieDetail.title ?? 'Tidak ada Judul',
                      style: AppTextstyle.titleStyle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _showGenres(movieDetail.genres ?? []),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _showDuration(movieDetail.runtime ?? 0),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: (movieDetail.voteAverage ?? 0) / 2,
                          itemCount: 5,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          itemSize: 24,
                        ),
                        Text('${movieDetail.voteAverage}')
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Overview',
                      style: AppTextstyle.titleStyle,
                    ),
                    Text(movieDetail.overview ?? 'Tidak ada Overview'),
                  ],
                );
              } else {
                return const Center();
              }
            },
          ),
        ),
      ),
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
