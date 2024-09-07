part of 'now_playing_bloc.dart';

sealed class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

final class NowPlayingEmpty extends NowPlayingState {
  final String message;

  const NowPlayingEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingError extends NowPlayingState {
  final String message;

  const NowPlayingError(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingLoaded extends NowPlayingState {
  final List<Movie> result;

  const NowPlayingLoaded(this.result);

  @override
  List<Object> get props => [result];
}
