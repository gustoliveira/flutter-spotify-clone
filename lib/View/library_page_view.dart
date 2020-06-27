import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/Controller/playlist_controller.dart';
import 'package:spotify_clone/Controller/rawPlaylist.dart'; // Will not be pushed to github repository, later will have informations direct from spotify API
import 'package:spotify_clone/View/playlist_page_view.dart';

import 'package:spotify_clone/Widget/search_flatbuttom_widget.dart';

import '../Model/playlist_model.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<PlaylistModel> playlistList = [
    PlaylistController(rawPlaylist: rawPlaylist).createPlaylistModel(
        rawPlaylist), // rawPlaylist is the json response from spotify API with informations about the playlist
    PlaylistModel(
      playlistName: "Músicas pra churrasco",
      imagePath: "images/musica_pra_churrasco.jpeg",
      ownerName: "souenaovc",
      isArtist: false,
      tracks: null,
    ),
    PlaylistModel(
      playlistName: "Soft And Warm",
      imagePath: "images/soft_and_warm.jpeg",
      ownerName: "souenaovc",
      isArtist: false,
      tracks: null,
    ),
    PlaylistModel(
      playlistName: "Swingera da Baea",
      imagePath: "images/swingera_da_baea.jpeg",
      ownerName: "souenaovc",
      isArtist: false,
      tracks: null,
    ),
    PlaylistModel(
      playlistName: "The Braba 2",
      imagePath: "images/the_braba_2.jpeg",
      ownerName: "souenaovc",
      isArtist: false,
      tracks: null,
    ),
    PlaylistModel(
      playlistName: "Your Top Song from 2019",
      imagePath: "images/your-top-songs-2019_DEFAULT-en.jpg",
      ownerName: "Spotify",
      isArtist: false,
      tracks: null,
    ),
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
                              "Music",
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
                      hintText: "Find in playlists",
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
                            "Filters",
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
                    createPlaylistButton(),
                    likedSongsButton(),
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
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaylistPage(
                playlistFinal: playlist,
              ),
            ));
      },
    );
  }

  Widget createPlaylistButton() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
        child: Row(
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xff222326),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Create playlist",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget likedSongsButton() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
        child: Row(
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage("images/liked_songs.png"),
                    fit: BoxFit.fill),
              ),
              padding: EdgeInsets.only(right: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Liked Songs",
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
                    "1232 songs",
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

class SliverHeader extends StatelessWidget {
  final Color backgroundColor;
  final bool pinned;

  SliverHeader({
    this.pinned,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: pinned,
      floating: false,
      delegate: Delegate(backgroundColor),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;

  Delegate(this.backgroundColor);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: true);

    return Container(
      padding: EdgeInsets.fromLTRB(0, 10.w, 0, 0),
      height: 103,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FlattButtonWithBottomBorder(
            label: "Playlists",
            labelColor: Colors.white,
            backgroundColor: backgroundColor,
            borderColor: Colors.green,
          ),
          FlattButtonWithBottomBorder(
            label: "Artists",
            labelColor: Colors.white54,
            backgroundColor: backgroundColor,
            borderColor: Colors.transparent,
          ),
          FlattButtonWithBottomBorder(
            label: "Albums",
            labelColor: Colors.white54,
            backgroundColor: backgroundColor,
            borderColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class FlattButtonWithBottomBorder extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color backgroundColor;
  final Color borderColor;

  FlattButtonWithBottomBorder(
      {this.label, this.labelColor, this.backgroundColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                      color: labelColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              width: 75,
              height: 52.5,
              color: backgroundColor,
            ),
            Container(
              width: 75,
              height: 2.5,
              color: borderColor,
            ),
          ],
        ),
      ),
    );
  }
}
