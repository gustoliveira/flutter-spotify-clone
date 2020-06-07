import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String name;
  final Color color;

  GenreCard({this.color, this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 60),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
