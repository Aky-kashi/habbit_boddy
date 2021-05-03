import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:habit_boddy/view/post/page/Todo.dart';
import 'package:habit_boddy/view/post/page/task_setting.dart';


class ToDoViewModel extends ChangeNotifier {
  List<Todo>  todoList = [];
  String todoText = "";

//リアルタイムでTodoが反映される。
  void getRealtime() {
    final snapshots =
    FirebaseFirestore.instance.collection("todoList").snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc: doc)).toList();
      this.todoList = todoList;
      notifyListeners();

    });
  }
 //firebaseに値を追加する。
  Future add() async{
    final collection = FirebaseFirestore.instance.collection("todoList");
    await collection.add({
      'title': todoText,
      'createdAt': Timestamp.now(),
    });
  }

}
