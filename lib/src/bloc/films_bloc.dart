export 'package:dbm_test/src/models/Film.dart';
export 'package:dbm_test/src/models/Person.dart';

import 'dart:async';

import 'package:dbm_test/src/providers/films_provider.dart';

class FilmsBloc {
  final _filmsController = StreamController.broadcast();
  final _filmsProvider = FilmsProvider();
  get filmsStream => _filmsController.stream;

  getAllFilms() async {
    _filmsController.sink.add(await _filmsProvider.getAllFilms());
  }

  dispose() {
    _filmsController?.close();
  }
}
