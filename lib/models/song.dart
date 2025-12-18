class  Song {
    final String id;
    final String title;
    final String artist;
    final String album;
    final String albumArt;
    final Duration duration;
    final bool isLiked;
    final int playCount;
    final DateTime? addedAt;

    Song({
      required this.id,
      required this.title,
      required this.artist,
      required this.album,
      required this.albumArt,
      required this.duration,
      this.isLiked = false,
      this.playCount = 0,
      this.addedAt
    });

    
}