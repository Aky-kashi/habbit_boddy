import "package:flutter/material.dart";
import 'package:habit_boddy/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _captionController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Text("したいこと"),
            Text("詳細"),
            TextField(
              controller: _captionController,
              decoration: InputDecoration(
                hintText: "例:腕を鍛える（ダンベル100回持ち上げる)",
                  hintStyle: TextStyle(color: Colors.grey[300]),
                  border: InputBorder.none
              ),
            ),
            Text("時間設定"),
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
