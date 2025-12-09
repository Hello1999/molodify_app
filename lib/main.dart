import 'package:flutter/material.dart';
import 'package:melodify_app/pages/app_shell.dart';

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
