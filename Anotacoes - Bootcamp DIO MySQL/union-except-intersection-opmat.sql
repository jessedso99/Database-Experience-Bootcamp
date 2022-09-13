-- UNION, INTERSECTION E EXCEPT
		-- OBS: N existe paplavras reservadas INTERSECTION E EXCEPT. Tem q usar subquery
		-- OBS: UNION, INTERSECTION E EXCEPT só podem ser usados entre conjutnos com o mesmo tipo de relação, com a mesmo, relação, 
			-- mesmo estrutura, mesma quantidade de colunas, mesmo tipo de dados.
-- UNION
	-- UNION: União dos elementos dos cojuntos, sem redundancias, apresentando apenas 1 vez cada ocorrencia
	-- UNION ALL: União dos elementos dos conjutnos, COM REDUNDANCIA, apresentando os elementos tantas vezes quantas forem suas ocorrencias.
-- INTERSECT: Intersecção. Mostra os elementos semelhantes entre os conjutos
-- EXCEPT: Complemento. Ex: elementos de A q n existem em B. (São os elemtnos de A, excluidno os elemtnos da intersacção com B)

create database teste;
use teste;
create table R(A char(2));
create table S(A char(2));
	insert into R(A) values('a1'),('a2'),('a2'),('a3');
	insert into S(A) values('a1'),('a1'),('a2'),('a3'),('a4'),('a5');

	-- EXCEPT -> not in
select* from S where A not in (select A from R);
	
    -- UNION
-- NO UNION OS ELEMENTOS RETORNADOS OCORREM APENAS 1 VEZ TBM. N PRECISA USAR O DISTINCT
(select R.A from R) UNION (select S.A from S);
(select DISTINCT R.A from R) UNION (select DISTINCT S.A from S); -- MESA COISA USANDO O DISTINC, PQ UNION MOSTRA SO 1x

	--	DISTINCT
(select R.A from R);
-- AQUI, SE QUISERMOS EXIBIR APENAS 1 OCORRENCIA DE 1 ELEMNTOS DENTRO DO SELECT USAMOS O DISTINCT.
(select DISTINCT R.A from R);

	-- INTERSECT 
-- selecionando elementos presnetes em R e em S
    -- O intersect apresenta redundancias e dependendo de como eh feito o select a intersecção pode ser diferente.
		select S.A from S where S.A in (select R.A from R); 
		select R.A from R where R.A in (select S.A from S);
-- DISTINCT: para evitar, pode-se usar o DISTINCT
select DISTINCT R.A from R where R.A in (select S.A from S);
select DISTINCT S.A from S where S.A in (select R.A from R);
	-- TBM EH POSSIVEL
	select DISTINCT R.A from R where R.A != 'a1';
    select DISTINCT R.A from R where R.A in ('a1', 'a2');