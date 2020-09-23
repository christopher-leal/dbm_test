import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesForm {
  static final SharedPreferencesForm _instance =
      SharedPreferencesForm._internal();

  factory SharedPreferencesForm() {
    return _instance;
  }
  SharedPreferencesForm._internal();

  SharedPreferences _prefs;

  initPref() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get searchType {
    return _prefs.getString('searchType') ?? 'films';
  }

  set searchType(String value) {
    _prefs.setString('searchType', value);
  }

  get order {
    return _prefs.getBool('order') ?? false;
  }

  set order(bool value) {
    _prefs.setBool('order', value);
  }

  //  ninguna de estas propiedades de usa
  // bool _secondaryColor;
  // int _gender;
  // String name;
}
