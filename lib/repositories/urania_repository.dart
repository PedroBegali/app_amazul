import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../models/flashcard.dart';
import '../models/participante.dart';

class UraniaRepository {
  
  static final List<Categoria> categorias = [
    Categoria(
      id: 1,
      titulo: 'Alimentação e Agricultura',
      subtitulo: 'Irradiação de alimentos e conservação segura',
      textoEducativo:
          'A irradiação de alimentos utiliza feixes controlados de energia para eliminar bactérias, fungos e insetos, aumentando a validade de frutas, grãos e carnes sem alterar seu sabor e SEM deixar o alimento radioativo.',
      impactoPratico:
          'Reduz o desperdício de alimentos e permite exportar frutas brasileiras cumprindo rigorosas normas sanitárias internacionais.',
      icone: Icons.eco,
      cor: Colors.green,
    ),
    Categoria(
      id: 2,
      titulo: 'Saúde e Medicina Nuclear',
      subtitulo: 'Radiofármacos para diagnóstico e tratamento',
      textoEducativo:
          'Na medicina, os radiofármacos funcionam como "marcadores inteligentes" que permitem detectar tumores precocemente (como em exames PET-CT) e tratar o câncer de forma localizada, preservando células saudáveis.',
      impactoPratico:
          'O Brasil busca autossuficiência na produção de radioisótopos através do Reator Multipropósito Brasileiro (RMB), com forte participação da AMAZUL.',
      icone: Icons.medical_services,
      cor: Colors.redAccent,
    ),
    Categoria(
      id: 3,
      titulo: 'Soberania e Energia Limpa',
      subtitulo: 'Eletricidade contínua sem emissão de efeito estufa',
      textoEducativo:
          'As usinas nucleares geram energia de base (24h por dia, independente de chuva ou sol) com baixíssima emissão de carbono. Além disso, o domínio do ciclo do combustível nuclear garante soberania tecnológica ao país.',
      impactoPratico:
          'Garante estabilidade energética para grandes centros urbanos e hospitais mesmo em períodos de seca nos reservatórios hidrelétricos.',
      icone: Icons.bolt,
      cor: Colors.blueAccent,
    ),
    Categoria(
      id: 4,
      titulo: 'Indústria e Pesquisa',
      subtitulo: 'Gamagrafia industrial e preservação cultural',
      textoEducativo:
          'Técnicas nucleares permitem inspecionar soldas de aviões e dutos de petróleo como se fosse um "raio-X industrial", além de descontaminar obras de arte e livros históricos sem danificar o papel.',
      impactoPratico:
          'Prevenção de acidentes na aviação e na indústria naval utilizando ensaios não destrutivos.',
      icone: Icons.precision_manufacturing,
      cor: Colors.orange,
    ),
  ];

