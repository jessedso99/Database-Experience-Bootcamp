use company_constraints;
show tables;

-- EXISTE FUNCAO P COMVERTER STRING PARA DATA usando o str_to_date(). EX: dec-21-1980
				-- update person set birthdate = str_to_date('dec-21-1980', '%b-%d-%Y') 

-- CONCATENAR
select concat(Fname, ' ', Lname) as NomeCompleto from employee;
-- PESQUISAR regecp '^to' acha td q começa com to

select* from departament;
select * from dept_locations;

-- ==================== USANDO ALIASING ===============
-- HAVERA AMBIGUIDADE SE HAVER MAIS DE UMA COLUNAS COM O MESMO NOME E MAIS DE UMA TABLEA DIFERENTE
select* from departament, dept_locations where Dnumber = Dnumber; -- erro, pq na clausula where temos um comparacao ambigua
																-- (n sabemos qm ta representando qm. Os duas tabelas tem Dnumber)
							-- Retiramos essa ambiguiade usando os As
select Dname as Nome_departamento, L.Dlocation as Nome_Local 
	from departament as D, dept_locations as L where D.Dnumber = L.Dnumber;