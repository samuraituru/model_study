import 'package:flutter/material.dart';
import 'package:model_study_test/domain/image.dart';
import 'package:model_study_test/presentation/add_image/add_image_model.dart';
import 'package:provider/provider.dart';

class AddImagePage extends StatelessWidget {
  AddImagePage({this.book});
  final book;
  @override
  Widget build(BuildContext context) {
    final bool isUpdate = book != null;
    final textEditingController = TextEditingController();

    if (isUpdate) {
      textEditingController.text = book.title;
    }

    return ChangeNotifierProvider<AddBookModel>(
        create: (_) => AddBookModel(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(isUpdate ? '本を編集' : '本を追加'),
            ),
            body: Consumer<AddBookModel>(builder: (context, model, child) {
              return Column(
                children: [
                  TextField(
                    controller: textEditingController,
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
                      child: Text(isUpdate ? '編集' : '追加')),
                ],
              );
            }),
          );
        });
  }
}
