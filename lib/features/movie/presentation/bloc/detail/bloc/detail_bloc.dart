import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netplix_app/features/movie/domain/entities/movie_detail.dart';
import 'package:netplix_app/features/movie/domain/usecases/get_detail.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetail getDetail;

  DetailBloc({required this.getDetail})
      : super(const DetailEmpty('Tidak ada Detail Movie')) {
    on<FetchDetail>(
      (event, emit) async {
        final id = event.id;

        emit(DetailLoading());
        final detailResult = await getDetail.execute(id);

        detailResult.fold(
          (failure) => emit(DetailError(failure.message)),
          (data) => emit(DetailLoaded(data)),
        );
      },
    );
  }
}
