SELECT COUNT(clients_id) AS Compres
FROM ulleres_clients
JOIN clients ON clients.id_clients = ulleres_clients.clients_id
WHERE clients.nom='ana';

SELECT ulleres_clients.ulleres_id, ulleres.nom
FROM ulleres_clients
JOIN empleats ON empleats.id_empleat = ulleres_clients.empleats_id
JOIN ulleres ON ulleres.id_ulleres = ulleres_clients.ulleres_id
WHERE empleats.nom = 'Joan' AND  ulleres_clients.data_venda LIKE '%2021%';

SELECT DISTINCT proveidors.nom
FROM proveidors
JOIN ulleres ON ulleres.id_proveidors = proveidors.id_proveidors
JOIN ulleres_clients ON ulleres_clients.ulleres_id = ulleres.id_ulleres
 
;