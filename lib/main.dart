import 'package:flutter/material.dart';

import 'View/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Spotify Clone',
        theme: ThemeData(
            primaryColor: Color(0xff222326), accentColor: Color(0xff121212)),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: MainPage());
  }
}
