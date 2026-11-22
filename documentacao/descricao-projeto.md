# Descrição do projeto — Jogo da Forca

## 1. Apresentação
O projeto consiste na modelagem de um banco de dados relacional para dar suporte a um jogo da forca. O banco registra os dados de autenticação e perfil dos usuários, os jogadores, o catálogo de palavras e dicas, as partidas e as letras tentadas.

## 2. Objetivo
Armazenar as informações necessárias para acompanhar a experiência do jogador, manter um histórico de partidas e permitir consultas sobre pontuação, desempenho e palavras disponíveis.

## 3. Regras gerais de negócio
1. Um registro de login está associado a um único cadastro de usuário.
2. Um usuário pode possuir um ou mais registros de jogador.
3. Um jogador pode participar de várias partidas.
4. Cada partida utiliza uma palavra cadastrada.
5. Uma palavra pode ser utilizada em várias partidas.
6. Cada partida pode possuir várias tentativas de letras.
7. Uma palavra marcada como inativa não deve ser selecionada em novas partidas.
8. A pontuação da partida é armazenada no encerramento, permitindo manter o histórico.

## 4. Entidades
- **LOGIN:** informações de autenticação.
- **USUARIO:** dados cadastrais da pessoa usuária.
- **JOGADOR:** perfil e progresso no jogo.
- **PALAVRAS:** palavras, dicas, categorias e níveis de dificuldade.
- **PARTIDA:** registro de cada sessão de jogo.
- **TENTATIVAS:** letras informadas durante uma partida.

## 5. Integridade dos dados
As chaves primárias identificam unicamente os registros. As chaves estrangeiras garantem que partidas estejam associadas a jogadores e palavras existentes e que tentativas pertençam a partidas cadastradas. Restrições UNIQUE evitam duplicidade de login e de associação entre login e usuário.

## 6. Tecnologia
Os scripts SQL deste repositório utilizam a sintaxe do MySQL 8.0 ou superior.

## 7. Modelo visual
O modelo conceitual/lógico também pode ser consultado no [DB Designer](https://dbdesigner.page.link/fDWH3oExuafwqt9q8).
