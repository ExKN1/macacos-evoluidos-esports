-- Banco de dados do projeto Macacos Evoluídos.
-- Execute este arquivo no MySQL antes de iniciar a aplicação.
-- Se o banco ou a tabela já existirem, sua estrutura e seus dados serão mantidos.
-- Este script não atualiza a estrutura de uma tabela existente.

CREATE DATABASE IF NOT EXISTS atividade4
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE atividade4;

CREATE TABLE IF NOT EXISTS mensagens (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(254) NOT NULL,
    assunto VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
