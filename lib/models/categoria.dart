import 'package:flutter/material.dart';

class Categoria {
  final int id;
  final String titulo;
  final String subtitulo;
  final String iconeAsset;
  final Color corFundoIcone;
  final String imagemUrl;
  final String resumoEducativo;
  bool favorita;

  Categoria({
    required this.id,
    required this.titulo,
    required this.subtitulo,
    required this.iconeAsset,
    required this.corFundoIcone,
    required this.imagemUrl,
    required this.resumoEducativo,
    this.favorita = false,
  });
}
