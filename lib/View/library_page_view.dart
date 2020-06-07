import 'package:flutter/material.dart';
import 'package:spotify_clone/Widget/search_flatbuttom_widget.dart';
import 'package:spotify_clone/Widget/sliver_header_widget.dart';

import '../Model/playlist_model.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<PlaylistModel> playlistList = [
    PlaylistModel(
        playlistName: "Músicas pra churrasco",
        imagePath: "images/musica_pra_churrasco.jpeg",
        ownerName: "souenaovc",
        isArtist: false),
    PlaylistModel(
        playlistName: "Soft And Warm",
        imagePath: "images/soft_and_warm.jpeg",
        ownerName: "souenaovc",
        isArtist: false),
    PlaylistModel(
        playlistName: "They're the same",
        imagePath: "images/theyre_the_same.jpeg",
        ownerName: "souenaovc",
        isArtist: false),
    PlaylistModel(
        playlistName: "Swingera da Baea",
        imagePath: "images/swingera_da_baea.jpeg",
        ownerName: "souenaovc",
        isArtist: false),
    PlaylistModel(
        playlistName: "The Braba 2",
        imagePath: "images/the_braba_2.jpeg",
        ownerName: "souenaovc",
        isArtist: false),
    PlaylistModel(
        playlistName: "Your Top Song from 2019",
        imagePath: "images/your-top-songs-2019_DEFAULT-en.jpg",
        ownerName: "Spotify",
        isArtist: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Container(
            color: Color(0xff121212),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFixedExtentList(
                  itemExtent: 80,
                  delegate: SliverChildListDelegate([
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 50, 10, 0),
                      color: Color(0xff121212),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              "Músicas",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              "Podcasts",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white54),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
                SliverHeader(
                  backgroundColor: Color(0xff121212),
                  pinned: true,
                ),
                SliverFixedExtentList(
                  itemExtent: 60,
                  delegate: SliverChildListDelegate([
                    CustomTextFieldFlatButtom(
                      height: 33,
                      width: MediaQuery.of(context).size.width * (0.73),
                      buttomPadding: EdgeInsets.all(0),
                      hintText: "Procure entre playlists",
                      hintTextStyle:
                          TextStyle(fontSize: 14, color: Colors.white54),
                      havePrefix: true,
                      prefixIcon: Icon(Icons.search, color: Colors.white54),
                      prefixPadding: EdgeInsets.fromLTRB(15, 8, 0, 15),
                      haveSuffix: true,
                      suffixIcon: ButtonTheme(
                        height: 33,
                        minWidth: 50,
                        child: FlatButton(
                          color: Color(0xff222326),
                          onPressed: () {},
                          child: Text(
                            "Filtros",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white54),
                          ),
                        ),
                      ),
                      suffixPadding: EdgeInsets.only(left: 10),
                      backgroundColor: Color(0xff222326),
                    ),
                  ]),
                ),
                SliverFixedExtentList(
                  itemExtent: 85,
                  delegate: SliverChildListDelegate([
                    playlistRepresentationWidget(playlistList[0]),
                    playlistRepresentationWidget(playlistList[1]),
                    playlistRepresentationWidget(playlistList[2]),
                    playlistRepresentationWidget(playlistList[3]),
                    playlistRepresentationWidget(playlistList[4]),
                    playlistRepresentationWidget(playlistList[5]),
                    playlistRepresentationWidget(playlistList[0]),
                    playlistRepresentationWidget(playlistList[1]),
                    playlistRepresentationWidget(playlistList[2]),
                    playlistRepresentationWidget(playlistList[3]),
                    playlistRepresentationWidget(playlistList[4]),
                    playlistRepresentationWidget(playlistList[5]),
                  ]),
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xff222326),
        ),
      ),
    );
  }

  Widget playlistRepresentationWidget(PlaylistModel playlist) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
        child: Row(
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                  shape: playlist.isArtist == true
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage(playlist.imagePath), fit: BoxFit.fill)),
              padding: EdgeInsets.only(right: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    playlist.playlistName,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 2,
                  ),
                  Text(
                    "de ${playlist.ownerName}",
                    style: TextStyle(color: Colors.white54),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
