import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model_study_test/presentation/add_image/add_image_model.dart';
import 'package:provider/provider.dart';

class AddImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
        create: (_) => AddBookModel(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('本追加画面'),
            ),
            body: Consumer<AddBookModel>(builder: (context, model, child) {
              return Column(
                children: [
                  TextField(
                    onChanged: (text) {
                      model.imagename = text;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          await model.addImageToFirebase();
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('保存しました'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          Navigator.of(context).pop();
                        } catch(e) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(e.toString()),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text('本追加')),
                ],
              );
            }),
          );
        });
  }
}
