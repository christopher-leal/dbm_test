import 'package:dbm_test/src/bloc/films_bloc.dart';
import 'package:dbm_test/src/bloc/forms_bloc.dart';
import 'package:dbm_test/src/bloc/people_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final _filmsBloc = FilmsBloc();
  final _peopleBloc = PeopleBloc();
  final _formsBloc = FormsBloc();

  static Provider _currentInstance;

  factory Provider({Key key, Widget child}) {
    return _currentInstance == null
        ? _currentInstance = Provider._internal(
            key: key,
            child: child,
          )
        : _currentInstance;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static FilmsBloc filmsBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._filmsBloc;
  }

  static PeopleBloc peopleBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._peopleBloc;
  }

  static FormsBloc formsBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._formsBloc;
  }
}
