-- Entidade Empresa:
CREATE TABLE empresa (
id_empresa INT PRIMARY KEY,
nome VARCHAR NOT NULL,
endereco VARCHAR,
cnpj VARCHAR NOT NULL,
telefone VARCHAR,
email VARCHAR
);


-- Entidade Tecnologia:
CREATE TABLE tecnologia (
id_tec INT PRIMARY KEY,
nome VARCHAR NOT NULL,
descricao VARCHAR
);


-- Entidade Relatórios:
CREATE TABLE relatorio (
id_relatorio INT PRIMARY KEY,
data_compilacao DATE NOT NULL,
empresa_id INT NOT NULL,
tecnologia_id INT NOT NULL,
FOREIGN KEY (empresa_id) REFERENCES empresa(id_empresa),
FOREIGN KEY (tecnologia_id) REFERENCES tecnologia(id_tec)
);
