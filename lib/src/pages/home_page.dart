import 'package:dbm_test/src/bloc/films_bloc.dart';
import 'package:dbm_test/src/widgets/spinner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filmBloc = FilmsBloc();
    // final data = filmBloc.getData('people', People);

    return Scaffold(body: SpinnerWidget());
  }
}
