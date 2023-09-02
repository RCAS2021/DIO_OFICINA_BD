DROP DATABASE IF EXISTS oficina;
CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

CREATE TABLE IF NOT EXISTS veiculo(
	id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(45) NOT NULL,
    modelo VARCHAR(45)  NOT NULL, 
    placa VARCHAR(8)  NOT NULL,
    ano_veiculo VARCHAR(4)  NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
	veiculo_id_veiculo INT NOT NULL,
    CONSTRAINT fk_cliente_veiculo FOREIGN KEY cliente(veiculo_id_veiculo) REFERENCES veiculo(id_veiculo)
);


CREATE TABLE IF NOT EXISTS serviço(
	id_serviço INT AUTO_INCREMENT,
	cliente_id_cliente INT,
	cliente_veiculo_id_veiculo INT,
	PRIMARY KEY(id_serviço, cliente_id_cliente, cliente_veiculo_id_veiculo),
	CONSTRAINT fk_serviço_cliente FOREIGN KEY serviço(cliente_id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT fk_serviço_veiculo FOREIGN KEY serviço(cliente_veiculo_id_veiculo) REFERENCES cliente(veiculo_id_veiculo)
);

CREATE TABLE IF NOT EXISTS manutenção(
	id_manutenção INT AUTO_INCREMENT,
    serviço_id_serviço INT,
    serviço_cliente_id_cliente INT,
    serviço_cliente_veiculo_id_veiculo INT,
    PRIMARY KEY(id_manutenção, serviço_id_serviço, serviço_cliente_id_cliente, serviço_cliente_veiculo_id_veiculo),
    CONSTRAINT fk_manutenção_serviço FOREIGN KEY manutenção(serviço_id_serviço) REFERENCES serviço(id_serviço),
    CONSTRAINT fk_manutenção_cliente FOREIGN KEY manutenção(serviço_cliente_id_cliente) REFERENCES serviço(cliente_id_cliente),
    CONSTRAINT fk_manutenção_veiculo FOREIGN KEY manutenção(serviço_cliente_veiculo_id_veiculo) REFERENCES serviço(cliente_veiculo_id_veiculo)
);

CREATE TABLE IF NOT EXISTS funcionario_manutenção(
	id_funcionario_manutenção INT AUTO_INCREMENT,
    nome_funcionario_manutenção VARCHAR(45) NOT NULL, 
    especialidade_manutenção VARCHAR(45), 
    manutenção_id_manutenção INT, 
    manutenção_serviço_id_serviço INT, 
    manutenção_serviço_cliente_id_cliente INT, 
    manutenção_serviço_cliente_veiculo_id_veiculo INT,
	PRIMARY KEY(id_funcionario_manutenção, manutenção_id_manutenção, manutenção_serviço_id_serviço, manutenção_serviço_cliente_id_cliente, manutenção_serviço_cliente_veiculo_id_veiculo),
    CONSTRAINT fk_funcionario_manutenção_manutenção FOREIGN KEY funcionario_manutenção(manutenção_id_manutenção) REFERENCES manutenção(id_manutenção),
    CONSTRAINT fk_funcionario_manutenção_serviço FOREIGN KEY funcionario_manutenção(manutenção_serviço_id_serviço) REFERENCES manutenção(serviço_id_serviço),
    CONSTRAINT fk_funcionario_manutenção_cliente FOREIGN KEY funcionario_manutenção(manutenção_serviço_cliente_id_cliente) REFERENCES manutenção(serviço_cliente_id_cliente),
    CONSTRAINT fk_funcionario_manutenção_veiculo FOREIGN KEY funcionario_manutenção(manutenção_serviço_cliente_veiculo_id_veiculo) REFERENCES manutenção(serviço_cliente_veiculo_id_veiculo)
);

CREATE TABLE IF NOT EXISTS administrativo(
	id_administrativo INT AUTO_INCREMENT,
    serviço_id_serviço INT,
    serviço_cliente_id_cliente INT,
    serviço_cliente_veiculo_id_veiculo INT,
    PRIMARY KEY(id_administrativo, serviço_id_serviço, serviço_cliente_id_cliente, serviço_cliente_veiculo_id_veiculo),
    CONSTRAINT fk_administrativo_serviço FOREIGN KEY administrativo(serviço_id_serviço) REFERENCES serviço(id_serviço),
    CONSTRAINT fk_administrativo_cliente FOREIGN KEY adminsitrativo(serviço_cliente_id_cliente) REFERENCES serviço(cliente_id_cliente),
    CONSTRAINT fk_adminstrativo_veiculo FOREIGN KEY administrativo(serviço_cliente_veiculo_id_veiculo) REFERENCES serviço(cliente_veiculo_id_veiculo)
);

CREATE TABLE IF NOT EXISTS funcionario_administrativo(
	id_funcionario_adm INT AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    função VARCHAR(45) NOT NULL,
    administrativo_id_administrativo INT,
    administrativo_serviço_id_serviço INT,
    administrativo_serviço_cliente_id_cliente INT,
    administrativo_serviço_cliente_veiculo_id_veiculo INT,
    PRIMARY KEY(id_funcionario_adm, administrativo_id_administrativo, administrativo_serviço_id_serviço, administrativo_serviço_cliente_id_cliente, administrativo_serviço_cliente_veiculo_id_veiculo),
    CONSTRAINT fk_administrativo_administrativo FOREIGN KEY funcionario_administrativo(administrativo_id_administrativo) REFERENCES administrativo(id_administrativo),
    CONSTRAINT fk__funcionario_administrativo_serviço FOREIGN KEY funcionario_administrativo(administrativo_serviço_id_serviço) REFERENCES administrativo(serviço_id_serviço),
    CONSTRAINT fk__funcionario_administrativo_cliente FOREIGN KEY funcionario_administrativo(administrativo_serviço_cliente_id_cliente) REFERENCES administrativo(serviço_cliente_id_cliente),
    CONSTRAINT fk_funcionario_administrativo_veiculo FOREIGN KEY funcionario_administrativo(administrativo_serviço_cliente_veiculo_id_veiculo) REFERENCES administrativo(serviço_cliente_veiculo_id_veiculo)
);






