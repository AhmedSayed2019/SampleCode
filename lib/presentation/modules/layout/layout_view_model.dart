import 'package:flutter/material.dart';



class CustomerLayoutViewModel extends ChangeNotifier {


  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {

    _currentIndex = index;
    notifyListeners();
  }
  void init(int? index) {
    _currentIndex = index??0;
  }

}
