part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class FetchDetail extends DetailEvent {
  final String id;

  const FetchDetail(this.id);

  @override
  List<Object> get props => [id];
}
