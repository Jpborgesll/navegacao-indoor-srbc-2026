# Sistema de Navegação Indoor — SBRC 2026

> Repositório submetido junto ao artigo científico apresentado no **Salão de Ferramentas do SBRC 2026** (Simpósio Brasileiro de Redes de Computadores e Sistemas Distribuídos), Salvador – Bahia.

---

## Resumo

**Sistema de navegação indoor** que combina **beacons BLE** com **Dead Reckoning Pedestre (PDR)** via fusão de sensores IMU utilizando o **Filtro de Madgwick**, operando em modo offline-first com roteamento acessível via **pgRouting** e analytics B2B em conformidade com a LGPD.

---

## Equipe

| Nome | GitHub |
|---|---|
| Murillo P. T. Melo | [@stdMurilloMelo](https://github.com/stdMurilloMelo) |
| João Pedro L. L. Borges | [@Jpborgesll](https://github.com/Jpborgesll) |
| Pedro L. A. de Sousa Santos | [@pedro-lukas-git](https://github.com/pedro-lukas-git) |

**Instituição:** Instituto de Informática – INF – Universidade Federal de Goiás (UFG)

---

## Estrutura do Repositório

```
navegacao-indoor-srbc-2026/
├── artigo/
│   ├── locare_srbc2026.tex        # Artigo científico (formato SBC)
│   └── sbc.bst                    # Estilo bibliográfico SBC
├── backend/                       # API REST – FastAPI (Python 3.13+)
│   ├── app/
│   │   ├── core/                  # Configuração e banco de dados
│   │   ├── routers/               # Endpoints (route, search, analytics, admin)
│   │   ├── schemas/               # Modelos Pydantic
│   │   └── main.py
│   └── requirements.txt
├── app/                           # Aplicativo Android (Kotlin / Jetpack Compose)
│   └── PDRMadgwick/
│       └── app/src/main/java/com/example/pdrmadgwick/
│           ├── PDRLogic.kt            # Filtro de Madgwick + PDR
│           ├── NavigationViewModel.kt
│           ├── NavigationScreen.kt
│           ├── RouteCalculator.kt
│           └── LocareApi.kt           # Cliente HTTP (Retrofit)
├── database/
│   └── schemas/
│       └── schema.sql             # Schema PostgreSQL + PostGIS + pgRouting
├── docs/
│   └── diagrams/                  # Diagramas de arquitetura e fluxo
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
│  │  BLE Scanner │   │   PDR + Filtro de Madgwick  │   │
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
│  PostgreSQL 16 + PostGIS + pgRouting                  │
└──────────────────────────────────────────────────────┘
```

---

## Tecnologias

| Camada | Tecnologia |
|---|---|
| Backend | FastAPI, Python 3.13+, SQLAlchemy (async), asyncpg |
| Banco de Dados | PostgreSQL 16, PostGIS, pgRouting |
| Mobile | Android (API 26+), Kotlin, Jetpack Compose |
| Sensores | BLE (Bluetooth Low Energy), IMU (acelerômetro, giroscópio, magnetômetro) |
| Algoritmos | Filtro de Madgwick (MARG), PDR, Dijkstra via pgRouting |
| Privacidade | Analytics anonimizado em conformidade com a LGPD |

---

## Requisitos

### Backend
- Python 3.13+
- PostgreSQL 16 com extensões **PostGIS** e **pgRouting** instaladas
- **ou** Docker e docker-compose (recomendado)

### Aplicativo Android
- Android Studio Hedgehog ou superior
- Dispositivo físico Android com API 26+ e sensores IMU (acelerômetro, giroscópio, magnetômetro)
- Beacons BLE compatíveis com iBeacon ou Eddystone

---

## Instalação e Execução

### Opção 1 — Docker (recomendado)

```bash
# Clone o repositório
git clone https://github.com/Jpborgesll/navegacao-indoor-srbc-2026.git
cd navegacao-indoor-srbc-2026

# Suba o backend e o banco de dados
docker compose up --build
```

O backend ficará disponível em `http://localhost:8000`.
A documentação interativa da API estará em `http://localhost:8000/docs`.

### Opção 2 — Instalação manual

**Banco de dados:**

```bash
# Com PostgreSQL, PostGIS e pgRouting já instalados:
psql -U postgres -c "CREATE DATABASE nav_indoor;"
psql -U postgres -d nav_indoor -c "CREATE EXTENSION postgis; CREATE EXTENSION pgrouting;"
psql -U postgres -d nav_indoor -f database/schemas/schema.sql
```

**Backend:**

```bash
cd backend
pip install -r requirements.txt

export DATABASE_URL=postgresql+asyncpg://postgres:senha@localhost/nav_indoor

uvicorn app.main:app --reload
```

**Aplicativo Android:**

1. Abra `app/PDRMadgwick/` no Android Studio
2. Em `LocareApi.kt`, atualize `BASE_URL` para o IP do backend
3. Conecte um dispositivo físico Android
4. Clique em **Run**

---

## Exemplo Mínimo de Uso

Após subir o backend, registre um espaço e calcule uma rota:

```bash
# Verificar se o backend está no ar
curl http://localhost:8000/

# Buscar unidades disponíveis
curl "http://localhost:8000/search?q=recep%C3%A7%C3%A3o"

# Calcular rota (origem e destino são IDs de nós no grafo)
curl -X POST http://localhost:8000/route/calculate \
  -H "Content-Type: application/json" \
  -d '{"space_id": 1, "origin_node": 1, "destination_node": 5, "accessibility": "default"}'
```

---

## Funcionalidades

- **Posicionamento híbrido:** BLE para ancoragem + PDR para navegação contínua entre beacons
- **Offline-first:** Sincronização prévia do mapa com versionamento incremental (sem GPS)
- **Roteamento acessível:** Perfis que evitam escadas e priorizam rampas/elevadores
- **Busca de locais:** Busca textual de unidades e POIs dentro do espaço
- **Analytics B2B:** Heatmaps de fluxo anonimizados (LGPD)

---

## Referência

> Melo, M. P. T.; Borges, J. P. L. L.; Santos, P. L. A. S. **Navegação Indoor Inteligente com Fusão de Beacons BLE e Dead Reckoning Pedestre via Filtro de Madgwick**. In: *Salão de Ferramentas do SBRC 2026*, Salvador, BA, 2026.

---

## Licença

Este projeto está licenciado sob a [Creative Commons Attribution-ShareAlike 4.0 (CC BY-SA 4.0)](LICENSE).
