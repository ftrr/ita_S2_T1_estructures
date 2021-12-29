INSERT INTO clients (nom,adreça,telefon,email,recomanador_client_id)
VALUES
('Pep','Tramuntana 11',62323323,'pep@gmail.com',null),
('Ana','Gregal 11',62323233,'ana@gmail.com',0),
('Laura','Migjorn 11',62335553,'laura@gmail.com',1);

INSERT INTO ulleres (nom, marca, graduacio_esq, graduacio_dret, montura, montura_color, vidre_color, preu, id_proveidors)
VALUES
('Rayban Aviador','Rayban',0.2,0.3,'fina','negre','negre',120,1),
('Carrera Old School','Carrera',0.5,0.5,'gruixuda','blanca','negre',160,2),
('Arnette Sun','Arnette',0.5,0.5,'gruixuda','rosa','gris',80,3);

INSERT INTO proveidors (nom)
VALUES
('Ulleres Salom'),
('Ulleres Balmes'),
('Vistaoptica'),
('Opticalia');

INSERT INTO empleats (nom)
VALUES
('Miquela'),
('Joan'),
('Laura');

INSERT INTO ulleres_clients (ulleres_id,clients_id,empleats_id, data_venda)
VALUES
(3,3,3,'2020-02-02 01:01:01'),
(3,1,2,'2020-02-02 01:01:01'),
(1,1,2,'2020-02-02 01:01:01'),
(1,1,1,'2021-02-02 01:01:01'),
(2,2,1,'2021-02-02 01:01:01'),
(1,2,1,'2021-02-02 01:01:01');
