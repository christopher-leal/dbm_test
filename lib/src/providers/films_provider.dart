import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dbm_test/src/models/Film.dart';
export 'package:dbm_test/src/models/Film.dart';

class FilmsProvider {
  String _url = "ghibliapi.herokuapp.com";
  FilmsProvider();

  Future<List<Film>> getAllFilms(bool sortAsc) async {
    final url = Uri.https(_url, 'films');
    print(url);
    final data = await http.get(url);
    final decodedData = json.decode(data.body);
    final films = Films.fromJson(decodedData);
    sortAsc
        ? films.items.sort((a, b) => a.title.compareTo(b.title))
        : films.items.sort((b, a) => a.title.compareTo(b.title));
    return films.items;

    // print(decodedData.toString());
  }

  Future<Film> getFilmById(String id) async {
    final url = Uri.https(_url, 'films/$id');
    print(url);
    final data = await http.get(url);
    final decodedData = json.decode(data.body);
    final film = Film.fromJson(decodedData);
    return film;

    // print(decodedData.toString());
  }
}
