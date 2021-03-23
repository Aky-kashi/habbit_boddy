import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';



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
    "英語",
    "筋トレ",
    "Flutter",
    "本読む",
    "ランニング",
    "瞑想",
    "アファメーション",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DropDownField(
                  onValueChanged: (dynamic value) {
                    task_id = value;
                  },
                  value: task_id,
                  required: false,
                  hintText: 'タスクを選ぶ',
                  labelText: 'タスク',
                  items: task,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:50.0),
                  child: TextField(
                    //controller: _captionController,
                    decoration: InputDecoration(
                        hintText: "詳細、具体的な内容",
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        border: InputBorder.none),
                  ),
                  //Time(),
                ),
              ]),
        ),
      ),
    );
  }
}