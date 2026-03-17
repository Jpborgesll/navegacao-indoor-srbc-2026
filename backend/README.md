# Backend - Sistema LOCARE

Este diretório contém a API backend do sistema de navegação indoor LOCARE, construída com FastAPI e PostgreSQL/PostGIS.

## Tecnologias
- **Python 3.13+**
- **FastAPI**: Framework web de alta performance.
- **SQLAlchemy (Async)**: ORM para interação com o banco.
- **asyncpg**: Driver assíncrono para PostgreSQL.
- **PostgreSQL + PostGIS + pgRouting**: Banco de dados geoespacial.

## Estrutura do Projeto
```text
backend/
├── app/
│   ├── core/      # Configurações e DB
│   ├── routers/   # Endpoints da API
│   ├── schemas/   # Validação de dados (Pydantic)
│   ├── main.py    # Ponto de entrada
├── requirements.txt # Dependências do projeto
```

## Configuração e Instalação

1. **Ambiente Virtual:**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

2. **Dependências:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Variáveis de Ambiente:**
   Crie um arquivo `.env` com as seguintes variáveis:
   ```env
   DATABASE_URL=postgresql+asyncpg://user:passwd@localhost:5432/nome_do_banco
   ```

## Executando a Aplicação
```bash
uvicorn app.main:app --reload
```
A API estará disponível em `http://localhost:8000`.
A documentação interativa (Swagger) pode ser acessada em `http://localhost:8000/docs`.

## Endpoints
| Método | Endpoint | Descrição | Requisito / US |
| :--- | :--- | :--- | :--- |
| GET | `/spaces/{id}/version` | Retorna a versão atual (`space_version`) para o app decidir se precisa baixar novos dados. | RNF07 (Offline-First) |
| GET | `/spaces/{id}/sync` | Download do pacote GeoJSON: Beacons, Grafo, POIs e Units (com atributo `is_blocked`). | US01 (Sincronização) |
| GET | `/search` | Busca por nome ou categoria de Unit/POI. Retorna o ID e a coordenada de entrada (`entry_point`). | US02 (Busca) |
| POST | `/route/calculate` | Calcula a rota entre pontos, filtrando `is_blocked = true` e aplicando "custo infinito" para acessibilidade. | US03 (Acessibilidade) |
| POST | `/analytics/ping` | Coleta de dados anonimizados contendo geom, level e timestamp. | US05 (Mapa de Calor) |
| PATCH | `/admin/units/{id}` | Atualiza o status da Unit (ex: `is_blocked`) para manutenção ou fechamento. | US04 (Bloqueio) |
| POST | `/admin/spaces/publish` | Incrementa a versão do espaço após edições no QGIS/Painel, disparando alertas de atualização. | RF04 (Gestão) |
