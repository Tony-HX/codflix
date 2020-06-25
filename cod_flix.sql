-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 25 juin 2020 à 15:12
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cod flix`
--

-- --------------------------------------------------------

--
-- Structure de la table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
CREATE TABLE IF NOT EXISTS `episodes` (
  `id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `episode_title` varchar(100) NOT NULL,
  `episode_duration` varchar(100) NOT NULL,
  `season` int(11) NOT NULL,
  `episode` int(11) NOT NULL,
  `episode_url` varchar(100) NOT NULL,
  `episode_summary` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `episodes`
--

INSERT INTO `episodes` (`id`, `media_id`, `episode_title`, `episode_duration`, `season`, `episode`, `episode_url`, `episode_summary`) VALUES
(1, 3, 'Uhtred, fils d\'Uhtred', '59:02', 1, 1, 'https://www.youtube.com/embed/bNDwFDqqCQs', 'En 866, le fils ainé du roi saxon de Bebbanburg voit arriver des drakkars et est tué par le comte danois Ragnar.'),
(2, 3, 'Le Royaume de Wessex', '58:42', 1, 2, 'https://www.youtube.com/embed/yJ0puT8mMGA', 'Après être venu affirmer aux portes de Bebbanburg qu\'il récupérerait son bien, Uhtred est pris en chasse par son oncle Alferic. '),
(3, 3, 'Serment d\'allégeance', '58:48', 1, 3, 'https://www.youtube.com/embed/gL3u4zvzqsA', 'Les indications d\'Uhtred ont permis aux hommes du Wessex de mettre les troupes de Guthrum en déroute, mais le roi Aethelred a été touché au cours de la bataille et il succombe à ses blessures.'),
(4, 3, 'Un nouvel espoir', '28:13', 2, 1, 'https://www.youtube.com/embed/wX0GNz-nR-U', 'Uhtred, l\'intrépide et instinctif guerrier, entame son périple vers le nord pour accomplir son destin : venger la mort d\'Earl Ragnar et reconquérir ses terres ancestrales de Bebbanburg.'),
(5, 3, 'Jeux de pouvoir', '2:24', 2, 2, 'https://www.youtube.com/embed/EoyBYGdx10Y', 'Quand des espions infiltrent l\'armée du Cumberland, Uhtred doit compter sur ses troupes pour le sauver d\'une attaque périlleuse.'),
(6, 3, 'Soumission', '2:31', 2, 3, 'https://www.youtube.com/embed/puPSkA-BUCE', 'Uhtred est fait esclave sur un navire et Hild et Ragnar partent en mission pour le sauver, mais le temps joue contre eux. ');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Horreur'),
(3, 'Science-Fiction');

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `finish_date` datetime DEFAULT NULL,
  `watch_duration` int(11) NOT NULL DEFAULT '0' COMMENT 'in seconds',
  PRIMARY KEY (`id`),
  KEY `history_user_id_fk_media_id` (`user_id`),
  KEY `history_media_id_fk_media_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `release_date` date NOT NULL,
  `summary` longtext NOT NULL,
  `trailer_url` varchar(100) NOT NULL,
  `poster_url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_genre_id_fk_genre_id` (`genre_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `genre_id`, `title`, `type`, `status`, `release_date`, `summary`, `trailer_url`, `poster_url`) VALUES
(1, 1, 'John Wick Parabellum', 'film', 'En brouillon', '2019-05-09', 'John Wick a transgressé une règle fondamentale : il a tué à l\'intérieur même de l\'Hôtel Continental. Excommunié, tous les services liés au Continental lui sont fermés et sa tête mise à prix. John se retrouve sans soutien, traqué par tous les plus dangereux tueurs du monde.', 'https://www.youtube.com/embed/Cs4wKxXjkc8', 'https://image.tmdb.org/t/p/original/jeNTqOnux7KSulznSh4UdiDlfmV.jpg'),
(2, 2, 'Blair Witch Project', 'film', 'en brouillon', '1999-07-28', 'Le 21 octobre 1994, 3 étudiants de cinéma vont dans la forêt de Black Hills, dans le Maryland, pour faire un documentaire sur une légende locale : la sorcière de Blair. Un an plus tard, leur bande vidéo est retrouvée. Eux sont toujours portés disparus.', 'https://www.youtube.com/embed/m1IKhSZ6OYM', 'https://images-na.ssl-images-amazon.com/images/I/51nRjakqfGL._AC_.jpg'),
(3, 1, 'The Last Kingdom', 'série', '', '2015-08-10', 'Au IXe siècle, l\'Angleterre, séparée en de nombreux royaumes, est envahie par les Vikings menés par le Roi Alfred. Alors que le royaume de Wessex est le seul à résister, Uhtred doit choisir entre son pays natal et le peuple qui l\'a élevé.', 'https://www.youtube.com/embed/WxPApTGWwas', 'https://media.senscritique.com/media/000018142315/source_big/The_Last_Kingdom.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'coding@gmail.com', 'SHWj9UVUhIjDU');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);

--
-- Contraintes pour la table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_media_id_fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_user_id_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_genre_id_b1257088_fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
