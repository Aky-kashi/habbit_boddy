import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_boddy/view/accomplishment/page/accomplish_page.dart';
import 'package:habit_boddy/utils/constants.dart';
import 'package:habit_boddy/view/login/feed/pages/feed_page.dart';
import 'package:habit_boddy/view/menu/menu_list.dart';
import 'package:habit_boddy/view/post/page/post_page.dart';

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
    ProfilePage(profileMode: ProfileMode.MYSELF,),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(child: Text('Habbit Boddy')),

        backgroundColor: Colors.amber,
      ),
      floatingActionButton:new FloatingActionButton(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          heroTag: "btn1",
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
                icon: const FaIcon(FontAwesomeIcons.listOl), label: "ToDo"),
            BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.chartBar), label: "record"),
            BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.user), label: "user")
          ]),
    );
  }
}