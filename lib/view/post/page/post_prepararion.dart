import "package:flutter/material.dart";

class PostPreparation extends StatefulWidget {
  PostPreparation({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<PostPreparation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "タスク",
                    hintText: "例:筋トレ",
                    hintStyle: TextStyle(color: Colors.grey[300]),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 5.0,
                height: 5.0,
                child: Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: const Text('登録'),
                    color: Colors.white,
                    shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
