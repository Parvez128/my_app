import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/creat_note_page.dart';
import 'package:my_app/draft_page.dart';
import 'package:my_app/note_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text('Note'),
              onTap: () {
               Get.to(NotePage());
              },
            ),
            ListTile(
              leading: Icon(Icons.drafts),
              title: Text('Draft Box'),
              onTap: () {
                Get.to(DraftPage());
              },
            ),
          ],
        ),
      ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(50.0),
          child: FloatingActionButton(
            onPressed: (){
              Get.to(CreatNotePage());
            },
            child: Icon(Icons.add),
          ),
        ),
      

    );
  }
}
