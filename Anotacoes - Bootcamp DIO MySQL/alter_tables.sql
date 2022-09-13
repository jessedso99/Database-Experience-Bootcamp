-- explorando comandos ddl - ALTER TABLE

	-- adicionando um auto increment com primary key
	-- alter table person add column Fila int not null auto_increment primary key;
		-- OBS: quando queremos add dados em um tabela com col. auto incremente, devemos, infelizmente, especuficar as colunas antes de values, 
																									-- e n informao a coluna q eh autoincrement.

select now() as timestamp;
use first_exemple;
select* from person;

			-- OQ PODEMOS FAZER COM O ALTER TABLE? 
		
		-- MODIFY ALTERA O NOME E TIPO DA COLUNA
	-- alter table nome_tabela modify column nome_atributo tipo_dado condicao(where);
		-- ADICIONAR COLUNCA => ("PADRAO")+ ADD COLUMN+ CONDICAO
	-- alter table person add column email varchar(50);
		-- DELETAR COLUNA => ("PADRAO") + DROP COLUMN+ CONDICAO
	-- alter table person DROP column email varchar(50);
		
        -- ADDC CONSTRAINT, MESMO DPS Q A COLUNA FOI CRIADA => ("PADRAO")+ ADD CONSTRAINT+ CONDICAO
	-- alter table person add constraint nome_constraint condicao(where);
	-- 
-- ADICIONANDO UMA COLUNA, SENDO ELA NOT NULL E TENDO UM VALOR DEFAULT PRE DEFINIDO
alter table person add column salario float not null default 1200;
update person set salario = 5000 where person_id = 1; -- alterando apenas um valor.
	-- DELETANDO COLUNAS EM SQL
desc person;
alter table person add column email varchar(50);
alter table person drop column email; -- ou ainda alter table person drop column email;
