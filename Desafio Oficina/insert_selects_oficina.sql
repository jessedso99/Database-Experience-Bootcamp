insert into cliente values
	("001111123456789", "Joaozinho", "Rua dos Bobos, 0", "11123456789"), 
    ("002211456123789", "Jesse", "Dubai, 1000", "11456123789"), 
    ("003311789123456", "Fulano", "Rua Um, 20", "11789123456"), 
    ("004411456789123", "Beltrano", "Rua Dois, 100", "11456789123"), 
    ("005511987654321", "Ciclano", "Rua Três, 45", "11987654321");
    
insert into veiculo_cliente values
	("001111123456789", "Fusca", "1973", "Vermelho"), 
    ("002211456123789", "Camaro", "2018", "Amarelo"), 
    ("002211456123789", "Ferrari", "2020", "Vermelho"), 
    ("002211456123789", "Trator", "2010", "Amarelo"), 
	("003311789123456", "Mercedes", "2018", "Preto"), 
    ("003311789123456", "Brasília", "1980", "Bege"), 
    ("004411456789123", "Celta", "2010", "Verde"), 
    ("005511987654321", "Corsa", "2015", "Lilás");
    
insert into mecanico values
	("110011123456789", "Marcão", "Rua dos Parafusos", "Autoelétrica"), 
    ("220011987654321", "Carol", "Rua dos Pistões", "Motores"), 
    ("330011456123789", "Lucas", "Rua dos Parafusos", "Suspesão e Frio");
    
insert into pecas values
	("0101", "Pneu", 350), 
    ("0102", "Bandeja de Suspensão", 250.50), 
    ("0103", "Correia Dentada", 170), 
    ("0104", "Mangueira de Agua", 99.99), 
    ("0105", "Filtro de Óleo", 70);
    
insert into maoDeObra values 
	("0101", "Serviços Autoelétricos", 150), 
    ("0201", "Serviços na Suspensão", 250.50), 
    ("0301", "Serviços no Motor", 370), 
    ("0401", "Serviços no Radiador", 199.99), 
    ("0501", "Troca de Óleo", 100);
    
insert into ordem_de_servico values 
	("0001", "001111123456789", "110011123456789", "2022-02-15", 150, "2022-02-20", "Em andamento"), -- seletrico
    ("0002", "002211456123789", "220011987654321", "2022-03-10", 640, "2022-03-15", "Cancelado"), -- corr+trocaoleo+smot
    ("0003", "002211456123789", "330011456123789", "2022-03-15", 501, "2022-03-20", "Concluído"), -- band+susp
    ("0004", "002211456123789", "220011987654321", "2022-04-07", 370, "2022-04-13", "Concluído"), -- smotor
    ("0005", "003311789123456", "330011456123789", "2022-04-20", 600.5, "2022-04-27", "Concluído"), -- pneu+ssusp
    ("0006", "003311789123456", "110011123456789", "2022-05-27", 250, "2022-06-02", "Em andamento"), -- -- seletrico+trocaoleo
    ("0007", "004411456789123", "220011987654321", "2022-06-01", 170, "2022-06-07", "Em andamento"), -- oleo+trocaoleo
    ("0008", "005511987654321", "330011456123789", "2022-06-07", 350, "2022-06-10", "Cancelado"); -- pneu
    
insert into pecas_solicitadas values 
	("0002", "0103", 1, 170), 
    ("0003", "0102", 1, 250.5), 
    ("0005", "0101", 1, 350), 
    ("0007", "0105", 1, 70), 
    ("0008", "0101", 1, 350);
    
insert into maoDeObra_solicitadas values 
	("0001", "0101", 150), 
    ("0002", "0301", 370), 
    ("0002", "0501", 100), 
    ("0003", "0201", 250.5), 
    ("0004", "0301", 370), 
    ("0005", "0201", 250.5), 
    ("0006", "0101", 150), 
    ("0006", "0501", 100), 
    ("0007", "0501", 100);
    
    
-- ============================================== SELECTS E QUERIES ==============================================

-- Os clientes cadastrados e quais os carros de cada um
select c.idCliente, c.nome, vc.modelo, vc.ano, vc.cor from cliente c, veiculo_cliente vc where c.idCliente= vc.carro_idCliente group by vc.modelo;

-- quantos carros cada cliente tem
select c.idCliente, c.nome, count(vc.modelo) from cliente c, veiculo_cliente vc where c.idCliente= vc.carro_idCliente group by c.nome;

-- select simples usando WEHRE, BETWEEN e HAVING
select * from ordem_de_servico where statusServico= "Concluído" and valor between  350 and 1000 having dataEntrada>= '2022-04-01';

-- Mostrando os clientes, a MAO DE OBRA solicitada e o status do serviço
-- existe mais de uma mao de obra para uma mesma OS. Existe mais de uma OS para um mesmo cliente
select c.nome, ms.ms_idOrdem_deServico, mdo.nomeServico, ms.valor, os.statusServico from maoDeObra_solicitadas ms 
			inner join ordem_de_servico os on os.idOrdem_deServico= ms.ms_idOrdem_deServico
            inner join cliente c on os.idCliente_servico= c.idCliente
            inner join maoDeObra mdo on mdo.id_maoDeObra= ms.ms_id_maoDeObra
            order by ms.ms_idOrdem_deServico;

-- Mostrando os clientes, a PEÇAS solicitada e o status do serviço
-- existe mais de uma peça para uma OS.
select c.nome, ps.ps_idOrdem_deServico, p.nomePeca, ps.valor, os.statusServico from pecas_solicitadas ps 
			inner join ordem_de_servico os on os.idOrdem_deServico= ps.ps_idOrdem_deServico
            inner join cliente c on os.idCliente_servico= c.idCliente
            inner join pecas p on p.idPecas= ps.ps_idPecas
            order by ps.ps_idOrdem_deServico;

-- trazendo os serviços que ainda não foram concluídos, o nome do cliente e o mecanico responsavel pelo serviço
select os.idOrdem_deServico as "Nº da O.S", c.nome as "Nome do Cliente", mec.nome as "Mec. Responsavel", os.valor, os.statusServico from ordem_de_servico os
		inner join cliente c on os.idCliente_servico= c.idCliente
        inner join mecanico mec on mec.idMecanico= os.idMecanico_responsavel
        where statusServico= 'Em andamento';
