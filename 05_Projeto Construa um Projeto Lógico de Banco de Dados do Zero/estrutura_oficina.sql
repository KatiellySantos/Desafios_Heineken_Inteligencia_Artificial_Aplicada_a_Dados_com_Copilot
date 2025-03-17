-- Criação das tabelas
CREATE TABLE clientes (
    idclientes INT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    endereco_cliente VARCHAR(255),
    telefone_cliente VARCHAR(20),
    email_cliente VARCHAR(100)
);

CREATE TABLE veiculos (
    idveiculos INT PRIMARY KEY,
    placa_veiculo VARCHAR(10),
    modelo_veiculo VARCHAR(100),
    ano_veiculo INT,
    cor_veiculo VARCHAR(50),
    tipo_combustivel VARCHAR(50),
    clientes_idclientes INT,
    FOREIGN KEY (clientes_idclientes) REFERENCES clientes(idclientes)
);

CREATE TABLE ordens_de_servicos (
    idordens_de_servicos INT PRIMARY KEY,
    data_emissao DATETIME,
    valor_servico DECIMAL(10,2),
    status_servico VARCHAR(50),
    data_conclusao DATETIME,
    veiculos_idveiculos INT,
    equipes_idequipes INT,
    observacoes TEXT,
    FOREIGN KEY (veiculos_idveiculos) REFERENCES veiculos(idveiculos),
    FOREIGN KEY (equipes_idequipes) REFERENCES equipes(idequipes)
);

CREATE TABLE equipes (
    idequipes INT PRIMARY KEY,
    nome_equipe VARCHAR(100)
);

CREATE TABLE mecanicos (
    idmecanicos INT PRIMARY KEY,
    nome_mecanico VARCHAR(100),
    endereco_mecanico VARCHAR(255),
    telefone_mecanico VARCHAR(20),
    email_mecanico VARCHAR(100),
    especialidade_mecanico VARCHAR(100)
);

CREATE TABLE pecas (
    idpecas INT PRIMARY KEY,
    descricao_peca TEXT,
    valor_peca DECIMAL(10,2)
);

CREATE TABLE servico (
    idservico INT PRIMARY KEY,
    descricao_servico TEXT,
    valor_mao_de_obra DECIMAL(10,2)
);

CREATE TABLE itens_os (
    iditens_os INT PRIMARY KEY,
    servico_idservico INT,
    pecas_idpecas INT,
    ordens_de_servicos_idordens_de_servicos INT,
    FOREIGN KEY (servico_idservico) REFERENCES servico(idservico),
    FOREIGN KEY (pecas_idpecas) REFERENCES pecas(idpecas),
    FOREIGN KEY (ordens_de_servicos_idordens_de_servicos) REFERENCES ordens_de_servicos(idordens_de_servicos)
);

CREATE TABLE equipe_mecanicos (
    idequipemecanicos INT PRIMARY KEY,
    equipes_idequipes INT,
    mecanicos_idmecanicos INT,
    FOREIGN KEY (equipes_idequipes) REFERENCES equipes(idequipes),
    FOREIGN KEY (mecanicos_idmecanicos) REFERENCES mecanicos(idmecanicos)
);
