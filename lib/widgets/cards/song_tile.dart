import 'package:flutter/material.dart';
import 'package:melodify_app/models/song.dart';
import 'package:melodify_app/providers/player_provider.dart';
import 'package:melodify_app/widgets/common/cached_image.dart';
import 'package:provider/provider.dart';

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
    final playerProvider = context.watch<PlayerProvider>();
    final isPlaying = playerProvider.currentSong?.id == song.id;

    return ListTile(
      onTap: onTap,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIndex && index != null)
            SizedBox(
              width: 32,
              child: Text(
                '${index! + 1}',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          if (showAlbumArt) ...[
            SizedBox(width: 8),
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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.equalizer,
                        color: colorScheme.primary,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
      title: Text(
        song.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: textTheme.bodyLarge?.copyWith(
          color: isPlaying ? colorScheme.primary : null,
          fontWeight: isPlaying ? FontWeight.w600 : null,
        ),
      ),
      subtitle: Row(
        children: [
          if (song.isLiked)
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: Icon(Icons.favorite, size: 12, color: colorScheme.primary),
            ),
          Expanded(
            child: Text(
              song.artist,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDuration)
            Text(
              song.durationString,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
    );
  }
}
