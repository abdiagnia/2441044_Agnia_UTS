CREATE DATABASE IF NOT EXISTS db_seminar_registration
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_seminar_registration;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS participants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    institution VARCHAR(100) NOT NULL,
    category ENUM('GENERAL','STUDENT') NOT NULL DEFAULT 'GENERAL'
) ENGINE=InnoDB;

INSERT INTO users (username, password, name)
VALUES ('admin', 'admin123.', 'Administrator')
ON DUPLICATE KEY UPDATE username = VALUES(username);

INSERT INTO participants (code, name, email, institution, category) VALUES
('P001', 'Dina', 'dina@example.com', 'STT Mandala', 'STUDENT'),
('P002', 'Budi', 'budi@example.com', 'General', 'GENERAL')
ON DUPLICATE KEY UPDATE code = VALUES(code);
