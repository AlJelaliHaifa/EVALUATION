-- Création de rôles 

-- rôle des tables catégories / products
CREATE ROLE 'r_afpa_gescom_admins'@'%';
-- rôle des tables orders / orders_details / customers
CREATE ROLE 'r_afpa_gescom_guess'@'%';



-- Attribution des privilèges aux roles

-- privilèges ajouter, modifier et supprimer à la table catégories
GRANT select, insert, delete, update 
ON afpa_gescom.categories 
TO 'r_afpa_gescom_admins'@'%';

-- privilèges ajouter, modifier et supprimer de la table products
GRANT select, insert, delete, update 
ON afpa_gescom.products 
TO 'r_afpa_gescom_admins'@'%';

-- privilège d'affichage de la table customers
GRANT select
ON afpa_gescom.customers 
TO 'r_afpa_gescom_guess'@'%';

-- privilèges d'affichage de la table orders
GRANT select
ON afpa_gescom.orders 
TO 'r_afpa_gescom_guess'@'%';

-- privilèges d'affichage de la table orders_details
GRANT select
ON afpa_gescom.orders_details
TO 'r_afpa_gescom_guess'@'%';


-- Création de cinq utilisateur 
CREATE USER 'mark1'@'%' IDENTIFIED BY '0123';
CREATE USER 'mark2'@'%' IDENTIFIED BY '1234';
CREATE USER 'mark3'@'%' IDENTIFIED BY '2345';
CREATE USER 'mark4'@'%' IDENTIFIED BY '3456';
CREATE USER 'mark5'@'%' IDENTIFIED BY '4567';


-- Affectation des rôles aux membres du groupe marketing 

GRANT 'r_afpa_gescom_admins'@'%'
TO 'mark1'@'%', 'mark2'@'%','mark3'@'%','mark4'@'%','mark5'@'%';

GRANT 'r_afpa_gescom_guess'@'%'
TO 'mark1'@'%', 'mark2'@'%','mark3'@'%','mark4'@'%','mark5'@'%';   


