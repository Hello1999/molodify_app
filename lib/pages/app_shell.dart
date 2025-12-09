import 'package:flutter/material.dart';

class AppShell extends StatefulWidget{
  const AppShell({super.key});

  @override
  State<StatefulWidget> createState() => _AppShellState();
  
}

class _AppShellState extends State<AppShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('data'),
    );
  }
}