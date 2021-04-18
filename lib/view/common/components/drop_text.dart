import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:habit_boddy/view/post/page/picture_page.dart';
import"package:cloud_firestore/cloud_firestore.dart";
import 'package:habit_boddy/view_models/todo_view_model.dart';
import 'package:provider/provider.dart';



class DropText extends StatefulWidget {
  @override
  _DropText createState() => _DropText();
}

class _DropText extends State<DropText> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  String task_id;
  List<String> task = [
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDoViewModel>(
      create: (_) => ToDoViewModel()..getRealtime(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<ToDoViewModel>(builder: (context, model, child){
          final todoList = model.todoList;
          return ListView(
            children:
              todoList.map((todo)=> ListTile(
                  title:Text(todo.title),),
              ).toList(),


          );
        }

        )

      ),
    );
  }
}