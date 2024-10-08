// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:developer';

import 'package:netplix_app/config/environment.dart';
import 'package:netplix_app/features/movie/data/model/movie_detail_model.dart';
import 'package:netplix_app/features/movie/data/model/movie_model.dart';
import 'package:netplix_app/features/movie/data/model/movie_response.dart';

import 'package:http/http.dart' as http;
import 'package:netplix_app/features/movie/data/model/trailer_model.dart';
import 'package:netplix_app/utils/exception.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopular();
  Future<MovieDetailModel> getDetail(String id);
  Future<List<TrailerModel>> getTrailer(String id);
  Future<List<MovieModel>> search(String query);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final String BASE_URL = '${Environment.baseApiUrl}/3/movie';
  final String NOW_PLAYING_URL = '/now_playing';
  final String POPULAR_URL = '/popular';

  final String SEARCH_URL = '${Environment.baseApiUrl}/3/search/movie';

  final String TRAILER_URL = 'https://api.kinocheck.com/trailers';

  var HEADER = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Environment.accessToken}'
  };

  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await client.get(
      Uri.parse(BASE_URL + NOW_PLAYING_URL),
      headers: HEADER,
    );

    if (response.statusCode == 200) {
      return movieResponseFromJson(response.body).results!;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailModel> getDetail(String id) async {
    final response = await client.get(
      Uri.parse('$BASE_URL/$id'),
      headers: HEADER,
    );

    if (response.statusCode == 200) {
      return detailResponseFromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TrailerModel>> getTrailer(String id) async {
    final response = await client.get(
      Uri.parse('$TRAILER_URL?tmdb_id=$id'),
      headers: HEADER,
    );

    if (response.statusCode == 200) {
      return trailerModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> search(String query) async {
    final response = await client.get(
        Uri.parse('$SEARCH_URL?api_key=${Environment.apiKey}&query=$query'));

    log('$SEARCH_URL?api_key=${Environment.apiKey}&query=$query');
    log(response.body);

    if (response.statusCode == 200) {
      return movieResponseFromJson(response.body).results!;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await client.get(
      Uri.parse(BASE_URL + POPULAR_URL),
      headers: HEADER,
    );

    if (response.statusCode == 200) {
      return movieResponseFromJson(response.body).results!;
    } else {
      throw ServerException();
    }
  }
}
