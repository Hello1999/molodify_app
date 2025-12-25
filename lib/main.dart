import 'package:flutter/material.dart';
import 'package:melodify_app/core/theme/app_theme.dart';
import 'package:melodify_app/pages/app_shell.dart';
import 'package:melodify_app/providers/providers.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized(); // 添加这行!
  
  final themeProvider = ThemeProvider();
  themeProvider.loadSettings();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider.value(value: themeProvider)],
      child: MelodifyApp(),
    ),
  );
}

class MelodifyApp extends StatelessWidget {
  const MelodifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'Melodify',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(themeProvider.seedColor),
      darkTheme: AppTheme.darkTheme(themeProvider.seedColor),
      home: AppShell(),
    );
  }
}
