# Backend – API de Navegação Indoor

API REST desenvolvida com **FastAPI** (Python 3.13+) para o sistema de navegação indoor.

## Pré-requisitos

- Python 3.13+
- PostgreSQL 16 com extensões **PostGIS** e **pgRouting**

## Instalação

```bash
pip install -r requirements.txt
```

## Configuração

Crie um arquivo `.env` na raiz do backend:

```env
DATABASE_URL=postgresql+asyncpg://usuario:senha@localhost:5432/nav_indoor
```

## Execução

```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

## Endpoints

| Endpoint | Método | Descrição |
|---|---|---|
| `/spaces/{id}/version` | GET | Versão atual do mapa |
| `/spaces/{id}/sync` | GET | Sincronização GeoJSON completa |
| `/search` | GET | Busca de unidades e POIs |
| `/route/calculate` | POST | Cálculo de rota acessível |
| `/analytics/ping` | POST | Registro anônimo de presença |
| `/admin/units/{id}` | PATCH | Atualização de status de unidade |
| `/admin/spaces/publish` | POST | Publicação de nova versão do mapa |
