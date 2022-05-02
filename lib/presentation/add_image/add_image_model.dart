import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  String imagename = '';

  Future addImageToFirebase() async {
    if (imagename.isEmpty) {
      throw('イメージ名が入力されていません');
    }

    FirebaseFirestore.instance.collection('images').add({
      'title': imagename, // John Doe
    });
  }
}
