class PlaylistModel {
  String imagePath;
  String playlistName;
  String ownerName;
  bool isArtist;
  int playlistLenght;

  PlaylistModel(
      {this.imagePath,
      this.playlistName,
      this.isArtist = false,
      this.ownerName,
      this.playlistLenght});
}
