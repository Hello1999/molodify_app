import 'package:flutter/material.dart';
import 'package:melodify_app/models/playlist.dart';
import 'package:melodify_app/widgets/common/cached_image.dart';

class PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const PlaylistCard({
    super.key,
    required this.playlist,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final cardWidth = width ?? 160;

    
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCachedImage(
              imgUrl: playlist.coverImage,
              width: cardWidth,
              height: height ?? cardWidth,
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(height: 8),
            Text(
              playlist.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              playlist.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant
              ),
            )
          ],
        ),
      ),
    );
  }
}
