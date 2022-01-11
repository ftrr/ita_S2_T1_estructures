SELECT COUNT(productes.nom) AS 'Begudes Venudes', localitats.nom AS 'Localitat' FROM productes

JOIN comanda_te_producte
ON comanda_te_producte.producte_id = productes.id_productes

JOIN comandes
ON comandes.id_comandes = comanda_te_producte.comanda_id

JOIN botigues
ON botigues.id_botiga = comandes.botiga_id

JOIN localitats
ON localitats.id_localitats = botigues.localitat_id

WHERE productes.tipus_producte = 'beguda'
AND localitats.nom = 'Sant Cugat';


SELECT COUNT(comandes.id_comandes) AS 'Nº comandes', empleats.nom AS 'Empleat' FROM comandes
RIGHT JOIN empleats 
ON empleats.id_empleat  = comandes.empleat_id
GROUP BY empleats.nom;
