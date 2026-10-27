import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../theme/app_theme.dart';
import '../widgets/fundo_degrade.dart';
import 'checkin_feira_page.dart';
import 'flashcard_page.dart';

class CategoriaDetalhePage extends StatelessWidget {
  final Categoria categoria;

  const CategoriaDetalhePage({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoria.titulo)),
      body: FundoDegrade(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: AppColors.cartaoClaro,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          categoria.iconeAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      categoria.titulo,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.fundo,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      categoria.resumoEducativo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.textoMedio,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  style: AppTheme.botaoTeal,
                  icon: const Icon(Icons.play_circle_fill),
                  label: const Text(
                    'Praticar Flashcards (Modo Solo)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FlashcardPage(
                          categoria: categoria,
                          nomeJogador: 'Explorador Solo',
                          emailJogador: '',
                          modoJogo: 'Treino Solo',
                          registrarNoRanking: false,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  style: AppTheme.botaoAmarelo,
                  icon: const Icon(Icons.emoji_events),
                  label: const Text(
                    'Modo Feira AMAZUL (Solo ou 1v1)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
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
      ),
    );
  }
}
