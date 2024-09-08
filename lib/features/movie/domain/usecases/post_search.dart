import 'package:dartz/dartz.dart';
import 'package:netplix_app/features/movie/domain/entities/movie.dart';
import 'package:netplix_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:netplix_app/utils/failure.dart';

class PostSearch {
  final MovieRepository repository;

  PostSearch(this.repository);

  Future<Either<Failure, List<Movie>>> execute(String query) {
    return repository.postSearch(query);
  }
}
