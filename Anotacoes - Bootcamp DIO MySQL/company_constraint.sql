-- company com constraints
-- check, unique, pk, fk sao constraints

create schema if not exists company_constraints;
use company_constraints;

-- restricao atribuida a um dominio (sominio n eh sortado no mysql)
-- create domain D_num as int check(D_num>0 and D_num< 21);

create table employee(
	Fname varchar(15) NOT NULL,
    Minit char,
    Lname varchar(15) NOT NULL,
    Ssn char(9),
    Bdate DATE,
    Address varchar(30),
    sex char, -- Aqui ele ja entende q vai ter apenas uma letra
    Salary decimal(10, 2),
    Super_ssn char(9),
    Dno INT NOT NULL,
    constraint chk_salary_employee check (Salary> 2000.0), -- check tbm eh uma constraint e podemos dar um "nome a ela"
    constraint pk_employee primary key (Ssn)
);
-- ==============DANDO UM ALTER TABLE P INSERIR UMA CONSTRAINT ============
alter table employee
	add constraint fk_employee foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;
-- ========================================================================    
desc employee;

create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date DATE,
    Dept_create_date DATE,
    -- cheack eh uma constraint, e assim eh possivel cria "condicoes de existencia" de certos dados na tabela
    constraint chk_date_dept check (Dept_create_date< Mgr_start_date), -- so sera aceito um gerente q começou dps da data de criacao do dpto
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept Unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn) -- aqui n colocamos um nome personalizado, mas podemos. 
);

-- ========================= DROP EM CONSTRAINT E INSERINDO UMA NOVA ======================
-- 'def', 'company_constraints', 'departament_ibfk_1', 'company_constraints', 'departament', 'FOREIGN KEY', 'YES'
-- modificacoes em uma constraint: drop e add
alter table departament drop constraint departament_ibfk_1;
alter table departament add constraint fk_dept foreign key (Mgr_ssn) references employee(Ssn) on update cascade;
-- qnd n souyber o nome da constraint pode verificar em information_schema.table_constraints
-- ========================================================================================

desc departament;

create table dept_locations(
	Dnumber int not null,
    Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation), -- chave primaria composta
    constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber) -- A foreign key tem o mesmo nome da primary key q ela vai se referencias. Ver isso mais p frente
);

-- ========= DELETANTO E ADCIONANDO CONSTRAINT ============
alter table dept_locations drop constraint fk_dept_locations;
Alter table dept_locations
	add constraint fk_dept_locations foreign key(Dnumber) references departament(Dnumber)
    on delete cascade
    on update cascade;
-- =======================================


create table project(
	Pname varchar(15) not null,
    Pnumber int not null,
	Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    constraint unique_project Unique (Pname),
    constraint fk_project Foreign key (Dnum) references departament(Dnumber)
);

create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal (3,1) not null,
    primary key (Essn, Pno), -- da employee e da project. Para idenctificar qual projeto um fincionario esta fazendo (que pode ser masi de um)
    constraint fk_employee_works_on foreign key (Essn) references employee (Ssn), -- existencia dependente
	constraint fk_project_works_on foreign key (Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char, -- Aqui ele ja entende q vai ter apenas uma letra
    Bdate date,
    Relationship varchar(8),
    primary key (Essn, Dependent_name), -- tabela dependente, pois sua cahve primaria tbm eh sua chave estrangeira
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);

show tables;
desc dependent;

-- ============== COMO INDENTIFICAR CONSTRAINS Q EXISTEM NESSE DATABASE =========
select * from information_schema.table_constraints where constraint_schema = 'company';
select * from information_schema.referential_constraints where constraint_schema = 'company';
select * from information_schema.table_constraints where constraint_schema = 'company_constraints';