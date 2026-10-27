import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/fundo_degrade.dart';

class SobreProjetoPage extends StatelessWidget {
  const SobreProjetoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o Projeto & AMAZUL')),
      body: FundoDegrade(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                color: AppColors.cartaoClaro,
                elevation: 6,
                shadowColor: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '⚓ Parceria AMAZUL & CTMSP',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.fundo,
                        ),
                      ),
                      SizedBox(height: 8),

                      Text(
                        'A Amazônia Azul Tecnologias de Defesa S.A. (AMAZUL) e o Centro Tecnológico da Marinha em São Paulo desenvolvem tecnologias essenciais para a saúde (Reator Multipropósito Brasileiro), geração de energia limpa e soberania nacional.',
                        style: TextStyle(
                          height: 1.45,
                          color: AppColors.textoMedio,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                color: AppColors.cartaoClaro,
                elevation: 6,
                shadowColor: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '🎓 Projeto UrâniaQuest (FIAP)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.fundo,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Criado por alunos do 2º ano de Análise e Desenvolvimento de Sistemas da FIAP para desmistificar a tecnologia nuclear por meio da gamificação em feiras, escolas e eventos.',
                        style: TextStyle(
                          height: 1.45,
                          color: AppColors.textoMedio,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
