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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `Billet` (`billet_id`, `quantite`, `prix_total`, `user_id`, `seance_id`) VALUES
(4,	2,	50,	2,	3)
ON DUPLICATE KEY UPDATE `billet_id` = VALUES(`billet_id`), `quantite` = VALUES(`quantite`), `prix_total` = VALUES(`prix_total`), `user_id` = VALUES(`user_id`), `seance_id` = VALUES(`seance_id`);

DROP TABLE IF EXISTS `Cinema`;
CREATE TABLE `Cinema` (
  `cinema_id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_nom` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `Cinema` (`cinema_id`, `cinema_nom`, `location`) VALUES
(1,	'UGC',	'Lyon'),
(2,	'Cinema Gaumont Pathé',	'Paris 75020'),
(3,	'UGC',	'Paris 75001')
ON DUPLICATE KEY UPDATE `cinema_id` = VALUES(`cinema_id`), `cinema_nom` = VALUES(`cinema_nom`), `location` = VALUES(`location`);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `Evaluation` (`note_id`, `note`, `user_id`, `film_id`) VALUES
(4,	8,	2,	3)
ON DUPLICATE KEY UPDATE `note_id` = VALUES(`note_id`), `note` = VALUES(`note`), `user_id` = VALUES(`user_id`), `film_id` = VALUES(`film_id`);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `Film` (`film_id`, `film_titre`, `genre`, `duration`, `description`, `seance_id`) VALUES
(3,	'Batman',	'Fantastique',	'01:30:00',	' Les super-héros DC sont bien connus contrairement aux super-vilains moins connus',	3)
ON DUPLICATE KEY UPDATE `film_id` = VALUES(`film_id`), `film_titre` = VALUES(`film_titre`), `genre` = VALUES(`genre`), `duration` = VALUES(`duration`), `description` = VALUES(`description`), `seance_id` = VALUES(`seance_id`);

DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_nom` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `Role` (`role_id`, `role_nom`) VALUES
(1,	'Admin'),
(2,	'Utilisateur')
ON DUPLICATE KEY UPDATE `role_id` = VALUES(`role_id`), `role_nom` = VALUES(`role_nom`);

DROP TABLE IF EXISTS `Salle`;
CREATE TABLE `Salle` (
  `salle_id` int(11) NOT NULL AUTO_INCREMENT,
  `salle_nom` varchar(255) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  PRIMARY KEY (`salle_id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `Salle_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `Cinema` (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `Salle` (`salle_id`, `salle_nom`, `cinema_id`) VALUES
(2,	'Salle 1',	1),
(3,	'Salle 2',	2),
(4,	'Salle 3',	1)
ON DUPLICATE KEY UPDATE `salle_id` = VALUES(`salle_id`), `salle_nom` = VALUES(`salle_nom`), `cinema_id` = VALUES(`cinema_id`);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `Seance` (`seance_id`, `heure_debut`, `heure_fin`, `date_seance`, `salle_id`) VALUES
(3,	'09:00:00',	'11:00:00',	'2023-06-20',	2)
ON DUPLICATE KEY UPDATE `seance_id` = VALUES(`seance_id`), `heure_debut` = VALUES(`heure_debut`), `heure_fin` = VALUES(`heure_fin`), `date_seance` = VALUES(`date_seance`), `salle_id` = VALUES(`salle_id`);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `Utilisateur` (`user_id`, `username`, `email`, `password`, `role_id`) VALUES
(2,	'Kevin',	'kevin@gmail.com',	'Kevin123456!',	1)
ON DUPLICATE KEY UPDATE `user_id` = VALUES(`user_id`), `username` = VALUES(`username`), `email` = VALUES(`email`), `password` = VALUES(`password`), `role_id` = VALUES(`role_id`);

-- 2023-06-26 20:50:50
