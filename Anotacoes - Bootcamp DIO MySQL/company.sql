create schema if not exists company;
use company;

-- restricao atribuida a um dominio (sominio n eh sortado no mysql)
-- create domain D_num as int check(D_num>0 and D_num< 21);

create table company.employee(
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
    primary key (Ssn) -- aqui n colocamos um nome personalizado, mas podemos. 
);

create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date DATE,
    Dept_create_date DATE,
    primary key (Dnumber),
    Unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn) -- aqui n colocamos um nome personalizado, mas podemos. 
);

create table dept_locations(
	Dnumber int not null,
    Dlocation varchar(15) not null,
    primary key (Dnumber, Dlocation), -- chave primaria composta
    foreign key (Dnumber) references departament(Dnumber) -- A foreign key tem o mesmo nome da primary key q ela vai se referencias. Ver isso mais p frente
);

create table project(
	Pname varchar(15) not null,
    Pnumber int not null,
	Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    Unique (Pname),
    Foreign key (Dnum) references departament(Dnumber)
);

create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal (3,1) not null,
    primary key (Essn, Pno), -- da employee e da project. Para idenctificar qual projeto um fincionario esta fazendo (que pode ser masi de um)
    foreign key (Essn) references employee (Ssn), -- existencia dependente
	foreign key (Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char, -- Aqui ele ja entende q vai ter apenas uma letra
    Bdate date,
    Relationship varchar(8),
	Age int not null, 
    constraint chk_age_denpendent check(Age< 22),
    primary key (Essn, Dependent_name),
    foreign key (Essn) references employee(Ssn)
);

show tables;
desc dependent;


-- ============== COMO INDENTIFICAR CONSTRAINS Q EXISTEM NESSE DATABASE =========
select * from information_schema.table_constraints where constraint_schema = 'company';
select * from information_schema.referential_constraints where constraint_schema = 'company';