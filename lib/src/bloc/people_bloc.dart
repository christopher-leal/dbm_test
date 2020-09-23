import 'package:rxdart/rxdart.dart';

import 'package:dbm_test/src/providers/people_provider.dart';

class PeopleBloc {
  final _peopleController = BehaviorSubject<List<Person>>();
  final _propleProvider = PeopleProvider();
  get peopleStream => _peopleController.stream;

  Future<void> getAllPeople({bool sort}) async {
    _peopleController.sink.add(await _propleProvider.getAllPeople(sort));
  }

  dispose() {
    _peopleController?.close();
  }
}
