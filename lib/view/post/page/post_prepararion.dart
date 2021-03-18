import"package:flutter/material.dart";
class PostPreparation extends StatefulWidget {
  PostPreparation({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<PostPreparation> {
  List<Widget> list = <Widget>[
    Container(
      child: Text( "Hello! Flutter!",
        style: TextStyle(fontSize:32.0,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto"),
      ),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.bottomCenter,
    ),
  ];

  List<Widget> _items = <Widget>[];

  @override
  void initState(){
    super.initState();
    _items = list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body:
      SingleChildScrollView(
        child:
        new Column(
            children: <Widget>[
              RaisedButton(
                  onPressed: buttonPressed,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child:Icon(
                      Icons.android,
                      size:50.0,
                    ),
                  )
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return _items[index];
                },
                itemCount: _items.length,
              ),
            ]
        ),
      ),
    );
  }

  void buttonPressed(){
    list.add(
      Container(
        child: Text( "Hello! Flutter!",
          style: TextStyle(fontSize:32.0,
              color: const Color(0xFF000000),
              fontWeight: FontWeight.w200,
              fontFamily: "Roboto"),
        ),
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.bottomCenter,
      ),
    );

    setState((){
      _items = list;
    });
  }

}