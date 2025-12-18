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
}
