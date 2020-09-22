import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dbm_test/src/models/Film.dart';
export 'package:dbm_test/src/models/Film.dart';

class FilmsProvider {
  String _url = "ghibliapi.herokuapp.com";
  FilmsProvider();
  Future<List> getAllFilms() async {
    final url = Uri.https(_url, 'films');
    print(url);
    final data = await http.get(url);
    final decodedData = json.decode(data.body);
    final films = Films.fromJson(decodedData);
    return films.items;

    // print(decodedData.toString());
  }
}
