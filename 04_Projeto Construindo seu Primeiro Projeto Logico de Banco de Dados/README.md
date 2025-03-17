# 🛠️ Construindo seu Primeiro Projeto Lógico de Banco de Dados

📝 Descrição do Projeto

Este projeto tem como objetivo criar um banco de dados lógico para uma aplicação de vendas online. O esquema lógico foi projetado com base em tabelas que representam usuários, vendedores, produtos, pedidos, cupons de desconto, devoluções e mais. Utilizamos boas práticas para garantir integridade, consistência e eficiência no gerenciamento de dados.

💡 Funcionalidades Principais

    * Gerenciamento completo de usuários e vendedores.

    * Controle de estoque e cadastro de produtos.

    * Processamento de pedidos com associação de itens, descontos e pagamentos.

    * Rastreamento de avaliações de produtos pelos usuários.

    * Suporte a relatórios e consultas complexas utilizando JOINs e agregações.

📦 Estrutura do Banco de Dados

O banco de dados contém as seguintes tabelas principais:

    * 👤 Usuários: Dados pessoais, contatos e endereço.

    * 🛍️ Produtos: Informações detalhadas, incluindo preço, estoque e vendedores associados.

    * 📦 Pedidos: Registro de compras feitas por usuários com status e frete.

    * 🔧 Avaliações: Feedback dos clientes sobre os produtos.

    * 📄 Cupons de Desconto: Controle de promoções e cupons usados.

    * 📊 Relatórios: Consultas para análise de dados, como total de pedidos por cliente.

🚀 Consultas Exemplares

Alguns exemplos de consultas implementadas no projeto:
```sql
    1. Listagem de Produtos:
    SELECT * FROM produtos;

    2. Filtragem de Usuários:
    SELECT * FROM usuarios WHERE nome_cliente = 'Carlos Oliveira';

    3. Atributos Derivados:
    SELECT id_pedidos, frete, frete * 0.1 AS Desconto 
    FROM pedidos;

    4. Ordenação por Data:
    SELECT * FROM pedidos ORDER BY data_pedido DESC;

    5. Junção de Múltiplas Tabelas:
    SELECT usuarios.nome_cliente, produtos.nome_produto, pedidos.data_pedido 
    FROM pedidos 
    JOIN usuarios ON pedidos.usuarios_idusuarios = usuarios.idusuarios 
    JOIN itenspedido ON pedidos.id_pedidos = itenspedido.pedidos_idpedidos 
    JOIN produtos ON itenspedido.produtos_idprodutos = produtos.id_produtos;

⚙️ Como Executar

    1. Clone este repositório:
    
    git clone <URL_DO_REPOSITORIO>

    2. Crie e configure o banco de dados utilizando as instruções SQL fornecidas.

    3. Utilize ferramentas como MySQL Workbench ou DBeaver para gerenciar e executar as queries.

📩 Contato

Caso tenha dúvidas ou sugestões, entre em contato:



