import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/Widget/bottom_navigation_bar_icustom_widget.dart';
import '../Model/playlist_model.dart';

class PlaylistPage extends StatefulWidget {
  final PlaylistModel playlistFinal;

  PlaylistPage({this.playlistFinal});

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: true);

    return Scaffold(
      bottomNavigationBar: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: (_, constraints) {
                var maxWidth = constraints.maxWidth;
                var maxHeight = constraints.maxHeight;

                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(15, 15, 15, 1),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      // APPBAR
                      SliverHeaderAppBar(
                        backgroundColor: Colors.green,
                        pinned: true,
                      ),
                      // BANNER COM FOTO e NOME DA PLAYLIST
                      SliverFixedExtentList(
                        itemExtent: 293,
                        delegate: SliverChildListDelegate([
                          Container(
                            child: Column(
                              children: <Widget>[
                                Divider(
                                  color: Colors.transparent,
                                  height: maxHeight * 0.035,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: maxWidth * 0.52,
                                    height: maxWidth * 0.52,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              widget.playlistFinal.imagePath),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: maxHeight * 0.03,
                                ),
                                Text(
                                  widget.playlistFinal.playlistName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(43),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Divider(
                                  color: Colors.transparent,
                                  height: maxHeight * 0.01,
                                ),
                                Text(
                                  "BY ${widget.playlistFinal.ownerName.toUpperCase()}",
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: ScreenUtil().setSp(20),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  height: maxHeight * .015,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Octicons.primitive_dot,
                                      color: Colors.white,
                                      size: ScreenUtil().setSp(25),
                                    ),
                                    Icon(
                                      Octicons.primitive_dot,
                                      color: Colors.white54,
                                      size: ScreenUtil().setSp(25),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      // SHUFFLE PLAY BUTTON
                      SliverHeaderShufflePlayButton(
                        pinned: true,
                        maxHeight: maxHeight,
                        maxWidth: maxWidth,
                      ),
                      // ADD SONGS BUTTON
                      SliverFixedExtentList(
                        itemExtent: 50,
                        delegate: SliverChildListDelegate([
                          Center(
                            child: GestureDetector(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "ADD SONGS",
                                    style: TextStyle(
                                      letterSpacing: ScreenUtil().setSp(3),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: ScreenUtil().setSp(22),
                                    ),
                                  ),
                                ),
                                height: maxHeight * .04,
                                width: maxWidth * .35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white54),
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ]),
                      ),
                      // DOWNLOAD AND SWITCH BUTTON
                      SliverFixedExtentList(
                        itemExtent: 50,
                        delegate: SliverChildListDelegate([
                          Container(
                            margin: EdgeInsets.fromLTRB(ScreenUtil().setSp(30),
                                0, ScreenUtil().setSp(25), 0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Download",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(32),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Expanded(
                                    child:
                                        Container(color: Colors.transparent)),
                                Switch(
                                  inactiveThumbColor: Colors.grey[500],
                                  inactiveTrackColor: Colors.grey[800],
                                  value: false,
                                  onChanged: null,
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                      // MUSICS LIST
                      widget.playlistFinal.tracks != null
                          ? SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return musicRepresentationWidget(
                                      context, index, widget.playlistFinal);
                                },
                                childCount: widget.playlistFinal.playlistLenght,
                              ),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, inteiro) {
                                  return null;
                                },
                                childCount: widget.playlistFinal.playlistLenght,
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBarCustom(
            context: context,
          ),
          backgroundColor: Color(0xff222326),
        ),
      ),
    );
  }

  Widget musicRepresentationWidget(
      BuildContext context, int index, PlaylistModel playlist) {
    return GestureDetector(
      child: Container(
        color: Color.fromRGBO(15, 15, 15, 1),
        padding: EdgeInsets.fromLTRB(3, 10, 0, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${playlist.tracks[index].name}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      textAlign: TextAlign.start,
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 2,
                    ),
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${playlist.tracks[index].artist.name}",
                            style: TextStyle(color: Colors.white54),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              child: Icon(
                                Octicons.primitive_dot,
                                color: Colors.white54,
                                size: ScreenUtil().setSp(10),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "${playlist.tracks[index].album}",
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Entypo.dots_three_vertical,
                size: 15,
                color: Colors.white,
              ),
              splashColor: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

class SliverHeaderAppBar extends StatelessWidget {
  final Color backgroundColor;
  final bool pinned;

  SliverHeaderAppBar({
    this.pinned,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: pinned,
      floating: false,
      delegate: DelegateAppBar(),
    );
  }
}

class DelegateAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: true);

    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      height: 50,
      color: Color.fromRGBO(15, 15, 15, 1),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Ionicons.ios_arrow_round_back,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              splashColor: Colors.transparent),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Entypo.dots_three_vertical,
              size: 15,
              color: Colors.white,
            ),
            splashColor: Colors.transparent,
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SliverHeaderShufflePlayButton extends StatelessWidget {
  final bool pinned;
  final double maxHeight;
  final double maxWidth;

  SliverHeaderShufflePlayButton({
    this.pinned,
    this.maxHeight,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: pinned,
      floating: false,
      delegate:
          DelegateShufflePlayButton(maxHeight: maxHeight, maxWidth: maxWidth),
    );
  }
}

class DelegateShufflePlayButton extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double maxWidth;

  DelegateShufflePlayButton({
    this.maxHeight,
    this.maxWidth,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: true);

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 25,
              color: Color.fromRGBO(15, 15, 15, 1),
              // color: Colors.red,
            ),
            Container(
              height: 25,
              color: Colors.transparent,
            ),
          ],
        ),
        Center(
          child: GestureDetector(
            child: Container(
              child: Center(
                child: Text(
                  "SHUFFLE PLAY",
                  style: TextStyle(
                    letterSpacing: ScreenUtil().setSp(3),
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              height: maxHeight * .079,
              width: maxWidth * .6,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 51;

  @override
  double get minExtent => 51;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
