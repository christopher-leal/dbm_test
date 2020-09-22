import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dbm_test/src/models/Person.dart';
export 'package:dbm_test/src/models/Person.dart';

class PeopleProvider {
  String _url = "ghibliapi.herokuapp.com";

  Future<List> getAllPeople(String type) async {
    final url = Uri.https(_url, 'people');
    print(url);
    final data = await http.get(url);
    final decodedData = json.decode(data.body);

    final people = People.fromJson(decodedData);
    return people.items;

    // print(decodedData.toString());
  }
}
