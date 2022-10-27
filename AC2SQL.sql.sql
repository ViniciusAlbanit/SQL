-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSQL - AC02 - DDL E DML
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* * * * * * INFORMAÇÕES DO GRUPO * * * * *

NOME COMPLETO:	Vinicius Farias Albanit			RA:2200420
NOME COMPLETO:		Gabryel Navarro		RA:2200213
NOME COMPLETO:				RA:
NOME COMPLETO:				RA:
NOME COMPLETO:				RA:
*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table banco
(
numeracao smallint identity(300, -1),
nome varchar(50) not null,
constraint uqNome unique(nome),
nascimento date constraint cknascimento check(nascimento>'19980101') not null, 
remuneracao decimal(9,2) constraint remuneracao check(remuneracao>='1200' and remuneracao<='50000'),
cargos tinyint constraint dfcargos default(0),
constraint uknumeracao primary key (numeracao)
)
select * from banco
insert into banco( nome, nascimento, remuneracao, cargos) 
values ('Vinicius', '20020101', 1500, 0)
insert into banco( nome, nascimento, remuneracao, cargos) 
values ('Gabryel', '20010117', 4375, 0)
update banco set remuneracao = (remuneracao * 25/100) + remuneracao where numeracao = 291
delete from banco where nome, nascimento, remuneracao, cargos
 