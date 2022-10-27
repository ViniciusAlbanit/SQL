-- 1. Recrie toda a estrutura de tabelas com devidos tipos e constraints.
----------------------------------------------------------------------------------------------------------------------
--delete from VendasAnuais
--delete from Veiculo
--delete from Fabricante
--delete from Modelo
--delete from Ano
--delete from Mes

drop table Fabricante;

CREATE TABLE Ano
( 
idAno tinyint identity(1,1)
, ano smallint not null 
, constraint pkAno primary key (idAno)
)
go


CREATE TABLE Fabricante
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
go

CREATE TABLE Mes
( 
idMes        tinyint identity (15, 3) 
, mes        tinyint  not null 
, constraint pkMes primary key (idMes)
)
go

CREATE TABLE Modelo
( 
idModelo           smallint identity(1,1)
, descricao          varchar(50) not null 
, constraint pkModelo primary key (idModelo)
)
go

CREATE TABLE Veiculo
( 
idVeiculo          smallint identity(1,1)
, descricao          varchar(50) not null
, valor              decimal(9,2)not null
, dataCompra date not null
, idModelo           smallint null 
, idFabricante       tinyint  null 
, idAnoFabricacao    tinyint  null 
, constraint pkVeiculo primary key (idVeiculo)
, constraint fkVeiculo_idModelo foreign key (idModelo) references Modelo(idModelo)
, constraint fkVeiculo_idFabricante foreign key (idFabricante) references Fabricante(idFabricante)
, constraint fkVeiculo_idAnoFabricacao foreign key (idAnoFabricacao) references Ano(idAno)
)
go

CREATE TABLE VendasAnuais
( 
idVendas           int identity (1,1)
, qtd                smallint not null 
, idVeiculo          smallint  null 
, idAnodaVenda       tinyint  null 
, idMesdaVenda       tinyint  null 
, constraint pkVendasAnuais primary key (idVendas)
, constraint fkVendasAnuais_idVeiculo foreign key (idVeiculo) references Veiculo(idVeiculo)
, constraint fkVendasAnuais_idAnodaVenda foreign key (idAnodaVenda) references Ano(idAno)
, constraint fkVendasAnuais_idMesdaVenda foreign key (idMesdaVenda) references Mes(idMes)
)
go
----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
-- 2. Adicione os fabricantes a seguir com todos dados: FIAT, GM e VW.
----------------------------------------------------------------------------------------------------------------------
insert Fabricante (nome, endereco, cidade, uf, telefone, contato) values
  ('Fiat', 'Rua Juí, 20', 'Sao Paulo', 'SP', '44456200', 'Samanta Ribeiro')
, ('GM', 'Rua da Consolacao, 125', 'Sao Paulo', 'SP', '26454128', 'Ismael Santos')
, ('Volks', 'Rua Ipiranga, 820', 'Sao Paulo', 'SP', '24456200', 'Ana Cristina')

select * from Fabricante -- 1, 2, 3
----------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------
-- 3. Adicione os modelos: Standard, Premium, Executive.
----------------------------------------------------------------------------------------------------------------------
insert Modelo values ('Standard'), ('Premium'), ('Executive')

select * from Modelo -- 1, 2, 3
----------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 4. Adicione os Veículos: Artic (Fiat  - Standard - ano 2025
							, Voltz (GM -  Executive - ano 2027)
							, Zeo (Volks - Premium - ano 2028)
							, Bjorn (GM - Premium - ano 2028)
							, Duntzen (Fiat - Standard – ano 2026)
							, Tungsten (Volks - Executive - ano 2027)
**/
--------------------------------------------------------------------------------------------------------------------------------------------------------------
sp_help Veiculo -- idAnoFabricacao

-- Precisamos inserir registros em ANO (idAnoFabricacao)
insert Ano values (2025), (2026), (2027), (2028) 

select * from Ano -- 1, 2, 3, 4, 5
select * from Fabricante -- 1, 2, 3
select * from Modelo -- 1, 2, 3

-- Agora conseguimos inserir em Veiculo
insert Veiculo (descricao, valor, idModelo, idFabricante, idAnoFabricacao, dataCompra) values 
('Artic', 125500, 1, 1, 1, '20190515') 
, ('Voltz', 156000, 3, 2, 3, '20190115') 
, ('Zeo', 149999, 2, 3, 4, '20190203') 
, ('Bjorn', 175500, 2, 2, 4, '20190227')  
, ('Duntzen', 137190, 1, 1, 2, '20190915') 
, ('Tungsten', 165000, 3, 3, 3, '20190309') 

select * from Veiculo -- 1, 2, 3, 4, 5, 6
----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
-- 5. Adicione três Vendas para cada veículo para o ano de 2029 em meses distintos.
----------------------------------------------------------------------------------------------------------------------
sp_help VendasAnuais -- idMesdaVenda

-- Ano de 2029
insert Ano values (2029)

-- Precisamos inserir registros em MES
insert mes values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)

select * from mes -- 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48
select * from Ano -- 1, 2, 3, 4, 5
select * from Fabricante -- 1, 2, 3
select * from Modelo -- 1, 2, 3
select * from Veiculo

insert VendasAnuais (qtd, idVeiculo, idAnoDaVenda, idMesDaVenda) values
(15, 1, 5, 15), (9, 1, 5, 30) , (3, 1, 5, 45)  
, (7, 2, 5, 18), (13, 2, 5, 33) , (11, 2, 5, 36)
, (9, 3, 5, 24), (23, 3, 5, 27) , (17, 3, 5, 48)
, (5, 4, 5, 39), (15, 4, 5, 42) , (6, 4, 5, 45)
, (21, 5, 5, 15), (23, 5, 5, 24) , (27, 5, 5, 30)
, (1, 6, 5, 18), (3, 6, 5, 21) , (8, 6, 5, 36)


select * from VendasAnuais -- 1333 ... 1341
----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
-- 6. Altere a fabricação dos veículos Zeo e Bjorn para o ano de 2026. 
-- Os demais veículos alterar para 2030
----------------------------------------------------------------------------------------------------------------------
select * from Ano -- 
--insert Ano values (2030)

Select * from Veiculo -- 3, 4

update Veiculo set idAnoFabricacao = 2 where idVeiculo in (3, 4)
update Veiculo set idAnoFabricacao = 6 where idVeiculo not in (3, 4)

Select * from Veiculo -- 3, 4
----------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------
-- 7. Altere as Vendas dos Veículos Premium para janeiro de 2030
--                                 , Standard para Dezembro de 2031 e 
--                                   Executive para outubro de 2032.
----------------------------------------------------------------------------------------------------------------------
insert Ano values (2031), (2032)

select * from Ano 
select * from Mes 
select * from Modelo 
select * from Veiculo 
select * from VendasAnuais 

-- Premium idModelo 2 - idVeiculo 3, 4 - idMes 15 - idAno = 6
update VendasAnuais set idMesdaVenda = 15, idAnodaVenda = 6 where idVeiculo in (3, 4)

-- Standard idModelo 1 - idVeiculo 1, 5 - idMes 48 - idAno = 7
update VendasAnuais set idMesdaVenda = 48, idAnodaVenda = 7 where idVeiculo in (1, 5)

-- Executive idModelo 3 - idVeiculo 2, 6 - idMes 42 - idAno = 8
update VendasAnuais set idMesdaVenda = 42, idAnodaVenda = 8 where idVeiculo in (2, 6)

select * from VendasAnuais 

Select * from Veiculo 
