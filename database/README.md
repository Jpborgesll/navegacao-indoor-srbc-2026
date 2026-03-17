# Módulo de Banco de Dados - Sistema de Navegação Indoor

Este diretório contém toda a modelagem e scripts de estrutura de dados para o sistema de navegação indoor.

## 📂 Estrutura de Pastas
- **/diagrams**: Contém o Modelo Entidade-Relacionamento (MER) em formato de imagem e arquivos editáveis.
- **/schemas**: Scripts SQL para criação das tabelas e extensões necessárias (PostGIS).

## 🛠️ Tecnologias Utilizadas
- **PostgreSQL**: Banco de dados relacional.
- **PostGIS**: Extensão para suporte a dados geográficos e cálculos de rota.

## 📌 Principais Entidades
- **Space**: Representa o ambiente físico (ex: Prédio da UFG).
- **Unit**: Salas ou departamentos dentro de um espaço.
- **Beacon**: Pontos de referência para localização via sinais (Bluetooth/IMU).
- **Edge Line**: Caminhos conectando os pontos para cálculo de trajetória.
