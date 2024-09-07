part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailEmpty extends DetailState {
  final String message;

  const DetailEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class DetailLoading extends DetailState {}

class DetailError extends DetailState {
  final String message;

  const DetailError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailLoaded extends DetailState {
  final MovieDetail result;

  const DetailLoaded(this.result);

  @override
  List<Object> get props => [result];
}
