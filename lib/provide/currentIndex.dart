import 'package:flutter/material.dart';

//当前页面index,provider要用,在index_page.dart中
class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
