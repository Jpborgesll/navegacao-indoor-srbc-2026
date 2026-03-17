# Core Logic - Sistema de Navegação Indoor

Este diretório contém a lógica de navegação e atitude do sistema Sistema de Navegação Indoor, dividida por responsabilidades.

## Arquivos Principais

- `MainActivity.kt`: Ponto de entrada do app, inicializa sensores e carrega a tela principal.
- `NavigationViewModel.kt`: Gerencia o estado da UI (`NavUiState`), as chamadas de rede à API e processa os sensores.
- `NavigationScreen.kt`: Interface moderna em Jetpack Compose (Busca, HUD e Mapa interativo).
- `PDRLogic.kt`: Núcleo matemático:
    - `MadgwickMARG`: Filtro de atitude para estimar Yaw (Giro).
    - `StepDetector`: Detector de passos baseado em picos de aceleração.
    - `PDRState`: Mantém a posição (x, y) percorrida em metros.
- `LocareApi.kt`: Interface Retrofit para os endpoints do Backend (Sync, Search, Route).

## Lógica de Conversão
- O PDR calcula deslocamentos em **metros**.
- O Backend utiliza **Lat/Long**.
- O sistema realiza uma conversão métrica em `NavigationViewModel.kt` para sobrepor a rota do servidor ao percurso local do usuário.
