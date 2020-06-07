import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';

import 'package:spotify_clone/Model/playlist_model.dart';
import 'package:spotify_clone/Widget/horizontal_artists_widget.dart';

class HomePage extends StatefulWidget {
  final int currentPage;
  HomePage({this.currentPage});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PlaylistModel> playlistList = [
    PlaylistModel(
        playlistName: "Músicas pra churrasco",
        imagePath: "images/musica_pra_churrasco.jpeg",
        ownerName: "souenaovc"),
    PlaylistModel(
        playlistName: "Soft And Warm",
        imagePath: "images/soft_and_warm.jpeg",
        ownerName: "souenaovc"),
    PlaylistModel(
        playlistName: "Swingera da Baea",
        imagePath: "images/swingera_da_baea.jpeg",
        ownerName: "souenaovc"),
    PlaylistModel(
        playlistName: "The Braba 2",
        imagePath: "images/the_braba_2.jpeg",
        ownerName: "souenaovc"),
    PlaylistModel(
        playlistName: "They're the same",
        imagePath: "images/theyre_the_same.jpeg",
        ownerName: "souenaovc"),
    PlaylistModel(
        playlistName: "Your Top Song from 2019",
        imagePath: "images/your-top-songs-2019_DEFAULT-en.jpg",
        ownerName: "Spotify"),
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
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton(
                      splashColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        SimpleLineIcons.settings,
                        size: 22,
                      ),
                      onPressed: () {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("VAI PARA CONFIGURAÇÃO"),
                              );
                            });
                      }, // Fazer ir para página de Configuração
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tocadas recentemente",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              HorizontalArtistsScrollList(
                playlistList: playlistList.toList()..shuffle(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Novos lançamentos para você",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              HorizontalArtistsScrollList(
                playlistList: playlistList.toList()..shuffle(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tocar novamente",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              HorizontalArtistsScrollList(
                playlistList: playlistList.toList()..shuffle(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Suas playlists",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              HorizontalArtistsScrollList(
                playlistList: playlistList.toList()..shuffle(),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xff222326),
      ),
    ));
  }
}
