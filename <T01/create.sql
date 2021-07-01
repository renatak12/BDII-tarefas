drop table if exists empregado cascade;
drop table if exists companhia cascade;
drop table if exists trabalha cascade;
drop table if exists gerente cascade;

CREATE TABLE empregado(
	cod_empregado CHAR(4) NOT NULL, 
	nome_empregado VARCHAR(100) NOT NULL, 
	rua VARCHAR(255) DEFAULT NULL, 
	cidade VARCHAR(50) DEFAULT NULL, 
	salario FLOAT NOT NULL,
	PRIMARY KEY (cod_empregado)
);

CREATE TABLE companhia(
	cod_companhia CHAR(4) NOT NULL ,
	cnpj CHAR(12) NOT NULL, 
	nome_companhia VARCHAR(100) DEFAULT NULL, 
	cidade VARCHAR(50) DEFAULT NULL,
	PRIMARY KEY (cod_companhia),
	UNIQUE (cnpj)
);


CREATE TABLE trabalha(
	cod_empregado CHAR(4) NOT NULL, 
	cod_companhia CHAR(4) NOT NULL ,
	PRIMARY KEY (cod_empregado, cod_companhia),
	FOREIGN KEY (cod_empregado) REFERENCES empregado(cod_empregado),
	FOREIGN KEY (cod_companhia) REFERENCES companhia(cod_companhia)
);

CREATE TABLE gerente(
	cod_empregado CHAR(4) NOT NULL, 
	cod_companhia CHAR(4) NOT NULL,
	PRIMARY KEY (cod_empregado, cod_companhia),
	FOREIGN KEY (cod_empregado) REFERENCES empregado(cod_empregado),
	FOREIGN KEY (cod_companhia) REFERENCES companhia(cod_companhia)
);

INSERT INTO companhia(
	cod_companhia, cnpj, nome_companhia, cidade)
	VALUES
	(1,456845455560, 'prime','Caico'),
	(2,947374837735, 'Soft Sell', 'Caico'),
	(3,987444343431, 'Other', 'Natal'),
    	(4,777333222111, 'Other2', 'Natal');
	
INSERT INTO empregado(
	cod_empregado, nome_empregado, rua, cidade, salario) 
	VALUES
	(1,'Matheus', 'Rua Generina Vale', 'Caico', 12000),
	(2,'Ana','Pedro Velho', 'Natal', 1200),
	(3,'Maria', 'Rua Generina Vale', 'Caico', 2500),
	(4,'João', 'João Damasceno', 'Caico', 1200);

INSERT INTO trabalha
	(cod_empregado, cod_companhia)
	VALUES
	(1,2),
    	(2,1),
    	(3,2),
    	(4,2);

INSERT INTO gerente(
	cod_empregado, cod_companhia)
	VALUES
	(1,2),
    	(2,1);
