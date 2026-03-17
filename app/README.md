# Módulo de Navegação Indoor (App)

Esta pasta contém o coração do sistema de rastreamento e navegação do projeto **Locare**. O sistema evoluiu de protótipos em Python para um aplicativo Android nativo completo, focado em alta precisão e integração com serviços de mapa.

## Evolução e Funcionalidades

### 1. Aplicativo Android Nativo (`app/PDRMadgwick/`)
O cliente principal desenvolvido em **Kotlin** e **Jetpack Compose**:
*   **Filtro de Madgwick (MARG):** Fusão sensorial avançada (Acelerômetro + Giroscópio + Magnetômetro) para estimativa de orientação (Yaw/Heading) estável e resistente a ruídos.
*   **Pedestrian Dead Reckoning (PDR):** Estimativa de deslocamento baseada em passos e comprimento de passada dinâmico.
*   **Integração com Backend:** Sincronização de dados de espaços (GeoJSON), busca de salas/POIs e cálculo de rota em tempo real via API REST.
*   **Mapa Interativo:** Renderização dinâmica do percurso percorrido (IMU) sobreposto à rota sugerida pelo servidor (pgRouting).

### 2. Protótipos em Python
Scripts originais utilizados para validação de algoritmos e testes rápidos:
*   `PDRMadgwick.py`: Implementação do filtro de atitude e lógica de passos.
*   `localizacao_imu.py`: Protótipo inicial de visualização.

## Tecnologias Principais
*   **Android SDK / Kotlin**: Plataforma de desenvolvimento mobile.
*   **Jetpack Compose**: UI moderna e reativa.
*   **Retrofit / OkHttp**: Comunicação com o Backend FastAPI.
*   **Kotlinx Serialization**: Processamento de dados GeoJSON.
*   **Sensores Inerciais (IMU)**: Acesso direto via `SensorManager`.

## Estrutura do Diretório
- `PDRMadgwick/`: Projeto Android (Kotlin/Compose).
- `PDRMadgwick.py`: Projeto incial em Python para testes.
