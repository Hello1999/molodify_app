import 'package:flutter/material.dart';
import 'package:melodify_app/models/song.dart';

class SongTile extends StatelessWidget {
  final Song song;
  final List<Song>? playlist;
  final int? index;
  final bool showIndex;
  final bool showAlbumArt;
  final bool showDuration;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;

  SongTile({
    super.key,
    required this.song,
    this.playlist,
    this.index,
    this.showIndex = false,
    this.showAlbumArt = true,
    this.showDuration = true,
    this.onTap,
    this.onMoreTap,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        SizedBox(
          width: 32,
          child: Text(
            '1',
            style: textTheme.bodyLarge?.copyWith(color: colorScheme.primary),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
