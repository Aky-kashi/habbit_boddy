import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:habit_boddy/view/post/page/post_preparation.dart';
import 'package:habit_boddy/view/post/page/todo.dart';

class ToDoViewModel extends ChangeNotifier {
  List<PostPreparation> todoList = [];
  String todoText = "";


//リアルタイムでTodoが反映される。
  void getRealtime() {
    final snapshots =
    FirebaseFirestore.instance.collection("todoList").snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => PostPreparation(doc: doc)).toList();
      this.todoList = todoList;
      notifyListeners();

    });
  }



  Future add() async{
    final collection = FirebaseFirestore.instance.collection("todoList");
    await collection.add({
      'title': todoText,
      'createdAt': Timestamp.now(),

    });
  }

}
