import 'package:spotify_clone/Model/artist_model.dart';
import 'package:spotify_clone/Model/playlist_model.dart';
import 'package:spotify_clone/Model/track_model.dart';

class PlaylistController {
  final Map<dynamic, dynamic> rawPlaylist;

  PlaylistController({this.rawPlaylist});

  List<TrackModel> _createTrackList(Map<dynamic, dynamic> rawPlaylist) {
    List<TrackModel> trackList = List<TrackModel>();
    for (int i = 0; i < rawPlaylist["tracks"]["total"]; i++) {
      TrackModel track = TrackModel(
        durationMs: rawPlaylist["tracks"]["items"][i]["track"]["duration_ms"],
        album: rawPlaylist["tracks"]["items"][i]["track"]["album"]["name"],
        artist: ArtistModel(
          externalUrlsSpotify: rawPlaylist["tracks"]["items"][i]["track"]
              ["album"]["artists"][0]["external_urls"]["spotify"],
          id: rawPlaylist["tracks"]["items"][i]["track"]["album"]["artists"][0]
              ["id"],
          name: rawPlaylist["tracks"]["items"][i]["track"]["album"]["artists"]
              [0]["name"],
          type: rawPlaylist["tracks"]["items"][i]["track"]["album"]["artists"]
              [0]["type"],
        ),
        explicit: rawPlaylist["tracks"]["items"][i]["track"]["explicit"],
        externalUrlSpotify: rawPlaylist["tracks"]["items"][i]["track"]
            ["external_urls"]["spotify"],
        id: rawPlaylist["tracks"]["items"][i]["track"]["id"],
        name: rawPlaylist["tracks"]["items"][i]["track"]["name"],
        previewUrl: rawPlaylist["tracks"]["items"][i]["track"]["preview_url"],
      );

      trackList.add(track);
    }

    return trackList;
  }

  PlaylistModel createPlaylistModel(Map<dynamic, dynamic> rawPlaylist) {
    return PlaylistModel(
      imagePath: "images/theyre_the_same.jpeg",
      playlistName: rawPlaylist["name"],
      isArtist: false,
      ownerName: rawPlaylist["owner"]["display_name"],
      playlistLenght: rawPlaylist["tracks"]["total"],
      tracks: _createTrackList(rawPlaylist),
    );
  }
}
