import 'package:flutter/material.dart';
import 'package:spotify_clone/Model/playlist_model.dart';

class HorizontalArtistsScrollList extends StatefulWidget {
  final List<PlaylistModel> playlistList;
  final VoidCallback onPressed;

  HorizontalArtistsScrollList({this.playlistList, this.onPressed});

  @override
  _HorizontalArtistsScrollListState createState() =>
      _HorizontalArtistsScrollListState();
}

class _HorizontalArtistsScrollListState
    extends State<HorizontalArtistsScrollList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView.separated(
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.playlistList.length,
        itemBuilder: (context, index) => _artistCard(context, index),
      ),
    );
  }

  Widget _artistCard(context, index) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 115,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                // QUANDO APERTAR IR PARA ALBUM/ARTISTA
                onTap: () {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content:
                              Text(widget.playlistList[index].playlistName),
                        );
                      });
                },
                child: SizedBox(
                  child: Image.asset(widget.playlistList[index].imagePath),
                  height: 115,
                  width: 115,
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 3,
              ),
              Text(
                widget.playlistList[index].playlistName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              )
            ],
          ),
        ));
  }
}
