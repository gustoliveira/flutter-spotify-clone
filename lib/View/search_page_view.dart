import 'package:flutter/material.dart';

import '../Widget/bottom_navigation_bar_icustom_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Container(
            color: Color(0xff121212),
            child: Column(
              children: <Widget>[
                Theme(
                  data: ThemeData(
                    primaryColor: Color(0xff222326),
                    primaryColorDark: Color(0xff222326),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.green,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration.collapsed(
                      hintText: "Buscar",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      fillColor: Color(0xff222326),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBarCustom(
            context: context,
            title: "Buscar",
          ),
          backgroundColor: Color(0xff222326),
        ),
      ),
    );
  }
}
