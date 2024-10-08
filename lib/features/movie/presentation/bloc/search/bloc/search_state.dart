part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchLoaded extends SearchState {
  final List<Movie> result;

  const SearchLoaded(this.result);

  @override
  List<Object> get props => [result];
}
