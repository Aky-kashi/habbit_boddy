import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_boddy/view/accomplishment/page/accomplish_page.dart';
import 'package:habit_boddy/view/login/feed/pages/feed_page.dart';
import 'package:habit_boddy/view/post/page/post_page.dart';
import 'package:habit_boddy/view/post/page/post_prepararion.dart';
import 'package:habit_boddy/view/profile/pages/profile_page.dart';
import 'package:habit_boddy/view/search/pages/search_page.dart';

import 'group/group_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages = [
    FeedPage(),
    SearchPage(),
    AccomplishmentPage(),
    GroupPage(),
    ProfilePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(child: Text('Habbit Boddy')),
        actions: [
          IconButton(
          icon:Icon(Icons.format_list_bulleted),
          onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostPreparation()),
          );}

      )



        ],
        backgroundColor: Colors.amber,
      ),
      floatingActionButton:FloatingActionButton(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          mini: true,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostPage()),
            );
            // Respond to button press
          },
          child: Icon(Icons.add),
        ),

      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.amber[800],
          items: [
            BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.houseUser), label: "home"),
            BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.search), label: "search"),
            BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.crown), label: "target"),
            BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.userFriends), label: "group"),
            BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.user), label: "user")
          ]),
    );
  }
}
