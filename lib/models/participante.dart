class Participante {
  final String nome;
  final String email;
  final String modoJogo;
  final String categoriaJogada;
  int pontuacao;

  Participante({
    required this.nome,
    required this.email,
    required this.modoJogo,
    required this.categoriaJogada,
    required this.pontuacao,
  });
}