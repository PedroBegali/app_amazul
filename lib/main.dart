import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'theme/app_theme.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );

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
