import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier{
  int _count = 0;

  get count => _count;

  add() {
    _count++;
    notifyListeners(); //변경되는 신호 알림
  }

  remove() {
    _count--;
    notifyListeners(); //변경되는 신호 알림
  }
}