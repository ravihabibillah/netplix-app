import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netplix_app/config/themes/app_textstyle.dart';
import 'package:netplix_app/features/movie/presentation/bloc/search/bloc/search_bloc.dart';
import 'package:netplix_app/features/movie/presentation/widgets/movie_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchFieldController = TextEditingController();

  @override
  void dispose() {
    searchFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchFieldController,
              decoration: const InputDecoration(
                hintText: 'Search Movie..',
                suffixIcon: const Icon(Icons.search),
              ),
              onChanged: (query) {
                context.read<SearchBloc>().add(OnQueryChanged(query));
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Search Result',
              style: AppTextstyle.titleStyle,
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchLoaded) {
                    final result = state.result;
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = result[index];
                        return MovieItem(movie: movie);
                      },
                      itemCount: result.length,
                    );
                  } else if (state is SearchError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
