use company_constraints;
select * from employee;
-- É POSSIVEL FAZER SELECT DE DIFERENTES TABLEAS SEM USAR JOIN
-- Ex: Gerente e seus departamentos
select Ssn, Fname , Dname from employee e, departament d where  (e.Ssn = d.Mgr_ssn); -- eh possivel dar um apelido ou usar o prorpio nome da tabela
-- tbm funciona sem usar apelido pras tabelas
Select Ssn, Fname, Dependent_name, relationship from employee, dependent where Essn = Ssn;

select Bdate, Address from employee 
	where Fname = 'John' and Minit= 'B' and Lname= 'Smith';
    
select * from departament where Dname= 'Researcher';

-- USANDO OPERADORES LOGICOS
select Fname, Lname, Address from employee, departament -- pode usar aliasing as n estamos usando
	WHERE Dname= 'Researcher' and Dnumber= Dno;
    
Select Pname, Essn, Fname, Hours from project, works_on, employee where Pnumber= Pno and Essn= Ssn; -- PEGANDO DADOS DE 3 TABELAS SEM JOIN

-- ===================== USANDO ALLIASING ===================
-- PODE USAR ALIASING PARA TABELAS E PARA COLUNAS DAS TABELAS
-- Pode usar um apelido, tipo uma letra do alfabeto, pode usar o proprio nome da tabela, ou qlqr outro nome
-- Quando usar?
		-- Diferenciar Atributos, mesmo q sejam da mesma tabela
select E.Fname, E.Lname, S.Fname, S.Lname from employee as E, employee as S where E.super_ssn= S.Ssn;
		--  Renomear atributos individualmente ou em "lote" (dando uma nova nomeclatura)
select a.Fname as PrimeiroNome from employee a; -- individualemente
select Fname as PrimeiroNome from employee; -- individualemente

-- em lote?? -- select * from employee as A(Fn, Mi, Ln, Ssn, Bd, Addr, Sex, Sal, Sssn, Dno);   
