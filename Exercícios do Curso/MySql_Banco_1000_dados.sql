/* Traga os funcionarios que trabalhem no departamento
de filmes OU no departamento de roupas */

select count(*) from funcionarios;

select * from funcionarios
where departamento = 'roupas' or departamento = 'filmes';

select departamento, count(*)
from funcionarios
group by departamento
order by 1; /* bizu para melhor melhor performance */

/* O gestor de marketing pediu a lista das funcionarias que
trabalhem no departamento de filmes ou no departamento lar. 
Ele necessita enviar um email para as colaboradoras
desses dois setores. */

select nome,departamento,email
from funcionarios
where departamento = 'lar' or departamento = 'filmes';

/* Traga os funcionarios do sexo masculino
ou os funcionarios que trabalhem no setor jardim */

select * from funcionarios
where sexo = 'Masculino' or departamento = 'jardim';

select sexo, count(*)
from funcionarios
group by sexo; /* bizu para melhor melhor performance */





