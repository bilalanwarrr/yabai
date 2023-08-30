import 'package:flutter/cupertino.dart';

class CustomProvider extends ChangeNotifier{
  int currentIndex = 0;

  setIndex(val){
    currentIndex = val;
    notifyListeners();
  }
}