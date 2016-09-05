-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 05/09/2016 às 17:43
-- Versão do servidor: 10.1.13-MariaDB
-- Versão do PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tibico`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `aluno_id` int(11) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `identidade` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `datanascimento` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `areaconhecimento`
--

CREATE TABLE `areaconhecimento` (
  `areaconhecimento_id` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `subareaconhecimento_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `areaconhecimento`
--

INSERT INTO `areaconhecimento` (`areaconhecimento_id`, `descricao`, `subareaconhecimento_id`) VALUES
(0, 'Matemática', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `aula`
--

CREATE TABLE `aula` (
  `aula_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `quantidadeaulas` int(11) NOT NULL,
  `conteudo` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `avaliacao_id` int(11) NOT NULL,
  `peso` decimal(10,0) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `calendario`
--

CREATE TABLE `calendario` (
  `horario_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `duracao` int(11) NOT NULL,
  `datainicioca` date DEFAULT NULL,
  `datafimca` date DEFAULT NULL,
  `datainiciopm` date DEFAULT NULL,
  `datafimpm` date DEFAULT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `datainiciopl` date DEFAULT NULL,
  `datafimpl` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE `curso` (
  `curso_id` int(11) NOT NULL,
  `nome_curso` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `regime` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `duracao` int(11) NOT NULL,
  `grauinstrucao_id` int(11) NOT NULL,
  `areaconhecimento_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `disciplina_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cargahoraria` int(11) DEFAULT NULL,
  `numcredito` int(11) NOT NULL,
  `periodocorrespondente` int(11) NOT NULL,
  `areadisciplina` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `frequencia`
--

CREATE TABLE `frequencia` (
  `frequencia_id` int(11) NOT NULL,
  `numfaltas` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `aula_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `grauinstrucao`
--

CREATE TABLE `grauinstrucao` (
  `grauinstrucao_id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `horario`
--

CREATE TABLE `horario` (
  `horario_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL,
  `horarioinicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `horariofim` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `professor_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `datanascimento` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `identidade` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `resultado`
--

CREATE TABLE `resultado` (
  `resultado_id` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `avaliacao_id` int(11) NOT NULL,
  `pontuacao` decimal(10,0) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

CREATE TABLE `turma` (
  `turma_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `horario_id` int(11) NOT NULL,
  `numvagas` int(11) NOT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `disciplina_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`aluno_id`);

--
-- Índices de tabela `areaconhecimento`
--
ALTER TABLE `areaconhecimento`
  ADD PRIMARY KEY (`areaconhecimento_id`);

--
-- Índices de tabela `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`aula_id`);

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`avaliacao_id`);

--
-- Índices de tabela `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`horario_id`);

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`curso_id`);

--
-- Índices de tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`disciplina_id`);

--
-- Índices de tabela `frequencia`
--
ALTER TABLE `frequencia`
  ADD PRIMARY KEY (`frequencia_id`);

--
-- Índices de tabela `grauinstrucao`
--
ALTER TABLE `grauinstrucao`
  ADD PRIMARY KEY (`grauinstrucao_id`);

--
-- Índices de tabela `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`horario_id`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`professor_id`);

--
-- Índices de tabela `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`resultado_id`);

--
-- Índices de tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`turma_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
