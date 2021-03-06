/* RELATORIO GERAL DE TODOS OS CLIENTES */

SELECT C.IDCLIENTE,C.NOME,C.SEXO,C.EMAIL,C.CPF,
		 E.RUA,E.BAIRRO,E.CIDADE,E.ESTADO,
		 T.TIPO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/* ================================== */

/* RELATORIO DE HOMENS */


/* CORREÇÃO DE DADOS CAMPO SEXO */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 12 OR IDCLIENTE = 13
 OR IDCLIENTE = 18 OR IDCLIENTE = 19;
 
 /* OU */
 
SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (12,13,18,19);
  
UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 12 OR IDCLIENTE = 13
 OR IDCLIENTE = 18 OR IDCLIENTE = 19
 OR IDCLIENTE = 6 OR IDCLIENTE = 7 OR IDCLIENTE = 14;

UPDATE CLIENTE
SET SEXO = 'M'
WHERE IDCLIENTE = 16;
 
SELECT C.IDCLIENTE,C.NOME,C.SEXO,C.EMAIL,C.CPF,
       E.RUA,E.BAIRRO,E.CIDADE,E.ESTADO,
       T.TIPO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';

/* ====================================== */

/* RELATORIO DE MULHERES */

SELECT C.IDCLIENTE,C.NOME,C.SEXO,C.EMAIL,C.CPF,
       E.RUA,E.BAIRRO,E.CIDADE,E.ESTADO,
       T.TIPO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';


/* ====================================== */

/* QUANTIDADE DE HOMENS E MULHERES */

SELECT SEXO,COUNT(*) AS QUANTIDADE FROM CLIENTE
GROUP BY SEXO;

/* ====================================== */

/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO 
RIO DE JANEIRO E NÃO TENHAM CELULAR */

SELECT C.IDCLIENTE,C.EMAIL
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' AND E.BAIRRO = 'CENTRO'
AND E.CIDADE = 'RIO DE JANEIRO'
AND E.ESTADO = 'RJ' AND T.TIPO != 'CEL';

/* OBS:ESSE EXERCÍCIO NÃO FOI RESOLVIDO DA MELHOR MANEIRA
AO LONGO DO CURSO VOLTAREI PARA RESOLVE LO USANDO UM
CONCEITO CHAMADO SUB QUERY */

/* ====================================== */

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM NOME,EMAIL, E TELEFONE CELULAR DOS CLIENTES
QUE MORAM NO ESTADO DO RIO DE JANEIRO. VOCÊ TERÁ QUE PASSAR
A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR*/

SELECT C.IDCLIENTE,C.NOME,C.EMAIL,T.NUMERO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CEL' AND E.ESTADO = 'RJ';

/* ====================================== */

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA,O COMERCIAL
SOLICITOU UM RELATÓRIO COM NOME,EMAIL,TELEFONE CELULAR
DAS MULHERES QUE MORAM NO ESTADO DO SÃO PAULO. VOCÊ TERÁ
QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR */ 

SELECT C.IDCLIENTE,C.NOME,C.EMAIL,T.NUMERO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CEL' AND E.ESTADO = 'SP'
AND SEXO = 'F';

/* ====================================== */

/* EXEMPLO DE CRIAÇÃO DE VIEW */

CREATE VIEW V_RELATORIO_FEMININO AS
SELECT C.IDCLIENTE,C.NOME,C.EMAIL,T.NUMERO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CEL' AND E.ESTADO = 'SP'
AND SEXO = 'F';

SELECT * FROM V_RELATORIO_FEMININO;

/* ====================================== */

/* EXEMPLO DE USO IFNULL */

SELECT C.IDCLIENTE,C.NOME,
IFNULL(C.EMAIL,'---------') AS EMAIL,T.NUMERO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CEL';


/* ====================================== */

/* EXEMPLO DE USO ORDERBY */

SELECT C.IDCLIENTE,C.NOME,
IFNULL(C.EMAIL,'---------') AS EMAIL,T.NUMERO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CEL'
ORDER BY 1;/* OU ORDER BY C.IDCLIENTE */


/* ====================================== */





