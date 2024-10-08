import 'package:dartz/dartz.dart';
import 'package:netplix_app/features/movie/domain/entities/movie.dart';
import 'package:netplix_app/features/movie/domain/entities/movie_detail.dart';
import 'package:netplix_app/features/movie/domain/entities/trailer.dart';
import 'package:netplix_app/utils/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopular();
  Future<Either<Failure, MovieDetail>> getDetail(String id);
  Future<Either<Failure, List<Trailer>>> getTrailer(String id);
  Future<Either<Failure, List<Movie>>> postSearch(String query);
}
