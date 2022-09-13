-- -usando like e between
use company_constraints;
desc employee;
-- USANDO O % INDICAMOS QUE EXISTE ALGUM(S) CARACTERES, ANTES, DEPOIS, OU OS DOIS
select concat(Fname, ' ', Lname ) as Nome_Completo, 
		Dname as Nome_departamento from employee, departament 
        where (Dno= Dnumber and Address like '%H_ust%'); -- "nao sabemos" o nome interiro da cidade Houston mas é possivel acha-lo asssim

-- USANDO _ DIZEMOS Q EXISTE UM CARACTER ALI.
-- PODEMOS USAR MAIS DE 1 _ PAA INDICAR Q HA MAIS DE 1 CARACTRER
-- usamos o % para indicar q existe n (n>0) caractares antes ali. Pode usar antes ou dps da string conhecida (%ra__lepipe%)

	-- BETWEEN
select Fname, Lname, Salary from employee where (Salary between 30000 and 40000);
select Fname, Lname, Salary from employee where (Salary >= 30000 and Salary <= 40000); -- É o mesmo que usar o between
-- se atente, pq o batween usa maior ou igual e menor ou igual.

		-- OPERADORES LOGICOS AND E OR
select Bdate, Address from employee where Fname= 'John' and Lname= 'Smith';
Select* from departament where Dname= 'Researcher' or Dname= 'Administration'; -- aqui usamos o OR pq não ha celulas que portem os 2 valors ao mesmoa tempo
select concat(Fname, ' ',Lname) as complete_name from employee, departament where Dname= 'Researcher' and Dnumber= Dno;