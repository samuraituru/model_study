import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String odatext = 'oda';

  void chageOdatext() {
    odatext = 'oda2';
    notifyListeners();
  }
}
