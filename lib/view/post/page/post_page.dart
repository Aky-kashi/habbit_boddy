import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:habit_boddy/component/post/task_add_button.dart';
import 'package:habit_boddy/utils/constants.dart';
import 'package:habit_boddy/view/common/components/drop_text.dart';
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


class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _captionController = TextEditingController();
  DocumentSnapshot doc;

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


//モデルにデータを入れる。
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDoViewModel>(
      create:(_) => ToDoViewModel()..getRealtime(),
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
          return DropdownButton<Todo>(
            items: todoList?.map<DropdownMenuItem<Todo>>((Todo todo) {
              return DropdownMenuItem<Todo>(
                value: Todo.fromDoc(doc),
                child: Text(todo.title),
              );
            })?.toList() ?? [],
          );
        }),
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

  _onCaptionUpdated() {
    final viewModel = Provider.of<PostViewModel>(context, listen: false);
    viewModel.caption = _captionController.text;
    print("caption: ${viewModel.caption}");
  }

  void _post(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
  }
}

Widget build(BuildContext context) {
  final postViewModel = Provider.of<PostViewModel>(context);
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: DropText(),
                      ),
                      height: 230),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 155.0),
                      child: TaskAdd(),
                    )),
              ],
            ),
            Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: DetailPost(),
                ),
                height: 270),
            Row(
              children: [
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
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
