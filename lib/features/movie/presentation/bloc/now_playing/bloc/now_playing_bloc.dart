import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netplix_app/features/movie/domain/entities/movie.dart';
import 'package:netplix_app/features/movie/domain/usecases/get_now_playing.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final GetNowPlaying getNowPlaying;

  NowPlayingBloc({required this.getNowPlaying})
      : super(const NowPlayingEmpty('Belum ada Movie yang diputar saat ini.')) {
    on<FetchNowPlaying>((event, emit) async {
      emit(NowPlayingLoading());

      final result = await getNowPlaying.execute();

      result.fold(
        (failure) => emit(NowPlayingError(failure.message)),
        (data) {
          if (data.isEmpty) {
            emit(const NowPlayingEmpty('Belum ada FAQ'));
          } else {
            emit(
              NowPlayingLoaded(data),
            );
          }
        },
      );
    });
  }
}
