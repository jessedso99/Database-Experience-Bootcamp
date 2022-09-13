-- pesquisar ANTI OUTER JOIN, ANTI LEFT JOIN, ANTI RIGHT JOIN
-- inner join = é a intersecção entre os dados da tableas
-- full join= pega tudo, mesmo os dados q n tem match com a outra tabela. Ele mostra e seu valor é nulo.
-- left/right outer join e left/right join são as mesmas coisas= N precisa usar o Outer

-- left join = é um outer join (intersceção), porem recupera tbm tds os atributos da tabela a esquerda
-- right join=  intersecção e recupera os atributos da tabela a direita 
-- outer join mostra todos os valores, mesmo os q n deram match. Assim serão exibidos resultados nulos na tela
	-- ex: tabela cliente, tablea compras. Um cliente q nunca comprou n será exibido em um inner join. Ja no outer join, SIM. o seu valor sera Nulo
    
    select* from employee;
    select* from dependent;
    
    select* from employee inner join dependent on Ssn= Essn;
    select* from employee left join dependent on Ssn= Essn; -- mostra todos msm os q n tem dependente
    select* from employee left outer join dependent on Ssn= Essn;