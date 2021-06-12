import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habit_boddy/view_models/todo_view_model.dart';


class Todo {
  Todo({@required this.title, this.model, this.createdAt});
  final ToDoViewModel model;
  final String title ;
  final Timestamp createdAt;

  static Todo fromDoc(DocumentSnapshot doc){
    /*if(doc == null){
      return null;
    }*/
    return Todo(createdAt: doc.data()['createdAt'], title: doc.data()["title"]);
  }
}
