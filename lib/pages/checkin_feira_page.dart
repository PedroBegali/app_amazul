import 'package:flutter/material.dart';
import '../models/categoria.dart';
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
          backgroundColor: Colors.green,
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
      appBar: AppBar(
        title: const Text('Check-in • Desafio AMAZUL'),
        backgroundColor: const Color(0xFF0A1931),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Preencha seus dados para registrar sua pontuação no telão do evento e concorrer aos brindes educativos:',
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Seu Nome ou Nickname',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
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
                decoration: const InputDecoration(
                  labelText: 'Seu E-mail de Contato',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
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
                value: _modoSelecionado,
                decoration: const InputDecoration(
                  labelText: 'Modalidade de Jogo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people),
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
                  decoration: const InputDecoration(
                    labelText: 'Nome do Player 2 (Desafiante)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.sports_kabaddi),
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
                height: 52,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.flash_on),
                  label: const Text(
                    'Confirmar e Iniciar Flashcards',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: _iniciarPartida,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}