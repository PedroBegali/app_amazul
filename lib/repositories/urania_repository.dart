import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../models/flashcard.dart';
import '../models/participante.dart';

class UraniaRepository {
  static final List<Categoria> categorias = [
    Categoria(
      id: 1,
      titulo: 'Alimentação',
      subtitulo: 'Conservação de alimentos e segurança alimentar',
      iconeAsset: './assets/icone_alimentacao.png',
      corFundoIcone: const Color(0xFFDFF5E3),
      imagemUrl:
          'https://images.unsplash.com/photo-1542838132-92c53300491e?w=600&q=80',
      resumoEducativo:
          'A irradiação alimentar utiliza feixes controlados de energia para eliminar bactérias, fungos e pragas, aumentando a durabilidade de frutas, grãos e verduras sem alterar o sabor e sem torná-los radioativos.',
    ),
    Categoria(
      id: 2,
      titulo: 'Saúde',
      subtitulo: 'Medicina nuclear e diagnóstico',
      iconeAsset: './assets/icone_saude.png',
      corFundoIcone: const Color(0xFFE5DEFF),
      imagemUrl:
          'https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=600&q=80',
      resumoEducativo:
          'Radiofármacos permitem diagnosticar doenças precocemente (como em exames PET-CT) e tratar tumores de forma localizada. A AMAZUL atua no projeto do Reator Multipropósito Brasileiro (RMB) para tornar o Brasil autossuficiente.',
    ),
    Categoria(
      id: 3,
      titulo: 'Energia',
      subtitulo: 'Geração de energia limpa',
      iconeAsset: './assets/icone_energia.png',
      corFundoIcone: const Color(0xFFFEF3C7),
      imagemUrl:
          'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=600&q=80',
      resumoEducativo:
          'As usinas nucleares fornecem energia limpa de base 24 horas por dia, sem emitir gases de efeito estufa e sem depender do clima, garantindo estabilidade para hospitais, indústrias e residências.',
    ),
    Categoria(
      id: 4,
      titulo: 'Amazônia Azul',
      subtitulo: 'Tecnologia e defesa',
      iconeAsset: './assets/icone_amazul.png',
      corFundoIcone: const Color(0xFFDCEEFF),
      imagemUrl:
          'https://images.unsplash.com/photo-1518837695005-2083093ee35b?w=600&q=80',
      resumoEducativo:
          'O Programa Nuclear da Marinha (PNM) e a AMAZUL desenvolvem tecnologia 100% nacional para propulsão naval e proteção das riquezas naturais da Amazônia Azul brasileira.',
    ),
    Categoria(
      id: 5,
      titulo: 'Indústria',
      subtitulo: 'Aplicações industriais',
      iconeAsset: './assets/icone_industria.png',
      corFundoIcone: const Color(0xFFF3E5F5),
      imagemUrl:
          'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=600&q=80',
      resumoEducativo:
          'A gamagrafia industrial funciona como um raio-X de alta precisão para inspecionar soldas de aviões, navios e tubulações sem danificar as peças.',
    ),
    Categoria(
      id: 6,
      titulo: 'Pesquisa e Inovação',
      subtitulo: 'Ciência para o futuro',
      iconeAsset: './assets/icone_pesquisa.png',
      corFundoIcone: const Color(0xFFE0F7FA),
      imagemUrl:
          'https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=600&q=80',
      resumoEducativo:
          'Centros de pesquisa utilizam técnicas nucleares para preservar obras históricas, estudar solos agrícolas e desenvolver novos materiais.',
    ),
  ];

