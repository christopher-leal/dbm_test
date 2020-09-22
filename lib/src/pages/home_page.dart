import 'package:dbm_test/src/widgets/spinner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final data = filmBloc.getData('people', People);

    return Scaffold(body: SpinnerWidget());
  }
}
