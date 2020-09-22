import 'package:dbm_test/src/pages/films_page.dart';
import 'package:flutter/material.dart';

import 'package:dbm_test/src/bloc/provider.dart';
import 'package:dbm_test/src/pages/home_page.dart';

import 'src/pages/film_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'films',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
        routes: {
          "home": (BuildContext context) => HomePage(),
          "film": (BuildContext context) => FilmPage(),
          "films": (BuildContext context) => FilmsPage(),
        },
      ),
    );
  }
}
