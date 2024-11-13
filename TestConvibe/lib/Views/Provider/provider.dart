import 'package:flutter/material.dart';

class inputTex with ChangeNotifier {
  int? _id;

  String? _image;

  int? get id => _id;
  String? get image => _image;

  void setid(int value) {
    _id = value;
    notifyListeners();
  }

  void setimage(String value) {
    _image = value;
    notifyListeners();
  }
}
