-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Out-2019 às 23:40
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `leosfy`
--
CREATE DATABASE IF NOT EXISTS `leosfy` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `leosfy`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `amigos`
--

CREATE TABLE IF NOT EXISTS `amigos` (
  `id_amigos` int(100) NOT NULL AUTO_INCREMENT,
  `id_solicitante` int(4) DEFAULT NULL,
  `id_solicitado` int(4) DEFAULT NULL,
  `STATUS` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_amigos`),
  KEY `id_solicitante` (`id_solicitante`),
  KEY `id_solicitado` (`id_solicitado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `musica`
--

CREATE TABLE IF NOT EXISTS `musica` (
  `id_musica` int(4) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `id_usuario` int(4) DEFAULT NULL,
  PRIMARY KEY (`id_musica`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `musica`
--

INSERT INTO `musica` (`id_musica`, `nome`, `status`, `id_usuario`) VALUES
(1, 'Charlie_Brown_Jr._-_Meu_Novo_Mundo_(LetraLegendado)[1].mp3', b'1', 2),
(2, 'Charlie_Brown_Jr._-_Meu_Novo_Mundo_(LetraLegendado)[1].mp3', b'1', 2),
(3, 'Gabriel_O_Pensador_-_Cachimbo_da_Paz_(Acústico)[1].mp3', b'1', 2),
(4, 'Froid_-_Fique_Rico_ou_Moralismo_(prod._Froid)[1].mp3', b'1', 2),
(5, '', b'1', 2),
(6, '', b'1', 2),
(7, '', b'1', 2),
(8, 'asddsa', b'1', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `playlist`
--

CREATE TABLE IF NOT EXISTS `playlist` (
  `id_solicitacao` int(50) NOT NULL AUTO_INCREMENT,
  `musica` int(4) NOT NULL,
  `sala` int(4) NOT NULL,
  `usuario` int(4) NOT NULL,
  `status` binary(1) NOT NULL,
  PRIMARY KEY (`id_solicitacao`),
  KEY `musica` (`musica`),
  KEY `sala` (`sala`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE IF NOT EXISTS `sala` (
  `id_sala` int(4) NOT NULL AUTO_INCREMENT,
  `id_adm` int(4) NOT NULL,
  `nome_sala` varchar(80) NOT NULL,
  `senha` varchar(80) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `id_adm` (`id_adm`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`id_sala`, `id_adm`, `nome_sala`, `senha`, `imagem`, `status`) VALUES
(1, 2, 'mal_FM', '123', '35a49657bb9019b6018c0c9cde8e46f1.jpg', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(4) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `img_perfil` varchar(255) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `senha`, `img_perfil`, `status`, `email`) VALUES
(1, 'leo', '123', 'Spinel.png', b'1', 'henrique.quagliato2@gmail.com'),
(2, 'mal', '123', '7c99b3dadb4a7001030d929cbd0c7e11.jpg', b'1', 'leonardo.mantoni@gmail.com');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `amigos`
--
ALTER TABLE `amigos`
  ADD CONSTRAINT `amigos_ibfk_1` FOREIGN KEY (`id_solicitante`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `amigos_ibfk_2` FOREIGN KEY (`id_solicitado`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `musica`
--
ALTER TABLE `musica`
  ADD CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`musica`) REFERENCES `musica` (`id_musica`),
  ADD CONSTRAINT `playlist_ibfk_2` FOREIGN KEY (`sala`) REFERENCES `sala` (`id_sala`),
  ADD CONSTRAINT `playlist_ibfk_3` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`id_adm`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
