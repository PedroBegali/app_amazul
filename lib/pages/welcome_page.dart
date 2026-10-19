import 'package:flutter/material.dart';
import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _mostrarTeaserJogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.videogame_asset, color: Colors.indigo),
            SizedBox(width: 8),
            Expanded(child: Text('Modo Aventura: Em Breve!')),
          ],
        ),
        content: const Text(
          'A campanha principal do UrâniaQuest está em desenvolvimento!\n\n'
          'Nela, você assumirá o papel de um cientista no Centro Tecnológico da Marinha '
          'resolvendo missões reais na saúde, agricultura e geração de energia limpa.\n\n'
          'Enquanto isso, explore nossos conteúdos interativos e participe do Desafio de Flashcards da Feira AMAZUL!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Fechar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
            child: const Text('Ir para Conteúdos e Quiz'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A1931), Color(0xFF185ADB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.public,
                size: 100,
                color: Colors.cyanAccent,
              ),
              const SizedBox(height: 20),
              const Text(
                'UrâniaQuest',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Desmistificando a tecnologia nuclear: descubra como a ciência transforma a saúde, a alimentação e o futuro energético do Brasil.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black87,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Iniciar Jogo'),
                  onPressed: () => _mostrarTeaserJogo(context),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.cyanAccent, width: 2),
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  icon: const Icon(Icons.menu_book),
                  label: const Text('Conhecer Nossos Conteúdos'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}