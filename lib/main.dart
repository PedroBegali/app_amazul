import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A1931)),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}