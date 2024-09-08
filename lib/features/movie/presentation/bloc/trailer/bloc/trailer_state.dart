part of 'trailer_bloc.dart';

sealed class TrailerState extends Equatable {
  const TrailerState();

  @override
  List<Object> get props => [];
}

class TrailerEmpty extends TrailerState {
  final String message;

  const TrailerEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class TrailerLoading extends TrailerState {}

class TrailerError extends TrailerState {
  final String message;

  const TrailerError(this.message);

  @override
  List<Object> get props => [message];
}

class TrailerLoaded extends TrailerState {
  final List<Trailer> result;

  const TrailerLoaded(this.result);

  @override
  List<Object> get props => [result];
}
