import "package:flutter/material.dart";
import 'package:habit_boddy/view/post/page/task_setting.dart';

import 'package:habit_boddy/view_models/todo_view_model.dart';
import 'package:provider/provider.dart';

class TaskAdd extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ToDoViewModel>(
        create: (_) => ToDoViewModel()..getRealtime(),
        child:SizedBox(
            height: 40.0,
            child: FloatingActionButton.extended(
                backgroundColor: Colors.grey[200],

                label: const Text('追加'),
                onPressed: () async{
                  await Navigator.push(
                    //TODO firestoreに値を追加する。
                    context,
                    MaterialPageRoute(builder: (context) => TaskSetting(),
                      fullscreenDialog: true,
                    ),
                  );
                }

            ))

    );



  }


}
