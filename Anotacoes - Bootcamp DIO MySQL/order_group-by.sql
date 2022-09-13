use company_constraints;
select count(*) from employee group by ssn;

select Fname from employee LIMIT 4;

select d.Dname, e.Dno as Num_dpto, concat(e.Fname, " ", e.Lname) as Nome_Gerente, 
	(select count(e.Dno) from employee as e where e.Dno= d.Dnumber) as Qnt_de_employee 
    from departament as d, employee as e where (d.Mgr_ssn=e.Ssn) group by e.Dno;

		-- COMO CONTAR QNTS SUBITENS ESTAO CONTIDOS EM UM "TOPICO"? USE O COUNT(*), ITEM E Dê UM ORDER BY PELO "ITEM". EX:
		select Pnumber, Pname, count(*) from project, works_on 
			where Pnumber= Pno group by Pnumber, Pname;
		-- NUMERO DE PESSOAS Q TRABALHAM NO DPTO 5
		select count(*)  from employee, departament where Dno= Dnumber and Dname= 'Researcher';
        -- MEDIA SALARIAL DO DEPARTAMENTO E NUMERO DE PESSOAS Q NELE TRABALHAM
        select Dno, count(*) as "Qnt de pessoas", round(avg(Salary), 2) as "meia salarial" from employee group by Dno;
        
        select Pnumber, Pname from project, works_on where Pnumber= Pno; -- tras todos, e repetidos
        select Pnumber, Pname, count(*) from project, works_on where Pnumber= Pno; -- ok, so que o count faz retornar apenas 1 linha :(
        select Pnumber, Pname, count(*) from project, works_on where Pnumber= Pno group by Pnumber, Pname; -- OK