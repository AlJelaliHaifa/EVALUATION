DROP DATABASE IF EXISTS GESTCOM;

CREATE DATABASE GESTCOM;

USE GESTCOM;

CREATE TABLE shop (
   -- INT defini un entier et auto_incriment signifie qu'un nombre unique sera généré automatiquement lors d'un nouvel enregistrement dans la table
sho_id INT(11) NOT NULL AUTO_INCREMENT,
-- varchar(40) signifi que la taille des caractère(char) peu varier/est variable (var) jusqu'a 40
sho_name VARCHAR(40)NOT NULL,
-- primary key est une clé primaire qui permet d'identifier ce qu'on va entrer dans la table et a une valeur unique et ne peut pas être null
PRIMARY KEY (sho_id)
-- innodb est un moteur de stockage engine=innodb est l'instruction qui converti le moteur de stockage myisam en innodb
-- default charset=utf8 est l'instruction qui me permet d'utiliser le codage de caractère informatique utf8 qui est universel 
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE posts (
pos_id INT(11) NOT NULL AUTO_INCREMENT,
pos_name VARCHAR(40) NOT NULL,
PRIMARY KEY (pos_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE departements (
dep_id INT(11) NOT NULL AUTO_INCREMENT,
dep_name VARCHAR(40)NOT NULL,
PRIMARY KEY (dep_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE suppliers (
   -- clé de la table suppliers(fournisseurs)
sup_id INT(11) NOT NULL AUTO_INCREMENT,
-- nom du fournisseur
sup_name VARCHAR(40) NOT NULL,
-- contact avec le fournisseur
sup_contact VARCHAR(40) NOT NULL,
PRIMARY KEY (sup_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE categories (
cat_id INT(11) NOT NULL AUTO_INCREMENT,
cat_name VARCHAR(40) NOT NULL,
cat_sub_cat INT(11) NOT NULL,
PRIMARY KEY (cat_id),
-- ici le Foreign key  fait allusion une clé etrangère qui a pour reference cat_id mais son nom change dans cette table
FOREIGN KEY (cat_sub_cat) REFERENCES categories(cat_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE customers (
cus_id INT(11) NOT NULL AUTO_INCREMENT,
cus_fisrtname VARCHAR(40) NOT NULL,
cus_lastname VARCHAR(40) NOT NULL,
cus_phone VARCHAR(40) NOT NULL,
cus_mail VARCHAR(40) NOT NULL,
cus_adress VARCHAR(40) NOT NULL,
cus_city VARCHAR(40) NOT NULL,
cus_zipcode VARCHAR(40) NOT NULL,
cus_password VARCHAR(40) NOT NULL,
cus_add DATE,
cus_update DATETIME,
PRIMARY KEY (cus_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE orders (
ord_id INT(11) NOT NULL AUTO_INCREMENT,
ord_cus_id INT(11) NOT NULL,
ord_add DATE,
ord_update DATETIME,
ord_payments DATETIME,
ord_deliveries DATETIME,
PRIMARY KEY (ord_id),
FOREIGN KEY (ord_cus_id) REFERENCES customers (cus_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE products (
   pro_id INT(11) NOT NULL AUTO_INCREMENT,
   pro_label VARCHAR(40),
   -- varchar(15) signifi que la taille des caractère(char) peu varier/est variable (var) jusqu'a 15
   pro_picture VARCHAR(15),
   -- varchar(40) signifi que la taille des caractère(char) peu varier/est variable (var) jusqu'a 40
   pro_colour VARCHAR(40),
   pro_description VARCHAR(40),
   pro_reference VARCHAR(40),
   -- Decimal (15,2) signifi que c'est un nombre décimal qui peu avoir jusqu'à 15 chiffres avant la virgule et 2 après
   pro_price DECIMAL(15,2) DEFAULT 0.00,
   -- INT (11) NOT NULL signifi que c'est un entier qui ne peut pas être 0 et qui peut aller jusqu'à 11 chiffres
   pro_bar_code INT (11) NOT NULL,
   pro_stock_alert INT (11) NOT NULL,
   pro_current_stock INT (11) NOT NULL,
   -- DATE affiche la date en format AAAA/MM/JJ
   pro_add DATE,
   -- DATETIME affiche la date en format AAAA/MM/JJ HH:MM:SS
   pro_update DATETIME,
   -- BIT(1) BIT n'accepte que la valeur 1 ou 0 donc ici ca me renverra vrai si c'est un 1 et faux si c'est 0
   pro_blocked BIT(1),
   sho_id INT (11) NOT NULL,
   sup_id INT (11) NOT NULL,
   cat_id INT (11) NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY (sho_id) REFERENCES shop (sho_id),
   FOREIGN KEY (sup_id) REFERENCES suppliers (sup_id),
   FOREIGN KEY (cat_id) REFERENCES categories (cat_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE employees (
   emp_id INT(11) NOT NULL AUTO_INCREMENT,
   emp_firstname VARCHAR(40) NOT NULL,
   emp_lastname VARCHAR(40) NOT NULL,
   emp_superior VARCHAR(40) NOT NULL,
   emp_gender VARCHAR(40) NOT NULL,
   emp_years_service DATE,
   -- Decimal (8,2) signifi que c'est un nombre décimal qui peu avoir jusqu'à 8 chiffres avant la virgule et 2 après
   emp_gross_salary DECIMAL(8,2) DEFAULT 0.00,
   emp_children (11) NOT NULL,
   emp_sup_id (11) NOT NULL,
   emp_pos_id (11) NOT NULL,
   emp_dep_id (11) NOT NULL,
   emp_sho_id (11) NOT NULL,
   PRIMARY KEY(emp_id),
   FOREIGN KEY(emp_sup_id) REFERENCES employees (emp_id),
   FOREIGN KEY(emp_pos_id) REFERENCES posts (pos_id),
   FOREIGN KEY(emp_dep_id) REFERENCES departements (dep_id),
   FOREIGN KEY(emp_sho_id) REFERENCES shop (sho_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE order_details (
   pro_id INT (11) NOT NULL,
   ord_id INT (11) NOT NULL,
   discount DECIMAL(15,2) DEFAULT 0.00,
   unitPrice DECIMAL(15,2) DEFAULT 0.00,
   quantity smallint(2) DEFAULT 0,
   PRIMARY KEY(pro_id, ord_id),
   FOREIGN KEY (pro_id) REFERENCES products(pro_id),
   FOREIGN KEY (ord_id) REFERENCES orders(ord_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;



