-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Mar-2023 às 15:37
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_resilia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `matricula` varchar(10) NOT NULL,
  `nome` varchar(60) NOT NULL DEFAULT '60',
  `data_nascimento` date NOT NULL,
  `telefone` varchar(12) NOT NULL DEFAULT '12',
  `email` varchar(60) NOT NULL DEFAULT '60'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`matricula`, `nome`, `data_nascimento`, `telefone`, `email`) VALUES
('20210320AL', 'Bela', '2001-02-03', '21998756458', 'bela15@hotmail.com'),
('20210335AK', 'Silvia', '2001-08-23', '21994755498', 'silviabela@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `idcurso` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL DEFAULT '30'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`idcurso`, `nome`) VALUES
(40205, 'Tecnico Informatica'),
(40216, 'Tecnico Enfermagem');

-- --------------------------------------------------------

--
-- Estrutura da tabela `facilitadores`
--

CREATE TABLE `facilitadores` (
  `idfacilitador` varchar(10) NOT NULL,
  `nomefacilitador` varchar(60) NOT NULL DEFAULT '60',
  `email` varchar(60) NOT NULL DEFAULT '60',
  `telefone` varchar(12) NOT NULL DEFAULT '12',
  `idturma` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `facilitadores`
--

INSERT INTO `facilitadores` (`idfacilitador`, `nomefacilitador`, `email`, `telefone`, `idturma`) VALUES
('FA020405', 'Joao Sergio', 'joaosergio21@outlook.com', '21991131102', 'T07'),
('FA060504', 'Lucio', 'Lucio171@gmail.com', '21998577768', 'T06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `idturma` varchar(10) NOT NULL,
  `turno` varchar(15) NOT NULL DEFAULT '20',
  `idcurso` int(11) DEFAULT NULL,
  `matricula` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`idturma`, `turno`, `idcurso`, `matricula`) VALUES
('T06', 'Noturno', 40216, '202103345K'),
('T07', 'Matutino', 40205, '20210320AL');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`matricula`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idcurso`);

--
-- Índices para tabela `facilitadores`
--
ALTER TABLE `facilitadores`
  ADD PRIMARY KEY (`idfacilitador`),
  ADD KEY `idturma` (`idturma`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`idturma`),
  ADD KEY `idcurso` (`idcurso`),
  ADD KEY `matricula` (`matricula`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40217;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `facilitadores`
--
ALTER TABLE `facilitadores`
  ADD CONSTRAINT `facilitadores_ibfk_1` FOREIGN KEY (`idturma`) REFERENCES `turma` (`idturma`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`idcurso`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`matricula`) REFERENCES `alunos` (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
