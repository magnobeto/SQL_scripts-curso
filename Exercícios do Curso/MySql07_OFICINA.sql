/* EXERCICIO OFICINA */

CREATE DATABASE PROJETO_OFICINA;

CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	CHASSI VARCHAR (30) NOT NULL UNIQUE,
	MODELO VARCHAR (30) NOT NULL,
	ID_MARCA INT
); 

CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	COR VARCHAR (15) UNIQUE NOT NULL
);

CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO_COR(
	ID_CARRO INT,
	ID_COR INT,
	PRIMARY KEY(ID_CARRO,ID_COR)
);

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	ID_CARRO INT UNIQUE
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('CEL','RES','COM') NOT NULL,
	NUMERO VARCHAR (15) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CARRO
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY (ID_MARCA)
REFERENCES MARCA(IDMARCA);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY (ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_TELEFONE_CLIENTE
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_COR
FOREIGN KEY (ID_COR)
REFERENCES COR(IDCOR);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO
FOREIGN KEY (ID_CARRO)
REFERENCES CARRO(IDCARRO);

SELECT CONSTRAINT_NAME,
		 TABLE_NAME,
		 CONSTRAINT_SCHEMA,
		 CONSTRAINT_TYPE FROM TABLE_CONSTRAINTS
		 WHERE CONSTRAINT_SCHEMA = 'PROJETO_OFICINA';
		 
/* INSERIR 10 REGISTROS */

INSERT INTO MARCA VALUES (NULL,'FIAT');
INSERT INTO MARCA VALUES (NULL,'CHEVROLET');
INSERT INTO MARCA VALUES (NULL,'FORD');
INSERT INTO MARCA VALUES (NULL,'VOLKSVAGEN');
INSERT INTO MARCA VALUES (NULL,'HYUNDAI');
INSERT INTO MARCA VALUES (NULL,'CITROEN');
INSERT INTO MARCA VALUES (NULL,'HONDA');
INSERT INTO MARCA VALUES (NULL,'RENAULT');

INSERT INTO COR VALUES (NULL,'PRETO');
INSERT INTO COR VALUES (NULL,'BRANCO');
INSERT INTO COR VALUES (NULL,'VERDE');
INSERT INTO COR VALUES (NULL,'AZUL');
INSERT INTO COR VALUES (NULL,'AMARELO');
INSERT INTO COR VALUES (NULL,'MARROM');

INSERT INTO CARRO VALUES (NULL,'4356','UNO','1');
INSERT INTO CARRO VALUES (NULL,'8567','CELTA','2');
INSERT INTO CARRO VALUES (NULL,'5468','PRISMA','2');
INSERT INTO CARRO VALUES (NULL,'9203','KA','3');
INSERT INTO CARRO VALUES (NULL,'8465','GOL','4');
INSERT INTO CARRO VALUES (NULL,'0912','HB20','5');
INSERT INTO CARRO VALUES (NULL,'8510','C3','6');
INSERT INTO CARRO VALUES (NULL,'0324','FIT','7');
INSERT INTO CARRO VALUES (NULL,'1096','CIVIC','7');
INSERT INTO CARRO VALUES (NULL,'2863','LOGAN','8');

SELECT IDCARRO,CHASSI,MODELO,MARCA FROM CARRO
INNER JOIN MARCA
ON IDMARCA = ID_MARCA
ORDER BY 1;

INSERT INTO CARRO_COR VALUES (1,4);
INSERT INTO CARRO_COR VALUES (2,3);
INSERT INTO CARRO_COR VALUES (3,2);
INSERT INTO CARRO_COR VALUES (4,5);
INSERT INTO CARRO_COR VALUES (5,2);
INSERT INTO CARRO_COR VALUES (6,4);
INSERT INTO CARRO_COR VALUES (7,3);
INSERT INTO CARRO_COR VALUES (11,4);
INSERT INTO CARRO_COR VALUES (9,2);
INSERT INTO CARRO_COR VALUES (10,1);

SELECT IDCARRO,CHASSI,MODELO,MARCA,COR FROM CARRO
INNER JOIN MARCA
ON IDMARCA = ID_MARCA
INNER JOIN CARRO_COR
ON  IDCARRO = ID_CARRO
INNER JOIN COR
ON IDCOR = ID_COR
ORDER BY 1;

ALTER TABLE CLIENTE
ADD SEXO ENUM('M','F') NOT NULL
AFTER NOME;

INSERT INTO CLIENTE VALUES (NULL,'BOB','M',1);
INSERT INTO CLIENTE VALUES (NULL,'MARIA','F',2);
INSERT INTO CLIENTE VALUES (NULL,'CELIA','F',3);
INSERT INTO CLIENTE VALUES (NULL,'BETO','M',4);
INSERT INTO CLIENTE VALUES (NULL,'JOAO','M',5);
INSERT INTO CLIENTE VALUES (NULL,'SILVIA','F',6);
INSERT INTO CLIENTE VALUES (NULL,'ANA','F',7);
INSERT INTO CLIENTE VALUES (NULL,'GIOVANA','F',11);
INSERT INTO CLIENTE VALUES (NULL,'MAGNO','M',9);
INSERT INTO CLIENTE VALUES (NULL,'PEDRO','M',10);

SELECT CA.IDCARRO,CA.CHASSI,CA.MODELO,
		 M.MARCA,
		 C.COR,
		 CL.NOME,
		 CL.SEXO FROM CARRO CA
INNER JOIN MARCA M
ON M.IDMARCA = CA.ID_MARCA
INNER JOIN CARRO_COR CC
ON  CA.IDCARRO = CC.ID_CARRO
INNER JOIN COR C
ON C.IDCOR = CC.ID_COR
INNER JOIN CLIENTE CL
ON CA.IDCARRO = CL.ID_CARRO
ORDER BY 1;

INSERT INTO TELEFONE VALUES (NULL,'CEL','87235672',1);
INSERT INTO TELEFONE VALUES (NULL,'RES','32094456',1);
INSERT INTO TELEFONE VALUES (NULL,'CEL','98382764',2);
INSERT INTO TELEFONE VALUES (NULL,'COM','78653428',2);
INSERT INTO TELEFONE VALUES (NULL,'CEL','68970483',3);
INSERT INTO TELEFONE VALUES (NULL,'RES','12544633',3);
INSERT INTO TELEFONE VALUES (NULL,'COM','56327890',3);
INSERT INTO TELEFONE VALUES (NULL,'CEL','99948234',4);
INSERT INTO TELEFONE VALUES (NULL,'CEL','85567686',5);
INSERT INTO TELEFONE VALUES (NULL,'RES','11112343',6);
INSERT INTO TELEFONE VALUES (NULL,'CEL','77732345',7);
INSERT INTO TELEFONE VALUES (NULL,'CEL','99545234',9);
INSERT INTO TELEFONE VALUES (NULL,'COM','55528394',9);
INSERT INTO TELEFONE VALUES (NULL,'CEL','66645467',10);
INSERT INTO TELEFONE VALUES (NULL,'COM','99882343',10);
INSERT INTO TELEFONE VALUES (NULL,NULL,NULL,8);

ALTER TABLE TELEFONE
MODIFY TIPO ENUM('CEL','COM','RES');

ALTER TABLE TELEFONE
MODIFY NUMERO VARCHAR(15);

SELECT CA.IDCARRO,CA.CHASSI,CA.MODELO,
		 M.MARCA,
		 C.COR,
		 CL.NOME,
		 CL.SEXO,
		 T.TIPO,T.NUMERO FROM CARRO CA
INNER JOIN MARCA M
ON M.IDMARCA = CA.ID_MARCA
INNER JOIN CARRO_COR CC
ON  CA.IDCARRO = CC.ID_CARRO
INNER JOIN COR C
ON C.IDCOR = CC.ID_COR
INNER JOIN CLIENTE CL
ON CA.IDCARRO = CL.ID_CARRO
INNER JOIN TELEFONE T
ON CL.IDCLIENTE = T.ID_CLIENTE
ORDER BY 1;
