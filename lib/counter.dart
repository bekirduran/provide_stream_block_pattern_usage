import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier{
  int _counterNum;


  Counter(this._counterNum);

  int get counterNum => _counterNum;

  void increase(){
    _counterNum++;
    notifyListeners();
  }

  void decrease(){
    _counterNum--;
    notifyListeners();
  }
}