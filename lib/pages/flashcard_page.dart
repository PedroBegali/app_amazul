import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../models/flashcard.dart';
import '../models/participante.dart';
import '../repositories/urania_repository.dart';
import '../theme/app_theme.dart';
import '../widgets/fundo_degrade.dart';

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
  int _moedas = 0;
  int _vidas = 3;
  int? _opcaoSelecionada;
  bool _respostaConfirmada = false;

  @override
  void initState() {
    super.initState();
    _perguntas = UraniaRepository.buscarPorCategoria(widget.categoria.id);
  }

  void _confirmarOuAvancar() {
    if (_opcaoSelecionada == null) return;

    if (!_respostaConfirmada) {
      final cardAtual = _perguntas[_indiceAtual];
      setState(() {
        _respostaConfirmada = true;
        if (_opcaoSelecionada == cardAtual.indiceCorreto) {
          _moedas += 50;
        } else {
          if (_vidas > 0) _vidas--;
        }
      });
    } else {
      if (_indiceAtual < _perguntas.length - 1 && _vidas > 0) {
        setState(() {
          _indiceAtual++;
          _opcaoSelecionada = null;
          _respostaConfirmada = false;
        });
      } else {
        _mostrarResultadoFinal();
      }
    }
  }

  void _mostrarResultadoFinal() {
    if (widget.registrarNoRanking) {
      UraniaRepository.adicionarNoRanking(
        Participante(
          nome: widget.nomeJogador,
          email: widget.emailJogador,
          modoJogo: widget.modoJogo,
          categoriaJogada: widget.categoria.titulo,
          pontuacao: _moedas,
        ),
      );
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.painel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(color: AppColors.bordaEscura),
        ),
        title: const Text(
          '🏆 Desafio Concluído!',
          style: TextStyle(
            color: AppColors.amarelo,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Jogador: ${widget.nomeJogador}\n'
          'Moedas acumuladas: $_moedas 🪙\n'
          'Vidas restantes: $_vidas ❤️\n\n'
          '${widget.registrarNoRanking ? "Sua pontuação foi registrada no Ranking da Feira AMAZUL!" : "Bom treino! Inscreva-se no modo Feira para concorrer aos brindes."}',
          style: const TextStyle(color: Colors.white, height: 1.4),
        ),
        actions: [
          ElevatedButton(
            style: AppTheme.botaoIndigo,
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('Voltar para a Categoria'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardAtual = _perguntas[_indiceAtual];
    final progresso = (_indiceAtual + 1) / _perguntas.length;

    return Scaffold(
      body: FundoDegrade(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 4),

                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.ciano.withValues(alpha: 0.4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: AppColors.ciano,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.teal,
                          child: ClipOval(
                            child: Image.asset(
                              widget.categoria.iconeAsset,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Row(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(
                            index < _vidas
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.redAccent,
                            size: 26,
                          ),
                        );
                      }),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F2D4A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.monetization_on,
                            color: Color(0xFFFFCA28),
                            size: 22,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '$_moedas',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Text(
                  widget.categoria.titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progresso,
                          minHeight: 10,
                          backgroundColor: AppColors.painelOpcao,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF8BC34A),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${_indiceAtual + 1}/${_perguntas.length}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
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
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(22),
                        ),
                        child: Image.network(
                          widget.categoria.imagemUrl,
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            height: 135,
                            width: double.infinity,
                            color: widget.categoria.corFundoIcone,
                            padding: const EdgeInsets.all(24),
                            child: Image.asset(
                              widget.categoria.iconeAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),
                        child: Text(
                          cardAtual.pergunta,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textoEscuro,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                Expanded(
                  child: ListView.builder(
                    itemCount: cardAtual.opcoes.length,
                    itemBuilder: (context, index) {
                      final selecionada = _opcaoSelecionada == index;
                      final ehCorreta = index == cardAtual.indiceCorreto;

                      Color corFundo = AppColors.painelOpcao;
                      Color corBorda = AppColors.bordaEscura;
                      IconData icone = Icons.radio_button_unchecked;
                      Color corIcone = Colors.white54;

                      if (_respostaConfirmada) {
                        if (ehCorreta) {
                          corFundo = AppColors.verdeEscuro;
                          corBorda = AppColors.verde;
                          icone = Icons.check_circle;
                          corIcone = Colors.white;
                        } else if (selecionada) {
                          corFundo = Colors.red.shade900;
                          corBorda = AppColors.erro;
                          icone = Icons.cancel;
                          corIcone = Colors.white;
                        }
                      } else if (selecionada) {
                        corFundo = AppColors.verdeEscuro;
                        corBorda = AppColors.verde;
                        icone = Icons.check_circle;
                        corIcone = AppColors.ciano;
                      }

                      return GestureDetector(
                        onTap: _respostaConfirmada
                            ? null
                            : () {
                                setState(() {
                                  _opcaoSelecionada = index;
                                });
                              },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: corFundo,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: corBorda, width: 1.8),
                          ),
                          child: Row(
                            children: [
                              Icon(icone, color: corIcone),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  cardAtual.opcoes[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                if (_respostaConfirmada)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.ciano.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.ciano.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Text(
                      cardAtual.explicacao,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.ciano,
                        fontSize: 13,
                      ),
                    ),
                  ),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: AppTheme.botaoIndigo,
                    onPressed: _opcaoSelecionada == null
                        ? null
                        : _confirmarOuAvancar,
                    child: Text(
                      _respostaConfirmada
                          ? (_indiceAtual < _perguntas.length - 1
                                ? 'Próxima Pergunta'
                                : 'Finalizar Desafio')
                          : 'Confirmar',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
