drop table if exists empregado cascade;
drop table if exists companhia cascade;
drop table if exists trabalha cascade;
drop table if exists gerente cascade;

CREATE TABLE empregado(
    cod_empregado NUMERIC(4) PRIMARY KEY,  
    nome_empregado CHAR(100) NOT NULL,
    rua CHAR(255) NOT NULL,
    cidade CHAR(100) NOT NULL,
    salario FLOAT NOT NULL
);

CREATE TABLE companhia (
    cnpj CHAR(12)PRIMARY KEY NOT NULL,  
    nome_companhia CHAR(100) NOT NULL,
    cidade CHAR(100) NOT NULL
);

CREATE TABLE trabalha (
    cod_empregado NUMERIC(4) PRIMARY KEY NOT NULL,  
    cnpj_cod CHAR(12) NOT NULL,
    CONSTRAINT fk_empregado FOREIGN KEY (cod_empregado)
        REFERENCES empregado(cod_empregado)
        ON DELETE RESTRICT ON UPDATE CASCADE,
 	CONSTRAINT fk_cnpj_cod FOREIGN KEY (cnpj_cod)
        REFERENCES companhia(cnpj)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE gerente (
    cod_empregado NUMERIC(4)PRIMARY KEY NOT NULL,  
    cod_companhia CHAR(12) NOT NULL,
  	CONSTRAINT fk_empregado FOREIGN KEY (cod_empregado)
       	REFERENCES empregado(cod_empregado)
        ON DELETE RESTRICT ON UPDATE CASCADE,
  	CONSTRAINT fk_companhia FOREIGN KEY (cod_companhia)
       	REFERENCES companhia(cnpj)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO empregado (cod_empregado, nome_empregado, rua, cidade, salario)
	VALUES 
		(9493, 'Matheus', 'Rua Generina Vale', 'caicó', 12000),
		(9494, 'Ana', 'Pedro Velho', 'caicó', 1200),
		(9495, 'Maria', 'Renato Dantas', 'caicó', 2500),
		(9496, 'João', 'João Damasceno', 'caicó', 1200)
;

INSERT INTO companhia (cnpj, nome_companhia, cidade)
	VALUES
		('947374837733', 'Soft Sell', 'caicó'),
		('947374837735', 'Soft Sell', 'caicó'),
		('777333222112', 'Other', 'caicó'),
		('777333222111', 'Other', 'caicó')
;

INSERT INTO trabalha (cod_empregado, cnpj_cod)
	VALUES 
		(9493, '947374837733'),
		(9495, '777333222112'),
		(9494, '947374837735'),
		(9496, '777333222111')
;

INSERT INTO gerente (cod_empregado, cod_companhia)
	VALUES 
		(9493, '947374837733'),
		(9495, '777333222112')
;
