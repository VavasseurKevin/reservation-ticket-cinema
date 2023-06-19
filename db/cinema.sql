-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `cinema`;
CREATE DATABASE `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cinema`;

DROP TABLE IF EXISTS `Billet`;
CREATE TABLE `Billet` (
  `billet_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) NOT NULL,
  `prix_total` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seance_id` int(11) NOT NULL,
  PRIMARY KEY (`billet_id`),
  KEY `user_id` (`user_id`),
  KEY `seance_id` (`seance_id`),
  CONSTRAINT `Billet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Utilisateur` (`user_id`),
  CONSTRAINT `Billet_ibfk_2` FOREIGN KEY (`seance_id`) REFERENCES `Seance` (`seance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `Cinema`;
CREATE TABLE `Cinema` (
  `cinema_id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_nom` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `Evaluation`;
CREATE TABLE `Evaluation` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `note` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `user_id` (`user_id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `Evaluation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Utilisateur` (`user_id`),
  CONSTRAINT `Evaluation_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `Film` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `Film`;
CREATE TABLE `Film` (
  `film_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_titre` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `duration` time NOT NULL,
  `description` varchar(255) NOT NULL,
  `seance_id` int(11) NOT NULL,
  PRIMARY KEY (`film_id`),
  KEY `seance_id` (`seance_id`),
  CONSTRAINT `Film_ibfk_1` FOREIGN KEY (`seance_id`) REFERENCES `Seance` (`seance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_nom` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `Salle`;
CREATE TABLE `Salle` (
  `salle_id` int(11) NOT NULL AUTO_INCREMENT,
  `salle_nom` varchar(255) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  PRIMARY KEY (`salle_id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `Salle_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `Cinema` (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `Seance`;
CREATE TABLE `Seance` (
  `seance_id` int(11) NOT NULL AUTO_INCREMENT,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `date_seance` date NOT NULL,
  `salle_id` int(11) NOT NULL,
  PRIMARY KEY (`seance_id`),
  KEY `salle_id` (`salle_id`),
  CONSTRAINT `Seance_ibfk_1` FOREIGN KEY (`salle_id`) REFERENCES `Salle` (`salle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `Utilisateur`;
CREATE TABLE `Utilisateur` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `Utilisateur_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 2023-06-19 19:45:54
