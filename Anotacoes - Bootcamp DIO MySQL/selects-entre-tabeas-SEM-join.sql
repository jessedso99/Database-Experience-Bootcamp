-- fazendo selects com expressoes(/*-+)
use first_exemple;
select* from person;
select round(salario*1.030516, 2) as `Novo salario` from person where person_id = 2; -- define o numero de casas decimais q sera exibida
																					-- se necessario faz um arredondamento

-- CONCATENANDO STRINGS
select concat(fname, gender, lname) as 'nome_completo' from person;

-- fazendo select entre mais d uma tabela sem usar join
use company_constraints;
select * from employee e, works_on as w, project as p 
						where(e.Ssn= w.Essn and w.Pno= p.Pnumber);

select concat(Fname, ' ', Lname) as 'Nome Completo', Salary, round(Salary* 1.1, 2) as "Increased Salary" from employee e, works_on as w, project as p 
						where(e.Ssn= w.Essn and w.Pno= p.Pnumber and p.Pname= 'ProductX');