import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const UraniaQuestApp());
}

class UraniaQuestApp extends StatelessWidget {
  const UraniaQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UrâniaQuest',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,
      home: const WelcomePage(),
    );
  }
}
