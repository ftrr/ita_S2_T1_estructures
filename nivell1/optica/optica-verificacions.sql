SELECT COUNT(client_id) AS Compres
FROM venda
JOIN client ON client.id_client = venda.client_id
WHERE client.nom='ana';

SELECT venda.ullera_id, ullera.nom
FROM venda
JOIN empleat ON empleat.id_empleat = venda.empleat_id
JOIN ullera ON ullera.id_ullera = venda.ullera_id
WHERE empleat.nom = 'Joan' AND  venda.data_venda LIKE '%2021%';

SELECT DISTINCT proveidor.nom
FROM proveidor
JOIN ullera ON ullera.proveidor_id = proveidor.id_proveidor
JOIN venda ON venda.ullera_id = ullera.id_ullera
 
;