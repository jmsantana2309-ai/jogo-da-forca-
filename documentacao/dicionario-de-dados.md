# Dicionário de dados

Banco: `jogo_da_forca`  
SGBD de referência: MySQL 8.0+

## LOGIN
| Campo | Tipo | Restrições | Descrição |
|---|---|---|---|
| id | INT | PK, AUTO_INCREMENT | Identificador do login |
| usuario | VARCHAR(50) | NOT NULL, UNIQUE | Nome de usuário para acesso |
| email | VARCHAR(120) | NOT NULL, UNIQUE | E-mail de acesso |
| senha_hash | VARCHAR(255) | NOT NULL | Hash da senha; nunca armazenar senha em texto puro |
| criado_em | DATETIME | NOT NULL | Data de criação |

## USUARIO
| Campo | Tipo | Restrições | Descrição |
|---|---|---|---|
| id | INT | PK, AUTO_INCREMENT | Identificador do usuário |
| login_id | INT | FK, UNIQUE, NOT NULL | Login associado |
| nome | VARCHAR(120) | NOT NULL | Nome do usuário |
| data_nascimento | DATE | NULL | Data de nascimento |
| telefone | VARCHAR(20) | NULL | Telefone para contato |
| status | TINYINT(1) | NOT NULL, DEFAULT 1 | Situação do cadastro |
| criado_em | DATETIME | NOT NULL | Data de criação |
| atualizado_em | DATETIME | NOT NULL | Data da última atualização |

## JOGADOR
| Campo | Tipo | Restrições | Descrição |
|---|---|---|---|
| id | INT | PK, AUTO_INCREMENT | Identificador do jogador |
| usuario_id | INT | FK, NOT NULL | Usuário responsável pelo perfil |
| pontuacao | INT | NOT NULL, DEFAULT 0 | Pontuação acumulada |
| nivel | INT | NOT NULL, DEFAULT 1 | Nível atual |

## PALAVRAS
| Campo | Tipo | Restrições | Descrição |
|---|---|---|---|
| id | INT | PK, AUTO_INCREMENT | Identificador da palavra |
| palavra | VARCHAR(80) | NOT NULL | Palavra a ser descoberta |
| dica | VARCHAR(255) | NOT NULL | Dica apresentada ao jogador |
| categoria | VARCHAR(60) | NULL | Categoria da palavra |
| dificuldade | ENUM | NOT NULL | Fácil, médio ou difícil |
| ativo | TINYINT(1) | NOT NULL, DEFAULT 1 | Indica se pode ser usada em novas partidas |

## PARTIDA
| Campo | Tipo | Restrições | Descrição |
|---|---|---|---|
| id | INT | PK, AUTO_INCREMENT | Identificador da partida |
| jogador_id | INT | FK, NOT NULL | Jogador participante |
| palavra_id | INT | FK, NOT NULL | Palavra escolhida para a partida |
| erros | INT | NOT NULL, DEFAULT 0 | Quantidade de erros |
| acertos | INT | NOT NULL, DEFAULT 0 | Quantidade de acertos |
| max_erros | INT | NOT NULL, DEFAULT 6 | Limite de erros |
| status | ENUM | NOT NULL | Em andamento, vitória ou derrota |
| inicio | DATETIME | NOT NULL | Data/hora de início |
| fim | DATETIME | NULL | Data/hora de encerramento |
| pontuacao_partida | INT | NOT NULL, DEFAULT 0 | Pontos obtidos na partida |

## TENTATIVAS
| Campo | Tipo | Restrições | Descrição |
|---|---|---|---|
| id | INT | PK, AUTO_INCREMENT | Identificador da tentativa |
| partida_id | INT | FK, NOT NULL | Partida em que ocorreu |
| letra | CHAR(1) | NOT NULL | Letra informada |
| acertou | TINYINT(1) | NOT NULL | 1 se a letra existe na palavra; 0 caso contrário |
| tentado_em | DATETIME | NOT NULL | Data/hora da tentativa |

## Observações
- `ativo = 1`: palavra disponível para novas partidas.
- `ativo = 0`: palavra desativada, preservada no histórico e não selecionada em novas partidas.
- `senha_hash` deve receber um hash produzido pela aplicação com algoritmo apropriado; não deve guardar a senha original.
- Os valores de `status` e `dificuldade` estão definidos como ENUM nos scripts SQL.
