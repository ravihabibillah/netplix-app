import 'dart:convert';

import 'package:netplix_app/features/movie/domain/entities/trailer.dart';

List<TrailerModel> trailerModelFromJson(String str) => List<TrailerModel>.from(
    json.decode(str).map((x) => TrailerModel.fromJson(x)));

class TrailerModel {
  String? id;
  String? youtubeVideoId;
  String? youtubeChannelId;
  String? youtubeThumbnail;
  String? title;
  String? thumbnail;
  String? language;
  List<String>? categories;
  List<String>? genres;
  DateTime? published;
  int? views;

  TrailerModel({
    this.id,
    this.youtubeVideoId,
    this.youtubeChannelId,
    this.youtubeThumbnail,
    this.title,
    this.thumbnail,
    this.language,
    this.categories,
    this.genres,
    this.published,
    this.views,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) => TrailerModel(
        id: json["id"],
        youtubeVideoId: json["youtube_video_id"],
        youtubeChannelId: json["youtube_channel_id"],
        youtubeThumbnail: json["youtube_thumbnail"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        language: json["language"],
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
        published: json["published"] == null
            ? null
            : DateTime.parse(json["published"]),
        views: json["views"],
      );

  Trailer toEntity() => Trailer(
        id: id,
        youtubeVideoId: youtubeVideoId,
        youtubeChannelId: youtubeChannelId,
        youtubeThumbnail: youtubeThumbnail,
        title: title,
        thumbnail: thumbnail,
        language: language,
        categories: categories,
        genres: genres,
        published: published,
        views: views,
      );
}
