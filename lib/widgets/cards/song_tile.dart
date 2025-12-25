import 'package:flutter/material.dart';
import 'package:melodify_app/models/song.dart';
import 'package:melodify_app/widgets/common/cached_image.dart';

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

    return ListTile(
      onTap: onTap,
      leading: Row(
        children: [
          if (showIndex && index != null)
            SizedBox(
              width: 32,
              child: Text(
                '1',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),

          if (showAlbumArt) ...[
            if (showIndex) const SizedBox(width: 8),
            SizedBox(
              width: 48,
              height: 48,
              child: Stack(
                children: [
                  AppCachedImage(
                    imgUrl: song.albumArt,
                    width: 48,
                    height: 48,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
