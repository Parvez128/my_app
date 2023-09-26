import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';
part 'model.g.dart';

@HiveType(typeId: 0)
class NoteModel{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
 // @HiveField(2)
 // File image;

  NoteModel({required this.title,required this.description,});
}
//required this.image