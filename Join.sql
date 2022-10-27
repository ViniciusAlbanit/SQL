create table fornecedor(
idfornecedor smallint,
nome varchar(50) not null,
telefone varchar(9) not null,
contato varchar(15) not null
constraint ukfornecedor primary key (idfornecedor)
)
create table cor(
idcor smallint,
descricao varchar(50) not null
constraint ukcor primary key (idcor)
)
create table produto(
idproduto smallint, 
codigo varchar(6) not null,
nome varchar(50) not null,
estoque tinyint check(estoque < 2000) not null,
descontinuado smallint constraint dfdescontinuado default(0) not null,
idfornecedor smallint not null,
idcor smallint not null,
constraint fkproduto_idfornecedor foreign key (idfornecedor) references fornecedor(idfornecedor),
constraint fkproduto_idcor foreign key (idcor) references cor(idcor)
)
select * from produto
insert into cor(idcor, descricao) values (1, 'Branco'), 
										 (2, 'Preto'),
										 (3, 'Azul'),
										 (4, 'Vermelho'),
										 (5, 'Amarelo'),
										 (6, 'Turquesa'),
										 (7, 'Marrom'),
										 (8, 'Roxo'),
										 (9, 'Dourado'),
										 (10, 'Verde')
insert into fornecedor(idfornecedor, nome, telefone, contato) values (2, 'Motorola', '7987-9900', 'Cristina'),
																	 (3, 'Asus', '4576-1120', 'Felipe'),
																	 (4, 'Nokia', '6755-5656', 'Fábio')
insert into produto(idproduto, codigo, nome, estoque, descontinuado, idfornecedor, idcor)
values (2, 'RQ765B', 'Nokia', 21, 1, 4, 4),
	   (3, 'WD528B', 'Moto X', 3, 0, 2, 5),
	   (4, 'TF897A', 'Xperia', 7, 1, 1, 1),
	   (5, 'RF212B', 'Moto Maxx', 2, 0, 2, 1),
	   (6, 'VI346N', 'Xiaomi', 4, 1, 2, 8),
	   (7, 'DE298D', 'Iphone 8 max', 1, 1, 3, 8),
	   (8, 'BR122V', 'Moto G 60', 10, 0, 2, 10),
	   (9, 'ME567B', 'Xiomi note 9', 7, 1, 2, 6),
	   (10, 'GR143V', 'Moto G 6', 2, 0, 2, 9),
	   (11, 'MI699P', 'Asus', 8, 1, 3, 3),
	   (12, 'PR786N', 'Play 5', 1, 0, 1, 9),
	   (13, 'XP899B', 'Nokia 1', 19, 1, 4, 2),
	   (14, 'GT790A', 'Moto G 10', 5, 0, 2, 5),
	   (15, 'JK090K', 'Asus Z', 8, 1, 3, 10)

select P.codigo, P.nome as 'Nome do Produto', P.estoque, P.descontinuado, F.nome as 'Nome do Fornecedor'
from produto as P join fornecedor as F on P.idfornecedor = F.idfornecedor 

select P.codigo, P.nome as 'Nome do Produto', P.estoque, P.descontinuado, F.nome as 'Nome do Fornecedor'
from produto as P join fornecedor as F on P.idfornecedor = F.idfornecedor where P.estoque between 7 and 21 and P.descontinuado = 1

select P.codigo, P.nome as 'Nome do Produto', P.estoque, P.descontinuado, F.nome as 'Nome do Fornecedor', C.descricao as Cor
from produto as P join fornecedor as F on P.idfornecedor = F.idfornecedor join cor as C on P.idcor = C.idcor
where C.idcor between 1 and 3

select P.codigo, P.nome as 'Nome do Produto', P.estoque, P.descontinuado, F.nome as 'Nome do Fornecedor', C.descricao as Cor
from produto as P join fornecedor as F on P.idfornecedor = F.idfornecedor join cor as C on P.idcor = C.idcor
where C.descricao between 1 and 2

select P.codigo, P.nome as 'Nome do Produto', P.estoque, P.descontinuado, F.nome as 'Nome do Fornecedor',F.contato as 'Contato do Fornecedor' , C.descricao as Cor
from produto as P join fornecedor as F on P.idfornecedor = F.idfornecedor join cor as C on P.idcor = C.idcor
where F.contato like 'F%';

select P.codigo, P.nome as 'Nome do Produto', P.estoque, P.descontinuado, F.nome as 'Nome do Fornecedor',F.contato as 'Contato do Fornecedor' ,F.telefone as 'Telefone do Fornecedor', C.descricao as Cor
from produto as P join fornecedor as F on P.idfornecedor = F.idfornecedor join cor as C on P.idcor = C.idcor
where F.contato like 'F%' and F.telefone like '%0';

																	 

