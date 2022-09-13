create database revisao;
use revisao;
create table rotUsados (ID int auto_increment primary key);

-- INSERT E ALTER (ADD COLUMNS, DROP COLUMNS, ETC)
insert into rotUsados (Modelo, Ano) values ("Corsa", "2004"), ("Sandero", "2014"), ("Monza", "1996");
insert into rotUsados (Modelo) values ("Kadett");

-- USANDO O LIKE, WHERE E BETWEEN (ao inves de usar and)
select* from rotUsados where ano between 2000 and 2021 and id between 2 and 4; -- podemos add mais de um filtro e between
select* from rotUsados where ano>2000 or ano<=1993;
select* from rotUsados where Modelo not like "%de%";
select* from rotusados where modelo like "__n%";

-- UPDATE (PARA ALTERAR O VALOR DE UMA CELULA)
update rotUsados set Ano=1993 where ID=1;
alter table rotUsados drop column teste;
alter table rotUsados add column Modelo varchar(255);
alter table rotUsados add column Ano Int;
insert into rotUsados (Modelo) values("teste");
delete from rotUsados where id = 5;




-- zueraaa
alter table rotUsados add column valorBase decimal(6,2);
update rotUsados set Ano = '2099' where id=6 and Modelo = 'teste2';
update rotUsados set valorbase = valorbase*50;

select valorBase, id from rotUsados where ano between 1900 and 2010;
-- zueraaa
create table testew(jesse int);
insert into testew (jesse) values (10);
update rotUsados set valorBase = (select valorBase from testew where jesse = 10) where id = 2;

update rotusados set valorbase  = valorbase*1.1, id = 50 where id = 2;
-- delete from testew; apaga tudooow
insert into rotUsados (modelo, valorbase) value (null, 5000);
insert into rotUsados (modelo, valorbase) value (default, 6000);

delete from rotusados where modelo is null and ano is null;

use curso;
select*from senso;

select estado, cod_uf, nome_mun, sum(populacao) from senso where cod_uf between 16 and 29 group by estado, nome_mun order by estado asc;
select populacao from senso where nome_mun="Água Branca" and cod_uf=27;
desc senso;



desc rotUsados;
select* from rotUsados;
