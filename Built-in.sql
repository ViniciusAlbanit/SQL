-- 1. Traga o nome dos fabricantes que possuam mais de 5 letras.
select nome from Fabricante where len(nome) > 5


-- 2. Traga o nome dos fabricantes que terminem com a letra �i�.
select nome from Fabricante where right(nome, 1) = 'i'
select nome from Fabricante where nome like '%i'


-- 3. Concatene numa coluna com o nome �CONCATENA�, composta pela 1�. e �ltima letra dos nomes de cada fabricante 
--   (ambas mai�sculas).
select upper(left(nome, 1) + right(nome, 1)) as 'Concatena' from Fabricante

-- 4. Retorne o endere�o dos fabricantes substituindo a palavra �Av.� por �Avenida�.
select replace(endereco, 'Av.', 'Avenida') as 'Endere�o' from Fabricante

-- 5. Utilizando o predicado LIKE, traga os endere�os que contenha a palavra �DA�.
select endereco from Fabricante where endereco like '%da%'

-- 6. Utilizando a fun��o CHARINDEX, traga os endere�os que contenha a palavra �DA�.
select endereco from Fabricante where charindex('da', endereco) <> 0
select endereco, charindex('da', endereco) from Fabricante where charindex('da', endereco) <> 0

-- 7. Liste os 8 primeiros telefones da tabela Fabricante, separando por h�fen os primeiros 4 d�gitos, dos �ltimos d�gitos.
-- update Fabricante set telefone = replace(telefone, '-', '')
select endereco from Fabricante 
select top 8 left(telefone, 4) + '-' + right(telefone, 4) as Telefone from Fabricante 

-- 8. Na tabela fabricante, liste uma coluna de nome �N�MERO� contendo apenas o n�mero dos endere�os.
select endereco, substring(endereco, charindex(',', endereco) + 2, len(endereco)) as 'N�mero' from Fabricante 



-- 9. Fa�a um JOIN entre Ve�culo e Fabricante, trazendo a Descri��o do Ve�culo, a UF do Fabricante e atrav�s de um CASE, 
--    liste 
--     um campo de nome �REGI�O�, colocando a regi�o do Brasil referente a UF encontrada  (ex: Regi�o Sul, Regi�o Norte, ...). 

-- SUL (Santa Catarina, Rio Grande do Sul e Paran�)
-- NORTE (Tocantins, Acre, Par�, Rond�nia, Roraima, Amap� e Amazonas) ...
-- CENTRO-OESTE (Mato Grosso, Mato Grosso do Sul, Goi�s e Distrito Federal) ...
-- NORDESTE (Bahia, Sergipe, Alagoas, Para�ba, Pernambuco, Rio Grande do Norte, Cear�, Piau� e Maranh�o) ...
-- SUDESTE (Esp�rito Santo, Rio de Janeiro, Minas Gerais e S�o Paulo)

select	V.descricao as 'Descri��o do Ve�culo'
		, F.UF
		, case 
			when UF in ('RJ', 'SP', 'MG', 'ES') then 'Regi�o Sudeste'
			when UF in ('PR', 'SC', 'RS') then 'Regi�o Sul'
			when UF in ('MT', 'MS', 'GO', 'DF') then 'Regi�o Centro-Oeste'
			when UF in ('BA', 'SE', 'AL', 'PB', 'PE', 'RN', 'CE', 'PI', 'MA') then 'Regi�o Nordeste'
			when UF in ('TO', 'AC', 'PA', 'RO', 'RR', 'AP', 'AM') then 'Regi�o Norte'
		end as 'Regi�o' 
from	Fabricante as F inner join Veiculo as V on F.idFabricante = V.idFabricante

select * from Fabricante

-- 10. Partindo da query anterior,  com um outro CASE, liste uma coluna de nome �SEGMENTO DA VENDA�, onde o conte�do deve 
--     seguir a seguinte regra:

	-- �Segmento 1� � quando a cidade for S�o Paulo
	-- �Segmento 2� � cidade do Rio de Janeiro
	-- �Segmento 3� � cidade de Curitiba 
	-- �Segmento 4� � qualquer outra cidade
select	V.descricao as 'Descri��o do Ve�culo'
		, F.UF
		, case 
			when UF in ('RJ', 'SP', 'MG', 'ES') then 'Regi�o Sudeste'
			when UF in ('PR', 'SC', 'RS') then 'Regi�o Sul'
			when UF in ('MT', 'MS', 'GO', 'DF') then 'Regi�o Centro-Oeste'
			when UF in ('BA', 'SE', 'AL', 'PB', 'PE', 'RN', 'CE', 'PI', 'MA') then 'Regi�o Nordeste'
			when UF in ('TO', 'AC', 'PA', 'RO', 'RR', 'AP', 'AM') then 'Regi�o Norte'
		end as 'Regi�o' 
		, cidade
		, case cidade
			when 'Sao Paulo' then 'Segmento 1'
			when 'Rio de Janeiro' then 'Segmento 2'
			when 'Curitiba' then 'Segmento 3'
			else 'Segmento 4'
		end as 'Segmento da Venda' 
from	Fabricante as F inner join Veiculo as V on F.idFabricante = V.idFabricante