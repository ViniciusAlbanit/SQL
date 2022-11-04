-- 1. Traga o nome dos fabricantes que possuam mais de 5 letras.
select nome from Fabricante where len(nome) > 5


-- 2. Traga o nome dos fabricantes que terminem com a letra “i”.
select nome from Fabricante where right(nome, 1) = 'i'
select nome from Fabricante where nome like '%i'


-- 3. Concatene numa coluna com o nome “CONCATENA”, composta pela 1ª. e última letra dos nomes de cada fabricante 
--   (ambas maiúsculas).
select upper(left(nome, 1) + right(nome, 1)) as 'Concatena' from Fabricante

-- 4. Retorne o endereço dos fabricantes substituindo a palavra “Av.” por “Avenida”.
select replace(endereco, 'Av.', 'Avenida') as 'Endereço' from Fabricante

-- 5. Utilizando o predicado LIKE, traga os endereços que contenha a palavra “DA”.
select endereco from Fabricante where endereco like '%da%'

-- 6. Utilizando a função CHARINDEX, traga os endereços que contenha a palavra “DA”.
select endereco from Fabricante where charindex('da', endereco) <> 0
select endereco, charindex('da', endereco) from Fabricante where charindex('da', endereco) <> 0

-- 7. Liste os 8 primeiros telefones da tabela Fabricante, separando por hífen os primeiros 4 dígitos, dos últimos dígitos.
-- update Fabricante set telefone = replace(telefone, '-', '')
select endereco from Fabricante 
select top 8 left(telefone, 4) + '-' + right(telefone, 4) as Telefone from Fabricante 

-- 8. Na tabela fabricante, liste uma coluna de nome “NÚMERO” contendo apenas o número dos endereços.
select endereco, substring(endereco, charindex(',', endereco) + 2, len(endereco)) as 'Número' from Fabricante 



-- 9. Faça um JOIN entre Veículo e Fabricante, trazendo a Descrição do Veículo, a UF do Fabricante e através de um CASE, 
--    liste 
--     um campo de nome “REGIÃO”, colocando a região do Brasil referente a UF encontrada  (ex: Região Sul, Região Norte, ...). 

-- SUL (Santa Catarina, Rio Grande do Sul e Paraná)
-- NORTE (Tocantins, Acre, Pará, Rondônia, Roraima, Amapá e Amazonas) ...
-- CENTRO-OESTE (Mato Grosso, Mato Grosso do Sul, Goiás e Distrito Federal) ...
-- NORDESTE (Bahia, Sergipe, Alagoas, Paraíba, Pernambuco, Rio Grande do Norte, Ceará, Piauí e Maranhão) ...
-- SUDESTE (Espírito Santo, Rio de Janeiro, Minas Gerais e São Paulo)

select	V.descricao as 'Descrição do Veículo'
		, F.UF
		, case 
			when UF in ('RJ', 'SP', 'MG', 'ES') then 'Região Sudeste'
			when UF in ('PR', 'SC', 'RS') then 'Região Sul'
			when UF in ('MT', 'MS', 'GO', 'DF') then 'Região Centro-Oeste'
			when UF in ('BA', 'SE', 'AL', 'PB', 'PE', 'RN', 'CE', 'PI', 'MA') then 'Região Nordeste'
			when UF in ('TO', 'AC', 'PA', 'RO', 'RR', 'AP', 'AM') then 'Região Norte'
		end as 'Região' 
from	Fabricante as F inner join Veiculo as V on F.idFabricante = V.idFabricante

select * from Fabricante

-- 10. Partindo da query anterior,  com um outro CASE, liste uma coluna de nome “SEGMENTO DA VENDA”, onde o conteúdo deve 
--     seguir a seguinte regra:

	-- “Segmento 1” – quando a cidade for São Paulo
	-- “Segmento 2” – cidade do Rio de Janeiro
	-- “Segmento 3” – cidade de Curitiba 
	-- “Segmento 4” – qualquer outra cidade
select	V.descricao as 'Descrição do Veículo'
		, F.UF
		, case 
			when UF in ('RJ', 'SP', 'MG', 'ES') then 'Região Sudeste'
			when UF in ('PR', 'SC', 'RS') then 'Região Sul'
			when UF in ('MT', 'MS', 'GO', 'DF') then 'Região Centro-Oeste'
			when UF in ('BA', 'SE', 'AL', 'PB', 'PE', 'RN', 'CE', 'PI', 'MA') then 'Região Nordeste'
			when UF in ('TO', 'AC', 'PA', 'RO', 'RR', 'AP', 'AM') then 'Região Norte'
		end as 'Região' 
		, cidade
		, case cidade
			when 'Sao Paulo' then 'Segmento 1'
			when 'Rio de Janeiro' then 'Segmento 2'
			when 'Curitiba' then 'Segmento 3'
			else 'Segmento 4'
		end as 'Segmento da Venda' 
from	Fabricante as F inner join Veiculo as V on F.idFabricante = V.idFabricante