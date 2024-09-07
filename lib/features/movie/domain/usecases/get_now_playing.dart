import 'package:dartz/dartz.dart';
import 'package:netplix_app/features/movie/domain/entities/movie.dart';
import 'package:netplix_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:netplix_app/utils/failure.dart';

class GetNowPlaying {
  final MovieRepository repository;

  GetNowPlaying(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlaying();
  }
}
