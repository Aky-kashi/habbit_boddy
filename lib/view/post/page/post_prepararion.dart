import "package:flutter/material.dart";

class PostPreparation extends StatefulWidget {
  PostPreparation({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<PostPreparation> {
  List<Widget> list = <Widget>[
    Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: "取り組みたいこと",
            hintText: "例:筋トレ",
            hintStyle: TextStyle(color: Colors.grey[300]),
          ),
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.bottomCenter,
    ),
  ];

  List<Widget> _items = <Widget>[];

  @override
  void initState() {
    super.initState();
    _items = list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('HabbtBoddy')),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: new Column(children: <Widget>[
          RaisedButton(
              onPressed: buttonPressed,
              child: Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Icon(
                  Icons.note_add,
                  size: 30.0,
                ),
              )),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _items[index];
            },
            itemCount: _items.length,
          ),
        ]),
      ),
    );
  }

  void buttonPressed() {
    int _counter = 2;
      list.add(
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "取り組みたいこと",
                hintText: "例:筋トレ",
                hintStyle: TextStyle(color: Colors.grey[300]),
              ),
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.bottomCenter,
        ),
      );

      setState(() {
        _items = list;
      });
    }
  }