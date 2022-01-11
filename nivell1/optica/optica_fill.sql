INSERT INTO proveidor (nom)
VALUES
('Ulleres Salom'),
('Ulleres Balmes'),
('Vistaoptica'),
('Opticalia');

INSERT INTO client (nom,adreça,telefon,email)
VALUES
('Pep','Tramuntana 11',62323323,'pep@gmail.com'),
('Ana','Gregal 11',62323233,'ana@gmail.com'),
('Laura','Migjorn 11',62335553,'laura@gmail.com');

INSERT INTO ullera (nom, marca, graduacio_esq, graduacio_dret, montura, montura_color, vidre_color, preu, proveidor_id)
VALUES
('Rayban Aviador','Rayban',0.2,0.3,'flotant','negre','negre',120,1),
('Carrera Old School','Carrera',0.5,0.5,'pasta','blanca','negre',160,2),
('Arnette Sun','Arnette',0.5,0.5,'pasta','rosa','gris',80,3);



INSERT INTO empleat (nom)
VALUES
('Miquela'),
('Joan'),
('Laura');

INSERT INTO venda (client_id,ullera_id,empleat_id, data_venda)
VALUES
(3,3,3,'2020-02-02 01:01:01'),
(3,1,2,'2020-02-02 01:01:01'),
(1,1,2,'2020-02-02 01:01:01'),
(1,1,1,'2021-02-02 01:01:01'),
(2,2,1,'2021-02-02 01:01:01'),
(1,2,1,'2021-02-02 01:01:01');
