import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongPage extends StatefulWidget {
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  var _value = 0.0;
  bool isPlaying = false;
  bool isFav = false;
  bool isAleatory = false;
  int repeat = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: true);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            var maxWidth = constraints.maxWidth;
            var maxHeight = constraints.maxHeight;

            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.2, 0.5],
                  colors: [
                    Colors.blueGrey[900],
                    Colors.black87,
                    Color(0xff121212)
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            EvilIcons.chevron_down,
                            size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          splashColor: Colors.transparent),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "PLAYING FROM PLAYLIST",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            Divider(
                              height: 5,
                              color: Colors.transparent,
                            ),
                            Text(
                              "The Braba 2",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            )
                          ],
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
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: maxWidth * 0.85,
                        height: maxHeight * 0.47,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/EllaMai-EllaMai.jpeg"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        width: 60.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Sauce",
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: ScreenUtil().setSp(35),
                              ),
                            ),
                            Text(
                              "Ella Mai",
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: isFav
                            ? Icon(
                                Icons.favorite,
                                size: ScreenUtil().setSp(50),
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.favorite_border,
                                size: ScreenUtil().setSp(50),
                                color: Colors.white54,
                              ),
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                      ),
                      Container(
                        color: Colors.transparent,
                        width: maxWidth * .051,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        width: maxWidth * .051,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Slider(
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                              activeColor: Colors.white,
                              inactiveColor: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  iconSize: ScreenUtil().setSp(10),
                                  icon: Icon(
                                    FontAwesome.random,
                                    color: isAleatory
                                        ? Colors.green
                                        : Colors.white,
                                    size: ScreenUtil().setSp(40),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isAleatory = !isAleatory;
                                    });
                                  },
                                ),
                                IconButton(
                                  iconSize: ScreenUtil().setSp(45),
                                  icon: Icon(AntDesign.stepbackward,
                                      color: Colors.white),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  iconSize: ScreenUtil().setSp(140),
                                  icon: Icon(
                                      isPlaying
                                          ? Icons.pause_circle_filled
                                          : Icons.play_circle_filled,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      if (isPlaying) {
                                        isPlaying = false;
                                      } else {
                                        isPlaying = true;
                                      }
                                    });
                                  },
                                ),
                                IconButton(
                                  iconSize: ScreenUtil().setSp(45),
                                  icon: Icon(AntDesign.stepforward,
                                      color: Colors.white),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  iconSize: ScreenUtil().setSp(45),
                                  icon: Icon(
                                      (repeat == 0 || repeat == 1)
                                          ? MaterialIcons.repeat
                                          : MaterialIcons.repeat_one,
                                      color: (repeat == 1 || repeat == 2)
                                          ? Colors.green
                                          : Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      repeat++;
                                      if (repeat == 3) repeat = 0;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        width: maxWidth * .051,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
