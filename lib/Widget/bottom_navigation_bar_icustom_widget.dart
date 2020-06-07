import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:spotify_clone/View/song_page_view.dart';
import 'package:spotify_clone/Widget/music_card_widget.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  final String title;
  final BuildContext context;

  BottomNavigationBarCustom({this.title, this.context});

  @override
  Widget build(BuildContext context) {
    double myHeight = 120;
    return SizedBox(
        height: myHeight,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, // Chama a outra ui
                    MaterialPageRoute(builder: (context) => SongPage()));
              },
              child: MusicCard(),
            ),
            TabBar(
              tabs: [
                Tab(
                    icon: TabBarIconCustom(
                        leftPadding: 34,
                        rightPadding: 0,
                        icon: Foundation.home,
                        title: "Início",
                        isSelected: title == "Início")),
                Tab(
                    icon: TabBarIconCustom(
                        leftPadding: 14,
                        rightPadding: 14,
                        title: "Buscar",
                        icon: AntDesign.search1,
                        isSelected: title == "Buscar")),
                Tab(
                  icon: TabBarIconCustom(
                      leftPadding: 0,
                      rightPadding: 23,
                      title: "Sua Biblioteca",
                      icon: EvilIcons.navicon,
                      isSelected: title == "Sua Biblioteca"),
                ),
              ],
              indicatorColor: Colors.transparent,
            ),
          ],
        ));
  }
}

class TabBarIconCustom extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final double leftPadding;
  final double rightPadding;

  TabBarIconCustom(
      {this.icon,
      this.title,
      this.isSelected,
      this.leftPadding,
      this.rightPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding, 1, rightPadding, 0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Icon(
              icon,
              size: 28,
              color: isSelected ? Colors.white : Colors.white70,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 10),
          )
        ],
      ),
    );
  }
}
