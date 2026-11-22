# Jogo da Forca — Banco de Dados

Projeto acadêmico de modelagem e implementação de banco de dados para um jogo da forca.

## Objetivo
Organizar os dados de acesso, usuários, jogadores, palavras, partidas e tentativas realizadas durante cada partida.

## Modelo utilizado
Os scripts foram preparados para **MySQL 8.0 ou superior**. As tabelas possuem chaves primárias, chaves estrangeiras, restrições de integridade e índices.

## Estrutura do repositório
- `documentacao/descricao-projeto.md`: objetivo, regras e visão geral.
- `documentacao/dicionario-de-dados.md`: descrição das tabelas e colunas.
- `documentacao/relacionamentos.md`: relacionamentos e diagrama ER.
- `sql/01-criacao-tabelas.sql`: criação do banco e das tabelas.
- `sql/02-insercao-dados.sql`: dados iniciais de exemplo.
- `sql/03-consultas.sql`: consultas úteis para o sistema.

## Como executar
1. Abra o MySQL Workbench ou outro cliente MySQL.
2. Execute `sql/01-criacao-tabelas.sql`.
3. Execute `sql/02-insercao-dados.sql` para inserir dados de teste.
4. Execute as consultas de `sql/03-consultas.sql`.

> O script inicial cria e seleciona o banco `jogo_da_forca`. Ajuste os dados de exemplo conforme necessário para o aplicativo.

## Diagrama no DB Designer
[Visualizar o modelo do banco de dados no DB Designer](https://dbdesigner.page.link/fDWH3oExuafwqt9q8)

## Tecnologias
- Banco de dados relacional
- SQL
- MySQL 8.0+

## Observação
Este repositório documenta a estrutura lógica do banco de dados. A aplicação do jogo pode ser conectada a essas tabelas por meio de sua camada de acesso a dados.
