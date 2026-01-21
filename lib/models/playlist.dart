import 'package:melodify_app/models/song.dart';

class Playlist {
  final String id;
  final String name;
  final String description;
  final String coverImage;
  final List<Song> songs;
  final String createdBy;
  final DateTime createdAt;
  final bool isPublic;
  final int followers;

  Playlist({
    required this.id,
    required this.name,
    required this.description,
    required this.coverImage,
    required this.songs,
    required this.createdBy,
    required this.createdAt,
    this.isPublic = true,
    this.followers = 0,
  });

  int get songCount => songs.length;

  Duration get totalDuration {
    return songs.fold(Duration.zero, (sum, song) => sum + song.duration);
  }

  String get totalDurationString {
    final hours = totalDuration.inHours;
    final minutes = totalDuration.inMinutes % 60;
    if (hours > 0) {
      return '$hours hr $minutes min';
    }
    return '$minutes min';
  }
}
