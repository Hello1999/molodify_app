import 'package:flutter/material.dart';
import 'package:melodify_app/core/responsive/breakpoint.dart';
import 'package:melodify_app/core/responsive/responsive_builder.dart';

import 'package:melodify_app/services/mock_data.dart';
import 'package:melodify_app/widgets/cards/playlist_card.dart';
import 'package:melodify_app/widgets/cards/song_tile.dart';
import 'package:melodify_app/widgets/common/cached_image.dart';
import 'package:melodify_app/widgets/common/section_header.dart';

class HomePage extends StatelessWidget {
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 18) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = ResponsiveBuilder.of(context);

    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Row(
              children: [
                Icon(
                  Icons.music_note_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text('Melodify'),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.history)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(screenSize.horizontalPadding),
              child: Text(
                _getGreeting(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: _buildQuickPlayGrid(context, screenSize)),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Made For You',
              subtitle: 'Personalized playlists',
              onSeeAll: () => {},
            ),
          ),
          SliverToBoxAdapter(child: _buildPlaylistSection(context, screenSize)),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Top Charts',
              subtitle: 'Most played this week',
              onSeeAll: () {},
            ),
          ),
          SliverToBoxAdapter(child: _buildTopCharts(context)),
        ],
      ),
    );
  }

  Widget _buildQuickPlayGrid(BuildContext context, ScreenSize screenSize) {
    final playlists = MockData.playlists.take(6).toList();
    final columns = screenSize.isMobile ? 2 : (screenSize.isTablet ? 3 : 4);
    final itemsToShow = screenSize.isMobile ? 6 : playlists.length;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          childAspectRatio: 3.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: itemsToShow,
        itemBuilder: (context, index) {
          final playlist = playlists[index];
          return _QuickPlayItem(playlist: playlist, onTap: () => {});
        },
      ),
    );
  }

  Widget _buildPlaylistSection(BuildContext context, ScreenSize screenSize) {
    final playlists = MockData.playlists;
    final cardWidth = context.responsive<double>(
      mobile: 150,
      tablet: 170,
      desktop: 180,
    );

    return SizedBox(
      height: cardWidth + 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenSize.horizontalPadding),
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          final artists = playlists[index];
          return Padding(
            padding: EdgeInsets.only(right: 16),
            child: PlaylistCard(
              playlist: artists,
              width: cardWidth,
              onTap: () => {print('touch on homepage 115')},
            ),
          );
        },
      ),
    );
  }

  Widget _buildTopCharts(BuildContext context) {
    final songs = MockData.topCharts.take(5).toList();

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return SongTile(
          song: songs[index],
          playlist: songs,
          index: index,
          showIndex: true,
        );
      },
    );
  }
}

class _QuickPlayItem extends StatelessWidget {
  final dynamic playlist;
  final VoidCallback? onTap;

  const _QuickPlayItem({required this.playlist, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(4),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            AppCachedImage(imgUrl: playlist.coverImage, width: 56, height: 56),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                playlist.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
