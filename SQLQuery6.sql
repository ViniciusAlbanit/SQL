select 200 + (( 500 / 20) * 10.5)
select 5.0 / 2.0
select top 100 nome, email from funcionario
select nome + sobrenome as 'nome completo' from funcionario
select matricula, nome, sobrenome, salario, bonus, (bonus + salario) as 'salario total' from funcionario
select DISTINCT cargo from funcionario
select nome, cargo, salario, ((salario * 7 / 100) + salario) as 'salario dissidio' from funcionario
