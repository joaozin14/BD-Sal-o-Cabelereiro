--CREATE DATABASE cabelereiro

CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nome_completo` varchar(80) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_cliente`)
);

CREATE TABLE `funcionarios` (
  `id_funcionario` int NOT NULL,
  `nome_completo` varchar(80) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `cargo` varchar(20) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_funcionario`)
);

CREATE TABLE `servicos` (
  `id_servicos` int NOT NULL AUTO_INCREMENT,
  `servicos` varchar(50) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_servicos`)
);

CREATE TABLE `horario` (
  `id_cliente` int NOT NULL,
  `horario` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_funcionario` int NOT NULL,
  `id_servicos` int NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  KEY `id_cliente` (`id_cliente`),
  KEY `id_funcionario` (`id_funcionario`),
  KEY `id_servicos` (`id_servicos`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `horario_ibfk_3` FOREIGN KEY (`id_servicos`) REFERENCES `servicos` (`id_servicos`)
);

INSERT INTO clientes (id_cliente, nome_completo, telefone, email)
VALUES (RIGHT('11954537288', 4), 'João Henrique Moraes da Silva', '11954537288', 'joaohms14@gmail.com');

INSERT INTO funcionarios(id_funcionario, nome_completo, email, telefone, cargo, salario)
VALUES
	(RIGHT('11959563266', 4), 'Lucas Pereira Marques', 'luqueta@gmail.com', '11959563266', 'Cabelereiro', '2000.00'),
    (RIGHT('11933256789', 4), 'Nicolas Santos de Almeida', 'Nick45@gmail.com', '11933256789', 'Cabelereiro', '2000.00'),
	(RIGHT('11920203978', 4), 'Gabriel Antônio da Silva', 'gabssil2@gmail.com', '11920203978', 'Cabelereiro', '2000.00'),
	(RIGHT('11978774698', 4), 'Alexandre Lemos Roques', 'alepeixoto@gmail.com', '11978774698', 'Gerente', '3000.00');

INSERT INTO servicos(servicos, preco)
VALUES 
	('Corte', 30.00),
    ('Barba', 20.00),
    ('Corte e Barba', 50.00),
    ('Sombrancelha', 10.00),
    ('Corte, Barba e Sombrancelha', 55.00),
    ('Luzes', 45.00),
    ('Luzes com Corte', 70.00);

INSERT INTO horario(id_cliente, id_funcionario, id_servicoS, preco)
VALUES
	(7288, 3266, 1, 30.00);