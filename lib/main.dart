import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_app/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/model/model.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
Hive.registerAdapter(NoteModelAdapter());
await Hive.openBox('notes');
await Hive.openBox("draft");


  //await openBoxes();

  runApp(const MyApp());
}


//Future<void> openBoxes() async {
 // await Hive.openBox('notes'); // Box for storing notes
 // await Hive.openBox('settings'); // Box for storing app settings
//}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

