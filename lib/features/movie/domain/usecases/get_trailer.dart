import 'package:dartz/dartz.dart';
import 'package:netplix_app/features/movie/domain/entities/trailer.dart';
import 'package:netplix_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:netplix_app/utils/failure.dart';

class GetTrailer {
  final MovieRepository repository;

  GetTrailer(this.repository);

  Future<Either<Failure, List<Trailer>>> execute(id) {
    return repository.getTrailer(id);
  }
}
