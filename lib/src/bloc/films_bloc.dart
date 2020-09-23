import 'dart:async';

import 'package:dbm_test/src/providers/films_provider.dart';
import 'package:rxdart/subjects.dart';

class FilmsBloc {
  final _filmsController = BehaviorSubject<List<Film>>();
  final _filmsProvider = FilmsProvider();
  get filmsStream => _filmsController.stream;

  Future<void> getAllFilms({bool sort}) async {
    _filmsController.sink.add(await _filmsProvider.getAllFilms(sort));
  }

  dispose() {
    _filmsController?.close();
  }
}
