import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netplix_app/features/movie/presentation/bloc/now_playing/bloc/now_playing_bloc.dart';
import 'package:netplix_app/features/movie/presentation/widgets/movie_carousel.dart';
import 'package:provider/provider.dart';

class NowPlayingList extends StatefulWidget {
  const NowPlayingList({super.key});

  @override
  State<NowPlayingList> createState() => _NowPlayingListState();
}

class _NowPlayingListState extends State<NowPlayingList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<NowPlayingBloc>(context, listen: false)
        .add(const FetchNowPlaying()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingBloc, NowPlayingState>(
      builder: (context, state) {
        if (state is NowPlayingEmpty) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is NowPlayingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NowPlayingLoaded) {
          return MovieCarousel(
            item: state.result,
          );
        } else if (state is NowPlayingError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
