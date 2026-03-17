# Routers Module

Contém as definições de rotas (endpoints) da API, organizadas por domínio de funcionalidade.

- `admin.py`: Endpoints para gestão administrativa (bloqueio de unidades, publicação de espaços).
- `analytics.py`: Coleta de dados de uso e telemetria (pings de localização).
- `route.py`: Lógica principal de cálculo de rotas usando pgRouting.
- `search.py`: Busca geoespacial de Unidades e Pontos de Interesse (POIs).
- `spaces.py`: Sincronização de dados e gerenciamento de versões dos espaços (Offline-First).
