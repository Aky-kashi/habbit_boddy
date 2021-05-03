import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_boddy/view_models/todo_view_model.dart';

//Todoのフィールド
class Todo {
  final ToDoViewModel model;
  String title = "";
  DateTime createdAt;
  Todo({DocumentSnapshot doc, this.title, this.model, this.createdAt}){
    this.title = doc.data()["title"];
    final Timestamp timestamp = doc.data()['createdAt'];
    this.createdAt = timestamp.toDate();
  }
}