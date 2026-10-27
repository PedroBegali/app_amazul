import 'package:flutter/material.dart';
import 'home_page.dart';
import 'sobre_projeto_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _mostrarModalModoAventura(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0D2B45),
        title: const Text(
          '⚛️ Modo Campanha (Em Breve)',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'A jornada completa do UrâniaQuest está sendo construída!\n\n'
          'Enquanto isso, clique em "Explorar conteúdos" para acessar os Flashcards interativos da Feira AMAZUL e disputar o Ranking de brindes!',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              'Voltar',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
            child: const Text(
              'Ir para Categorias',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF071A2E),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/bg_player.jpg',
            fit: BoxFit.cover, // Preenche a tela inteira
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF071A2E)),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  const Color(0xFF051322).withOpacity(0.85),
                  const Color(0xFF051322),
                ],
                stops: const [0.4, 0.8, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  Image.asset(
                    'assets/logo_urania.png',
                    fit: BoxFit.contain,
                    height: 90,
                    errorBuilder: (_, __, ___) => const Text(
                      'URÂNIA\nQUEST',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFCA28),
                        foregroundColor: const Color(0xFF071A2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 6,
                      ),
                      onPressed: () => _mostrarModalModoAventura(context),
                      child: const Text(
                        'Jogar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0E7C96),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        );
                      },
                      child: const Text(
                        'Explorar conteúdos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF0A2239,
                        ).withOpacity(0.8),
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          color: Color(0xFF286684),
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SobreProjetoPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sobre o projeto',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
