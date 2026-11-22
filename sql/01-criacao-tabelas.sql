-- Projeto: Jogo da Forca
-- SGBD: MySQL 8.0+
-- Criação do banco e das tabelas.

CREATE DATABASE IF NOT EXISTS jogo_da_forca
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE jogo_da_forca;

CREATE TABLE IF NOT EXISTS LOGIN (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS USUARIO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login_id INT NOT NULL UNIQUE,
    nome VARCHAR(120) NOT NULL,
    data_nascimento DATE NULL,
    telefone VARCHAR(20) NULL,
    status TINYINT(1) NOT NULL DEFAULT 1,
    criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_login
        FOREIGN KEY (login_id) REFERENCES LOGIN(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS JOGADOR (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    pontuacao INT NOT NULL DEFAULT 0,
    nivel INT NOT NULL DEFAULT 1,
    CONSTRAINT chk_jogador_pontuacao CHECK (pontuacao >= 0),
    CONSTRAINT chk_jogador_nivel CHECK (nivel >= 1),
    CONSTRAINT fk_jogador_usuario
        FOREIGN KEY (usuario_id) REFERENCES USUARIO(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_jogador_usuario (usuario_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS PALAVRAS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    palavra VARCHAR(80) NOT NULL,
    dica VARCHAR(255) NOT NULL,
    categoria VARCHAR(60) NULL,
    dificuldade ENUM('facil', 'medio', 'dificil') NOT NULL DEFAULT 'facil',
    ativo TINYINT(1) NOT NULL DEFAULT 1,
    CONSTRAINT chk_palavra_ativo CHECK (ativo IN (0, 1)),
    INDEX idx_palavras_disponiveis (ativo, dificuldade)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS PARTIDA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jogador_id INT NOT NULL,
    palavra_id INT NOT NULL,
    erros INT NOT NULL DEFAULT 0,
    acertos INT NOT NULL DEFAULT 0,
    max_erros INT NOT NULL DEFAULT 6,
    status ENUM('em_andamento', 'vitoria', 'derrota') NOT NULL DEFAULT 'em_andamento',
    inicio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fim DATETIME NULL,
    pontuacao_partida INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_partida_erros CHECK (erros >= 0),
    CONSTRAINT chk_partida_acertos CHECK (acertos >= 0),
    CONSTRAINT chk_partida_max_erros CHECK (max_erros > 0),
    CONSTRAINT fk_partida_jogador
        FOREIGN KEY (jogador_id) REFERENCES JOGADOR(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_partida_palavra
        FOREIGN KEY (palavra_id) REFERENCES PALAVRAS(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_partida_jogador (jogador_id),
    INDEX idx_partida_palavra (palavra_id),
    INDEX idx_partida_status (status)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS TENTATIVAS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partida_id INT NOT NULL,
    letra CHAR(1) NOT NULL,
    acertou TINYINT(1) NOT NULL,
    tentado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_tentativa_acertou CHECK (acertou IN (0, 1)),
    CONSTRAINT fk_tentativa_partida
        FOREIGN KEY (partida_id) REFERENCES PARTIDA(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    INDEX idx_tentativas_partida (partida_id)
) ENGINE=InnoDB;
