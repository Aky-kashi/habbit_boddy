import "package:flutter/material.dart";
import 'package:habit_boddy/component/post/task_add_button.dart';
import 'package:habit_boddy/utils/constants.dart';
import 'package:habit_boddy/view/common/components/drop_text.dart';
import 'package:habit_boddy/view/common/components/post_caption_part.dart';
import 'package:habit_boddy/view/post/page/detail_page.dart';
import 'package:habit_boddy/view/post/page/picture_page.dart';
import 'package:habit_boddy/view/post/page/todo.dart';
import 'package:habit_boddy/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

import 'confirm_dialog.dart';

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
    final postViewModel = Provider.of<PostViewModel>(context);
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex:3,
                    child: Container(child: Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: DropText(),
                    ), height: 230),
                  ),
                  Expanded(
                      flex:1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:155.0),
                        child: TaskAdd(),
                      )),
                ],
              ),

              Container(child: Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: DetailPost(),
              ), height: 270),
              Row(
                children: [
                  PicturePage(),
                  postViewModel.imageFile == null
                      ? Container()
                      : Container(
                    height: 60, width: 60,
                    child: SingleChildScrollView(
                      child: PostCaptionPart(
                        from: PostCaptionOpenMode.FROM_POST,
                      ),
                    ),
                  )
                ],
              ),

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

  void _post(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
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
                color: Colors.blueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.w500),
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
      ));

}
