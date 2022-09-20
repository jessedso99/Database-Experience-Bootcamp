show tables;

insert into clients values (0, "Joao", "D", "lopes", "Rua dos Bobos", "1999-02-10", "PF"),
							(1, "Jude", "T", "Church", "Rua dos Tolos", "2009-05-15", "PF"),
                            (2, "Bob", "F", "Mollen", "Rua dos Bakas", "1998-12-30", "PF"),
                            (3, "Loyd", "Mc", "Gray", "Rua dos Asnos", "1990-02-17", "PJ"),
                            (4, "John", "B", "Boy", "Rua dos Corno", "2002-09-03", "PF"),
                            (5, "Lucas", "da", "Silva", "Rua dos Louco", "2001-07-25", "PJ");

insert into payments (pIdClient, idPayment, typePayment, numero_cartao, numero_boleto) 
			values (0, 101, "Boleto", null ,123),
					(1, 102, "cartão", 456789, null),
					(2, 102, "cartão", 789456,null),
					(3, 101, "Boleto", null, 456),
					(4, 102, "cartão", 456123,null),
					(5, 102, "cartão", 123789,null);
                    
insert into product (idProduct, Pname, classification_kids, category, descricao, valor, avaliação, size)
			values(0110, "caneca", 1, "Móveis","caneca de dia das maes", 115.00, 5, "12x12"),
					(0111, "cafe da manha", 1, "Alimentos", "cesta de cafe da manha", 405.6, 2, "15x12"),
                    (0112, "bolinho", 1, "Alimentos", "bolinho ana maria", 10.0, 3,"120x102"),
                    (0113, "minuatura", 0, "Brinquedos", "minuatura do batman", 200.22, 5,"15x30"),
                    (0114, "Videogames", 0, "Eletrônica", "GTA6", 100.22, 4, "30x30"),
                    (0115, "Chocolates", 1, "Alimentos", "Chocolate", 50, 0, "5x15");

insert into orders (idOrder, idOrderClient , orderStatus, orderDescription, sendValue, paymentCash, oIdProduct) 
			values(010, 0, "Confirmado", "caneca de dia das maes", 15.00, 1, 110),
					(011, 1, "Em processamento", "cesta de cafe da manha", 45.6, 0, 111),
                    (012, 2, "Cancelado", "bolinho ana maria", 20.0, 0, 112),
                    (013, 3, "Confirmado", "minuatura do batman", 20.22, 1, 113),
                    (014, 4, null, "GTA6", 10.22, 0, 114),
                    (015, 5, "Confirmado", "Chocolate", 5, 0, 115);

insert into dadosFrete (idOrder_frete, nome_Transportadora, origem, destino, data_coleta) 
			values(010, "TramsConfirmado", "Canecas-PR", "Sao Paulo", "2021-12-11"),
					(011, "Process Transportes", "Manha-SP", "Parana", "2022-10-30"),
                    (012, "Canceline BR", "Ana Maria- MG", "Rio de Janeiro", "2022-05-05"),
                    (013, "Confrete Brasil", "Morcegos-SP", "Londrina-PR", "2020-02-10"),
                    (014, "Road Sick", "Las vegas", "SP-Brasil", "2021-06-15"),
                    (015, "Solomil", "Suiça", "Nárnia", "2022-09-13");

insert into productStorage (idProdStorage, storageLocation, quantity) 
			values (0, "Parana", 20),
					(1, "Sao Paulo", 30),
					(2, "Minas Gerais", 12),
					(3, "Sao Paulo", 56),
					(4, "EUA", 45),
					(5, "Suiça", 123);
                    
insert into supplier (idSupplier ,SocialName, CNPJ, contact) 
			values (101, "TramsConfirmado BR", 123456789123456, 45678912),
					(111, "Sao Process Transportes", 456789123456789, 12345678),
					(121, "Minas Canceline", 456123789467894, 56123789),
					(131, "Confrete Paulo", 891234567456456, 45781289),
					(141, "Road EUA", 546879213564897, 12457856),
					(151, "SolomilaSul", 213546879546213, 23545689);


