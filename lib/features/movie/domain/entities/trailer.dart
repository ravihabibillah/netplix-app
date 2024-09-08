class Trailer {
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

  Trailer({
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
}
