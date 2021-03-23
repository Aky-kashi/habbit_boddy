import"package:flutter/material.dart";
import 'package:habit_boddy/view/post/page/post_prepararion.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          leading: IconButton(
              icon:Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuList()),
                );}

          ),
          title: Center(child: Text('Habbit Boddy')),
          actions: [
            IconButton(
                icon:Icon(Icons.format_list_bulleted),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostPreparation()),
                  );}

            )



          ],
          backgroundColor: Colors.amber,
        ),
        body: ListView(
            children: [
              _menuItem("カテゴリー作成", Icon(Icons.category)
              ),
              _menuItem("予定作成", Icon(Icons.schedule),),
              _menuItem("未完了の予定", Icon(Icons.room)),
              _menuItem("完了の予定", Icon(Icons.task_alt)),
              _menuItem("グループ作成", Icon(Icons.group_add)),
              _menuItem("時間記録", Icon(Icons.access_time)),
              _menuItem("目標設定", Icon(Icons.tour)),
            ]
        ),
      ),
    );
  }

  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child:Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child:icon,
              ),
              Text(
                title,
                style: TextStyle(
                    color:Colors.black,
                    fontSize: 18.0
                ),
              ),
            ],
          )
      ),
      onTap: () {
        print("onTap called.");
      },
    );
  }
}