import 'package:flutter/material.dart';

class PostPreparation extends StatefulWidget {
  PostPreparation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PostPreparation createState() => _PostPreparation();
}

class _PostPreparation extends State {
  int _counter = 0;
  final myController = TextEditingController();
  final items = [];

  _addItem(String inputtext) {
    setState(() {
      _counter++;
      items.add({ "title": inputtext});
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('タスク設定')),
        actions: [
          IconButton(
              icon: Icon(Icons.format_list_bulleted),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostPreparation()),
                );
              })
        ],
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    labelText: "タスク",
                    hintText: "例:筋トレ",
                    hintStyle: TextStyle(color: Colors.grey[300]),
                  ),
                ),
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
              ),
            ]),
      ),
      // 投稿ボタン
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        mini: true,
        // onPressedでボタンが押されたらテキストフィールドの内容を取得して、アイテムに追加
        onPressed: () {
          _addItem(myController.text);
          // テキストフィールドの内容をクリア
          myController.clear();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
