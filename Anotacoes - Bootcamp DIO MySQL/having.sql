use company_constraints;
select Pnumber, Pname, count(*) from project, works_on 
	where Pnumber= Pno group by Pnumber, Pname having count(*) > 3;

select Pname as nome_projeto, count(*) as qnt_pessoas from project, works_on 
	where Pnumber= Pno group by Pname having qnt_pessoas>= 3;