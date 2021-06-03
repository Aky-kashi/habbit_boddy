import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habit_boddy/view/post/page/picture_page.dart';
import 'package:habit_boddy/view_models/todo_view_model.dart';
import 'package:provider/provider.dart';

//Todoリストのタスクを画面に表示させる。
class TaskSetting extends StatefulWidget {
  @override
  _PostPreparation createState() => _PostPreparation();
}

class _PostPreparation extends State {
  final ToDoViewModel model;
  _PostPreparation({this.model});

  int _counter = 0;
  final myController = TextEditingController();
  final items = [];

  _addItem(String inputtext) {
    setState(() {
      _counter++;
      items.add({"title": inputtext});
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDoViewModel>.value(
      value: model,
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('タスク設定')),
            backgroundColor: Colors.amber,
          ),
          body: Consumer<ToDoViewModel>(builder: (context, model, child) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      labelText: "タスク",
                      hintText: "例:筋トレ",
                      hintStyle: TextStyle(color: Colors.grey[300]),
                    ),
                    onChanged: (text) {
                      model.todoText = text;
                    }),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items[index];
                      return Dismissible(
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                        secondaryBackground: Container(
                          child: Center(
                            child: Text(
                              '削除',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          color: Colors.red,
                        ),
                        background: Container(),
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.pending_actions),
                            title: Text(item["title"]),
                          ),
                        ),
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                      );
                    }),
                // 投稿ボタン
              ),
            ]);
          }),
          floatingActionButton:
              Consumer<ToDoViewModel>(builder: (context, model, child) {
            return FloatingActionButton(
              backgroundColor: const Color(0xff03dac6),
              foregroundColor: Colors.black,
              mini: true,
              // onPressedでボタンが押されたらテキストフィールドの内容を取得して、アイテムに追加
              onPressed: () async {
                _addItem(myController.text);
                // テキストフィールドの内容をクリア
                myController.clear();
                await model.add();
              },
              child: Icon(Icons.add),
            );
          })),
    );
  }
}
