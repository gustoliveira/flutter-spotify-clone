import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            label: "Artistas",
            labelColor: Colors.white54,
            backgroundColor: backgroundColor,
            borderColor: Colors.transparent,
          ),
          FlattButtonWithBottomBorder(
            label: "Álbuns",
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
