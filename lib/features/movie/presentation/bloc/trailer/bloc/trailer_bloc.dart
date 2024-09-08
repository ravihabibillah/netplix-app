import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netplix_app/features/movie/domain/entities/trailer.dart';
import 'package:netplix_app/features/movie/domain/usecases/get_trailer.dart';

part 'trailer_event.dart';
part 'trailer_state.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  GetTrailer getTrailer;

  TrailerBloc({required this.getTrailer})
      : super(const TrailerEmpty('Belum ada Trailer')) {
    on<FetchTrailer>((event, emit) async {
      emit(TrailerLoading());

      final result = await getTrailer.execute(event.id);

      result.fold(
        (failure) => emit(TrailerError(failure.message)),
        (data) {
          if (data.isEmpty) {
            emit(const TrailerEmpty('Belum ada FAQ'));
          } else {
            emit(
              TrailerLoaded(data),
            );
          }
        },
      );
    });
  }
}
