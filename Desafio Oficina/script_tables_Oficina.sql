-- drop database oficina_jesse;
create database oficina_jesse;
use oficina_jesse;

create table cliente(
	idCliente char(15) primary key,
    nome varchar(50),
    endereço varchar(50),
    telefone varchar(11)
);

create table veiculo_cliente(
	carro_idCliente char(15),
	modelo varchar(20),
	ano char(4),
	cor varchar(10),
    constraint fk_carro_idCliente foreign key (carro_idCliente) references cliente(idCliente)
);

create table mecanico(
	idMecanico char(15) primary key,
    nome varchar(50),
    endereço varchar(50),
    especialidade varchar(20)
);

create table pecas(
	idPecas char(4) primary key,
    nomePeca varchar(50),
    valor float
);

create table maoDeObra(
	id_maoDeObra char(4) primary key,
    nomeServico varchar(50),
    valor float
);

create table ordem_de_servico(
	idOrdem_deServico char(4) primary key,
    idCliente_servico char(15),
    idMecanico_responsavel char(15),
    dataEntrada date,
    valor float,
    previsaoEntrega date,
    statusServico enum("Em andamento", "Cancelado", "Concluído"),
    constraint fk_idCliente_servico foreign key(idCliente_servico) references cliente(idCliente),
    constraint fk_idMecanico_responsavel foreign key(idMecanico_responsavel) references mecanico(idMecanico)
);

create table pecas_solicitadas(
	ps_idOrdem_deServico char(4),
    ps_idPecas char(4),
    quantidade int,
    valor float,
    constraint fk_ps_idOrdem_deServico foreign key(ps_idOrdem_deServico) references ordem_de_servico(idOrdem_deServico),
    constraint fk_ps_idPecas foreign key(ps_idPecas) references pecas(idPecas)
);

create table maoDeObra_solicitadas(
	ms_idOrdem_deServico char(4),
    ms_id_maoDeObra char(4),
    valor float,
    constraint fk_ms_idOrdem_deServico foreign key(ms_idOrdem_deServico) references ordem_de_servico(idOrdem_deServico),
    constraint fk_ms_id_maoDeObra foreign key(ms_id_maoDeObra) references maoDeObra(id_maoDeObra)
);
