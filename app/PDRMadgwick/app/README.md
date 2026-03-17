# Módulo App - Lógica e UI

Este diretório contém o código-fonte, recursos e configurações de build do aplicativo Sistema de Navegação Indoor.

## Estrutura Interna
- `src/main/java/com/example/pdrmadgwick/`: Código Kotlin principal (Lógica de sensores e Navegação).
- `src/main/res/`: Recursos visuais (cores, strings, temas, ícones).
- `AndroidManifest.xml`: Configurações de permissões (Internet) e declaração de componentes.
- `build.gradle.kts`: Configuração de bibliotecas (Retrofit, Compose, Serialization).

## Componentes Principais
- **MVVM**: Separação de estado da UI da lógica de sensores.
- **Compose**: Implementação moderna do mapa e do painel de navegação (HUD).
