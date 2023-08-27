
CREATE TABLE empresas (
empresa_id VARCHAR(10) PRIMARY KEY,
nome VARCHAR(100),
endereco VARCHAR(100),
cnpj CHAR(14) UNIQUE,
telefone VARCHAR(13),
email VARCHAR(100),
horario_inicio TIME,
horario_termino TIME,
avaliacao VARCHAR(2)
);

CREATE TABLE produtos (
produto_id VARCHAR(10) PRIMARY KEY,
empresa_id VARCHAR(10),
nome VARCHAR(100),
preco DECIMAL(9,2),
descricao VARCHAR(255),
avaliacao VARCHAR(2),
FOREIGN KEY(empresa_id) REFERENCES empresas (empresa_id)
);

CREATE TABLE oportunidades (
oportunidade_id VARCHAR(10) PRIMARY KEY,
cargo VARCHAR(30),
salario DECIMAL(7,2),
descricao VARCHAR(255)
);

CREATE TABLE candidatos (
candidato_id VARCHAR(10) PRIMARY KEY,
contratacao_id VARCHAR(10),
cpf CHAR(11) UNIQUE,
rg VARCHAR(12) UNIQUE,
nome VARCHAR(100),
telefone VARCHAR(13),
email VARCHAR(100)
);

CREATE TABLE entregadores (
entregador_id VARCHAR(10) PRIMARY KEY,
periferia_id VARCHAR(10),
cpf CHAR(11) UNIQUE,
rg VARCHAR(12) UNIQUE,
nome VARCHAR(100),
telefone VARCHAR(13),
info_veiculo VARCHAR(100),
avaliacao_media VARCHAR(2)
);

CREATE TABLE parcerias_externas (
parcerias_id VARCHAR(10) PRIMARY KEY,
nome VARCHAR(100),
telefone VARCHAR(13),
email VARCHAR(100),
descricao VARCHAR(255)
);

CREATE TABLE periferias (
periferia_id VARCHAR(10) PRIMARY KEY,
nome VARCHAR(100),
localizacao VARCHAR(100),
populacao BIGINT,
descricao VARCHAR(255)
);



CREATE TABLE usuarios (
usuario_id VARCHAR(10) PRIMARY KEY,
periferia_id VARCHAR(10),
cpf CHAR(11) UNIQUE,
rg VARCHAR(12) UNIQUE,
nome VARCHAR(100),
telefone VARCHAR(13),
endereco VARCHAR(100),
data_cadastro DATE,
preferencias VARCHAR(255),
email VARCHAR(100),
FOREIGN KEY(periferia_id) REFERENCES periferias (periferia_id)
);

CREATE TABLE contratacoes (
contratacao_id VARCHAR(10) PRIMARY KEY,
data_inicio DATE,
desempenho VARCHAR(255),
observações VARCHAR(255),
beneficios VARCHAR(255)
);

CREATE TABLE menor_aprendiz (
menor_aprendiz_id VARCHAR(10) PRIMARY KEY,
periferia_id VARCHAR(10),
cpf CHAR(11) UNIQUE,
rg VARCHAR(12) UNIQUE,
nome VARCHAR(100),
data_nascimento DATE,
data_inicio DATE,
escola VARCHAR(100),
turno_escolar VARCHAR(5),
FOREIGN KEY(periferia_id) REFERENCES periferias (periferia_id)
);

CREATE TABLE oportunidades_candidatos (
oportunidades_candidatos_id VARCHAR(10) PRIMARY KEY,
candidato_id VARCHAR(10),
oportunidade_id VARCHAR(10),
data_candidatura DATE,
status VARCHAR(10),
FOREIGN KEY(candidato_id) REFERENCES candidatos (candidato_id),
FOREIGN KEY(oportunidade_id) REFERENCES oportunidades (oportunidade_id)
);

CREATE TABLE periferias_oportunidades (
periferias_oportunidades_id VARCHAR(10) PRIMARY KEY,
periferia_id VARCHAR(10),
oportunidade_id VARCHAR(10),
status VARCHAR(10),
data DATE,
FOREIGN KEY(periferia_id) REFERENCES periferias (periferia_id),
FOREIGN KEY(oportunidade_id) REFERENCES oportunidades (oportunidade_id)
);

CREATE TABLE periferias_empresas (
periferias_empresas_id VARCHAR(10) PRIMARY KEY,
periferia_id VARCHAR(10),
empresa_id VARCHAR(10),
tipo_relacao VARCHAR(100),
FOREIGN KEY(periferia_id) REFERENCES periferias (periferia_id),
FOREIGN KEY(empresa_id) REFERENCES empresas (empresa_id)
);

CREATE TABLE oportunidades_contratacoes (
oportunidades_contratacoes_id VARCHAR(10) PRIMARY KEY,
contratacao_id VARCHAR(10),
oportunidade_id VARCHAR(10),
FOREIGN KEY(contratacao_id) REFERENCES contratacoes (contratacao_id),
FOREIGN KEY(oportunidade_id) REFERENCES oportunidades (oportunidade_id)
);

CREATE TABLE periferias_parcerias (
periferias_parcerias_id VARCHAR(10) PRIMARY KEY,
parcerias_id VARCHAR(10),
periferia_id VARCHAR(10),
data_inicio DATE,
benificio VARCHAR(255),
FOREIGN KEY(parcerias_id) REFERENCES parcerias_externas (parcerias_id),
FOREIGN KEY(periferia_id) REFERENCES periferias (periferia_id)
);

CREATE TABLE entregadores_usuarios (
entregadores_usuarios_id VARCHAR(10) PRIMARY KEY,
usuario_id VARCHAR(10),
entregador_id VARCHAR(10),
horario_entrega DATETIME,
avaliacao VARCHAR(2),
FOREIGN KEY(usuario_id) REFERENCES usuarios (usuario_id),
FOREIGN KEY(entregador_id) REFERENCES entregadores (entregador_id)
);

CREATE TABLE empresas_entregadores (
empresas_entregadores_id VARCHAR(10) PRIMARY KEY,
entregador_id VARCHAR(10),
empresa_id VARCHAR(10),
horario_contato DATETIME,
horario_recebimento DATETIME,
taxa_entrega NUMERIC(3),
FOREIGN KEY(entregador_id) REFERENCES entregadores (entregador_id),
FOREIGN KEY(empresa_id) REFERENCES empresas (empresa_id)
);

ALTER TABLE candidatos ADD FOREIGN KEY(contratacao_id) REFERENCES contratacoes (contratacao_id);
ALTER TABLE entregadores ADD FOREIGN KEY(periferia_id) REFERENCES periferias (periferia_id);
