import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_study_test/presentation/add_image/add_image_page.dart';
import 'package:model_study_test/presentation/image_list/image_list_model.dart';
import 'package:provider/provider.dart';

class ImageListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageListModel>(
        create: (_) => ImageListModel()..fetchImages(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(),
            body: Consumer<ImageListModel>(builder: (context, model, child) {
              final books = model.books;
              final listtiles = books
                  .map(
                    (book) => ListTile(
                      title: Text(book.title),
                    ),
                  )
                  .toList();
              return ListView(
                children: listtiles,
              );
            }),
            floatingActionButton:
                Consumer<ImageListModel>(builder: (context, model, child) {
              return FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddImagePage()),
                  );
                  await model.fetchImages();
                },
              );
            }),
          );
        });
  }
}
