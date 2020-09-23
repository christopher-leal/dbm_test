import 'dart:async';

import 'package:dbm_test/src/shared_prefs/shared_prefs.dart';
import 'package:rxdart/rxdart.dart';

class FormsBloc {
  final _orderController = BehaviorSubject<bool>();
  final _dropdownController = BehaviorSubject<String>();

  final _pref = SharedPreferencesForm();

  final List<Item> searchTypes = <Item>[
    Item(title: "Personas", value: "people"),
    Item(title: "Peliculas", value: "films"),
  ];
  // get stream data
  Stream<String> get dropdownStream => _dropdownController.stream;
  Stream<bool> get orderStream => _orderController.stream;

  // Stream<bool> get formValidStream =>
  //     Rx.combineLatest2(emailStream, passStream, (e, p) => true);

// insert values to stream
  changeOrder(bool order) {
    _pref.order = order;
    _orderController.sink.add(order);
  }

  changeSearchType(String searchType) {
    _pref.searchType = searchType;
    _dropdownController.sink.add(searchType);
  }

  // getter y setter para email and pass

  get order => _orderController.value ?? _pref.order;
  get searchType => _dropdownController.value ?? _pref.searchType;

  // List<Item> get searchTypes => _searchTypes;
  dispose() {
    _orderController?.close();
    _dropdownController?.close();
  }
}

class Item {
  Item({this.title, this.value});
  final String title;
  final String value;
}
