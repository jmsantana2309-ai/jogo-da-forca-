-- Consultas úteis para o sistema Jogo da Forca.
USE jogo_da_forca;

-- 1. Listar jogadores e seus respectivos usuários.
SELECT
    j.id AS jogador_id,
    u.nome,
    l.usuario AS nome_login,
    j.pontuacao,
    j.nivel
FROM JOGADOR j
INNER JOIN USUARIO u ON u.id = j.usuario_id
INNER JOIN LOGIN l ON l.id = u.login_id
ORDER BY j.pontuacao DESC;

-- 2. Listar somente palavras disponíveis para novas partidas.
SELECT id, palavra, dica, categoria, dificuldade
FROM PALAVRAS
WHERE ativo = 1
ORDER BY dificuldade, palavra;

-- 3. Histórico de partidas com jogador e palavra.
SELECT
    p.id AS partida_id,
    u.nome AS jogador,
    w.palavra,
    p.erros,
    p.acertos,
    p.status,
    p.inicio,
    p.fim,
    p.pontuacao_partida
FROM PARTIDA p
INNER JOIN JOGADOR j ON j.id = p.jogador_id
INNER JOIN USUARIO u ON u.id = j.usuario_id
INNER JOIN PALAVRAS w ON w.id = p.palavra_id
ORDER BY p.inicio DESC;

-- 4. Mostrar todas as tentativas de uma partida (altere o ID).
SELECT id, letra, acertou, tentado_em
FROM TENTATIVAS
WHERE partida_id = 1
ORDER BY tentado_em;

-- 5. Somar pontos obtidos por jogador a partir das partidas.
SELECT
    j.id AS jogador_id,
    u.nome,
    COALESCE(SUM(p.pontuacao_partida), 0) AS pontos_em_partidas
FROM JOGADOR j
INNER JOIN USUARIO u ON u.id = j.usuario_id
LEFT JOIN PARTIDA p ON p.jogador_id = j.id
GROUP BY j.id, u.nome
ORDER BY pontos_em_partidas DESC;

-- 6. Quantidade de partidas por resultado.
SELECT status, COUNT(*) AS total
FROM PARTIDA
GROUP BY status;

-- 7. Desativar uma palavra sem apagar seu registro histórico.
-- UPDATE PALAVRAS SET ativo = 0 WHERE id = 1;
