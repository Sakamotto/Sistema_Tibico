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
  `aluno_id` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `identidade` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `datanascimento` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL,
   PRIMARY KEY (`aluno_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `areaconhecimento`
--

CREATE TABLE `areaconhecimento` (
  `areaconhecimento_id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `subareaconhecimento_id` int(11) DEFAULT NULL,
   PRIMARY KEY (`areaconhecimento_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estrutura para tabela `aula`
--

CREATE TABLE `aula` (
  `aula_id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `quantidadeaulas` int(11) NOT NULL,
  `conteudo` varchar(255) NOT NULL,
   PRIMARY KEY (`aula_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `avaliacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `peso` decimal(10,0) NOT NULL,
  `nome` varchar(255) NOT NULL,
   PRIMARY KEY (`avaliacao_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `calendario`
--

CREATE TABLE `calendario` (
  `calendario_id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) NOT NULL,
  `duracao` int(11) NOT NULL,
  `datainicioca` date DEFAULT NULL,
  `datafimca` date DEFAULT NULL,
  `datainiciopm` date DEFAULT NULL,
  `datafimpm` date DEFAULT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `datainiciopl` date DEFAULT NULL,
  `datafimpl` date DEFAULT NULL,
   PRIMARY KEY (`calendario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE `curso` (
  `curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `regime` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `duracao` int(11) NOT NULL,
  `grauinstrucao_id` int(11) NOT NULL,
  `areaconhecimento_id` int(11) NOT NULL,
   PRIMARY KEY (`curso_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `disciplina_id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cargahoraria` int(11) DEFAULT NULL,
  `numcredito` int(11) NOT NULL,
  `periodocorrespondente` int(11) NOT NULL,
  `areadisciplina` varchar(255) NOT NULL,
   PRIMARY KEY (`disciplina_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `frequencia`
--

CREATE TABLE `frequencia` (
  `frequencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `numfaltas` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `aula_id` int(11) NOT NULL,
   PRIMARY KEY (`frequencia_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `grauinstrucao`
--

CREATE TABLE `grauinstrucao` (
  `grauinstrucao_id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
   PRIMARY KEY (`grauinstrucao_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `horario`
--

CREATE TABLE `horario` (
  `horario_id` int(11) NOT NULL AUTO_INCREMENT,
  `turma_id` int(11) NOT NULL,
  `horarioinicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `horariofim` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
   PRIMARY KEY (`horario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `professor_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `datanascimento` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `identidade` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
   PRIMARY KEY (`professor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `resultado`
--

CREATE TABLE `resultado` (
  `resultado_id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) NOT NULL,
  `avaliacao_id` int(11) NOT NULL,
  `pontuacao` decimal(10,0) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
   PRIMARY KEY (`resultado_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

CREATE TABLE `turma` (
  `turma_id` int(11) NOT NULL AUTO_INCREMENT,
  `professor_id` int(11) NOT NULL,
  `horario_id` int(11) NOT NULL,
  `numvagas` int(11) NOT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `disciplina_id` int(11) NOT NULL,
   PRIMARY KEY (`turma_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
