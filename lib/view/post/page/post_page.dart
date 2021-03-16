import"package:flutter/material.dart";
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
    return Provider<PostViewModel>(
        create: (_) => PostViewModel(),
        child: Builder(builder:(context) {
          return Scaffold(
            body: TextField(
        controller: _captionController,
      ),
          );
     }));
    }
  _onCaptionUpdated(){
    final viewModel = Provider.of<PostViewModel>(context, listen:false);
    viewModel.caption = _captionController.text;
    print("caption: ${viewModel.caption}");
  }
}
