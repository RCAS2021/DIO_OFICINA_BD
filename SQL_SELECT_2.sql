-- Visualizar clientes
SELECT * FROM cliente;

-- Visualizar veiculos
SELECT * FROM veiculo;

-- Visualizar serviço
SELECT * FROM serviço;

-- Visualizar administrativo
SELECT * FROM administrativo;

-- Visualizar manutenção
SELECT * FROM manutenção;

-- Visualizar funcionario_manutenção
SELECT * FROM funcionario_manutenção;

-- Visualizar funcionario_administrativo
SELECT * FROM funcionario_administrativo;

-- Quantos clientes foram atendidos
SELECT count(*) FROM serviço, manutenção WHERE serviço.id_serviço = manutenção.serviço_id_serviço;

-- Quantos clientes foram atendidos por funcionario de manutenção
SELECT id_funcionario_manutenção, count(*) AS num_serviços FROM serviço, manutenção, funcionario_manutenção WHERE serviço.cliente_id_cliente = manutenção.serviço_id_serviço AND funcionario_manutenção.manutenção_serviço_id_serviço = manutenção.serviço_id_serviço GROUP BY funcionario_manutenção.id_funcionario_manutenção;

-- Quais funcionários possuem mais serviços realizados
SELECT * FROM funcionario_manutenção, manutenção WHERE funcionario_manutenção.manutenção_serviço_id_serviço = manutenção.serviço_id_serviço ORDER BY(SELECT count(*) AS num_serviços FROM serviço, manutenção, funcionario_manutenção WHERE serviço.cliente_id_cliente = manutenção.serviço_id_serviço AND funcionario_manutenção.manutenção_serviço_id_serviço = manutenção.serviço_id_serviço) DESC;

-- Quais veiculos mais utilizados
select modelo, count(*) as num_veiculos from veiculo group by modelo;

-- Relação veiculo-cliente
select * from veiculo inner join cliente on veiculo_id_veiculo = id_veiculo;

-- Relação funcionario_manutenção-serviço
select * from funcionario_manutenção inner join serviço on id_serviço = manutenção_serviço_id_serviço;

-- Relação funcionario_manutenção-serviço -> quais funcionarios não realizaram serviços
select * from funcionario_manutenção left join serviço on id_serviço = manutenção_serviço_id_serviço;

-- Relação funcionario_manutenção-serviço -> quais serviços não possuem funcionarios realizando
select * from funcionario_manutenção right join serviço on id_serviço = manutenção_serviço_id_serviço;