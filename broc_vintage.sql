-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 02 fév. 2023 à 17:24
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `broc_vintage`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `postal` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `country`, `phone`) VALUES
(2, 4, 'rs', 'bob', 'bob', NULL, '8 rue des lilas', '83000', 'toulon', 'FR', '0102030405'),
(3, 21, 'rswebcorp', 'ric', 'rr', NULL, 'rue du dev', '56890', 'juinh', 'FR', '0102030565'),
(6, 24, 'ric', 'richard', 'de rocbaron', NULL, 'rue de la traversée', '83000', 'toulon', 'FR', '0405060809'),
(10, 27, 'chemin des roses', 'ric', 'sch', NULL, 'rue de la joie', '83000', 'toulon', 'FR', '0405060708');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'mondial relais', 'Livraison dans votre point relais sous 72h', 595),
(2, 'chronopost', 'livré à la maison en 72h', 995),
(3, 'UPS', 'livraison dans le monde en 1 semaine', 2500);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Art de la table Chic ou Vintage'),
(2, 'Decoration'),
(3, 'Culture Vintage et Occasion');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221225180254', '2022-12-25 19:03:09', 315),
('DoctrineMigrations\\Version20221225181606', '2022-12-25 19:16:19', 156),
('DoctrineMigrations\\Version20221226184233', '2022-12-26 19:42:46', 268),
('DoctrineMigrations\\Version20221226185326', '2022-12-26 19:53:45', 625),
('DoctrineMigrations\\Version20221228161553', '2022-12-28 17:16:07', 432),
('DoctrineMigrations\\Version20221229110020', '2022-12-29 12:00:33', 214),
('DoctrineMigrations\\Version20221229122146', '2022-12-29 13:21:58', 1047),
('DoctrineMigrations\\Version20221231104925', '2022-12-31 11:49:36', 229),
('DoctrineMigrations\\Version20221231141211', '2022-12-31 15:12:22', 337),
('DoctrineMigrations\\Version20221231161342', '2022-12-31 17:14:01', 322);

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `btn_title` varchar(255) NOT NULL,
  `btn_url` varchar(255) NOT NULL,
  `illustration` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext NOT NULL,
  `reference` varchar(255) NOT NULL,
  `stripe_session_id` varchar(255) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `reference`, `stripe_session_id`, `is_paid`) VALUES
