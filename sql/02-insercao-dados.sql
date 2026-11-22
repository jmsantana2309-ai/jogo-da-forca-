-- Dados demonstrativos para testes do Jogo da Forca.
-- Execute após 01-criacao-tabelas.sql.

USE jogo_da_forca;

INSERT INTO LOGIN (usuario, email, senha_hash)
VALUES
('jogador01', 'jogador01@example.com', '$2y$10$hash_de_exemplo_nao_utilizar_em_producao'),
('jogador02', 'jogador02@example.com', '$2y$10$hash_de_exemplo_nao_utilizar_em_producao');

INSERT INTO USUARIO (login_id, nome, data_nascimento, telefone)
VALUES
(1, 'Jogador de Teste 1', '2005-05-10', '71999990001'),
(2, 'Jogador de Teste 2', '2006-08-20', '71999990002');

INSERT INTO JOGADOR (usuario_id, pontuacao, nivel)
VALUES
(1, 120, 2),
(2, 50, 1);

INSERT INTO PALAVRAS (palavra, dica, categoria, dificuldade, ativo)
VALUES
('COMPUTADOR', 'Máquina utilizada para processar informações', 'Tecnologia', 'medio', 1),
('GIRAFA', 'Animal de pescoço comprido', 'Animais', 'facil', 1),
('ALGORITMO', 'Sequência de passos para resolver um problema', 'Tecnologia', 'dificil', 1),
('BIBLIOTECA', 'Local onde se encontram livros', 'Educação', 'medio', 1),
('ABACAXI', 'Fruta de casca áspera', 'Alimentos', 'facil', 0);

-- Exemplo de partida em andamento para o primeiro jogador.
INSERT INTO PARTIDA (jogador_id, palavra_id, erros, acertos, max_erros, status)
VALUES (1, 1, 1, 2, 6, 'em_andamento');

INSERT INTO TENTATIVAS (partida_id, letra, acertou)
VALUES
(1, 'A', 1),
(1, 'E', 1),
(1, 'Z', 0);
