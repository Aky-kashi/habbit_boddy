import "package:flutter/material.dart";
import 'package:habit_boddy/view/post/page/post_prepararion.dart';
import 'package:habit_boddy/view/post/page/timer_dialog.dart';
import 'package:habit_boddy/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _captionController = TextEditingController();
  List<String> _list = <String>['りんご', 'オレンジ', 'みかん', 'ぶどう'];

  @override
  void initState() {
    _captionController.addListener(_onCaptionUpdated);
    super.initState();
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿'),
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
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:100.0),
                  child: Text("したいこと"),
                ),
                Text("$_text",
                  style: TextStyle(
                      color:Colors.blueAccent,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            DropdownButton<String>(
              items: _list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text("詳細"),
            TextField(
              controller: _captionController,
              decoration: InputDecoration(
                  hintText: "例:腕を鍛える（ダンベル100回持ち上げる)",
                  hintStyle: TextStyle(color: Colors.grey[300]),
                  border: InputBorder.none),
            ),
            Text("時間設定"),
            Timer(),
          ],
        ),
      ),
    );
  }

  _onCaptionUpdated() {
    final viewModel = Provider.of<PostViewModel>(context, listen: false);
    viewModel.caption = _captionController.text;
    print("caption: ${viewModel.caption}");
  }
}


List<String> _list = <String>['りんご', 'オレンジ', 'みかん', 'ぶどう'];
String _text = '';

Widget build(BuildContext context) {
  return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Text(
            "$_text",
            style: TextStyle(
                color:Colors.blueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.w500
            ),
          ),
          DropdownButton<String>(
            items: _list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      )
  );
}
