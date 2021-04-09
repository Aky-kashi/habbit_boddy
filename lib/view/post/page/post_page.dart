import "package:flutter/material.dart";
import 'package:habit_boddy/view/common/components/drop_text.dart';
import 'package:habit_boddy/view/post/page/detail_page.dart';
import 'package:habit_boddy/view/post/page/picture_page.dart';
import 'package:habit_boddy/view/post/page/post_prepararion.dart';
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
        backgroundColor: Colors.amber,
      ),

      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(child: DropText(),height: 100),
              Container(
                child: FloatingActionButton.extended(
                  onPressed: ()=> PostPreparation(),
                  backgroundColor: Colors.grey,
                  icon: Icon(Icons.add),
                  label: const Text('タスク追加'),
                ),
              ),
              Container(child: DetailPost(),height: 200),
              Container(child: PicturePage(),height: 200)
            ],
          ),
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