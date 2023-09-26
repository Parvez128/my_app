import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/controller/draft_controller.dart';
import 'package:my_app/model/model.dart';
import 'package:my_app/note_details_page.dart';

class DraftPage extends StatelessWidget {

  Box openbox=Hive.box("draft");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Draft Box')),
        elevation: 0.0,
      ),
      body: ValueListenableBuilder(
          valueListenable:openbox.listenable() ,
          builder: (context,box,child){
            return ListView.builder(
                shrinkWrap: true,
                itemCount: box.keys.length,
                itemBuilder: (context,index){
                  NoteModel note= box.getAt(index);
                  //box.deleteAt(index);
                  return ListTile(
                    onTap: () {
                      Get.to(NoteDraftPage(note: note,));
                      //NoteDraftPage(note: note,);
                    },
                   // leading: Image.file(note.image),
                    title: Text(note.title),
                    subtitle: Text(note.description),
                    trailing: GestureDetector(
                      onTap: () {
                        box.deleteAt(index);
                      },
                      child: Icon(Icons.delete_forever),
                    ),
                  );
                });
          }),

    );
  }
}

//GetBuilder<DraftController>(builder: (_)
//ValueListenableBuilder(
//valueListenable:box.listenable(),
//builder:(contex,box,child)
// body:GetBuilder<DraftController>(builder: (_) {
//         return ListView.builder(
//             shrinkWrap: true,
//             itemCount:box.keys.length,
//             itemBuilder:(context,index){
//
//               NoteModel noteModel =box.getAt(index);
//               return ListTile(
//                 onTap: (){
//                   Get.to(NoteDraftPage(note: noteModel,));
//                 },
//                 leading: Image.file(noteModel.image),
//                 title: Text(noteModel.title),
//                 subtitle: Text(noteModel.description),
//                 trailing: Icon(Icons.arrow_forward_ios),
//
//               );
//             });
//       }),