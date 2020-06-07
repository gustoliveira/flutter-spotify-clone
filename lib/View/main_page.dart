import 'package:flutter/material.dart';
import 'package:spotify_clone/Widget/bottom_navigation_bar_icustom_widget.dart';

import 'library_page_view.dart';
import 'home_page_view.dart';
import 'discovery_page_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: TabBarView(
              children: <Widget>[
                HomePage(),
                DiscoveryPage(),
                LibraryPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBarCustom(
              context: context,
            ),
            backgroundColor: Color(0xff222326),
          ),
        ),
      ),
    );
  }
}
