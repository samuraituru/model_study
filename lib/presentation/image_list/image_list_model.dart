import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_study_test/domain/image.dart';

class ImageListModel extends ChangeNotifier {
  List<Book> books = [];

  Future fetchImages() async {
    final docs = await FirebaseFirestore.instance.collection('images').get();
    final books = docs.docs.map((doc) => Book(doc)).toList();
    this.books = books;
    notifyListeners();
  }
}
