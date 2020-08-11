CREATE TABLE QUESTOES(

	IDQUESTAO INT PRIMARY KEY AUTO_INCREMENT,
	SEGMENTO VARCHAR(30),
	ANO VARCHAR(30),
	MATERIA VARCHAR(30) NOT NULL,
	ASSUNTO VARCHAR(100) NOT NULL,
	TOPICO_DO_ASSUNTO VARCHAR(100) NOT NULL,
	SUBTOPICO VARCHAR(100) NOT NULL,
	TIPO_DO_CONCURSO VARCHAR(100) NOT NULL,
	CAMINHO VARCHAR(300)
);

INSERT INTO QUESTOES VALUES(NULL,"Ensino Médio","Primeiro Ano",
"Física","Cinemática","Vetores","Regra do Paralelogramo","ENEM",
"C:\Users\Roberto Magno\Documents\PROGRAMAS EM DEVC\dicionario.txt");

INSERT INTO QUESTOES VALUES(NULL,"Ensino Médio","Primeiro Ano",
"Física","Cinemática","Vetores","Subtração de Vetores","ENEM",
"C:\Users\Roberto Magno\Documents\PROGRAMAS EM DEVC\dicionario.txt");

INSERT INTO QUESTOES VALUES(NULL,"Ensino Médio","Primeiro Ano",
"Física","Cinemática","Vetores","Adição de Vetores","ENEM",
"C:\Users\Roberto Magno\Documents\PROGRAMAS EM DEVC\dicionario.txt");