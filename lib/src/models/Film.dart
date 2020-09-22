// To parse this JSON data, do
//
//     final film = filmFromJson(jsonString);

import 'dart:convert';

Film filmFromJson(String str) => Film.fromJson(json.decode(str));

String filmToJson(Film data) => json.encode(data.toJson());

class Films {
  List<Film> items;

  Films.fromJson(List<dynamic> json) {
    if (json == null) return;

    items = json.map((film) => Film.fromJson(film)).toList();
  }
}

class Film {
  Film({
    this.id,
    this.title,
    this.description,
    this.director,
    this.producer,
    this.releaseDate,
    this.rtScore,
  });

  String id;
  String title;
  String description;
  String director;
  String producer;
  String releaseDate;
  String rtScore;

  factory Film.fromJson(Map<String, dynamic> json) => Film(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        director: json["director"],
        producer: json["producer"],
        releaseDate: json["release_date"],
        rtScore: json["rt_score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "director": director,
        "producer": producer,
        "release_date": releaseDate,
        "rt_score": rtScore,
      };
}
