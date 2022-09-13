use company_constraints;
-- UMA SUBQUERY INTERNA (DENTRO DO () ENXERGA UM CLAUSULA EXTERNA. MAS UMA EXTERNA N ENXERGA UMA INTERNA 
		-- (EX: QUANDO CHAMAMOS UMA TABELA E DAMOS UM ALIASING DENTRO DE UMA SUBQUERY, A QUERY EXTERNA N ENXERGA ESSE NOVO ALIASING))
        
-- subqueries // EXISTS E NOT EXISTS
select distinct Essn from works_on 
	where (Pno, Hours) in (select Pno, Hours from works_on where Essn= 123456789);
        
	   -- PESQUISAR SOBRE EXISTS E NOT EXISTS
-- com o exists verificamos se um valor q eu busco esta contindo dentro do subselect

	-- quais employees POSSUEM DEPENDENTES. A primeira parta da query eh o meu retorno e a condição e a subquery a parttir do exists
select e.Fname, e.Lname, count(d.Dependent_name) from employee as e, dependent as d 
	where exists(select * from dependent as d where e.Ssn= d.Essn) and e.Ssn= d.Essn group by e.Fname;
    
		-- N POSSUEM DEPENDENTES
	select e.Fname, e.Lname from employee as e 
		where not exists(select* from dependent as d where e.Ssn= d.Essn);
				-- podemos fazer com o IN tbm.
			select e.Fname, e.Lname, e.SSn from employee as e 
			where e.Ssn not in (select Essn from dependent as d where e.Ssn= d.Essn);

-- subselect 
select e.Fname, e.Lname, e.Dno, d.Dname from employee e, departament d 
	where exists (select d.Dnumber from departament d where e.Dno= 5 and e.Dno= d.Dnumber) and e.Dno= d.Dnumber;
    
    

        