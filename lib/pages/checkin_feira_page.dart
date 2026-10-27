import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../theme/app_theme.dart';
import '../widgets/fundo_degrade.dart';
import 'flashcard_page.dart';

class CheckinFeiraPage extends StatefulWidget {
  final Categoria categoria;

  const CheckinFeiraPage({super.key, required this.categoria});

  @override
  State<CheckinFeiraPage> createState() => _CheckinFeiraPageState();
}

class _CheckinFeiraPageState extends State<CheckinFeiraPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _oponenteController = TextEditingController();

  String _modoSelecionado = 'Individual (Ranking)';
  bool _aceitaRankingBrindes = true;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _oponenteController.dispose();
    super.dispose();
  }

  void _iniciarPartida() {
    if (_formKey.currentState!.validate()) {
      final nomeFormatado = _modoSelecionado == 'Disputa 1v1'
          ? '${_nomeController.text.trim()} vs ${_oponenteController.text.trim()}'
          : _nomeController.text.trim();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Inscrição confirmada! Boa sorte, $nomeFormatado!'),
          backgroundColor: AppColors.verdeBotao,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => FlashcardPage(
            categoria: widget.categoria,
            nomeJogador: nomeFormatado,
            emailJogador: _emailController.text.trim(),
            modoJogo: _modoSelecionado,
            registrarNoRanking: _aceitaRankingBrindes,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check-in • Desafio AMAZUL')),
      body: FundoDegrade(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categoria: ${widget.categoria.titulo}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.amarelo,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Preencha seus dados para registrar sua pontuação no telão do evento e concorrer aos brindes educativos:',
                  style: TextStyle(color: AppColors.textoClaro, height: 1.4),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nomeController,
                  decoration: AppTheme.campo(
                    rotulo: 'Seu Nome ou Nickname',
                    icone: Icons.person,
                  ),
                  validator: (valor) {
                    if (valor == null || valor.trim().length < 3) {
                      return 'Informe um nome com pelo menos 3 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppTheme.campo(
                    rotulo: 'Seu E-mail de Contato',
                    icone: Icons.email,
                  ),
                  validator: (valor) {
                    if (valor == null || !valor.contains('@')) {
                      return 'Informe um e-mail válido (ex: nome@email.com)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _modoSelecionado,
                  dropdownColor: AppColors.painel,
                  borderRadius: BorderRadius.circular(14),
                  decoration: AppTheme.campo(
                    rotulo: 'Modalidade de Jogo',
                    icone: Icons.people,
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Individual (Ranking)',
                      child: Text('Jogar Sozinho (Ranking Geral)'),
                    ),
                    DropdownMenuItem(
                      value: 'Disputa 1v1',
                      child: Text('Contra Outro Player (1v1 Local)'),
                    ),
                  ],
                  onChanged: (novoModo) {
                    if (novoModo != null) {
                      setState(() {
                        _modoSelecionado = novoModo;
                      });
                    }
                  },
                ),
                if (_modoSelecionado == 'Disputa 1v1') ...[
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _oponenteController,
                    decoration: AppTheme.campo(
                      rotulo: 'Nome do Player 2 (Desafiante)',
                      icone: Icons.sports_kabaddi,
                    ),
                    validator: (valor) {
                      if (_modoSelecionado == 'Disputa 1v1' &&
                          (valor == null || valor.trim().isEmpty)) {
                        return 'Informe o nome do segundo jogador';
                      }
                      return null;
                    },
                  ),
                ],
                const SizedBox(height: 12),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Exibir minha nota no Ranking da Feira'),
                  subtitle: const Text(
                    'Necessário para concorrer aos brindes do estande AMAZUL',
                  ),
                  value: _aceitaRankingBrindes,
                  onChanged: (val) {
                    setState(() {
                      _aceitaRankingBrindes = val;
                    });
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    style: AppTheme.botaoVerde,
                    icon: const Icon(Icons.flash_on),
                    label: const Text(
                      'Confirmar e Iniciar Flashcards',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _iniciarPartida,
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
