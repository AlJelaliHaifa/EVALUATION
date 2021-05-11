-- Q1. Afficher dans l'ordre alphabétique et sur une seule colonne les noms et prénoms des employés qui ont des enfants, présenter d'abord ceux qui en ont le plus.
SELECT CONCAT(emp_lastname,' ', emp_firstname) AS emp_name , emp_children 
FROM employees 
ORDER BY emp_children DESC 
LIMIT 4

-- Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence.
SELECT cus_lastname, cus_firstname, cus_countries_id 
FROM customers 
WHERE cus_countries_id != 'FR'

-- Q3. Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays.
SELECT cus_city, cus_countries_id, cou_name 
FROM customers 
INNER JOIN countries ON cou_id = cus_countries_id 
ORDER BY cus_city ASC
LIMIT 5

-- Q4. Afficher le nom des clients dont les fiches ont été modifiées
SELECT cus_lastname, cus_update_date 
FROM customers 
WHERE cus_update_date IS NOT NULL

-- Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose dont elle se souvienne est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ?
SELECT * 
FROM customers
WHERE cus_city LIKE '%divos%'

-- Q6. Quel est le produit vendu le moins cher ? Afficher le prix, l'id et le nom du produit.
SELECT pro_id,pro_name,pro_price
FROM products
ORDER BY pro_price ASC
LIMIT 1

-- Q7. Lister les produits qui n'ont jamais été vendus
SELECT pro_id , pro_ref, pro_name 
FROM products
WHERE pro_id NOT IN (SELECT ode_pro_id FROM orders_details);

-- Q8. Afficher les produits commandés par Madame Pikatchien.
SELECT pro_id, pro_ref, pro_name, cus_id, ord_id, ode_id
FROM products
LEFT JOIN orders_details ON ode_pro_id = pro_id 
LEFT JOIN orders ON ord_id = ode_ord_id
LEFT JOIN customers ON cus_id = ord_cus_id
WHERE cus_lastname = 'Pikatchien'

--Q9. Afficher le catalogue des produits par catégorie, le nom des produits et de la catégorie doivent être affichés. 
SELECT cat_id, cat_name ,pro_name
FROM categories
INNER JOIN products ON pro_cat_id = cat_id
ORDER BY cat_name ASC

-- Q10. Afficher l'organigramme hiérarchique (nom et prénom et poste des employés) du magasin de Compiègne, classer par ordre alphabétique. Afficher le nom et prénom des employés, éventuellement le poste (si vous y parvenez).
SELECT CONCAT(emp.emp_lastname,'   ', emp.emp_firstname) AS 'Employé', pos_libelle AS 'Poste', CONCAT(emp1.emp_lastname,'   ',emp1.emp_firstname) AS 'Supérieur' 
FROM employees AS emp 
JOIN postson pos_id = emp.emp_pos_id
JOIN employees AS emp1 ON emp1.emp_id = emp1.emp_superior_id
ORDER BY emp.emp_lastname;


--  Fonctions d'agrégation

-- Q11. Quel produit a été vendu avec la remise la plus élevée ? Afficher le montant de la remise, le numéro et le nom du produit, le numéro de commande et de ligne de commande.
SELECT ode_discount, pro_id , pro_name, ord_id , ode_id 
FROM orders
JOIN orders_details ON ode_ord_id = ord_id
JOIN products ON pro_id = ode_pro_id
WHERE ode_discount IN (SELECT max(ode_discount) FROM orders_details)

-- Q12. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada'
SELECT COUNT(*) AS 'Nombre de client Canadiens'
FROM customers
JOIN countries ON cou_id = cus_countries_id
WHERE cou_name = 'Canada';

-- Q13. Afficher le détail des commandes de 2020.
SELECT ode_id, ode_unit_price, ode_discount, ode_quantity, ode_ord_id, ode_pro_id, ord_order_date 
FROM orders
JOIN orders_details ON ode_ord_id = ord_id
WHERE YEAR(ord_order_date) = 2020;

-- Q14. Afficher les coordonnées des fournisseurs pour lesquels des commandes ont été passées.
SELECT DISTINCT(sup_id), sup_name, sup_city, cou_name, sup_address, sup_zipcode, sup_contact, sup_phone, sup_mail
FROM suppliers
JOIN countries ON sup_countries_id = cou_id 
JOIN products ON pro_sup_id = sup_id
JOIN orders_details ON ode_pro_id = pro_id;

-- Q15. Quel est le chiffre d'affaires de 2020 ?
SELECT ROUND(SUM( ode_quantity * (ode_unit_price - ( (ode_unit_price * ode_discount) / 100) ) ),2) 
FROM orders
JOIN orders_details ON ode_ord_id = ord_id
WHERE year(ord_order_date) = 2020;

-- Q16. Quel est le panier moyen ?
SELECT(SUM(((ode_unit_price-(ode_unit_price*ode_discount/100))*ode_quantity)))/count(DISTINCT(ord_id)) AS 'panier moyen'
FROM orders_details
LEFT JOIN orders ON ord_id = ode_ord_id

-- Q17. Lister le total de chaque commande par total décroissant (Afficher numéro de commande, date, total et nom du client).
SELECT ord_id , cus_lastname, ord_order_date, ode_quantity , SUM(ode_quantity * ode_unit_price) AS 'Total de commande'
FROM customers
JOIN orders ON cus_id = ord_cus_id
JOIN orders_details ON ode_ord_id = ord_id
GROUP BY ode_ord_id
ORDER BY SUM(ode_quantity * ode_unit_price) DESC;


-- Les besoins de mise à jour

-- Q19. La version 2020 du produit barb004 s'appelle désormais Camper et, bonne nouvelle, son prix subit une baisse de 10%.
UPDATE products 
SET pro_ref = 'Camper', pro_price = pro_price * 0.9, pro_update_date = NOW()
WHERE  pro_ref = 'barb004';

-- Q20. L'inflation en France en 2019 a été de 1,1%, appliquer cette augmentation à la gamme de parasols.
UPDATE products 
SET pro_price = pro_price * 1.011,  pro_update_date = NOW()
WHERE pro_cat_id = 25 ;

-- Q21. Supprimer les produits non vendus de la catégorie "Tondeuses électriques". Vous devez utiliser une sous-requête sans indiquer de valeurs de clés.
DELETE FROM  products 
WHERE  pro_cat_id  = 
(SELECT  cat_id  FROM  categories  WHERE  cat_name = 'Tondeuses électriques') AND  pro_id  NOT IN (SELECT  ode_pro_id  FROM  orders_details );