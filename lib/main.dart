import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:model_study_test/image_list_page.dart';
import 'package:model_study_test/main_model.dart';
import 'package:provider/provider.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('widget.title'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: [
                  Text(
                    model.odatext,
                  ),
                  ElevatedButton(
                    child: Text('ok'),
                    onPressed: () {
                      model.chageOdatext();
                    },
                  ),
                  FloatingActionButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageListPage()),
                    );
                  })
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
