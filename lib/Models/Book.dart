import 'dart:convert';

import 'package:flutter/foundation.dart';

class Book with ChangeNotifier {
  String id;
  String NameOfBook;
  String Author;
  String Publisher;
  String LevelofBook;
  String SubjectofBook;
  int NumberOfPages;
  String ConditionOfBook;
  bool isMark;
  double price;
  List<String> imageUrl;
  String description;

  Book({
    this.Author = '',
    this.Publisher = '',
    this.LevelofBook = '',
    this.SubjectofBook = '',
    this.NumberOfPages = 1,
    this.ConditionOfBook = '',
    this.isMark = false,
    this.NameOfBook = '',
    this.id = '',
    this.imageUrl = const <String>[],
    this.description = '',
    this.price = 1.00,
  });
}
