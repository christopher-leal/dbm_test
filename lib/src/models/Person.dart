import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class People {
  List<Person> items;

  People.fromJson(List<dynamic> json) {
    if (json == null) return;

    items = json.map((person) => Person.fromJson(person)).toList();
  }
}

class Person {
  Person({
    this.id,
    this.name,
    this.gender,
    this.age,
    this.eyeColor,
    this.hairColor,
    this.films,
    this.species,
    this.url,
  });

  String id;
  String name;
  String gender;
  String age;
  String eyeColor;
  String hairColor;
  List<dynamic> films;
  String species;
  String url;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        age: json["age"],
        eyeColor: json["eye_color"],
        hairColor: json["hair_color"],
        films: List<dynamic>.from(json["films"].map((x) => x)),
        species: json["species"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "age": age,
        "eye_color": eyeColor,
        "hair_color": hairColor,
        "films": List<dynamic>.from(films.map((x) => x)),
        "species": species,
        "url": url,
      };
}