insert into seller (idSeller, SocialName, AbstName, CNPJ, CPF, location, contact) 
			values (1001, "Joao Multimarca", "Joao", 123456789123456, 101045678912, "Parana", 45678912),
					(1111, "Silva Variedades", "Silva", 456789123456789, 201012345678, "Sao Paulo", 12345678),
					(1221, "Mirna Variedades", "Mirna", 456123789467894, 301056123789, "Minas Gerais", 56123789),
					(1331, "Loja Coronha", "Coronha", 891234567456456, 401045781289, "Sao Paulo", 45781289),
					(1441, "Rondalu Comercio", "Rondalu", 546879213564897, 501012457856, "EUA", 12457856),
					(1551, "Silvana Toy", "Silvana", 213546879546213, 601023545689, "Suiça", 23545689);
                    
insert into productSeller (idPseller, idProduct, prodQuantity) 
			values (1001, 0110, 29),
					(1111, 0111, 35),
					(1221, 0112, 22),
					(1331, 0113, 62),
					(1441, 0114, 24),
					(1551, 0115, 23);
                    
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
			values (0110, 010, 2, "Disponível"),
					(0111, 011, 3, "Disponível"),
                    (0112, 012, 5, "Disponível"),
                    (0113, 013, 7, "Disponível"),
                    (0114, 014, 1, "Disponível"),
                    (0115, 015, 1, "Disponível");
                    
insert into storageLocation (idLproduct, idLstorage, location)
			values (0110, 1, "Parana"),
					(0111, 2, "São Paulo"),
                    (0112, 3, "Minas Gerais"),
                    (0113, 4, "São Paulo"),
                    (0114, 5, "EUA"),
                    (0115, 7, "Suiça");
                    
insert into productSupplier (idPsSupplier, idPsProduct, quantity)
			values (101, 0110, 29),
					(111, 0111, 35),
					(121, 0112, 22),
					(131, 0113, 62),
					(141, 0114, 24),
					(151, 0115, 23);

-- ============================== RESOLVENDO O DESAFIO ==================================
select* from clients; -- Adicionei uma coluna identificando se o cliente é PF ou PF e uma valor Default
select* from payments; -- Aqui ficam os dados e metodos de pagameto
select* from orders; -- Nessa tabela encontram-se os dados das entragas dos pedidos, com codigo de rastreio e status

-- ================================ QUERIES ================================
-- select com Where
select concat(Fname, " ", Minit, " ", Lname) as "Client", o.idOrder as Request, o.orderStatus as "Status" 
	from clients c, orders o where c.cIdCliente= idOrderClient;
    
-- select com JOIN. Retorna o mesmo result que a query acima
select concat(Fname, " ", Minit, " ", Lname) as "Client", idOrder as Request, orderStatus as "Status" 
	from clients inner join orders on cIdCliente= idOrderClient;

-- Indentificação do cleinte e o que comprou
select c.cIdCliente, concat(Fname, " ", Minit, " ", Lname) as "Nome Completo", p.Pname, o.orderDescription from clients c
		inner join orders o on o.idOrderClient= c.cIdCliente 
        left join product p on p.idProduct= o.oIdProduct;

-- Dos produtos cadastrados, recuperamos a quantidade e a categoria deles
select count(*) as "Quantidade", category from product group by category order by category asc;

-- Algo semelhante à query acima so que usando filtro Like e Where
select count(*), category from product where category like "__i%o_" group by category;

-- Aqui listamos alguns dados sobre os vendedores
select s.SocialName as "Nome_Loja", s.location, p.category, p.avaliação 
		from seller s inner join productSeller ps on ps.idPseller= s.idSeller
					inner join product p using(idProduct);

-- Algo semelhante à query acima, so que usando o having para filtrar dados
select s.SocialName, s.location, p.category, p.avaliação 
		from seller s inner join productSeller ps on ps.idPseller= s.idSeller
					inner join product p using(idProduct) where location in ("Parana", "Sao Paulo") having avaliação= 5 order by location;