  static final List<Flashcard> flashcards = [
    // Categoria 1: Alimentação
    Flashcard(
      id: 1,
      categoriaId: 1,
      pergunta: 'Um alimento que passa pelo processo de irradiação fica radioativo?',
      opcoes: [
        'Sim, por isso deve esperar 10 dias para consumo',
        'Não, a energia apenas elimina microrganismos sem deixar resíduos',
        'Apenas se for aquecido no micro-ondas depois',
        'Sim, mas em níveis baixos',
      ],
      indiceCorreto: 1,
      explicacao:
          'Assim como uma pessoa não fica radioativa ao fazer um exame de Raio-X, o alimento irradiado apenas recebe um feixe de energia que elimina pragas e bactérias.',
    ),
    Flashcard(
      id: 2,
      categoriaId: 1,
      pergunta: 'Qual é o principal benefício da irradiação em frutas como morango e manga?',
      opcoes: [
        'Aumentar o tamanho da fruta em 3x',
        'Mudar a cor da fruta artificialmente',
        'Retardar o apodrecimento e eliminar fungos sem usar agrotóxicos',
        'Deixar a fruta mais salgada',
      ],
      indiceCorreto: 2,
      explicacao:
          'A irradiação inibe o brotamento (em batatas e cebolas) e retarda o amadurecimento de frutas, evitando o desperdício no transporte.',
    ),

    // Categoria 2: Saúde
    Flashcard(
      id: 3,
      categoriaId: 2,
      pergunta: 'O que são os radiofármacos utilizados nos hospitais?',
      opcoes: [
        'Antibióticos comuns vendidos em farmácia',
        'Medicamentos com elementos radioativos seguros para diagnóstico e terapia de doenças como o câncer',
        'Vitaminas para atletas de corrida',
        'Vacinas contra gripe',
      ],
      indiceCorreto: 1,
      explicacao:
          'Radiofármacos emitem pequenas quantidades de radiação que câmeras especiais captam para mapear órgãos ou destruir células tumorais com precisão.',
    ),
    Flashcard(
      id: 4,
      categoriaId: 2,
      pergunta: 'Qual grande projeto conta com a engenharia da AMAZUL para tornar o Brasil autossuficiente em radiofármacos?',
      opcoes: [
        'Reator Multipropósito Brasileiro (RMB)',
        'Usina de Itaipu',
        'Ponte Rio-Niterói',
        'Satélite Amazônia-1',
      ],
      indiceCorreto: 0,
      explicacao:
          'O RMB (Reator Multipropósito Brasileiro) produzirá radioisótopos essenciais para o SUS e clínicas de medicina nuclear em todo o país.',
    ),

    // Categoria 3: Soberania e Energia
    Flashcard(
      id: 5,
      categoriaId: 3,
      pergunta: 'Por que a energia nuclear é considerada uma aliada contra o aquecimento global?',
      opcoes: [
        'Porque esfria a água dos oceanos',
        'Porque gera grande quantidade de eletricidade sem queimar combustíveis fósseis e sem emitir CO2 na operação',
        'Porque depende do vento para funcionar',
        'Porque consome gás carbônico do ar',
      ],
      indiceCorreto: 1,
      explicacao:
          'O vapor que sai das torres de resfriamento é apenas vapor de água limpa, não fumaça poluente.',
    ),

    // Categoria 4: Indústria
    Flashcard(
      id: 6,
      categoriaId: 4,
      pergunta: 'Como a tecnologia nuclear ajuda a preservar acervos históricos e museus?',
      opcoes: [
        'Pintando os quadros automaticamente',
        'Eliminando cupins, traças e fungos de livros raros através da radiação gama sem molhar ou rasgar as páginas',
        'Digitalizando páginas em PDF',
        'Congelando as esculturas',
      ],
      indiceCorreto: 1,
      explicacao:
          'A desinfestação por radiação gama salva documentos históricos inteiros de pragas sem usar produtos químicos líquidos.',
    ),
  ];

  static final List<Participante> rankingFeira = [
    Participante(
      nome: 'Marina Silva (Visitante)',
      email: 'marina@email.com',
      modoJogo: 'Individual (Ranking)',
      categoriaJogada: 'Saúde e Medicina Nuclear',
      pontuacao: 200,
    ),
    Participante(
      nome: 'Lucas Souza vs Gabriel',
      email: 'lucas@email.com',
      modoJogo: 'Disputa 1v1',
      categoriaJogada: 'Alimentação e Agricultura',
      pontuacao: 150,
    ),
    Participante(
      nome: 'Beatriz Oliveira',
      email: 'bia@email.com',
      modoJogo: 'Individual (Ranking)',
      categoriaJogada: 'Soberania e Energia Limpa',
      pontuacao: 100,
    ),
  ];

  static List<Flashcard> buscarFlashcardsPorCategoria(int categoriaId) {
    return flashcards.where((f) => f.categoriaId == categoriaId).toList();
  }

  static void adicionarParticipanteRanking(Participante novo) {
    rankingFeira.add(novo);

    rankingFeira.sort((a, b) => b.pontuacao.compareTo(a.pontuacao));
  }
}