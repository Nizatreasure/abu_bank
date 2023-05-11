import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int currentTab = 0;

  changeTab(int index) async {
    currentTab = index;
    await Future.delayed(const Duration(milliseconds: 1));
    notifyListeners();
  }
}
