import 'package:flutter/material.dart';
import 'package:melodify_app/core/responsive/breakpoint.dart';
import 'package:melodify_app/core/responsive/responsive_builder.dart';
import 'package:melodify_app/models/album.dart';
import 'package:melodify_app/services/mock_data.dart';
import 'package:melodify_app/widgets/cards/album_card.dart';
import 'package:melodify_app/widgets/common/section_header.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  String _searchQuery = '';
  bool _isSearching = false;

  List<Album> _albumResults = MockData.albums.toList();

  void _performSearch(String query) {
    setState(() {
      _searchQuery = query;
      _isSearching = true;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = ResponsiveBuilder.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(
                  screenSize.horizontalPadding,
                  0,
                  screenSize.horizontalPadding,
                  8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    SearchBar(
                      controller: _searchController,
                      focusNode: _focusNode,
                      hintText: 'Songs, artists, or playlists',
                      leading: Icon(Icons.search),
                      trailing: [
                        if (_searchQuery.isNotEmpty)
                          IconButton(
                            onPressed: _clearSearch,
                            icon: Icon(Icons.close),
                          ),
                      ],
                      onChanged: _performSearch,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ..._buildBrowseContent(screenSize),
        ],
      ),
    );
  }

  List<Widget> _buildBrowseContent(ScreenSize screenSize) {
    return [
      SliverToBoxAdapter(
        child: SectionHeader(
          title: 'Browse All',
          subtitle: 'Explore by category',
        ),
      ),
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.horizontalPadding),
        sliver: SliverToBoxAdapter(child: _buildHorizontalAlbums(screenSize)),
      ),
    ];
  }

  Widget _buildHorizontalAlbums(ScreenSize screenSize) {
    final cardWidth = 140.0;

    return AlbumCard(album: _albumResults[0]);
  }
}
