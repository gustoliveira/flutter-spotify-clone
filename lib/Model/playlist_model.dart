import 'package:spotify_clone/Model/track_model.dart';

class PlaylistModel {
  String imagePath;
  String playlistName;
  String ownerName;
  bool isArtist;
  int playlistLenght;
  List<TrackModel> tracks;

  PlaylistModel({
    this.imagePath,
    this.playlistName,
    this.isArtist = false,
    this.ownerName,
    this.playlistLenght,
    this.tracks,
  });

  List<TrackModel> addTrack(TrackModel trackToBeAdded) {
    tracks.add(trackToBeAdded);
    return tracks;
  }

  List<TrackModel> removeTrack(TrackModel trackToBeRemoved) {
    tracks.remove(trackToBeRemoved);
    return tracks;
  }
}
