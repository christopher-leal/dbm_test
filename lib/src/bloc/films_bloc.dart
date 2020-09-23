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

  getFilmByIds(List<String> ids) async {
    List<Film> films = List<Film>();
    // ids.forEach((id) async {
    //   final film =
    //   films.add(film);
    //   print(films.length);
    // });
    for (var id in ids) {
      films.add(await _filmsProvider.getFilmById(id));
    }
    _filmsController.sink.add(films);
    // return await _filmsProvider.getFilmById(id);
  }

  dispose() {
    _filmsController?.close();
  }
}
