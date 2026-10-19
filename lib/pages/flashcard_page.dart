import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../models/flashcard.dart';
import '../models/participante.dart';
import '../repositories/urania_repository.dart';

class FlashcardPage extends StatefulWidget {
  final Categoria categoria;
  final String nomeJogador;
  final String emailJogador;
  final String modoJogo;
  final bool registrarNoRanking;

  const FlashcardPage({
    super.key,
    required this.categoria,
    required this.nomeJogador,
    required this.emailJogador,
    required this.modoJogo,
    required this.registrarNoRanking,
  });

  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  late List<Flashcard> _perguntas;
  int _indiceAtual = 0;
  int _pontuacao = 0;
  int? _opcaoSelecionada;
  bool _respostaConfirmada = false;

  @override
  void initState() {
    super.initState();
    _perguntas =
        UraniaRepository.buscarFlashcardsPorCategoria(widget.categoria.id);
  }

  void _confirmarResposta() {
    if (_opcaoSelecionada == null) return;

    final cardAtual = _perguntas[_indiceAtual];
    setState(() {
      _respostaConfirmada = true;
      if (_opcaoSelecionada == cardAtual.indiceCorreto) {
        _pontuacao += 100;
      }
    });
  }

  void _proximaPergunta() {
    if (_indiceAtual < _perguntas.length - 1) {
      setState(() {
        _indiceAtual++;
        _opcaoSelecionada = null;
        _respostaConfirmada = false;
      });
    } else {
      _finalizarQuiz();
    }
  }

  void _finalizarQuiz() {
    if (widget.registrarNoRanking) {
      UraniaRepository.adicionarParticipanteRanking(
        Participante(
          nome: widget.nomeJogador,
          email: widget.emailJogador,
          modoJogo: widget.modoJogo,
          categoriaJogada: widget.categoria.titulo,
          pontuacao: _pontuacao,
        ),
      );
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Desafio Concluído!'),
        content: Text(
          'Jogador(es): ${widget.nomeJogador}\n'
          'Pontuação Final: $_pontuacao pontos!\n\n'
          '${widget.registrarNoRanking ? "Seu resultado já foi enviado para o Ranking da Feira AMAZUL (confira na 3ª aba da tela principal)!" : "Continue treinando para competir no modo Feira!"}',
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('Concluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardAtual = _perguntas[_indiceAtual];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards • ${widget.categoria.titulo}'),
        backgroundColor: widget.categoria.cor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Questão ${_indiceAtual + 1} de ${_perguntas.length}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Chip(
                  avatar: const Icon(Icons.stars, color: Colors.amber),
                  label: Text(
                    '$_pontuacao pts',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 4,
              color: const Color(0xFF0A1931),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  cardAtual.pergunta,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cardAtual.opcoes.length,
                itemBuilder: (context, index) {
                  final selecionada = _opcaoSelecionada == index;
                  Color? corCard;
                  if (_respostaConfirmada) {
                    if (index == cardAtual.indiceCorreto) {
                      corCard = Colors.green.shade100;
                    } else if (selecionada) {
                      corCard = Colors.red.shade100;
                    }
                  } else if (selecionada) {
                    corCard = Colors.indigo.shade50;
                  }

                  return Card(
                    color: corCard,
                    child: RadioListTile<int>(
                      value: index,
                      // ignore: deprecated_member_use
                      groupValue: _opcaoSelecionada,
                      title: Text(cardAtual.opcoes[index]),
                      // ignore: deprecated_member_use
                      onChanged: _respostaConfirmada
                          ? null
                          : (valor) {
                              setState(() {
                                _opcaoSelecionada = valor;
                              });
                            },
                    ),
                  );
                },
              ),
            ),
            if (_respostaConfirmada)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blueGrey.shade200),
                ),
                child: Text(
                  '💡 Explicação: ${cardAtual.explicacao}',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF185ADB),
                  foregroundColor: Colors.white,
                ),
                onPressed: _opcaoSelecionada == null
                    ? null
                    : (_respostaConfirmada
                        ? _proximaPergunta
                        : _confirmarResposta),
                child: Text(
                  _respostaConfirmada
                      ? (_indiceAtual < _perguntas.length - 1
                          ? 'Próximo Flashcard'
                          : 'Ver Resultado Final')
                      : 'Confirmar Resposta',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}