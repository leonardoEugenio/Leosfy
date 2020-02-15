-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Fev-2020 às 09:39
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `id11098704_leosfy`
--
CREATE DATABASE IF NOT EXISTS `id11098704_leosfy` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id11098704_leosfy`;

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `musica`
--

INSERT INTO `musica` (`id_musica`, `nome`, `status`, `id_usuario`) VALUES
(30, 'Happier.mp3', b'1', 4),
(32, 'Thunder.mp3', b'1', 4),
(34, 'ButterCup.mp3', b'1', 4);

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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `playlist`
--

INSERT INTO `playlist` (`id_solicitacao`, `musica`, `sala`, `usuario`, `status`) VALUES
(31, 30, 13, 4, 0x31),
(33, 32, 13, 4, 0x31),
(42, 34, 15, 1, 0x31),
(94, 34, 13, 1, 0x31);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`id_sala`, `id_adm`, `nome_sala`, `senha`, `imagem`, `status`) VALUES
(13, 4, 'Léo e la', '123', '1336217376670.jpg', 1),
(15, 12, 'Leo123', '123', '1567902413981.png', 1),
(16, 13, 'Estou testando', '123', '', 1),
(17, 12, 'Salve', '123', 'IMG-20191004-WA0000.jpg', 1),
(18, 14, 'salinha do mau', '123', 'bichos4.jpg', 1),
(19, 13, 'Mais um teste', '123', '', 1),
(20, 13, 'Ta funcionando!', '123', '', 1),
(21, 13, 'Banco', '', 'img_20191007_204605_4733799444644378258.jpg', 1),
(22, 4, 'testezin', '', 'j0440666.png', 1),
(23, 16, 'Teste', '', '', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `senha`, `img_perfil`, `status`, `email`) VALUES
(1, 'leo', '123', 'Spinel.png', b'1', 'henrique.quagliato2@gmail.com'),
(4, 'Pidkill', '123', 'yato.jpg', b'1', 'pidkill.games@gmail.com'),
(5, 'JAIR', '210306', 'IMG_20190930_155030.jpg', b'1', 'jair.grizolia@yahoo.com.br'),
(6, 'Eugenio', '123', '20190915_115633.jpg', b'1', 'leonardo.emmantoni@gmail.com'),
(11, 'Lauren Smith', 'lupesmith', 'PhotoGrid_1570333814802.jpg', b'1', 'lauren.franchi@hotmail.com'),
(12, 'Caio', 'ricardo', 'images (1).jpeg', b'1', 'caiodacostaprado@gmail.com'),
(13, 'Emerson', '123', '', b'1', 'meuemail@email.com'),
(14, 'Cleiton', '123', 'pipoca.jpg', b'1', 'creiton@gmail.com'),
(15, 'Glaucia', '123', 'IMG-20191004-WA0035.jpg', b'1', 'glaucia@gmail.com'),
(16, 'Faaser', '1a234567', '', b'1', 'faserkrek@gmail.com'),
(17, 'Leo123', '0121019', 'img_20191106_002522_6590080611549857264.jpg', b'1', 'leonardo.emmantoni@gmail.com');

--
-- Restrições para despejos de tabelas
--

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
