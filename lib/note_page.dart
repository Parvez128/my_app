import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/controller/note_controller.dart';
import 'package:my_app/model/model.dart';
import 'package:my_app/note_details_page.dart';


class NotePage extends StatelessWidget {

  final  Box box=Hive.box('notes');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Note Box')),
        elevation: 0.0,
      ),
        body: ValueListenableBuilder(
        valueListenable:box.listenable() ,
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
// body:GetBuilder<NoteController>(builder: (_){
//         return ListView.builder(
//             shrinkWrap: true,
//             itemCount:box.keys.length,
//             itemBuilder:(context,index){
//
//               NoteModel noteModel=box.getAt(index);
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