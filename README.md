# ⚛️ UrâniaQuest (App AMAZUL) — Mobile Application Development

Primeira versão funcional (protótipo visual e interativo) do aplicativo mobile **UrâniaQuest**, desenvolvido em **Flutter e Dart** para a 1ª Sprint do Challenge 2026 da FIAP.

---

## 🎥 Vídeo de Demonstração
* **Link do Vídeo (YouTube - Não Listado):** [LINK NÃO CRIADO NO MOMENTO]

---

## 👨💻 Integrantes da Equipe (2º Ano ADS - 2TDS)
Denise Santos — RM: 567559
Lucas Dudena — RM: 567600
Karen Cardoso — RM: 566870
Pedro Begali — RM: 567478

---

## ⚓ Empresa / Parceiro Relacionado
* **Centro Tecnológico da Marinha em São Paulo (CTMSP) / Amazônia Azul Tecnologias de Defesa S.A. (AMAZUL) — Marinha do Brasil** (Programa Nuclear da Marinha - PNM).

---

## 💡 Descrição Resumida da Solução
A tecnologia nuclear ainda é cercada por estigmas e desinformação na sociedade, sendo frequentemente associada apenas a riscos ou aplicações militares, enquanto seus benefícios essenciais no cotidiano permanecem pouco divulgados.

O **UrâniaQuest** é uma solução digital gamificada e educativa criada para aproximar a população dos benefícios reais da tecnologia nuclear em seis frentes principais: **Alimentação (irradiação de alimentos), Saúde (radiofármacos), Energia Limpa, Amazônia Azul (soberania e defesa), Indústria e Pesquisa Científica**.

Além de apresentar o chamariz do seu modo campanha e conteúdos explicativos acessíveis, o aplicativo foi projetado para uso prático em **feiras, exposições e estandes institucionais da AMAZUL**, permitindo que visitantes realizem um check-in rápido e disputem rodadas de **Flashcards de múltipla escolha** (no modo Individual ou Disputa 1v1 local), acumulando moedas em um **Ranking do Evento** utilizado para premiar os melhores colocados com brindes educativos.

---

## 🛠️ Tecnologias Utilizadas e Estrutura Técnica
* **Flutter SDK & Dart** (Interface construída com Material Design 3 e tematização customizada).
* **Navegação entre Telas (`Navigator.push` / `Navigator.pop`):**
  * `WelcomePage`: Tela inicial com acesso ao modo campanha, exploração de conteúdos e informações do projeto.
  * `HomePage`: Hub principal com `BottomNavigationBar` alternando entre Categorias de Conteúdo, Ranking da Feira e Perfil.
  * `CategoriaDetalhePage`: Tela de estudo detalhado que recebe o objeto `Categoria` via **passagem de parâmetros**.
  * `CheckinFeiraPage`: Tela de inscrição do visitante para o desafio de estande da AMAZUL.
  * `FlashcardPage`: Arena de perguntas interativas com controle de vidas, moedas e barra de progresso.
  * `SobreProjetoPage`: Tela institucional sobre a parceria AMAZUL/CTMSP e o propósito acadêmico do projeto.
* **Gerenciamento de Estado (`StatefulWidget` e `setState`):**
  * Atualização dinâmica da seleção de alternativas, validação de acerto/erro com exibição da explicação científica, cálculo de moedas acumuladas, perda de corações de vida em tempo real, filtro de favoritos e ordenação dinâmica do Ranking da Feira.
* **Formulário e Validação (`Form`, `GlobalKey<FormState>`, `TextFormField`, `DropdownButtonFormField`, `SwitchListTile`):**
  * Validação de preenchimento obrigatório de nome/dupla e formato de e-mail antes de iniciar a partida oficial, apresentando feedback visual imediato ao usuário via `SnackBar` e `AlertDialog`.
* **Dados Mockados (`UraniaRepository`):**
  * Repositório em memória contendo as categorias da tecnologia nuclear, banco de flashcards temáticos e lista inicial de participantes do ranking.

---

## 🚀 Instruções Básicas para Execução

### Pré-requisitos
* **Flutter SDK** instalado e configurado no PATH do sistema.
* **Android Studio** (com Emulador Android configurado) ou dispositivo físico Android conectado via depuração USB.

### Passo a passo
1. Clone o repositório oficial do GitHub Classroom:
   ```bash
   git clone https://github.com/PedroBegali/app_amazul.git
   cd app_amazul