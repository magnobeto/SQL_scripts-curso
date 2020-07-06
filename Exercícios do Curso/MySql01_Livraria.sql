CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS(
	nomeDoLivro VARCHAR(30),
	nomeDoAutor VARCHAR(30),
	sexoDoAutor CHAR(1),
	numeroDePaginas VARCHAR(4),
	nomeDaEditora VARCHAR(30),
	valorDoLivro FLOAT(7,2),
	estadoUFDaEditora CHAR(2),
	anoDePublicacao CHAR(4)
);

INSERT INTO LIVROS VALUES('Cavaleiro Real','Ana Claudia','F','465','Atlas',49.9,'RJ','2009'),
						('SQL para leigos','João Nunes','M','450','Addison',98,'SP','2018'),
						('Receitas Caseiras','Celia Tavares','F','210','Atlas',45,'RJ','2008'),
						('Pessoas Efetivas','Eduardo Santos','M','390','Beta',78.99,'RJ',2018),
						('Habitos Saudáveis','Eduardo Santos','M','630','Beta',150.98,'RJ','2019'),
						('A Casa Marrom','Hermes Macedo','M','250','Bubba',60,'MG',2016),
						('Estacio Querido','Geraldo Francisco','M','310','Insignia',100,'ES','2015'),
						('Pra sempre amigas','Leda Silva','F','510','Insignia',78.98,'ES','2011'),
						('Copas Inesqueciveis','Marco Alcantara','M','200','Larson',130.98,'RS','2018'),
						('O poder da mente','Clara Mafra','F','120','Continental',56.58,'SP','2017');

/* QUERY 1 */

select * from LIVROS;

/* QUERY 2 */

select nomeDoLivro,nomeDaEditora from LIVROS;

/* QUERY 3 */

select nomeDoLivro,estadoUFDaEditora from LIVROS
where sexoDoAutor = 'M';

/* QUERY 4 */

select nomeDoLivro,numeroDePaginas from LIVROS
where sexoDoAutor = 'F';

/* QUERY 5 */

select valorDoLivro from LIVROS
where estadoUFDaEditora = 'SP';

/* QUERY 6 */

select nomeDoAutor,nomeDoLivro,sexoDoAutor,numeroDePaginas,nomeDaEditora,valorDoLivro,anoDePublicacao from LIVROS
where sexoDoAutor ='M' AND (estadoUFDaEditora = 'SP' OR estadoUFDaEditora = 'RJ');
