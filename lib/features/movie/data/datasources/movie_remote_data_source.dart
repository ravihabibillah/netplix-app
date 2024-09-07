// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:developer';

import 'package:netplix_app/config/environment.dart';
import 'package:netplix_app/features/movie/data/model/movie_model.dart';
import 'package:netplix_app/features/movie/data/model/now_playing_response.dart';

import 'package:http/http.dart' as http;
import 'package:netplix_app/utils/exception.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final String BASE_URL = '${Environment.baseApiUrl}/3/movie';
  final String NOW_PLAYING_URL = '/now_playing';

  var HEADER = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Environment.accessToken}'
  };

  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await client.get(
      Uri.parse(BASE_URL),
      headers: HEADER,
    );

    log(response.body.toString());

    if (response.statusCode == 200) {
      return nowPlayingResponseFromJson(response.body).results!;
    } else {
      throw ServerException();
    }
  }
}
