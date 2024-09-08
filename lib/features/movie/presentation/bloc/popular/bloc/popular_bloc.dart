import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netplix_app/features/movie/domain/entities/movie.dart';
import 'package:netplix_app/features/movie/domain/usecases/get_popular.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final GetPopular getPopular;

  PopularBloc({required this.getPopular})
      : super(const PopularEmpty('Belum ada Movie yang diputar saat ini.')) {
    on<FetchPopular>((event, emit) async {
      emit(PopularLoading());

      final result = await getPopular.execute();

      result.fold(
        (failure) => emit(PopularError(failure.message)),
        (data) {
          if (data.isEmpty) {
            emit(const PopularEmpty('Belum ada FAQ'));
          } else {
            emit(
              PopularLoaded(data),
            );
          }
        },
      );
    });
  }
}
