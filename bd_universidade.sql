-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 27/08/2025 às 18:32
-- Versão do servidor: 9.4.0
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_universidade`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `id` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `data_nascimento` date NOT NULL,
  `CRA` int NOT NULL,
  `sigla_facul` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `sigla` varchar(8) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `num_creditos` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `faculdade`
--

CREATE TABLE `faculdade` (
  `sigla` varchar(8) NOT NULL,
  `bloco` varchar(32) NOT NULL,
  `num_professores` int NOT NULL,
  `orcamento` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `id` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `data_nascimento` date NOT NULL,
  `salario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sala_de_aula`
--

CREATE TABLE `sala_de_aula` (
  `nome_bloco` varchar(128) NOT NULL,
  `numero_sala` int NOT NULL,
  `capacidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone_aluno`
--

CREATE TABLE `telefone_aluno` (
  `id_aluno` int NOT NULL,
  `telefone` int NOT NULL,
  `tipo_telefone` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

CREATE TABLE `turma` (
  `id` int NOT NULL,
  `semestre` int NOT NULL,
  `ano` int NOT NULL,
  `local` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_facul_aluno` (`sigla_facul`);

--
-- Índices de tabela `faculdade`
--
ALTER TABLE `faculdade`
  ADD PRIMARY KEY (`sigla`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sala_de_aula`
--
ALTER TABLE `sala_de_aula`
  ADD PRIMARY KEY (`numero_sala`);

--
-- Índices de tabela `telefone_aluno`
--
ALTER TABLE `telefone_aluno`
  ADD KEY `fk_telefone_aluno` (`id_aluno`);

--
-- Índices de tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_facul_aluno` FOREIGN KEY (`sigla_facul`) REFERENCES `faculdade` (`sigla`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `telefone_aluno`
--
ALTER TABLE `telefone_aluno`
  ADD CONSTRAINT `fk_telefone_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
