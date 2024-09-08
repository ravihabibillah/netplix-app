part of 'popular_bloc.dart';

sealed class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

final class PopularEmpty extends PopularState {
  final String message;

  const PopularEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class PopularLoading extends PopularState {}

class PopularError extends PopularState {
  final String message;

  const PopularError(this.message);

  @override
  List<Object> get props => [message];
}

class PopularLoaded extends PopularState {
  final List<Movie> result;

  const PopularLoaded(this.result);

  @override
  List<Object> get props => [result];
}
