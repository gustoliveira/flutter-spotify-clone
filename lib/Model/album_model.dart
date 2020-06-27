import 'package:spotify_clone/Model/artist_model.dart';

class AlbumModel {
  String albumType;
  List<ArtistModel> artists;
  String externalUrlsSpotfy;
  String id;
  String imageUrl;
  String name;
  String releaseDate;
  int totalTracks;

  AlbumModel({
    this.albumType,
    this.artists,
    this.externalUrlsSpotfy,
    this.id,
    this.imageUrl,
    this.name,
    this.releaseDate,
    this.totalTracks,
  });
}
