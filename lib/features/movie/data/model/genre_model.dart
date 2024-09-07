import 'package:netplix_app/features/movie/domain/entities/genre.dart';

class GenreModel {
  int? id;
  String? name;

  GenreModel({
    this.id,
    this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Genre toEntity() {
    return Genre(
      id: id,
      name: name,
    );
  }
}
