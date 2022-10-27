-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSQL - AC03 - DDL, DML e DQL
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* * * * * * INFORMAÇÕES DO GRUPO * * * * *
Número do Grupo: 5
Tema: Locadora

NOME COMPLETO:	Vinicius Farias Albanit			RA:2200420
NOME COMPLETO:	Gabryel Navarro					RA: 2200213
NOME COMPLETO:	Tarcisio Eugenio				RA: 2200174
NOME COMPLETO:	Paulo Eduardo Cavalcanti Fusco	RA:2201405
NOME COMPLETO:	Mateus Casanova Montesso		RA:2200492
*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Locatário
(
idcliente		int identity(10,1),
cpf_cliente		varchar(12) not null,
rg_cliente		varchar(11) not null,
CNH				varchar(11) not null,
endereço		varchar(100) not null,
telefone		varchar(12) not null,
constraint pkcliente primary key (idcliente)
)

CREATE TABLE Fabricantes
( 
idFabricante       tinyint identity(1,1)
, Nome               varchar(50) not null 
, endereco           varchar(100) null 
, cidade             varchar(50) not null 
, UF                 char(2) null 
, telefone           varchar(20) null 
, contato            varchar(50) not null
, constraint pkFabricante primary key (idFabricante)
)

create table Locacao
(
idgrupo			tinyint identity(10, 1),
idcliente		int not null,
seguro			smallint not null,
data_locacao	smalldatetime not null,
limite_km		smallint not null,
constraint pkgrupo primary key (idgrupo),
constraint fkcliente foreign key (idcliente) references Locatário(idcliente)
)

CREATE TABLE Veiculos
( 
idVeiculo          smallint identity(10,1)
, descricao          varchar(50) not null
, valor              decimal(9,2)not null
, idModelo           varchar(15) null 
, idFabricante       tinyint  not null 
, idAnoFabricacao    date  null
, idgrupo			tinyint null
, constraint pkVeiculo primary key (idVeiculo)
, constraint fkgrupo foreign key (idgrupo) references Locacao(idgrupo)
, constraint fkfabricante foreign key (idFabricante) references Fabricantes(idFabricante)
)

select * from Veiculos
select * from Locacao
select * from Locatário
select * from Fabricantes

insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (22,5200, '20220920', 150)
insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (13,5200, '20220927', 200)
insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (14,4250, '20220914', 548)
insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (15,4250, '20220925', 80)
insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (16,200, '20220929', 100)
insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (18,700, '20220915', 480)
insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (17,8900, '20220908', 148)
insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (19,700, '20220908', 200)
insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (20,4207, '20220912', 158)
insert into Locacao(idcliente,
seguro, data_locacao, limite_km) values (21,420, '20220925', 150)

insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 157986324-54, 255879561-9, 49318463791,
'Rua Morubixaba 712', 11963976348)
insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 159743566-98, 46820190-9, 89863427869,
'Av Bandeirantes 950', 11925589634)
insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 789443593-02, 78420186-9, 58918478791,
'Rua 9 de Novembro 450', 11994041611)
insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 364803618-45, 25860184-9, 58914818439,
'Rua Bem Vinda 32', 11957896458)
insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 754804784-87, 5790191-9, 76801649439,
'Rua Somalia 500', 11902689764)
insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 176893451-87, 189486345-9, 4568939439,
'Av Maria Luiza 1458', 11948962577)
insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 778964281-12, 178934680-9, 45568937891,
'Av Inajar de Souza 201', 11920027985)
insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 883345928-69, 154479954-9, 2798937891,
'Av Jorge Beretta 2010', 11920027985)
insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 446893715-12, 342255887-9, 47892246807,
'Rua Oscar freire 2000', 11940028922)
insert into Locatário(cpf_cliente, rg_cliente, CNH, endereço, telefone) values ( 77998863-08, 224879684-9, 78894689721,
'Rua 25 de março 35', 11978643892)

insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('Lamborghini', 10000.00, 'Venom', 2, '20190101')
insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('Argo', 110.00, 'Trekking',1, '20220101')
insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('Gol', 95.00, 'GTI',3, '20220101')
insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('Onix', 85.00, 'LTZ Turbo',4 ,'20220101')
insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('Virtus', 150.00, 'TSI',3 ,'20220101')
insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('Audi', 300.00, 'RS7',5 ,'20220101')
insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('BMW', 350.00, 'M3',6 ,'20220101')
insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('Mercades', 350.00, 'GLA',7 ,'20220101')
insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('Doblo', 230.00, 'KBB', 1,'20220101')
insert into Veiculos(descricao, valor, idModelo,idFabricante, idAnoFabricacao) values ('Strada', 120.00, 'Fire',1 ,'20220101')

insert into Fabricantes(Nome, endereco, cidade, UF, telefone, contato) values ('Fiat', 'Av Gabriel Mistral 1150', 'São Paulo', 
'SP', 1140913488, 'Marcío')
insert into Fabricantes(Nome, endereco, cidade, UF, telefone, contato) values ('Lamborghini', 'Av Europa 110', 'São Paulo', 
'SP', 1130613300, 'Eliana')
insert into Fabricantes(Nome, endereco, cidade, UF, telefone, contato) values ('Volkswagen', 'Rua Serra Borborema 201', 'Diadema', 
'SP', 1140913488, 'Gabriel')
insert into Fabricantes(Nome, endereco, cidade, UF, telefone, contato) values ('Chevrolet', 'Av Goias 205', 'São Caetano do Sul', 
'SP', 1121006000, 'Bolsonaro')
insert into Fabricantes(Nome, endereco, cidade, UF, telefone, contato) values ('Audi', 'Av das Nações Unidas 14261', 'São Paulo', 
'SP', 1130412834, 'Jorge')
insert into Fabricantes(Nome, endereco, cidade, UF, telefone, contato) values ('BMW', 'Rua Clodomiro Amazonas 1540', 'São Paulo', 
'SP', 1147502398, 'Jaime')
insert into Fabricantes(Nome, endereco, cidade, UF, telefone, contato) values ('Mercedes', 'Rua Fernão Dias Leme 340', 'São Bernardo do Campo', 
'SP', 1141736611, 'Juliana')

/* O select seguinte mostra a data de locação, Limite de KM, Cpf , Endereço e Telefone dos clientes, para verificar o tempo
que o cliente fica com o carro, se ele passar do tempo, temos o endereço, telefone para entrar em contato*/
select Lo.data_locacao, Lo.limite_km, L.cpf_cliente, L.endereço, L.telefone
from Locatário as L join Locacao as Lo on L.idcliente= Lo.idcliente
update Veiculos set idFabricante = 7 where idVeiculo = 17

/*O select seguinte mostra o nome do carro, a marca, o valor por dia do aluguel com o valor menor que 100 e o modelo do carro, server para o cliente 
visualizar qual carro quer alugar*/
select F.Nome, V.descricao, V.valor, V.idModelo
from Fabricantes as F join Veiculos as V on V.idFabricante = F.idFabricante
where V.valor < 100
