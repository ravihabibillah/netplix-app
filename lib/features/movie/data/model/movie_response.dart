import 'dart:convert';

import 'package:netplix_app/features/movie/data/model/movie_model.dart';

MovieResponse movieResponseFromJson(String str) =>
    MovieResponse.fromJson(json.decode(str));

class MovieResponse {
  // Dates? dates;
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MovieResponse({
    // this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        // dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<MovieModel>.from(
                json["results"]!.map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

// class Dates {
//   DateTime? maximum;
//   DateTime? minimum;

//   Dates({
//     this.maximum,
//     this.minimum,
//   });

//   factory Dates.fromJson(Map<String, dynamic> json) => Dates(
//         maximum:
//             json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
//         minimum:
//             json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
//       );
// }
