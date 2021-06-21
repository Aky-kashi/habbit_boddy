import "package:flutter/material.dart";
import 'package:habit_boddy/utils/constants.dart';
import 'package:habit_boddy/view/common/components/post_caption_part.dart';
import 'package:habit_boddy/view/post/page/Todo.dart';
import 'package:habit_boddy/view/post/page/detail_page.dart';
import 'package:habit_boddy/view/post/page/picture_page.dart';
import 'package:habit_boddy/view/post/page/task_setting.dart';
import 'package:habit_boddy/view_models/post_view_model.dart';
import 'package:habit_boddy/view_models/todo_view_model.dart';
import 'package:provider/provider.dart';

import 'confirm_dialog.dart';

//投稿画面のメインの関数。

class PostPage extends StatelessWidget {
//モデルにデータを入れる。
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDoViewModel>(
      create: (_) => ToDoViewModel()..getRealtime(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          actions: [
            ElevatedButton(
                child: Text('投稿する'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                onPressed: () => showConfirmedDialog(
                    context: context,
                    title: "投稿",
                    content: "投稿しても良いですか?",
                    onConfirmed: (isConfirmed) {
                      if (isConfirmed) {
                        _post(context);
                      }
                    }))
          ],
        ),
        body: Consumer<ToDoViewModel>(builder: (context, model, child) {
          final todoList = model.todoList;
          final postViewModel = Provider.of<PostViewModel>(context);
          print(todoList);
          if (todoList == null) {
            return Container();
          } else {
            return Container(
                child: SingleChildScrollView(
                    child: Column(children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: DropdownButton<Todo>(
                        value: model.dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(height: 2, color: Colors.orange),
                        onChanged: (Todo newValue) {
                          model.onChanged(newValue);
                        },
                        items:
                            todoList.map<DropdownMenuItem<Todo>>((Todo todo) {
                          return DropdownMenuItem<Todo>(
                              value: todo,
                              child: Container(
                                child: Text(todo.title),
                                width: 300,
                                alignment: Alignment.center,
                              ));
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: DetailPost(),
                  ),
                  height: 270),
              Row(children: [
                PicturePage(),
                postViewModel.imageFile == null
                    ? Container()
                    : Container(
                        height: 60,
                        width: 60,
                        child: SingleChildScrollView(
                          child: PostCaptionPart(
                            from: PostCaptionOpenMode.FROM_POST,
                          ),
                        ),
                      )
              ])
            ])));
          }
        }),
        //ボタンを押すと、タスクを設定するページに遷移する。
        floatingActionButton:
            Consumer<ToDoViewModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskSetting()),
              );
            },
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }

//imageFileを投稿すると動くメソッド
  void _post(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
  }
}