(137, 23, '2022-12-31 15:44:05', 'mondial relais', 595, 'richard de rocbaron<br>0102030405<br>rue de la soie<br>83000 toulon<br>FR', '31122022-63b04ab559cea', 'cs_test_b1HC1kLG8S7F1DpFpCkR51J2Agyg7VA33JK72ZnUiqSFEA5V3lO9zqI9bq', 0),
(138, 23, '2022-12-31 15:45:13', 'chronopost', 995, 'richard de rocbaron<br>0102030405<br>rue de la soie<br>83000 toulon<br>FR', '31122022-63b04af9d6e8c', 'cs_test_b1i0keNUggdJ6YsDtt67n0okMwZR8elk5FRK4qXL4B3zUQB2WOh0INjQ1f', 1),
(139, 26, '2022-12-31 16:13:04', 'mondial relais', 595, 'nana toto<br>0458451212<br>12154 rue d d<br>83000 toulon<br>FR', '31122022-63b05180c0eac', 'cs_test_b1sjbPTMZs6bxV0mAQDailpRe7EvCSDA2ZcznqXmFgaUR1LNNDkdHhLVFG', 1),
(140, 23, '2022-12-31 17:24:47', 'mondial relais', 595, 'richard bob<br>0405060708<br>chemin des roses<br>83000 toulon<br>FR', '31122022-63b0624fd82f3', NULL, 0),
(141, 23, '2022-12-31 17:27:21', 'mondial relais', 595, 'richard bob<br>0405060708<br>chemin des roses<br>83000 toulon<br>FR', '31122022-63b062e99e7e9', NULL, 0),
(142, 23, '2022-12-31 17:37:29', 'mondial relais', 595, 'richard bob<br>0405060708<br>chemin des roses<br>83000 toulon<br>FR', '31122022-63b065498f39a', NULL, 0),
(143, 23, '2022-12-31 17:39:04', 'mondial relais', 595, 'jean jacques<br>050506060302<br>23 rue de la santé<br>15000 cantal<br>FR', '31122022-63b065a8db9b1', NULL, 0),
(144, 27, '2023-01-14 14:18:20', 'mondial relais', 595, 'ric sch<br>0405060708<br>rue de la joie<br>83000 toulon<br>FR', '14012023-63c2ab9c6b2e1', 'cs_test_b1SR9ZCPENyCgfCzYoX5Yo4mCgnC2hCWBFJE2MkXub6X3fZdzNSrS5K9Jm', 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(160, 136, 'tasse à café nespresso', 1, 3500, 3500),
(161, 137, 'théière', 1, 4500, 4500),
(162, 138, 'théière', 1, 4500, 4500),
(163, 139, 'gamelle en aluminium', 1, 8500, 8500),
(164, 140, 'tasse à café nespresso', 2, 3500, 7000),
(165, 140, 'gamelle en aluminium', 1, 8500, 8500),
(166, 141, 'tasse à café nespresso', 2, 3500, 7000),
(167, 141, 'gamelle en aluminium', 1, 8500, 8500),
(168, 142, 'tasse à café nespresso', 2, 3500, 7000),
(169, 142, 'gamelle en aluminium', 1, 8500, 8500),
(170, 143, 'tasse à café nespresso', 2, 3500, 7000),
(171, 143, 'gamelle en aluminium', 1, 8500, 8500),
(172, 144, 'tasse à café nespresso', 1, 3500, 3500);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `illustration` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_best` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`, `category_id`, `is_best`) VALUES
(5, 'tasse à café nespresso', 'tasse-a-cafe-nespresso', 'b9d7bc32338929a6bef14b81418fe691955393fe.jpg', 'lot de 6 tasses à café avec tasse vintage', 'lot de 6 tasses à café vintage de 1995 première édition', 3500, 0, 0),
(6, 'gamelle en aluminium', 'gamelle-en-aluminium', '58f8edc21c32fa30816f1244a41c5ff4464a4774.jpg', 'lot de 5 articles en aluminium', 'comprend une gourde, une écuelle, un sot à champagne, un fourre tout et une biche à lait', 8500, 0, 0),
(7, 'verre vintage', 'verre-vintage', '58561e8a8cd9b0d8047fd69e2a97eb0a1de25b96.jpg', 'lot de 6 verres', 'verre à eau en cristal dimensions 12cm de haut et 4cm de diamètre', 3500, 0, 0),
(8, 'tasse à thé de grand-mère', 'tasse-a-the-de-grand-mere', 'dca9f7ac601afda95cddc3e3a71fe2847d317895.jpg', 'produit anglais', 'lot de 6 tasse à thé avec coupelle', 12500, 0, 0),
(9, 'livre de chant grégorien', 'livre-de-chant-gregorien', 'baaf596ad2048214c0b3163fb466189aa12276ac.jpg', 'chant grégorien de 1942', 'livre de 40 chants grégorien , epoque bon état', 6900, 0, 0),
(10, 'lot de livre roman', 'lot-de-livre-roman', 'c7e6b9d826de196bdc986763e2e57b4cadd3a5ed.jpg', 'lot de 40 livres', 'roman de 1990 , vends lot', 2500, 0, 0),
(11, 'pot à plante', 'pot-a-plante', '1b92f9f84f0011e464452b624ebfe34f1b5c30af.jpg', 'en porcelaine et en verre', '2 en porcelaine et 2 en verre', 1500, 0, 0),
(12, 'commode vintage 1960', 'commode-vintage-1960', 'da11b499fc22729e501a6b15f280e2f2e84397fb.jpg', 'dim: 110cm x 50cmx 70cm', 'longueur large, haut, profond\r\ncommode de 1960 en bon état \r\nen acajou', 120000, 0, 0),
(13, 'tot la gamelle', 'tot-la-gamelle', '354f2b00efe0ce873b20eb8022a2433ec6fe3570.jpg', 'lot de livre', 'hbjf,', 6900, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(27, 'madein43@hotmail.fr', '[]', '$2y$13$.RYJqbKpguJWNmTdTBrxiuf/e9INHq.pSDcmkJDyBltELFX5dwAG.', 'richard', 'SCH');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1BFCDF877` (`my_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B9983CE5A76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD CONSTRAINT `FK_B9983CE5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
