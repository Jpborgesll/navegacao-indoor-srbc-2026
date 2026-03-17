# Sistema de Navegação Indoor - Android Client (PDRMadgwick)

Este projeto é o cliente mobile do sistema de navegação indoor **Sistema de Navegação Indoor**. Ele utiliza sensores do smartphone para estimar a posição do usuário em ambientes fechados onde o GPS é ineficaz.

## Tecnologias
- **Kotlin**: Linguagem principal.
- **Jetpack Compose**: Interface declarativa moderna.
- **Retrofit**: Integração com a API REST do Backend.
- **Sensores (IMU)**: Acelerômetro, Giroscópio e Magnetômetro.
- **Algoritmo PDR**: Filtro de Madgwick para atitude e Step Detection para deslocamento.

## Estrutura do Diretório
- `app/`: Módulo principal do aplicativo Android.
- `gradle/`: Configurações de dependências e Version Catalog.

## Como Executar
1. Certifique-se de que o **Backend** esteja rodando.
2. No Android Studio, abra a pasta `app/PDRMadgwick`.
3. Ajuste o IP do servidor em `NavigationViewModel.kt` se necessário (padrão: `10.0.2.2`).
4. Execute em um emulador ou smartphone.
