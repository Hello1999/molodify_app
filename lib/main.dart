import 'package:flutter/material.dart';

void main(List<String> args) async {
  runApp(MelodifyApp());
}

class MelodifyApp extends StatelessWidget {
  const MelodifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melodify',
      debugShowCheckedModeBanner: false,
      home: AppShell(),
    );
  }
}

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('a App'));
  }
}
