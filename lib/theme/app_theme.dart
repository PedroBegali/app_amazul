import 'package:flutter/material.dart';

class AppColors {
  // --- Fundos (azul-marinho) ---
  static const Color fundoTopo = Color(0xFF0B2A4A); // início do degradê
  static const Color fundo = Color(0xFF071A2E); // cor original do seu fundo
  static const Color fundoBase = Color(
    0xFF051322,
  ); // fim do degradê / barra inferior

  // --- Painéis escuros (cards sobre o fundo escuro) ---
  static const Color painel = Color(0xFF0F2D4A);
  static const Color painelOpcao = Color(0xFF132E42);
  static const Color painelDesativado = Color(0xFF1E3A5F);
  static const Color bordaEscura = Color(0xFF284B63);

  // --- Cards claros (categorias, ranking, sobre) ---
  static const Color cartaoClaro = Color(0xFFF4F7FB);
  static const Color textoEscuro = Color(0xFF0A1E32);
  static const Color textoMedio = Color(0xFF334E68);
  static const Color textoClaro = Color(
    0xFFB9C9E6,
  ); // texto secundário no escuro

  // --- Destaques ---
  static const Color amarelo = Color(0xFFFFCA28);
  static const Color teal = Color(0xFF0E7C96);
  static const Color ciano = Color(0xFF4DE3F5);
  static const Color indigo = Color(0xFF4C51BF);
  static const Color verde = Color(0xFF2ECC71);
  static const Color verdeEscuro = Color(0xFF007E2A);
  static const Color verdeBotao = Color(0xFF1E9E54);
  static const Color erro = Color(0xFFFF5252);

  // --- Medalhas do ranking ---
  static const Color prata = Color(0xFFCFD8DC);
  static const Color bronze = Color(0xFFD7945A);

  /// Degradê vertical usado como fundo das telas.
  static const LinearGradient degradeFundo = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [fundoTopo, fundoBase],
  );
}

class AppTheme {
  static ButtonStyle _botao(Color fundo, Color texto) {
    return ElevatedButton.styleFrom(
      backgroundColor: fundo,
      foregroundColor: texto,
      disabledBackgroundColor: AppColors.painelDesativado,
      disabledForegroundColor: Colors.white38,
      elevation: 6,
      shadowColor: fundo.withValues(alpha: 0.55),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  static final ButtonStyle botaoAmarelo = _botao(
    AppColors.amarelo,
    AppColors.fundo,
  );
  static final ButtonStyle botaoTeal = _botao(AppColors.teal, Colors.white);
  static final ButtonStyle botaoIndigo = _botao(AppColors.indigo, Colors.white);
  static final ButtonStyle botaoVerde = _botao(
    AppColors.verdeBotao,
    Colors.white,
  );

  /// Botão com contorno (ex.: "Sobre o projeto"): fundo escuro translúcido + borda.
  static final ButtonStyle botaoContorno = OutlinedButton.styleFrom(
    backgroundColor: AppColors.fundo.withValues(alpha: 0.75),
    foregroundColor: Colors.white,
    side: const BorderSide(color: AppColors.bordaEscura, width: 1.5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static InputDecoration campo({
    required String rotulo,
    required IconData icone,
  }) {
    // Função auxiliar local: monta uma borda arredondada com a cor/espessura desejada.
    OutlineInputBorder borda(Color cor, [double largura = 1.4]) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cor, width: largura),
      );
    }

    return InputDecoration(
      labelText: rotulo,
      labelStyle: const TextStyle(color: AppColors.textoClaro),
      prefixIcon: Icon(icone),
      prefixIconColor: AppColors.ciano,
      filled: true,
      fillColor: AppColors.painelOpcao,
      border: borda(AppColors.bordaEscura),
      enabledBorder: borda(AppColors.bordaEscura),
      focusedBorder: borda(AppColors.ciano, 2),
      errorBorder: borda(AppColors.erro),
      focusedErrorBorder: borda(AppColors.erro, 2),
    );
  }

  static ThemeData get tema {
    return ThemeData(
      useMaterial3: true,
      // Tema ESCURO: assim textos, menus, dialogs e snackbars já nascem
      // legíveis sobre o fundo azul-marinho.
      brightness: Brightness.dark,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: const Color(
              0xFF0A1931,
            ), // mesma semente que você já usava
            brightness: Brightness.dark,
          ).copyWith(
            primary: AppColors.ciano, // cursor, foco de campos, switch ligado
            surface: AppColors.painel,
          ),
      scaffoldBackgroundColor: AppColors.fundo,

      // AppBar com a MESMA cor do topo do degradê: a barra "some" no fundo.
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.fundoTopo,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
