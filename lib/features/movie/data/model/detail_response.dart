// To parse this JSON data, do
//
//     final detailResponse = detailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:netplix_app/features/movie/data/model/genre_model.dart';
import 'package:netplix_app/features/movie/domain/entities/movie_detail.dart';

DetailResponse detailResponseFromJson(String str) =>
    DetailResponse.fromJson(json.decode(str));

class DetailResponse {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<GenreModel>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  // List<ProductionCompany>? productionCompanies;
  // List<ProductionCountry>? productionCountries;
  DateTime? releaseDate;
  int? revenue;
  int? runtime;
  // List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  DetailResponse({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    // this.productionCompanies,
    // this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    // this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory DetailResponse.fromJson(Map<String, dynamic> json) => DetailResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: json["genres"] == null
            ? []
            : List<GenreModel>.from(
                json["genres"]!.map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        // productionCompanies: json["production_companies"] == null ? [] : List<ProductionCompany>.from(json["production_companies"]!.map((x) => ProductionCompany.fromJson(x))),
        // productionCountries: json["production_countries"] == null ? [] : List<ProductionCountry>.from(json["production_countries"]!.map((x) => ProductionCountry.fromJson(x))),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        // spokenLanguages: json["spoken_languages"] == null ? [] : List<SpokenLanguage>.from(json["spoken_languages"]!.map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  MovieDetail toEntity() {
    return MovieDetail(
      adult: adult,
      backdropPath: backdropPath,
      genres: genres!.map((genre) => genre.toEntity()).toList(),
      id: id,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      releaseDate: releaseDate,
      runtime: runtime,
      title: title,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}


// class ProductionCompany {
//     int? id;
//     String? logoPath;
//     String? name;
//     String? originCountry;

//     ProductionCompany({
//         this.id,
//         this.logoPath,
//         this.name,
//         this.originCountry,
//     });

//     factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
//         id: json["id"],
//         logoPath: json["logo_path"],
//         name: json["name"],
//         originCountry: json["origin_country"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "logo_path": logoPath,
//         "name": name,
//         "origin_country": originCountry,
//     };
// }

// class ProductionCountry {
//     String? iso31661;
//     String? name;

//     ProductionCountry({
//         this.iso31661,
//         this.name,
//     });

//     factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
//         iso31661: json["iso_3166_1"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "iso_3166_1": iso31661,
//         "name": name,
//     };
// }

// class SpokenLanguage {
//     String? englishName;
//     String? iso6391;
//     String? name;

//     SpokenLanguage({
//         this.englishName,
//         this.iso6391,
//         this.name,
//     });

//     factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
//         englishName: json["english_name"],
//         iso6391: json["iso_639_1"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "english_name": englishName,
//         "iso_639_1": iso6391,
//         "name": name,
//     };
// }
