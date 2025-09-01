-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 01/09/2025 às 03:44
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
-- Banco de dados: `Universidade`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Aluno`
--

CREATE TABLE `Aluno` (
  `id` int NOT NULL,
  `faculdade_sigla` varchar(8) NOT NULL,
  `nome` int NOT NULL,
  `data_nascimento` date NOT NULL,
  `CRA` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Aluno_Professor`
--

CREATE TABLE `Aluno_Professor` (
  `aluno_id` int NOT NULL,
  `professor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Aluno_Turma`
--

CREATE TABLE `Aluno_Turma` (
  `aluno_id` int NOT NULL,
  `turma_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Disciplina`
--

CREATE TABLE `Disciplina` (
  `sigla` varchar(128) NOT NULL,
  `nome` int NOT NULL,
  `numero_creditos` int NOT NULL,
  `faculdade_sigla` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Disciplina_pre_requisito`
--

CREATE TABLE `Disciplina_pre_requisito` (
  `sigla` varchar(128) NOT NULL,
  `disciplina_sigla` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Faculdade`
--

CREATE TABLE `Faculdade` (
  `sigla` varchar(8) NOT NULL,
  `id_diretor` int NOT NULL,
  `bloco` varchar(128) NOT NULL,
  `numero_professores` int NOT NULL,
  `numero_alunos` int NOT NULL,
  `orcamento` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Professor`
--

CREATE TABLE `Professor` (
  `id` int NOT NULL,
  `nome` varchar(128) NOT NULL,
  `data_nascimento` date NOT NULL,
  `salario` float NOT NULL,
  `faculdade_sigla` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Professor_Turma`
--

CREATE TABLE `Professor_Turma` (
  `professor_id` int NOT NULL,
  `turma_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Sala`
--

CREATE TABLE `Sala` (
  `numero_sala` int NOT NULL,
  `bloco` varchar(128) NOT NULL,
  `capacidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Telefole`
--

CREATE TABLE `Telefole` (
  `aluno_id` int NOT NULL,
  `telefone_fixo` varchar(11) NOT NULL,
  `telefone_cel` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Turma`
--

CREATE TABLE `Turma` (
  `id` int NOT NULL,
  `disciplina_sigla` varchar(128) NOT NULL,
  `numero_sala` int NOT NULL,
  `bloco` varchar(128) NOT NULL,
  `semestre` int NOT NULL,
  `ano` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Aluno`
--
ALTER TABLE `Aluno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculdade_sigla` (`faculdade_sigla`);

--
-- Índices de tabela `Aluno_Professor`
--
ALTER TABLE `Aluno_Professor`
  ADD KEY `aluno_id` (`aluno_id`),
  ADD KEY `professor_id` (`professor_id`);

--
-- Índices de tabela `Aluno_Turma`
--
ALTER TABLE `Aluno_Turma`
  ADD KEY `aluno_id` (`aluno_id`),
  ADD KEY `turma_id` (`turma_id`);

--
-- Índices de tabela `Disciplina`
--
ALTER TABLE `Disciplina`
  ADD PRIMARY KEY (`sigla`),
  ADD KEY `faculdade_sigla` (`faculdade_sigla`);

--
-- Índices de tabela `Disciplina_pre_requisito`
--
ALTER TABLE `Disciplina_pre_requisito`
  ADD PRIMARY KEY (`sigla`),
  ADD KEY `disciplina_sigla` (`disciplina_sigla`);

--
-- Índices de tabela `Faculdade`
--
ALTER TABLE `Faculdade`
  ADD PRIMARY KEY (`sigla`);

--
-- Índices de tabela `Professor`
--
ALTER TABLE `Professor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculdade_sigla` (`faculdade_sigla`);

--
-- Índices de tabela `Professor_Turma`
--
ALTER TABLE `Professor_Turma`
  ADD KEY `professor_id` (`professor_id`),
  ADD KEY `turma_id` (`turma_id`);

--
-- Índices de tabela `Sala`
--
ALTER TABLE `Sala`
  ADD PRIMARY KEY (`numero_sala`,`bloco`);

--
-- Índices de tabela `Telefole`
--
ALTER TABLE `Telefole`
  ADD KEY `aluno_id` (`aluno_id`);

--
-- Índices de tabela `Turma`
--
ALTER TABLE `Turma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_sala` (`numero_sala`,`bloco`);
  ADD KEY `disciplina_sigla` (`disciplina_sigla`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Aluno`
--
ALTER TABLE `Aluno`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Professor`
--
ALTER TABLE `Professor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Turma`
--
ALTER TABLE `Turma`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Aluno`
--
ALTER TABLE `Aluno`
  ADD CONSTRAINT `Aluno_ibfk_1` FOREIGN KEY (`faculdade_sigla`) REFERENCES `Faculdade` (`sigla`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Aluno_Professor`
--
ALTER TABLE `Aluno_Professor`
  ADD CONSTRAINT `Aluno_Professor_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Aluno_Professor_ibfk_2` FOREIGN KEY (`professor_id`) REFERENCES `Professor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Aluno_Turma`
--
ALTER TABLE `Aluno_Turma`
  ADD CONSTRAINT `Aluno_Turma_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Aluno_Turma_ibfk_2` FOREIGN KEY (`turma_id`) REFERENCES `Turma` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Disciplina_pre_requisito`
--
ALTER TABLE `Disciplina_pre_requisito`
  ADD CONSTRAINT `Disciplina_pre_requisito_ibfk_1` FOREIGN KEY (`disciplina_sigla`) REFERENCES `Disciplina` (`sigla`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Professor`
--
ALTER TABLE `Professor`
  ADD CONSTRAINT `Professor_ibfk_1` FOREIGN KEY (`faculdade_sigla`) REFERENCES `Faculdade` (`sigla`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Professor_Turma`
--
ALTER TABLE `Professor_Turma`
  ADD CONSTRAINT `Professor_Turma_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `Professor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Professor_Turma_ibfk_2` FOREIGN KEY (`turma_id`) REFERENCES `Turma` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Telefole`
--
ALTER TABLE `Telefole`
  ADD CONSTRAINT `Telefole_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Turma`
--
ALTER TABLE `Turma`
  ADD CONSTRAINT `Turma_ibfk_1` FOREIGN KEY (`numero_sala`,`bloco`) REFERENCES `Sala` (`numero_sala`, `bloco`) ON DELETE RESTRICT ON UPDATE RESTRICT;
  ADD CONSTRAINT `Turma_ibfk_2` FOREIGN KEY (`disciplina_sigla`) REFERENCES `Disciplina` (`sigla`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
