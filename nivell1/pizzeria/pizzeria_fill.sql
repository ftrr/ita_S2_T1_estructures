INSERT INTO provincies (nom)
VALUES
('Barcelona'),
('Girona'),
('Lleida'),
('Tarragona');


INSERT INTO localitats (nom,provincia_id)
VALUES
('Sant Cugat',1),
('Hospitalet',1),
('Salt',2),
('Girona',2),
('Lleida',3),
('Mollerussa',3),
('Tarragona',4),
('Reus',4);


INSERT INTO botigues (cp,localitat_id)
VALUES
('08023',1),
('08025',1),
('09023',2),
('09024',2),
('10023',3),
('10026',3),
('20023',4),
('20025',4);


INSERT INTO empleats (nom,botiga_id,tipus_empleat)
VALUES
('Joan',1,'repartidor'),
('Miquel',1,'cuiner'),
('Joana',2,'repartidor'),
('Miquela',2,'cuiner'),
('Beatriu',3,'repartidor'),
('Pep',3,'cuiner'),
('Lluisa',4,'repartidor'),
('Josefa',4,'cuiner');

INSERT INTO clients (nom,localitat_id)
VALUES
('Albert',1),
('Roger',1),
('Laia',2),
('Adela',2),
('Mireia',3),
('David',3),
('Lluís',4),
('Miqui',4);

INSERT INTO comandes (preu,tipus_comanda,client_id, botiga_id,empleat_id)
VALUES
(23,'domicili',1,1,1),
(53,'botiga',2,2,2),
(23,'domicili',1,3,3),
(33,'botiga',3,4,1),
(13,'botiga',2,5,5),
(13,'domicili',1,6,6);

SELECT * FROM pizzeria.productes;

INSERT INTO productes (nom,tipus_producte)
VALUES
('Coca Cola', 'beguda'),
('Fanta', 'beguda'),
('Pepsi', 'beguda'),
('Sprite', 'beguda'),
('Completa', 'hamburguesa'),
('Clásica', 'hamburguesa'),
('Especial', 'hamburguesa'),
('Capricciosa', 'pizza'),
('4estaciones', 'pizza'),
('Margarita', 'pizza');

INSERT INTO comanda_te_producte (comanda_id, producte_id,quantitat)
VALUES
(1,1,2),
(1,3,2),
(1,6,2),
(1,10,1),
(2,2,2),
(2,5,1),
(2,4,1),
(2,9,1),
(3,4,1),
(3,6,1),
(3,8,1),
(3,2,1),
(4,3,1),
(4,2,1),
(4,1,1),
(4,8,1);

