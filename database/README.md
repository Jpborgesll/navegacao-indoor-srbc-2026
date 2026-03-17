# Banco de Dados – Navegação Indoor

Schema PostgreSQL com extensões **PostGIS** e **pgRouting**.

## Pré-requisitos

```sql
CREATE EXTENSION postgis;
CREATE EXTENSION pgrouting;
```

## Instalação

```bash
psql -U postgres -d nav_indoor -f schemas/schema.sql
```

## Entidades Principais

| Tabela | Descrição |
|---|---|
| `spaces` | Ambiente físico (ex.: shopping, hospital) |
| `units` | Salas, lojas ou departamentos |
| `beacons` | Pontos de referência BLE com coordenadas (x, y) |
| `edge_lines` | Arestas do grafo de navegação com atributos de acessibilidade |
| `pois` | Pontos de interesse vinculados a unidades |
