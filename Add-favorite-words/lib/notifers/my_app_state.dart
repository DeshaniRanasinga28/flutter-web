import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  var favourite = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void triggerFavourite() {
    if (favourite.contains(current)) {
      favourite.remove(current);
    } else {
      favourite.add(current);
    }
    notifyListeners();
  }
}
