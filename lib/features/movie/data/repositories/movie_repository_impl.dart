import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:netplix_app/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:netplix_app/features/movie/domain/entities/movie.dart';
import 'package:netplix_app/features/movie/domain/entities/movie_detail.dart';
import 'package:netplix_app/features/movie/domain/entities/trailer.dart';
import 'package:netplix_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:netplix_app/utils/exception.dart';
import 'package:netplix_app/utils/failure.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    try {
      final result = await remoteDataSource.getNowPlaying();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Terjadi Kesalahan Server'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terkoneksi dengan internet!'));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getDetail(String id) async {
    try {
      final result = await remoteDataSource.getDetail(id);

      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Terjadi Kesalahan Server'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Trailer>>> getTrailer(String id) async {
    try {
      final result = await remoteDataSource.getTrailer(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Terjadi Kesalahan Server'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terkoneksi dengan internet!'));
    }
  }
}
