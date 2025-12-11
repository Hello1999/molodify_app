import 'package:flutter/material.dart';

class AppShell extends StatefulWidget{
  const AppShell({super.key});

  @override
  State<StatefulWidget> createState() => _AppShellState();
  
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;


  final List<NavigationDestination> _destinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.search_outlined),
      selectedIcon: Icon(Icons.search),
      label: 'Search',
    ),
    NavigationDestination(
      icon: Icon(Icons.library_music_outlined),
      selectedIcon: Icon(Icons.library_music),
      label: 'Library',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outlined),
      selectedIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Text('A')
        ],
      ),
      bottomNavigationBar: Column(
        children: [
          NavigationBar(
            selectedIndex: _currentIndex, onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
          },
          destinations: _destinations, 
          )
        ],
      ),
    );
  }
}