import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_study_test/domain/image.dart';

class AddBookModel extends ChangeNotifier {
  String imagename = '';

  Future addImageToFirebase() async {
    if (imagename.isEmpty) {
      throw ('イメージ名が入力されていません');
    }

    FirebaseFirestore.instance.collection('images').add(
      {
        'title': imagename,
      },
    );
  }

  Future updateImage(Book book) async {
    final document =
        FirebaseFirestore.instance.collection('images').doc(book.documentID);
    await document.update(
      {
        'title': imagename,
      },
    );
  }
}
