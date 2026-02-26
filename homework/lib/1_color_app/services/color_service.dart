import 'package:flutter/material.dart';

class ColorService extends ChangeNotifier {
  int redTapCount = 0;
  int blueTapCount = 0;

  ColorService({this.blueTapCount = 0, this.redTapCount = 0});

  void incrementRedTapCount() {
    redTapCount++;

    notifyListeners();
  }

  void incrementBlueTapCount() {
    blueTapCount++;

    notifyListeners();
  }
}
