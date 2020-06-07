import 'package:flutter/material.dart';
import 'package:spotify_clone/Widget/genre_card_widget.dart';
import 'package:spotify_clone/Widget/search_flatbuttom_widget.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  List<Map<String, dynamic>> favGenreList = [
    {"genreName": "Pop", "Color": Color(0xffF19821)},
    {"genreName": "Hip Hop", "Color": Color(0xff99BACB)},
    {"genreName": "Sertanejo", "Color": Color(0xff4E97F2)},
    {"genreName": "Eletrônica", "Color": Color(0xffB196C4)}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                  0.1,
                  0.2,
                  0.5,
                ],
                    colors: [
                  Colors.blueGrey[900],
                  Colors.black87,
                  Color(0xff121212)
                ])),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Buscar",
                              style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    CustomTextFieldFlatButtom(
                      width: MediaQuery.of(context).size.width * (0.83),
                      buttomPadding: EdgeInsets.only(top: 15),
                      hintText: "Artistas, músicas ou podcasts",
                      hintTextStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                      onPressed: () {},
                      haveSuffix: true,
                      suffixIcon:
                          Icon(Icons.mic_none, color: Colors.white, size: 25),
                      suffixPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      havePrefix: true,
                      prefixIcon: Icon(Icons.search, color: Colors.black87),
                      prefixPadding: EdgeInsets.fromLTRB(15, 8, 0, 8),
                      backgroundColor: Colors.grey[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Seus gêneros favoritos",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GenreCard(
                                  color: favGenreList[0]["Color"],
                                  name: favGenreList[0]["genreName"]),
                              GenreCard(
                                  color: favGenreList[1]["Color"],
                                  name: favGenreList[1]["genreName"]),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              GenreCard(
                                  color: favGenreList[2]["Color"],
                                  name: favGenreList[2]["genreName"]),
                              GenreCard(
                                  color: favGenreList[3]["Color"],
                                  name: favGenreList[3]["genreName"])
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
