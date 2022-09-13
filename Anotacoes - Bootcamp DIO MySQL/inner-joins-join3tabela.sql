-- JOINS
-- DEPOIS DO ON, AINDA PODEMOS USAR UM WHERE (VANTAGEM SOBRE FAZER SELECT ENTRE 2 TABLEAS SEM O JOIN) e tbm um HAVING
select e.fname, e.lname, d.Dname, d.Dnumber from employee e join departament d ON e.Dno= d.Dnumber WHERE Dname= "Administration" having fname= "Sarah";

-- PODEMOS USAR O JOIN DENTRO DE UM FROM, POIS O JOIN RETORNA UMA TABELA
SELECT Fname, Lname, Address FROM (employee JOIN departament ON Dno= Dnumber) 
							WHERE Dname= 'Researcher';

-- PODEMOS PASAR PARA O JOIN, AO INVES DE UMA TABELA, UM SELECT COMO PARAMETRO
/*EX: SELECT a, b, c FROM tableA JOIN (SELECT d, e, f FROM tableB) b (aliasign o select) ON a=d JOIN (tabela ou selec from C) ON colunafromAouB=colunaFromC*/
-- -------

-- JOIN COM 3 OU MAIS TABELAS: DEPOIS DO ON COLOCAR UM NOVO JOIN, NOME DA NOVA TABELA E DPS SEU ON
    select e.fname, e.lname, d.Dname, e.Ssn, w.Pno, p.Pname from employee e 
		JOIN departament d ON e.Dno= d.Dnumber 
        JOIN works_on w on e.Ssn= w.Essn 
        JOIN project p ON p.Pnumber= w.Pno
        order by e.fname, e.lname;

    -- join com CASE WHEN THEN END
    select concat(e.fname, " ",e.lname) as Gerente, d.Dname from employee e join departament d on d.Mgr_ssn= e.Ssn;
    update employee e set e.Salary= CASE
										WHEN e.Ssn in (select Mgr_ssn from departament) THEN Salary+ 1000
                                        ELSE Salary+ 0
									END;	
                                    
-- para fazer menos join deveria fazer o primeiro select coma Worksone dps join com a emplyee
select*from works_on; -- Essn, Pno(10,20)

-- SE N COLOCAR O ON TEREMOS UM CORSS JOIN, PRODUTO CARTESIANO, MULTIPLICAÇÃO ENTRE OS DADOS DAS TABELAS, E POR ISSO TEREMOS REDUNDANCIAS
/*EX: */ select e.fname, e.lname, d.Dname from employee e join departament d; -- multiplicou cada iten de departament por cada employee
		-- para evitar isso usamos o ON, que vai determinar a condição de junção
			select e.fname, e.lname, d.Dname from employee e JOIN departament d -- AQUI ELE JA ENTENDE COMO INNER JOIN
																ON e.Dno= d.Dnumber;
-- É O MESMO QUE: 
select e.fname, e.lname, d.Dname from employee e, departament d where e.Dno= d.Dnumber;

		-- INNER JOIN
-- é o exemplo acima, qnd usa join e on ele ja eh um inner join
-- FALHA: c vc qr cruzar tabela fincionarios com departamento, se tiver um departamento em ninguem essa departamento n vai aparecer no resultado
-- quand vc tem atributos com o mesmo nome e qer usa-los para comparar no ON pode usar o USING ao invez de ON
				-- Ex: ON e.depto_no= d.depto_no // eh o mesmo que USING(depto_no)
                       