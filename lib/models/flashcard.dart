class Flashcard {
  final int id;
  final int categoriaId;
  final String pergunta;
  final List<String> opcoes;
  final int indiceCorreto;
  final String explicacao;

  Flashcard({
    required this.id,
    required this.categoriaId,
    required this.pergunta,
    required this.opcoes,
    required this.indiceCorreto,
    required this.explicacao,
  });
}