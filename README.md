# Sistema de Navegação Indoor — SRBC 2026

> Repositório submetido junto ao artigo científico apresentado no **SRBC 2026** (Simpósio de Robótica e Bots Computacionais), Salvador – Bahia.

---

## Resumo

**Sistema de navegação indoor** desenvolvido para endereçar as limitações do GPS em ambientes fechados de grande escala, como shoppings e hospitais. O sistema combina **beacons BLE** com **Dead Reckoning Pedestre (PDR)** via fusão de sensores IMU utilizando o **Filtro de Madgwick**, operando em modo offline-first com roteamento acessível via **pgRouting** e analytics B2B em conformidade com a LGPD.

---

## Equipe

| Nome | GitHub |
|---|---|
| Murillo P. T. Melo | [@stdMurilloMelo](https://github.com/stdMurilloMelo) |
| João Pedro L. L. Borges | [@Jpborgesll](https://github.com/Jpborgesll) |
| Pedro L. A. de Sousa Santos | [@pedro-lukas-git](https://github.com/pedro-lukas-git) |
| Gabriel S. M. Silva | [@gabrielsalesms](https://github.com/gabrielsalesms) |
| Uerberth Jancen Pereira | [@Uerberth-Jancen](https://github.com/Uerberth-Jancen) |

---

## Estrutura do Repositório

```
navegacao-indoor-srbc-2026/
├── artigo/
│   ├── nav_indoor_srbc2026.tex   # Artigo científico (formato SBC)
│   └── sbc.bst                   # Estilo bibliográfico SBC
├── backend/                      # API REST – FastAPI (Python 3.13+)
│   ├── app/
│   │   ├── core/                 # Configuração e banco de dados
│   │   ├── routers/              # Endpoints (route, search, analytics, admin)
│   │   ├── schemas/              # Modelos Pydantic
│   │   └── main.py
│   └── requirements.txt
├── app/                          # Aplicativo Android (Kotlin / Jetpack Compose)
│   └── PDRMadgwick/
│       └── app/src/main/java/com/example/pdrmadgwick/
│           ├── PDRLogic.kt           # Filtro de Madgwick + PDR
│           ├── NavigationViewModel.kt
│           ├── NavigationScreen.kt
│           ├── RouteCalculator.kt
│           └── LocareApi.kt          # Cliente HTTP (Retrofit)
├── database/
│   └── schemas/
│       └── schema.sql            # Schema PostgreSQL + PostGIS + pgRouting
├── docs/
│   └── diagramas/                # Diagramas de arquitetura e ER
└── README.md
```

---

## Arquitetura Geral

```
┌──────────────────────────────────────────────────────┐
│                  Aplicativo Android                   │
│  Jetpack Compose │ Retrofit │ Kotlinx Serialization   │
│                                                       │
│  ┌──────────────┐   ┌────────────────────────────┐   │
│  │  BLE Scanner │   │    PDR + Filtro Madgwick    │   │
│  │  (Beacons)   │──▶│  Aceler. + Giroscópio + Mag │   │
│  └──────────────┘   └────────────────────────────┘   │
│          │                      │                     │
│          └──────────┬───────────┘                     │
│                     ▼                                 │
│            Fusão de Posição (Híbrido)                 │
└──────────────────────┬───────────────────────────────┘
                       │ HTTP/GeoJSON (offline-first)
                       ▼
┌──────────────────────────────────────────────────────┐
│                  Backend FastAPI                      │
│  /spaces/sync  │  /route/calculate  │  /analytics    │
│                                                       │
│  PostgreSQL + PostGIS + pgRouting                     │
└──────────────────────────────────────────────────────┘
```

---

## Tecnologias

| Camada | Tecnologia |
|---|---|
| Backend | FastAPI, Python 3.13+, SQLAlchemy (async), asyncpg |
| Banco de Dados | PostgreSQL 16, PostGIS, pgRouting |
| Mobile | Android, Kotlin, Jetpack Compose |
| Serialização | GeoJSON, Pydantic, orjson |
| Sensores | BLE (Bluetooth Low Energy), IMU (acelerômetro, giroscópio, magnetômetro) |
| Algoritmos | Filtro de Madgwick (MARG), PDR, Dijkstra via pgRouting |
| Privacidade | LGPD-compliant (analytics anonimizado) |

---

## Funcionalidades Principais

- **Posicionamento Indoor Híbrido:** BLE Beacons para localização de referência + PDR para navegação contínua entre beacons
- **Offline-First:** Sincronização prévia do mapa (grafo, beacons, POIs) com versionamento incremental
- **Roteamento Acessível:** Perfis de acessibilidade evitando escadas, priorizando rampas e elevadores
- **Busca de Locais:** Busca textual de unidades/departamentos dentro do espaço
- **Analytics B2B:** Heatmaps de fluxo e análise de footfall com anonimização (LGPD)
- **Gestão Administrativa:** Publicação de versões de mapa e gerenciamento de unidades

---

## Como Executar

### Backend

```bash
cd backend
pip install -r requirements.txt

# Configure as variáveis de ambiente
export DATABASE_URL=postgresql+asyncpg://user:pass@localhost/nav_indoor

uvicorn app.main:app --reload
```

### Aplicativo Android

1. Abra `app/PDRMadgwick/` no Android Studio
2. Atualize `BASE_URL` em `LocareApi.kt` para o endereço do backend
3. Execute em dispositivo físico (sensores IMU obrigatórios)

### Banco de Dados

```bash
# PostgreSQL com extensões PostGIS e pgRouting instaladas
psql -U postgres -f database/schemas/schema.sql
```

---

## Referência ao Artigo

> Melo, M. P. T. et al. **Navegação Indoor com Fusão BLE e Dead Reckoning Pedestre via Filtro de Madgwick**. In: *Simpósio de Robótica e Bots Computacionais (SRBC)*, Salvador, BA, 2026.

---

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
