create database if not exists first_exemple; /*cria se n existir...*/
use first_exemple;
show tables;
create table person(
	person_id smallint unsigned,
    /*podedia criar o primary key aqui, mas e se quisermos deletar essa pk dps? Então... ultima linha*/
    fname varchar(20),
    lname varchar(20),
    gender enum('M', 'F'),
    birth_date date,
    street varchar(20),
    city varchar(20),
    state varchar(20),
    country varchar(20),
    postal_code varchar(20),
    constraint pk_person primary key (person_id)
);
desc person;

create table favorite_food(
    /*vincular essa tabela com a table person*/
    person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food), /*declarando uma chave composta*/
    constraint fk_favorite_food_person_id foreign key (person_id) references person(person_id) /*se referencia a tabela perosn e coluna person id*/
    -- obs q a foreign key n se referencia a PK mas sim à coluna da PK.
);

	/*caso precise recuperar as infromações do schema, dos constraints, etc*/
		desc information_schema.table_constraints;
        select * from information_schema.table_constraints where table_name = 'person';
        select * from information_schema.table_constraints where table_schema = 'first_exemple';
        
	desc person;
    select * from person;
    insert into person values ('1', 'Carol','Silva', 'F', '1978-08-21', 'Rua Tal', 'Cidade J', 'RJ', 'Polonia', '124578-45');
    insert into person values ('2', 'Paulo','Santos', 'M', '1988-02-02', 'Rua Tim', 'Cidade J', 'RJ', 'Brasil', '154578-45'),
								('3', 'Lucas','Faria', 'F', '1966-05-27', 'Rua Tol', 'Cidade K', 'RK', 'Alemanha', '454478-45'), 
                                ('4', 'Caio','Freitas', 'M', '1999-01-01', 'Rua Tul', 'Cidade L', 'RL', 'EUA', '1021578-45'), 
                                ('5', 'Kat','Silva', 'F', '1988-07-2', 'Rua Tal', 'Cidade K', 'RJ', 'Polonia', '1787452-45');
    delete from person where person_id = 2 or person_id = 3 or person_id = 4 or person_id = 5;
					-- N eh possivel deletar ou modificar um regsitro caso haja um outro, em outra tabela, como foreign key refefniando a essa priemria tablea
    update person set fname = 'Teste' where person_id='1';
    
    select * from favorite_food;
    
    desc favorite_food;
    insert into favorite_food values ('2', 'Lasanha'); -- N inseriu pq na tabela person n existe um person id = 2
    
    insert into favorite_food values ('1', 'Lasanha'), ('5', 'MAcarrao'); -- aqui deu certo pq existe person id  = 1
                                    
                                    delete from favorite_food where person_id = 5;
    
    select*from favorite_food;