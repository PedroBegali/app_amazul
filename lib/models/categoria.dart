import 'package:flutter/material.dart';

class Categoria {
  final int id;
  final String titulo;
  final String subtitulo;
  final String textoEducativo;
  final String impactoPratico;
  final IconData icone;
  final Color cor;
  bool favorita;

  Categoria({
    required this.id,
    required this.titulo,
    required this.subtitulo,
    required this.textoEducativo,
    required this.impactoPratico,
    required this.icone,
    required this.cor,
    this.favorita = false,
  });
}