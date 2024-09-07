import 'package:get_it/get_it.dart';
import 'package:netplix_app/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:netplix_app/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:netplix_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:netplix_app/features/movie/domain/usecases/get_detail.dart';
import 'package:netplix_app/features/movie/domain/usecases/get_now_playing.dart';
import 'package:netplix_app/features/movie/presentation/bloc/detail/bloc/detail_bloc.dart';
import 'package:netplix_app/features/movie/presentation/bloc/now_playing/bloc/now_playing_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // BLoC
  // Now Playing
  locator.registerFactory(
    () => NowPlayingBloc(
      getNowPlaying: locator(),
    ),
  );
  // Detail
  locator.registerFactory(
    () => DetailBloc(
      getDetail: locator(),
    ),
  );

  // Use Case
  locator.registerLazySingleton(() => GetNowPlaying(locator()));
  locator.registerLazySingleton(() => GetDetail(locator()));

  // Repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(remoteDataSource: locator()),
  );

  // Data Source
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));

  // External (HTTP)
  locator.registerLazySingleton(() => http.Client());
}
