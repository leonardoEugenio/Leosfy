-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Out-2019 às 03:27
-- Versão do servidor: 10.3.16-MariaDB
-- versão do PHP: 7.3.6

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `musica`
--

INSERT INTO `musica` (`id_musica`, `nome`, `status`, `id_usuario`) VALUES
(11, 'Lil Uzi Vert ft. MR. Galiza - XO TOUR LLIF3 (MASHUP).mp3', b'1', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE IF NOT EXISTS `sala` (
  `id_sala` int(4) NOT NULL AUTO_INCREMENT,
  `id_adm` int(4) NOT NULL,
  `nome_sala` varchar(80) DEFAULT NULL,
  `senha` varchar(80) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `id_adm` (`id_adm`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`id_sala`, `id_adm`, `nome_sala`, `senha`, `imagem`, `status`) VALUES
(1, 1, 'ricardao FM', '123', 'apagar_depois_400x400.jpg', 1),
(2, 1, 'stalin', '123', 'urss.png', 1),
(3, 1, 'teste', '123', 'IMG_0701.jpg', 1),
(4, 1, 'leo', '123', 'IMG_0703.jpg', 1),
(5, 1, 'LEO', '123', 'IMG_0701.jpg', 1),
(6, 1, 'Z-INDEX', '123', '', 1),
(7, 1, 'leo', '123', 'IMG_0703.jpg', 1),
(8, 1, 'leo', '123', 'IMG_0703.jpg', 1),
(9, 1, 'leo', '123', 'IMG_0703.jpg', 1),
(10, 1, 'leo', '123', 'IMG_0703.jpg', 1),
(11, 1, 'leo', '123', 'IMG_0703.jpg', 1),
(12, 1, 'leo', '123', 'IMG_0703.jpg', 1),
(13, 1, 'leo', '123', 'IMG_0703.jpg', 1),
(14, 1, 'leo', '123', 'IMG_0701.jpg', 1),
(15, 1, 'teste', '3', 'IMG_0703.jpg', 1),
(16, 1, 'teste', '3', 'IMG_0703.jpg', 1),
(17, 1, 'teste', '123', '', 1),
(18, 1, 'teste4', '123', '', 1),
(19, 1, 'teste88', '123', 'IMG_0701.jpg', 1),
(20, 1, 'teste1000', '123', 'IMG_0703.jpg', 1),
(21, 1, 'teste1000', '123', 'IMG_0703.jpg', 1),
(22, 1, 'teste1000', '123', 'IMG_0701.jpg', 1),
(23, 1, 'tes 9999', '123', 'apagar_depois_400x400.jpg', 1),
(24, 1, 'teste', '123', 'icone lupa.jpg', 1),
(25, 1, 'teste', '123', 'urss.png', 1),
(26, 3, 'Hip hop', '1234', 'urss.png', 1),
(27, 4, 'aaaaa', 'aaaaa', 'yato.jpg', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `senha`, `img_perfil`, `status`, `email`) VALUES
(1, 'leo', '123', 'Spinel.png', b'1', 'henrique.quagliato2@gmail.com'),
(3, 'admin', '123', 'urss.png', b'1', 'a@com'),
(4, 'pidkill', '123', 'yato.jpg', b'1', 'pidkill.games@gmail.com');

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
-- Limitadores para a tabela `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`id_adm`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
