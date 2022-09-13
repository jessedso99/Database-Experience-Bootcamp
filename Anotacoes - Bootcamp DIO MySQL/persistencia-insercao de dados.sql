-- inserção de dados no bd company

use company_constraints;
show tables;


select* from works_on;
-- load file, modificar create e no serv. pesquisar
-- load data infile 'path local' into table company_constraints fields terminated by ',' lines terminated by ';';

insert into employee values ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Foundren-Houston-TX', 'M', 30000, null, 5);
insert into employee values	('Frank', 'B', 'South', 224578235, '1999-10-20', '731-Foundren-Houston-SP', 'M', 35000, 123456789, 5),
                            ('Luis', 'C', 'McLarty', 124578, '1996-5-12', '704-Orfeoes-SP', 'M', 20000, 224578235, 5),
                            ('Ana', 'D', 'Houston', 784512235, '1988-12-23', '51-Semicolcheias-RJ', 'F', 40000, null, 5),
                            ('Elza', 'A', 'Sabath', 457812568, '1955-05-01', '71-Vanda Cidade-CE', 'F', 55000, 784512235, 5),
                            ('Sarah', 'E', 'Loren', 238956784, '1973-09-26', '991-Jose Almada-SP', 'F', 32100, 784512235, 5),
                            ('Jhonny', 'L', 'Golden', 128956784, '1969-10-30', '001-Espirito Santo-PR', 'M', 90500, 123456789, 5),
                            ('Dan', 'D', 'Roger', 234578561, '1978-05-15', '51-Dona Maria-JP', 'M', 10500, 224578235, 5);

insert into dependent values (123456789, 'Alice', 'F', '1986-05-05', 'Daughter'),
							(123456789, 'Theodore', 'M', '1983-06-20', 'Son'),
                            (123456789, 'Joy', 'F', '1958-12-07', 'Spouse'),
                            (784512235, 'Abner', 'M', '1942-05-15', 'Spouse'),
                            (234578561, 'Michael', 'M', '1988-07-25', 'Son'),
                            (234578561, 'Alice', 'F', '1986-11-30', 'Daughter'),
                            (234578561, 'Elizabeth', 'F', '1962-10-30', 'Spouse');

insert into departament values ('Researcher', 5, 123456789, '1988-05-02', '1986-05-22'),
								('Administration', 4, 457812568, '1995-01-01', '1994-01-01'),
								('Headquarters', 1, 128956784, '1981-05-19', '1980-06-19');
                                
insert into dept_locations values (1, 'Houston'),
									(4, 'Stafford'),
									(5, 'Bellair'),
									(5, 'Sugarland'),
									(5, 'Houston');
                                    
insert into project values ('ProductX', 1, 'Bellair', 5),                                   
							('ProductY', 2, 'Sugarland', 5),
							('ProductZ', 3, 'Houston', 5),
							('Computerization', 10, 'Stafford', 4),
							('Reorganization', 20, 'Houston', 1),
							('Newbenefits', 30, 'Stafford', 4);
                            
insert into works_on values (123456789, 1, 32.5),
							(123456789, 2, 7.5),
							(224578235, 3, 40.0),
							(124578, 1, 20.0),
							(124578, 2, 20.0),
							(784512235, 2, 10.0),
							(784512235, 3, 10.0),
							(784512235, 10, 10.0),
							(784512235, 20, 10.0),
							(784512235, 30, 30.0),
							(123456789, 30, 15.0),
							(128956784, 10, 35.0),
							(128956784, 30, 05.0),
							(457812568, 30, 20.0),
							(457812568, 20, 15.0),
							(123456789, 20, 0.0);
                            