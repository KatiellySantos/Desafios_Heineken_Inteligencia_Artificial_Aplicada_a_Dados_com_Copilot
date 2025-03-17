# 🛠️ Construa um Projeto Lógico de Banco de Dados do Zero

📝 Descrição do Projeto

Este projeto consiste em criar e implementar um banco de dados lógico do zero para gerenciar dados de uma oficina mecânica. O foco está na organização das tabelas e relações, garantindo eficiência e integridade no armazenamento e recuperação de informações.

💡 Objetivos

    * Estruturar um banco de dados relacional com tabelas para clientes, veículos, ordens de serviço, equipes, mecânicos, peças e serviços.

    * Permitir consultas detalhadas que forneçam insights e atendam às necessidades operacionais da oficina.

    * Assegurar boas práticas no uso de chaves primárias, estrangeiras e integridade referencial.

📦 Estrutura do Banco de Dados

As principais tabelas do banco incluem:

    * 👤 Clientes: Informações básicas, como nome, endereço e telefone.

    * 🚗 Veículos: Dados do veículo, incluindo modelo, ano, cor e tipo de combustível.

    * 📋 Ordens de Serviços: Registro de serviços realizados, datas e status.

    * 🛠️ Equipes e Mecânicos: Estrutura das equipes e detalhes dos mecânicos, como especialidades.

    * 🔩 Peças e Serviços: Descrição das peças utilizadas e serviços oferecidos.

    * 📦 Itens da Ordem de Serviço: Associação de serviços e peças às ordens de serviço.

🚀 Consultas Exemplares

Exemplos de consultas SQL implementadas:
```sql
    1. Listagem de Veículos:
    SELECT * FROM veiculos;

    2. Filtragem de Clientes:
    SELECT * FROM clientes WHERE nome_cliente = 'Joao Silva';

    3. Atributos Derivados:
    SELECT idordens_de_servicos, valor_servico, valor_servico * 0.1 AS Desconto 
    FROM ordens_de_servicos 
    JOIN servico ON ordens_de_servicos.servico_idservico = servico.idservico;

    4. Ordenação por Data:
    SELECT * FROM ordens_de_servicos ORDER BY data_emissao DESC;

    5. Junção entre Tabelas:
    SELECT clientes.nome_cliente, veiculos.modelo_veiculo, servico.descricao_servico 
    FROM ordens_de_servicos 
    JOIN clientes ON ordens_de_servicos.clientes_idclientes = clientes.idclientes 
    JOIN veiculos ON ordens_de_servicos.veiculos_idveiculos = veiculos.idveiculos 
    JOIN servico ON ordens_de_servicos.servico_idservico = servico.idservico;

    💻 Como Executar

    1. Clone este repositório:

    git clone <URL_DO_REPOSITORIO>

    2. Execute os scripts SQL fornecidos para criar e popular o banco de dados.

    3. Utilize uma ferramenta de gerenciamento, como MySQL Workbench ou DBeaver, para executar as consultas e explorar os dados.

    📩 Contato

    Caso tenha dúvidas ou sugestões, sinta-se à vontade para entrar em contato:



