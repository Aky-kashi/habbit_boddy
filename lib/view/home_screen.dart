import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_boddy/view/accomplishment/page/accomplish_page.dart';
import 'package:habit_boddy/view/login/feed/pages/feed_page.dart';
import 'package:habit_boddy/view/post/page/post_page.dart';
import 'package:habit_boddy/view/profile/pages/profile_page.dart';
import 'package:habit_boddy/view/search/pages/search_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages = [
    FeedPage(),
    AccomplishmentPage(),
    ProfilePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Icon(Icons.menu),
        title: Text('Habbit Boddy'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.group_add),
        ],
        backgroundColor: Colors.amber,
      ),

      floatingActionButton:FloatingActionButton(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          mini: true,
          onPressed: () {
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
                icon: const FaIcon(FontAwesomeIcons.crown), label: "target"),
            BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.user), label: "user")
          ]),
    );
  }
}
