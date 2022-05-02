import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot doc) {
    String documentID = '';
    documentID = doc.documentID;
    title = doc['title'];
  }
  String title ='';
}