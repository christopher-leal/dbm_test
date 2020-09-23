import 'package:dbm_test/src/pages/films_page.dart';
import 'package:dbm_test/src/pages/people_page.dart';
import 'package:dbm_test/src/pages/person_page.dart';
import 'package:dbm_test/src/shared_prefs/shared_prefs.dart';
import 'package:flutter/material.dart';

import 'package:dbm_test/src/bloc/provider.dart';
import 'package:dbm_test/src/pages/home_page.dart';

import 'src/pages/film_page.dart';

void main() async {
  final prefs = SharedPreferencesForm();
  WidgetsFlutterBinding.ensureInitialized();

  await prefs.initPref();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
        routes: {
          "home": (BuildContext context) => HomePage(),
          "film": (BuildContext context) => FilmPage(),
          "films": (BuildContext context) => FilmsPage(),
          "person": (BuildContext context) => PersonPage(),
          "people": (BuildContext context) => PeoplePage(),
        },
      ),
    );
  }
}
