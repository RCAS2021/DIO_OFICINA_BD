use oficina;

INSERT INTO veiculo(marca,modelo, placa,ano_veiculo) VALUES
					('Marca1','Modelo1','Placa1',2008),
                    ('Marca2','Modelo2','Placa2',2012),
                    ('Marca3','Modelo3','Placa3',2016)
;

INSERT INTO cliente(nome,idade, veiculo_id_veiculo) VALUES
					('Nome1',18,1),
                    ('Nome2',22,2),
                    ('Nome3',26,3)
;

INSERT INTO serviço(cliente_id_cliente, cliente_veiculo_id_veiculo) VALUES
					(1,1),
					(2,2),
                    (3,3)
;

INSERT INTO manutenção(serviço_id_serviço, serviço_cliente_id_cliente, serviço_cliente_veiculo_id_veiculo) VALUES
						(1,1,1),
                        (2,2,2),
                        (3,3,3)
;

INSERT INTO funcionario_manutenção(nome_funcionario_manutenção, especialidade_manutenção, manutenção_id_manutenção, manutenção_serviço_id_serviço, manutenção_serviço_cliente_id_cliente, manutenção_serviço_cliente_veiculo_id_veiculo) VALUES
									('Nome1','Especialidade1',1,1,1,1),
                                    ('Nome2','Especialidade2',2,2,2,2),
                                    ('Nome3','Especialidade3',3,3,3,3)
;

INSERT INTO administrativo(serviço_id_serviço, serviço_cliente_id_cliente, serviço_cliente_veiculo_id_veiculo) VALUES
							(1,1,1),
                            (2,2,2),
                            (3,3,3)
;

INSERT INTO funcionario_administrativo(nome, função, administrativo_id_administrativo, administrativo_serviço_id_serviço, administrativo_serviço_cliente_id_cliente, administrativo_serviço_cliente_veiculo_id_veiculo) VALUES
										('Nome1','Função1',1,1,1,1),
                                        ('Nome2','Função3',2,2,2,2),
                                        ('Nome3','Função3',3,3,3,3)
;



