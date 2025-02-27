-- Criação das tabelas
CREATE TABLE usuarios (
  idusuarios INT PRIMARY KEY,
  nome_cliente VARCHAR(100) NOT NULL,
  email_cliente VARCHAR(100) NOT NULL UNIQUE,
  telefone_cliente VARCHAR(20),
  endereco_cliente VARCHAR(255),
  senha_cliente VARCHAR(15) NOT NULL,
  documento_cliente VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE vendedores (
  idvendedores INT PRIMARY KEY,
  nome_vendedor VARCHAR(100) NOT NULL,
  email_vendedor VARCHAR(100) NOT NULL UNIQUE,
  telefone_vendedor VARCHAR(20),
  tipo_documento ENUM('cpf', 'cnpj') NOT NULL,
  numero_documento VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE produtos (
  id_produtos INT PRIMARY KEY,
  nome_produto VARCHAR(100) NOT NULL,
  descricao_produto TINYTEXT,
  preco_produto DECIMAL(10,2) NOT NULL CHECK(preco_produto >= 0),
  quantidade_estoque INT NOT NULL CHECK(quantidade_estoque >= 0),
  vendedores_idvendedores INT,
  fornecedores_idfornecedores INT,
  FOREIGN KEY (vendedores_idvendedores) REFERENCES vendedores(idvendedores),
  FOREIGN KEY (fornecedores_idfornecedores) REFERENCES fornecedores(idfornecedores)
);

CREATE TABLE fornecedores (
  idfornecedores INT PRIMARY KEY,
  nome_fornecedor VARCHAR(100) NOT NULL,
  email_fornecedor VARCHAR(100) NOT NULL UNIQUE,
  telefone_fornecedor VARCHAR(20),
  endereco_fornecedor VARCHAR(255),
  documento_fornecedor VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE pedidos (
  id_pedidos INT PRIMARY KEY,
  data_pedido DATETIME NOT NULL,
  status_pedido VARCHAR(50) NOT NULL,
  frete DECIMAL(10,2) NOT NULL CHECK(frete >= 0),
  usuarios_idusuarios INT,
  FOREIGN KEY (usuarios_idusuarios) REFERENCES usuarios(idusuarios)
);

CREATE TABLE itenspedido (
  id_itenspedido INT PRIMARY KEY,
  quantidade INT NOT NULL CHECK(quantidade > 0),
  preco_total DECIMAL(10,2) NOT NULL CHECK(preco_total >= 0),
  pedidos_idpedidos INT,
  produtos_idprodutos INT,
  FOREIGN KEY (pedidos_idpedidos) REFERENCES pedidos(id_pedidos),
  FOREIGN KEY (produtos_idprodutos) REFERENCES produtos(id_produtos)
);

CREATE TABLE avaliacoesprodutos (
  id_avaliacoesprodutos INT PRIMARY KEY,
  nota INT NOT NULL CHECK(nota BETWEEN 1 AND 5),
  comentario TINYTEXT,
  produtos_idprodutos INT,
  usuarios_idusuarios INT,
  FOREIGN KEY (produtos_idprodutos) REFERENCES produtos(id_produtos),
  FOREIGN KEY (usuarios_idusuarios) REFERENCES usuarios(idusuarios)
);

CREATE TABLE categoriasprodutos (
  id_categoriasprodutos INT PRIMARY KEY,
  nome_categoria VARCHAR(100) NOT NULL,
  produtos_idprodutos INT,
  FOREIGN KEY (produtos_idprodutos) REFERENCES produtos(id_produtos)
);

CREATE TABLE enderecosusuarios (
  idenderecosusuarios INT PRIMARY KEY,
  idusuarios INT,
  endereco_usuario VARCHAR(255) NOT NULL,
  FOREIGN KEY (idusuarios) REFERENCES usuarios(idusuarios)
);

CREATE TABLE produtoscategoria (
  idprodutoscategoria INT PRIMARY KEY,
  idprodutos INT,
  idcategoriasprodutos INT,
  FOREIGN KEY (idprodutos) REFERENCES produtos(id_produtos),
  FOREIGN KEY (idcategoriasprodutos) REFERENCES categoriasprodutos(id_categoriasprodutos)
);

CREATE TABLE pagamentos (
  idpagamentos INT PRIMARY KEY,
  idpedidos INT,
  valor_pagamento DECIMAL(10,2) NOT NULL CHECK(valor_pagamento >= 0),
  metodo_pagamento ENUM('cartao de credito', 'boleto bancario', 'pix') NOT NULL,
  data_pagamento DATETIME NOT NULL,
  FOREIGN KEY (idpedidos) REFERENCES pedidos(id_pedidos)
);

CREATE TABLE fornecedoresprodutos (
  idfornecedoresprodutos INT PRIMARY KEY,
  idfornecedores INT,
  idprodutos INT,
  FOREIGN KEY (idfornecedores) REFERENCES fornecedores(idfornecedores),
  FOREIGN KEY (idprodutos) REFERENCES produtos(id_produtos)
);

CREATE TABLE cuponsdesconto (
  idcuponsdesconto INT PRIMARY KEY,
  codigo_cupom VARCHAR(50) NOT NULL UNIQUE,
  desconto DECIMAL(5,2) NOT NULL CHECK(desconto >= 0),
  validade DATE NOT NULL
);

CREATE TABLE cuponsusados (
  idcuponsusados INT PRIMARY KEY,
  idcuponsdesconto INT,
  idusuarios INT,
  idpedidos INT,
  FOREIGN KEY (idcuponsdesconto) REFERENCES cuponsdesconto(idcuponsdesconto),
  FOREIGN KEY (idusuarios) REFERENCES usuarios(idusuarios),
  FOREIGN KEY (idpedidos) REFERENCES pedidos(id_pedidos)
);

CREATE TABLE devolucoes (
  iddevolucoes INT PRIMARY KEY,
  idpedidos INT,
  motivo_devolucao VARCHAR(255) NOT NULL,
  data_devolucao DATETIME NOT NULL,
  FOREIGN KEY (idpedidos) REFERENCES pedidos(id_pedidos)
);

CREATE TABLE estoques (
  idestoques INT PRIMARY KEY,
  idprodutos INT,
  quantidade INT NOT NULL CHECK(quantidade >= 0),
  FOREIGN KEY (idprodutos) REFERENCES produtos(id_produtos)
);

-- Inserção de dados nas tabelas com exemplos fictícios
INSERT INTO produtos (nome_produto, descricao_produto, preco_produto, quantidade_estoque, vendedores_idvendedores) VALUES ('Smartphone X', 'Smartphone de última geração', 2999.99, 150, 2);
INSERT INTO usuarios (idusuarios, nome_cliente, email_cliente, telefone_cliente, endereco_cliente, senha_cliente, documento_cliente) VALUES (2, 'Carlos Oliveira', 'carlos_oliveira@gmail.com', '9888-7777', 'Rua B, 789', 'senha321', '987.654.321-00');
INSERT INTO pedidos (id_pedidos, data_pedido, status_pedido, frete, usuarios_idusuarios) VALUES (2, '2025-03-01', 'Concluído', 30.00, 2);

-- Recuperações simples com SELECT Statement
SELECT * FROM produtos;

-- Filtros com WHERE Statement
SELECT * FROM usuarios WHERE nome_cliente = 'Carlos Oliveira';

-- Expressões para gerar atributos derivados
SELECT id_pedidos, frete, frete * 0.1 AS Desconto 
FROM pedidos;

-- Ordenações dos dados com ORDER BY
SELECT * FROM pedidos ORDER BY data_pedido DESC;

-- Condições de filtros aos grupos – HAVING Statement
SELECT usuarios_idusuarios, COUNT(*) AS Total_Pedidos 
FROM pedidos 
GROUP BY usuarios_idusuarios 
HAVING COUNT(*) > 1;

-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT usuarios.nome_cliente, produtos.nome_produto, pedidos.data_pedido 
FROM pedidos 
JOIN usuarios ON pedidos.usuarios_idusuarios = usuarios.idusuarios 
JOIN itenspedido ON pedidos.id_pedidos = itenspedido.pedidos_idpedidos 
JOIN produtos ON itenspedido.produtos_idprodutos = produtos.id_produtos;
