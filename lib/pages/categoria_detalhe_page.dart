import 'package:flutter/material.dart';
import '../models/categoria.dart';
import 'checkin_feira_page.dart';
import 'flashcard_page.dart';

class CategoriaDetalhePage extends StatelessWidget {
  final Categoria categoria;

  const CategoriaDetalhePage({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.titulo),
        backgroundColor: categoria.cor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 44,
                backgroundColor: categoria.cor.withOpacity(0.15),
                child: Icon(categoria.icone, size: 48, color: categoria.cor),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Como essa tecnologia funciona?',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  categoria.textoEducativo,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Benefício Direto para a Sociedade',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.amber.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Colors.amber, size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        categoria.impactoPratico,
                        style: const TextStyle(fontSize: 15, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Pronto para testar seus conhecimentos?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.school),
                label: const Text('Estudar Flashcards (Modo Treino)'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FlashcardPage(
                        categoria: categoria,
                        nomeJogador: 'Visitante (Treino)',
                        emailJogador: '',
                        modoJogo: 'Treino Livre',
                        registrarNoRanking: false,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A1931),
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.emoji_events),
                label: const Text('Competir na Feira AMAZUL (Solo ou 1v1)'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckinFeiraPage(categoria: categoria),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}