  static final List<Flashcard> flashcards = [
    // Categoria 1: Alimentação (Idêntico à Tela 3 da imagem!)
    Flashcard(
      id: 1,
      categoriaId: 1,
      pergunta: 'Os alimentos tratados por irradiação ficam radioativos.',
      opcoes: ['Verdadeiro', 'Falso', 'Depende do contexto'],
      indiceCorreto: 1, // Falso
      explicacao:
          'Falso! O alimento apenas recebe ondas de energia para eliminar microrganismos, exatamente como em um raio-X médico, sem reter radioatividade.',
    ),
    Flashcard(
      id: 2,
      categoriaId: 1,
      pergunta:
          'Qual é o efeito prático da irradiação em morangos, batatas e grãos?',
      opcoes: [
        'Aumenta a validade e evita o brotamento sem usar químicos',
        'Altera o sabor para deixá-los mais doces',
        'Substitui a necessidade de lavar a fruta',
      ],
      indiceCorreto: 0,
      explicacao:
          'A técnica retarda a maturação e impede que batatas e cebolas germinem no estoque, reduzindo drasticamente o desperdício.',
    ),

    // Categoria 2: Saúde
    Flashcard(
      id: 3,
      categoriaId: 2,
      pergunta:
          'Os radiofármacos são utilizados apenas para tratamento de doenças graves.',
      opcoes: [
        'Verdadeiro',
        'Falso, também são essenciais para diagnósticos precisos',
        'Depende do hospital',
      ],
      indiceCorreto: 1,
      explicacao:
          'Grande parte dos radiofármacos é usada em exames de imagem (cintilografia e PET-CT) para detectar problemas cardíacos, ósseos e oncológicos bem no início.',
    ),

    // Categoria 3: Energia
    Flashcard(
      id: 4,
      categoriaId: 3,
      pergunta:
          'A fumaça branca que sai das torres das usinas nucleares é gás carbônico.',
      opcoes: [
        'Verdadeiro',
        'Falso, é apenas vapor de água limpa',
        'Depende da potência do reator',
      ],
      indiceCorreto: 1,
      explicacao:
          'As torres de resfriamento liberam exclusivamente vapor de água. A geração nuclear não queima combustíveis fósseis.',
    ),

    // Categoria 4: Amazônia Azul
    Flashcard(
      id: 5,
      categoriaId: 4,
      pergunta:
          'O Brasil domina o ciclo completo de enriquecimento do combustível nuclear.',
      opcoes: ['Verdadeiro', 'Falso', 'Depende de importação total'],
      indiceCorreto: 0,
      explicacao:
          'Graças ao Programa Nuclear da Marinha (PNM) e ao CTMSP, o Brasil faz parte do seleto grupo de países que dominam o ciclo do combustível para fins pacíficos.',
    ),

    // Categoria 5: Indústria
    Flashcard(
      id: 6,
      categoriaId: 5,
      pergunta:
          'A radiação gama pode inspecionar turbinas de avião sem desmontar a peça.',
      opcoes: ['Verdadeiro', 'Falso', 'Apenas peças de plástico'],
      indiceCorreto: 0,
      explicacao:
          'Por meio da gamagrafia industrial (ensaio não destrutivo), é possível identificar trincas internas invisíveis a olho nu.',
    ),

    // Categoria 6: Pesquisa e Inovação
    Flashcard(
      id: 7,
      categoriaId: 6,
      pergunta:
          'Livros raros e obras de museus podem ser descontaminados com radiação.',
      opcoes: [
        'Verdadeiro',
        'Falso, o papel queima',
        'Apenas esculturas de metal',
      ],
      indiceCorreto: 0,
      explicacao:
          'A radiação elimina cupins, fungos e brocas de acervos históricos inteiros sem precisar molhar ou aplicar venenos nas páginas.',
    ),
  ];

  static final List<Participante> rankingFeira = [
    Participante(
      nome: 'Marina Silva',
      email: 'marina@email.com',
      modoJogo: 'Individual (Feira)',
      categoriaJogada: 'Alimentação',
      pontuacao: 250,
    ),
    Participante(
      nome: 'Lucas vs Gabriel',
      email: 'lucas@email.com',
      modoJogo: 'Disputa 1v1',
      categoriaJogada: 'Amazônia Azul',
      pontuacao: 200,
    ),
    Participante(
      nome: 'Beatriz Costa',
      email: 'bia@email.com',
      modoJogo: 'Individual (Feira)',
      categoriaJogada: 'Saúde',
      pontuacao: 150,
    ),
  ];

  static List<Flashcard> buscarPorCategoria(int categoriaId) {
    return flashcards.where((f) => f.categoriaId == categoriaId).toList();
  }

  static void adicionarNoRanking(Participante p) {
    rankingFeira.add(p);
    rankingFeira.sort((a, b) => b.pontuacao.compareTo(a.pontuacao));
  }
}
