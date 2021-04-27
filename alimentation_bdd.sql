-- Exercice 2 
-- Afin de respecter les contraintes de clés étrangères il faut remplir la base de données en commencant par les table n'ayant pas de clés étrangères car pour inserer une table contenant une clé étrangère il faut que celle-ci existe.
-- -------------------------------------------------------------------
-- Exercice 5
-- Créez les scripts d'alimentation des autres tables. Les valeurs devront bien sûr respecter les problématiques d'intégrité référentielle.

-- table du document gescom
-- Structure de la table `posts`

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `pos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pos_libelle` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- éléments à inserer dans la table post (pour l'exercice 5)

INSERT INTO posts (pos_id, pos_libelle) VALUES
(1,'Directeur/trice'),
(2,'Comptable'),
(3,'Auditeur'),
(4,'Commissaire aux comptes'),
(5,'Directeur/trice des RH'),
(6,'Chargé(e) de recrutement'),
(7,'Chargé(e) de RH'),
(8,'Consultant(e) en recrutement'),
(9,'Assistant(e) RH'),
(10,'Responsable marketing'),
(11,'Administrateur des ventes'),
(12,'Commercial'),
(13,'Chargé de communication'),
(14,'Responsable informatique'),
(15,'Manageur'),
(16,'Vendeur/deuse');

-- -------------------------------------------------------------------

-- table du document gescom
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `cat_parent_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_parent_id` (`cat_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- éléments à inserer dans la table categories (pour l'exercice 5)

INSERT INTO categories (cat_id, cat_name, cat_parent_id) VALUES
(1, 'echelle', ),
(2, 'scie', ),
(3, 'scie d élegage', 2),
(4, 'cisaille', ),
(5, 'cisaille à gazon', 4),
(6, 'cisaille à haie', 4),
(7, 'butteur', );

-- -------------------------------------------------------------------

--
-- Structure de la table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `cou_id` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cou_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE KEY `alpha2` (`cou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------


-- table du document gescom
-- Structure de la table `customers`

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `cus_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_address` varchar(150) NOT NULL,
  `cus_zipcode` varchar(5) NOT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_countries_id` char(2) NOT NULL,
  `cus_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cus_phone` int(10) UNSIGNED NOT NULL,
  `cus_password` varchar(60) NOT NULL,
  `cus_add_date` datetime NOT NULL,
  `cus_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cus_id`),
  KEY `ibfk_customers_countries` (`cus_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- éléments à inserer dans la table customers (pour l'exercice 5)

INSERT INTO customers (cus_id, cus_lastname, cus_firstname, cus_address, cus_zipcode, cus_city, cus_countries_id, cus_mail, cus_phone, cus_password, cus_add_date, cus_update_date) VALUES
(1,'Al Jelali','Souleimane','Dar el Kebdani','62202','Nador','MA','souleiii8z@gmail.com','0600154512','Nesmohlei222915','21/10/2020',''),
(2, 'Louis', 'Olivier-Jahid', 'C Square Henri Matisse', '80080', 'Amiens', 'FR', 'oli.jahid@msn.com', '0722761740', 'Nesrine221216', '20/05/2020', ''),
(3, 'Hamid Barkai', 'Senoussi', '35 rue de Bololo', '99344', 'Ndjamena', 'TD', 'barkai.s@yahoo.fr', '0756578990', 'tchad00235', '10/01/2021', '11/01/2021'),
(4, 'Abdallah', 'Kader', 'Cranleigh Abu Dhabi', '99247', 'Abu Dhabi', 'AE', 'kaabdallah@gmail.ae', '0124970000', 'Ninss1212', '25/12/2020', ''),
(5, 'Areekkan', 'Shahid', 'Areekkan House Kuttoor north po', '676305', 'Malappuram', 'IN', 'mohammedshahid@gmail.in', '9895848282', 'Shadhin100421', '20/04/2021', '');



-- -------------------------------------------------------------------

-- table du document gescom
-- Structure de la table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_superior_id` int(10) UNSIGNED DEFAULT NULL,
  `emp_pos_id` int(10) UNSIGNED NOT NULL,
  `emp_lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_zipcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_phone` int(10) UNSIGNED NOT NULL,
  `emp_salary` int(10) UNSIGNED DEFAULT NULL,
  `emp_enter_date` date NOT NULL,
  `emp_gender` char(1) NOT NULL,
  `emp_children` tinyint(2) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emp_superior_id` (`emp_superior_id`),
  KEY `emp_pos_id` (`emp_pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- éléments à inserer dans la table employees (pour l'exercice 5)

INSERT INTO employees (emp_id, emp_superior_id, emp_pos_id, emp_lastname, emp_firstname, emp_address, emp_zipcode, emp_city, emp_mail, emp_phone, emp_salary, emp_enter_date, emp_gender, emp_children) VALUES
(1, , 1, 'Jonas', 'Julien', '15 rue Adeoda Lefebvre', '80080', 'Amiens', 'jonas.julien@jarditou.com', '0722761740', '5290.00', '01/01/1980', 'M', 5),
(2, 1, 2, 'Spellman', 'Sabrina', ' 133 Collins Road', '53132', 'Greendale', 'sabspellman@witch.us', '0777477456', '2700.00', '31/10/2019', 'F', 0),
(3, 1, 3, 'Bull', 'Jason', '101 Independence Avenue', '20559', 'Washington, D.C.', 'jason.b@loc.gov', '7108220185', '2110.00', '19/05/2018', 'M', 1),
(4, 1, 5, 'Geum', 'Jan Di', 'Biryu-Daero 762beon-Gil', '23050', 'Incheon', 'geumgeum.jan@oopa.co', '0148244006', '2650.00', '31/03/2019', 'F', 2),
(5, 4, 6, 'Gu', 'Jun Pyo', 'Biryu-Daero 762beon-Gil', '23050', 'Incheon', 'junpyo.jandi@sarang.co', '0148244010', '2105.98', '05/01/2019', 'M', 2);

-- -------------------------------------------------------------------

-- table du document gescom
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ord_order_date` date NOT NULL,
  `ord_payment_date` date DEFAULT NULL,
  `ord_ship_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25) NOT NULL,
  `ord_cus_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `ord_cus_id` (`ord_cus_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- éléments à inserer dans la table orders (pour l'exercice 5)

INSERT INTO orders (ord_id, ord_order_date, ord_payment_date, ord_ship_date, ord_reception_date, ord_status, ord_cus_id) VALUES
(1, '21/10/2020', '21/10/2020', '01/11/2020', '28/10/2020', 'Commande urgente', 1),
(2, '20/05/2020', '20/05/2020', '10/06/2020', '30/05/2020', NULL, 2),
(3, '10/01/2021', '10/01/2021', '31/01/2021', '21/01/2021', NULL, 3)?
(4, '25/12/2020', '25/12/2020', '05/01/2021', '31/12/2020', 'Commande urgente', 4),
(5, '20/04/2021', '20/04/2021', '30/04/2021', NULL, 'Commande annulée', 5);

-- -------------------------------------------------------------------

--
-- Structure de la table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
CREATE TABLE IF NOT EXISTS `orders_details` (
  `ode_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ode_unit_price` decimal(7,2) NOT NULL,
  `ode_discount` decimal(4,2) DEFAULT NULL,
  `ode_quantity` int(5) NOT NULL,
  `ode_ord_id` int(10) UNSIGNED NOT NULL,
  `ode_pro_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ode_id`),
  KEY `ode_ord_id` (`ode_ord_id`) USING BTREE,
  KEY `ode_pro_id` (`ode_pro_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_cat_id` int(10) UNSIGNED NOT NULL,
  `pro_price` decimal(7,2) NOT NULL,
  `pro_ref` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_ean` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pro_stock` int(5) UNSIGNED NOT NULL,
  `pro_stock_alert` int(5) UNSIGNED NOT NULL,
  `pro_color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_publish` tinyint(1) NOT NULL,
  `pro_sup_id` int(10) UNSIGNED NOT NULL,
  `pro_add_date` datetime NOT NULL,
  `pro_update_date` datetime DEFAULT NULL,
  `pro_picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `pro_sup_id` (`pro_sup_id`) USING BTREE,
  KEY `pro_cat_id` (`pro_cat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- table du document gescom
-- Structure de la table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_countries_id` char(2) NOT NULL,
  `sup_address` varchar(150) NOT NULL,
  `sup_zipcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_contact` varchar(100) NOT NULL,
  `sup_phone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_mail` varchar(75) NOT NULL,
  PRIMARY KEY (`sup_id`),
  KEY `sup_countries_id` (`sup_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- éléments à inserer dans la table suppliers (pour l'exercice 5)

INSERT INTO suppliers (sup_id, sup_name, sup_city, sup_countries_id, sup_address, sup_zipcode, sup_contact, sup_phone, sup_mail) VALUES
(1, 'Fourlyon', 'Lyon', 'FR', '15 rue du Dr Albéric Pont', '69000', 'Hans Grimm', '061234567890', 'hans.g@gmail.com'),
(2, 'Hashirama', 'Osaka', 'JP', 'Hokko Dori', '540-8570', 'Tobirama Senju', '071234567890','tobirama.s@naruto.uz'),
(3, 'Eurolanka', 'Kandy', 'LK', 'Anniewatta Circular Rd', '20000', 'Sachin Thilini', '5622334455', 'sachin.t@srlk.lk'),
(4, 'Sinaloa', 'Mexico', 'MX', 'Av Fransisco Sosa', '77800', 'Joaquim Guzman', '0122334455', 'guzman.j@sinaloa.mx'),
(5, 'Apollonbergen', 'Bergen', 'NO', '1 Rosenbergsgaten', '5020', 'Tatianna Osteroy', '081234567890', 'tatianna.osteroy@gmail.no'),
(6, 'Dobardan', 'Kiev', 'UA', ' 5 Tsentralna', '01000', 'Micky Draskovitch', '051234567890', 'm.draskovitch');

-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`cat_parent_id`) REFERENCES `categories` (`cat_id`);

--
-- Contraintes pour la table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `ibfk_customers_countries` FOREIGN KEY (`cus_countries_id`) REFERENCES `countries` (`cou_id`);

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`emp_superior_id`) REFERENCES `employees` (`emp_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`emp_pos_id`) REFERENCES `posts` (`pos_id`),
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`emp_pos_id`) REFERENCES `posts` (`pos_id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ord_cus_id`) REFERENCES `customers` (`cus_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ord_cus_id`) REFERENCES `customers` (`cus_id`);

--
-- Contraintes pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`sup_countries_id`) REFERENCES `countries` (`cou_id`);
COMMIT;