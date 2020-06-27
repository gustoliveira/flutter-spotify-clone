import 'package:spotify_clone/Model/album_model.dart';
import 'package:spotify_clone/Model/artist_model.dart';

class TrackModel {
  String album;
  ArtistModel artist;
  int durationMs;
  bool explicit;
  bool isFavorite;
  String externalUrlSpotify;
  String id;
  String name;
  String previewUrl;

  TrackModel({
    this.album,
    this.artist,
    this.durationMs,
    this.explicit,
    this.externalUrlSpotify,
    this.id,
    this.name,
    this.previewUrl,
  });
}
