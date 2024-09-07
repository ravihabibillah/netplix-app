import 'package:dartz/dartz.dart';
import 'package:netplix_app/features/movie/domain/entities/movie_detail.dart';
import 'package:netplix_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:netplix_app/utils/failure.dart';

class GetDetail {
  final MovieRepository repository;

  GetDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(String id) {
    return repository.getDetail(id);
  }
}
