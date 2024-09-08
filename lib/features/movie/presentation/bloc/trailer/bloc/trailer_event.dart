part of 'trailer_bloc.dart';

sealed class TrailerEvent extends Equatable {
  const TrailerEvent();

  @override
  List<Object> get props => [];
}

class FetchTrailer extends TrailerEvent {
  const FetchTrailer(this.id);
  final String id;

  @override
  List<Object> get props => [];
}
