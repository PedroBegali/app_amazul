import 'package:flutter/material.dart';
import '../repositories/urania_repository.dart';
import '../theme/app_theme.dart';
import '../widgets/categoria_list_item.dart';
import '../widgets/fundo_degrade.dart';
import 'categoria_detalhe_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _abaSelecionada =
      1; // Já abre na aba "Conteúdos" igual à Tela 2 da imagem!

  // Cor da bolinha de posição no ranking: ouro, prata, bronze e depois teal.
  Color _corMedalha(int index) {
    if (index == 0) return AppColors.amarelo;
    if (index == 1) return AppColors.prata;
    if (index == 2) return AppColors.bronze;
    return AppColors.teal;
  }

  // ABA 1: Conteúdos (Lista de Categorias da Tela 2)
  Widget _buildAbaConteudos() {
    final categorias = UraniaRepository.categorias;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: categorias.length,
      itemBuilder: (context, index) {
        final cat = categorias[index];
        return CategoriaListItem(
          categoria: cat,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CategoriaDetalhePage(categoria: cat),
              ),
            );
            setState(() {});
          },
        );
      },
    );
  }

  // ABA 2: Ranking da Feira AMAZUL
  Widget _buildAbaRanking() {
    final ranking = UraniaRepository.rankingFeira;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: ranking.length,
      itemBuilder: (context, index) {
        final p = ranking[index];
        final medalha = _corMedalha(index);
        // Texto preto sobre ouro/prata/bronze (cores claras); branco sobre teal.
        final corTextoPosicao = index < 3 ? Colors.black : Colors.white;

        return Card(
          color: AppColors.cartaoClaro,
          elevation: 4,
          shadowColor: Colors.black54,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 6,
            ),
            leading: CircleAvatar(
              backgroundColor: medalha,
              foregroundColor: corTextoPosicao,
              child: Text(
                '${index + 1}º',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              p.nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textoEscuro,
              ),
            ),
            subtitle: Text(
              '${p.categoriaJogada} • ${p.modoJogo}',
              style: const TextStyle(color: AppColors.textoMedio),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.monetization_on,
                  color: Color(0xFFF5A300),
                  size: 22,
                ),
                const SizedBox(width: 4),
                Text(
                  '${p.pontuacao}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                    color: AppColors.fundo,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ABA 3: Perfil do Visitante / Estatísticas
  Widget _buildAbaPerfil() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Anel ciano ao redor do avatar (como o avatar da Tela 3).
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.ciano, width: 3),
              boxShadow: [
                BoxShadow(
                  color: AppColors.ciano.withValues(alpha: 0.35),
                  blurRadius: 18,
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 48,
              backgroundColor: AppColors.teal,
              child: Icon(Icons.person, size: 54, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Explorador Nuclear',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Estande Interativo • AMAZUL & CTMSP',
            style: TextStyle(color: AppColors.ciano),
          ),
          const SizedBox(height: 24),
          Card(
            color: AppColors.painel,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: const BorderSide(color: AppColors.bordaEscura),
            ),
            child: ListTile(
              leading: const Icon(Icons.emoji_events, color: AppColors.amarelo),
              title: const Text(
                'Participantes no Ranking Hoje',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                '${UraniaRepository.rankingFeira.length}',
                style: const TextStyle(
                  color: AppColors.amarelo,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titulos = ['Início', 'Categorias', 'Ranking da Feira', 'Perfil'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(titulos[_abaSelecionada]),
      ),
      body: FundoDegrade(
        child: _abaSelecionada == 1
            ? _buildAbaConteudos()
            : (_abaSelecionada == 2 ? _buildAbaRanking() : _buildAbaPerfil()),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
        child: BottomNavigationBar(
          backgroundColor: AppColors.fundoBase,
          type: BottomNavigationBarType.fixed,
          currentIndex: _abaSelecionada,
          selectedItemColor: AppColors.ciano,
          unselectedItemColor: Colors.white54,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          elevation: 0,
          onTap: (index) {
            if (index == 0) {
              Navigator.pop(context);
            } else {
              setState(() {
                _abaSelecionada = index;
              });
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Conteúdos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              label: 'Ranking',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}
