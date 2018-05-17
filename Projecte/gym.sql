-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-05-2018 a las 07:29:00
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gym`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activitat`
--

CREATE TABLE IF NOT EXISTS `activitat` (
  `Codi` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Places` int(3) NOT NULL,
  `Dificultat` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Duracio` float NOT NULL,
  PRIMARY KEY (`Codi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `User` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Cognom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `CompteBancari` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `Rol` int(11) NOT NULL,
  PRIMARY KEY (`User`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Rol` (`Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendari`
--

CREATE TABLE IF NOT EXISTS `calendari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CodiActivitat` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Sala` int(11) NOT NULL,
  `Monitor` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `HoraInici` time NOT NULL,
  `Dia` int(11) NOT NULL,
  `Mes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CodiActivitat` (`CodiActivitat`),
  KEY `Sala` (`Sala`),
  KEY `Monitor` (`Monitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `User` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Cognom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `CompteBancari` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`User`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `energia`
--

CREATE TABLE IF NOT EXISTS `energia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Client` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Maquina` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Monitor` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Quantitat` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Client` (`Client`),
  KEY `Maquina` (`Maquina`),
  KEY `Monitor` (`Monitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE IF NOT EXISTS `maquina` (
  `Nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Tipus` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Estat` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `RatiConversio` float NOT NULL,
  PRIMARY KEY (`Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitor`
--

CREATE TABLE IF NOT EXISTS `monitor` (
  `User` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Cognom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `CompteBancari` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`User`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaactivitat`
--

CREATE TABLE IF NOT EXISTS `reservaactivitat` (
  `Codi` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Activitat` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Client` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codi`),
  KEY `Activitat` (`Activitat`),
  KEY `Client` (`Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservamaquina`
--

CREATE TABLE IF NOT EXISTS `reservamaquina` (
  `Codi` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Maquina` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Client` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codi`),
  KEY `Maquina` (`Maquina`),
  KEY `Client` (`Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcio` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE IF NOT EXISTS `sala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estat` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`Rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `calendari`
--
ALTER TABLE `calendari`
  ADD CONSTRAINT `calendari_ibfk_1` FOREIGN KEY (`CodiActivitat`) REFERENCES `activitat` (`Codi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calendari_ibfk_2` FOREIGN KEY (`Sala`) REFERENCES `sala` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calendari_ibfk_3` FOREIGN KEY (`Monitor`) REFERENCES `monitor` (`User`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `energia`
--
ALTER TABLE `energia`
  ADD CONSTRAINT `energia_ibfk_1` FOREIGN KEY (`Client`) REFERENCES `client` (`user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `energia_ibfk_2` FOREIGN KEY (`Maquina`) REFERENCES `maquina` (`Nom`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `energia_ibfk_3` FOREIGN KEY (`Monitor`) REFERENCES `monitor` (`User`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservaactivitat`
--
ALTER TABLE `reservaactivitat`
  ADD CONSTRAINT `reservaactivitat_ibfk_1` FOREIGN KEY (`Activitat`) REFERENCES `activitat` (`Codi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservaactivitat_ibfk_2` FOREIGN KEY (`Client`) REFERENCES `client` (`user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservamaquina`
--
ALTER TABLE `reservamaquina`
  ADD CONSTRAINT `reservamaquina_ibfk_1` FOREIGN KEY (`Maquina`) REFERENCES `maquina` (`Nom`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservamaquina_ibfk_2` FOREIGN KEY (`Client`) REFERENCES `client` (`user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
