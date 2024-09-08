import 'dart:convert';

import 'package:netplix_app/features/movie/data/model/movie_model.dart';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

class SearchResponse {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  SearchResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<MovieModel>.from(
                json["results"]!.map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
