# Relacionamentos do banco de dados

## Cardinalidades
| Relação | Cardinalidade | Explicação |
|---|---|---|
| LOGIN → USUARIO | 1:1 | Cada usuário possui um login; cada login pertence a um usuário |
| USUARIO → JOGADOR | 1:N | Um usuário pode ter um ou mais perfis de jogador |
| JOGADOR → PARTIDA | 1:N | Um jogador pode jogar várias partidas |
| PALAVRAS → PARTIDA | 1:N | Uma palavra pode aparecer em várias partidas |
| PARTIDA → TENTATIVAS | 1:N | Uma partida pode registrar várias tentativas |

## Diagrama entidade-relacionamento

```mermaid
erDiagram
    LOGIN ||--|| USUARIO : possui
    USUARIO ||--o{ JOGADOR : cadastra
    JOGADOR ||--o{ PARTIDA : participa
    PALAVRAS ||--o{ PARTIDA : utilizada_em
    PARTIDA ||--o{ TENTATIVAS : registra

    LOGIN {
        int id PK
        varchar usuario
        varchar email
        varchar senha_hash
        datetime criado_em
    }
    USUARIO {
        int id PK
        int login_id FK
        varchar nome
        date data_nascimento
        varchar telefone
        boolean status
    }
    JOGADOR {
        int id PK
        int usuario_id FK
        int pontuacao
        int nivel
    }
    PALAVRAS {
        int id PK
        varchar palavra
        varchar dica
        varchar categoria
        enum dificuldade
        boolean ativo
    }
    PARTIDA {
        int id PK
        int jogador_id FK
        int palavra_id FK
        int erros
        int acertos
        int max_erros
        enum status
        datetime inicio
        datetime fim
        int pontuacao_partida
    }
    TENTATIVAS {
        int id PK
        int partida_id FK
        char letra
        boolean acertou
        datetime tentado_em
    }
```

## Integridade referencial
- `USUARIO.login_id` referencia `LOGIN.id` e é UNIQUE para garantir a relação 1:1.
- `JOGADOR.usuario_id` referencia `USUARIO.id`.
- `PARTIDA.jogador_id` referencia `JOGADOR.id`.
- `PARTIDA.palavra_id` referencia `PALAVRAS.id`.
- `TENTATIVAS.partida_id` referencia `PARTIDA.id`.

O diagrama visual do projeto também está disponível no [DB Designer](https://dbdesigner.page.link/fDWH3oExuafwqt9q8).
