import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../repositories/urania_repository.dart';
import '../widgets/categoria_list_item.dart';
import 'categoria_detalhe_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _abaAtual = 0;
  bool _mostrarApenasFavoritas = false;

  void _alternarFavorito(Categoria cat) {
    setState(() {
      cat.favorita = !cat.favorita;
    });
  }

  Widget _buildAbaCategorias() {
    final listaExibida = _mostrarApenasFavoritas
        ? UraniaRepository.categorias.where((c) => c.favorita).toList()
        : UraniaRepository.categorias;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.indigo.shade50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Escolha uma frente tecnológica para estudar ou competir nos Flashcards:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              FilterChip(
                label: const Text('Favoritos'),
                selected: _mostrarApenasFavoritas,
                onSelected: (valor) {
                  setState(() {
                    _mostrarApenasFavoritas = valor;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: listaExibida.isEmpty
              ? const Center(
                  child: Text('Nenhuma categoria marcada como favorita.'),
                )
              : ListView.builder(
                  itemCount: listaExibida.length,
                  itemBuilder: (context, index) {
                    final cat = listaExibida[index];
                    return CategoriaListItem(
                      categoria: cat,
                      onFavoritar: () => _alternarFavorito(cat),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                CategoriaDetalhePage(categoria: cat),
                          ),
                        );
                        setState(() {});
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildAbaAmazul() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: const Color(0xFF0A1931),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  Icon(Icons.anchor, size: 56, color: Colors.cyanAccent),
                  SizedBox(height: 12),
                  Text(
                    'AMAZUL & CTMSP',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Amazônia Azul Tecnologias de Defesa S.A. e Centro Tecnológico da Marinha em São Paulo',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Quem é a AMAZUL?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'A AMAZUL é uma empresa pública federal criada para promover, desenvolver e manter tecnologias necessárias às atividades do Programa Nuclear da Marinha (PNM), do Programa de Desenvolvimento de Submarinos (PROSUB) e do Programa Nuclear Brasileiro (PNB).',
            style: TextStyle(fontSize: 15, height: 1.4),
          ),
          const SizedBox(height: 16),
          const Text(
            'Atuação em Benefício da Sociedade',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Card(
            child: ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.redAccent),
              title: Text('Reator Multipropósito Brasileiro (RMB)'),
              subtitle: Text(
                'Parceria para produção nacional de radiofármacos usados no diagnóstico e tratamento do câncer.',
              ),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.security, color: Colors.blue),
              title: Text('Domínio do Ciclo do Combustível Nuclear'),
              subtitle: Text(
                'Tecnologia 100% nacional que garante soberania energética e capacitação científica de ponta.',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbaProjetoERanking() {
    final ranking = UraniaRepository.rankingFeira;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sobre o Projeto UrâniaQuest',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Desenvolvido por estudantes do 2º ano de Análise e Desenvolvimento de Sistemas da FIAP, o UrâniaQuest nasceu para combater a desinformação histórica sobre a energia nuclear.\n\n'
            'Pensado para feiras, escolas e eventos institucionais da AMAZUL, o app une conteúdo acessível a uma mecânica de Flashcards competitivos (Solo ou 1v1), permitindo premiar os melhores colocados com brindes educativos.',
            style: TextStyle(fontSize: 15, height: 1.4),
          ),
          const Divider(height: 32, thickness: 1),
          Row(
            children: const [
              Icon(Icons.emoji_events, color: Colors.amber, size: 28),
              SizedBox(width: 8),
              Text(
                'Ranking do Estande (Brindes)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ranking.length,
            itemBuilder: (context, index) {
              final p = ranking[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        index == 0 ? Colors.amber : Colors.indigo.shade100,
                    child: Text(
                      '${index + 1}º',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(p.nome),
                  subtitle: Text('${p.categoriaJogada} • ${p.modoJogo}'),
                  trailing: Text(
                    '${p.pontuacao} pts',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paginas = [
      _buildAbaCategorias(),
      _buildAbaAmazul(),
      _buildAbaProjetoERanking(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('UrâniaQuest • Conteúdos'),
        backgroundColor: const Color(0xFF0A1931),
        foregroundColor: Colors.white,
      ),
      body: paginas[_abaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _abaAtual,
        selectedItemColor: const Color(0xFF185ADB),
        onTap: (novoIndice) {
          setState(() {
            _abaAtual = novoIndice;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.anchor),
            label: 'AMAZUL',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Projeto & Ranking',
          ),
        ],
      ),
    );
  }
}