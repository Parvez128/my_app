import 'dart:io';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/controller/draft_controller.dart';
import 'package:my_app/controller/note_controller.dart';
import 'package:my_app/model/model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CreatNotePage extends StatefulWidget {
  const CreatNotePage({super.key});

  @override
  State<CreatNotePage> createState() => _CreatNotePageState();
}

class _CreatNotePageState extends State<CreatNotePage> {

  final _formKey= GlobalKey<FormState>();
  TextEditingController titleClt= TextEditingController();
  TextEditingController descriptionClt= TextEditingController();
  //File ?finalImage;
  //String imageHint = 'Select Image';
    Box box=Hive.box('notes');
    Box openbox=Hive.box("draft");


  //DraftController draftController=Get.put(DraftController());



  @override
  Widget build(BuildContext context) {
   return WillPopScope(
       onWillPop: ()async{
     openbox.add(NoteModel(title: titleClt.text, description: descriptionClt.text,));
     return true;
   },

    child: Scaffold(
     appBar: AppBar(
       elevation: 0.0,
       title: Text('Creat Note'),
     ),
     body: Form(
         key: _formKey,
         child: Padding(
           padding: const EdgeInsets.all(12.0),
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: TextFormField(
                   controller: titleClt,
                   decoration: InputDecoration(
                       hintText: "Title"
                   ),
                   validator: (value){
                     if(value!.isEmpty){
                       return "Empty Field";
                     }
                   },
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: TextFormField(
                   controller: descriptionClt,
                   decoration: InputDecoration(
                       hintText: "Description"
                   ),
                   validator: (value){
                     if(value!.isEmpty){
                       return "Empty Field";
                     }
                   },
                 ),
               ),
             //  Padding(
                // padding: const EdgeInsets.all(10.0),
                // child: Row(
                //   children: [
                 //    Expanded(child: Text(imageHint,overflow: TextOverflow.ellipsis,)),
                 //    Expanded(child:IconButton(
                   //    icon: Icon(Icons.image_outlined),
                    //   onPressed: (){
                    //     _getFromGallery();},
                    // )),
                //   ],
                 //),
             //  ),
               SizedBox(height: 25.0,),

               ElevatedButton(onPressed: (){
               if(_formKey.currentState!.validate()) {
                 _formKey.currentState!.save();
                 box.add(NoteModel(title: titleClt.text,
                     description: descriptionClt.text,));
                  //   image: finalImage!));
                 Navigator.pop(context);
               }
               }, child: Text('Save'))
             ],
           ),
         )
     ),

   ),
   );
  }

}

  /// Get from gallery
  //_getFromGallery() async {
  //  XFile? pickedFile = await ImagePicker().pickImage(
  //    source: ImageSource.gallery,
   //   maxWidth: 1800,
    //  maxHeight: 1800,
  //  );
  //  if (pickedFile != null) {
  //   File imageFile = File(pickedFile.path);
  //    setState(() {
   //     finalImage=imageFile;
  //  //    imageHint=pickedFile.path;
     // });
  //  }
//  }
//}
//WillPopScope(
//onWillPop: ()async{
//draftController.addDrafe(NoteModel(title: titleClt.text, description: descriptionClt.text, image: finalImage!));
//return true;
//},
