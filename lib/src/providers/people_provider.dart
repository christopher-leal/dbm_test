import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dbm_test/src/models/Person.dart';
export 'package:dbm_test/src/models/Person.dart';

class PeopleProvider {
  String _url = "ghibliapi.herokuapp.com";

  Future<List> getAllPeople(bool sortAsc) async {
    final url = Uri.https(_url, 'people');
    print(url);
    final data = await http.get(url);
    final decodedData = json.decode(data.body);

    final people = People.fromJson(decodedData);
    sortAsc
        ? people.items.sort((a, b) => a.name.compareTo(b.name))
        : people.items.sort((b, a) => a.name.compareTo(b.name));

    return people.items;

    // print(decodedData.toString());
  }
}
