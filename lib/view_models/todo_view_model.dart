import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:habit_boddy/view/post/page/Todo.dart';

class ToDoViewModel extends ChangeNotifier {
  List<Todo> todoList = [];
  String todoText = "";
  ToDoViewModel({this.todoList});
  Todo dropdownValue;

//リアルタイムでTodoが反映される。
  void getRealtime() {
    final snapshots =
        FirebaseFirestore.instance.collection("todoList").snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo.fromDoc(doc)).toList();
      this.todoList = todoList;
      dropdownValue = todoList.first;
      notifyListeners();
    });
  }

  //firebaseに値を追加する。
  Future add() async {
    final collection = FirebaseFirestore.instance.collection("todoList");
    await collection.add({
      'title': todoText,
      'createdAt': Timestamp.now(),
    });
  }

  onChanged(Todo newValue) {
    dropdownValue = newValue;
    notifyListeners();
  }
}
