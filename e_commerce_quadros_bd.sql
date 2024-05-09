-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Set-2023 às 04:46
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `e_commerce_quadros_bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacoescomentarios`
--

CREATE TABLE `avaliacoescomentarios` (
  `ID_avaliacaoComent` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `avaliacao` decimal(3,2) NOT NULL,
  `comentario` text DEFAULT NULL,
  `data_avaliacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinhodecompras`
--

CREATE TABLE `carrinhodecompras` (
  `ID_carrinhoCompras` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `data_adicao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoriasprodutos`
--

CREATE TABLE `categoriasprodutos` (
  `ID_categoria` int(11) NOT NULL,
  `tipoCategoria` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `ID_clientes` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `genero` enum('Masculino','Feminino','Outro') DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conversaschatbot`
--

CREATE TABLE `conversaschatbot` (
  `ID_chatBot` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `mensagem_do_cliente` text DEFAULT NULL,
  `resposta_do_chatbot` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupons`
--

CREATE TABLE `cupons` (
  `ID_cupom` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `desconto_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `data_utilizacao` datetime DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `pedido_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dashboardvendedores`
--

CREATE TABLE `dashboardvendedores` (
  `ID_dashboardVendedores` int(11) NOT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `tipo` enum('Vendas','Comissao','Produtos','Estoque') DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `descontos`
--

CREATE TABLE `descontos` (
  `ID_descontos` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` enum('Porcentagem','Valor Fixo','Frete grátis') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_validade` date NOT NULL,
  `descricao` text DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `descontosprodutos`
--

CREATE TABLE `descontosprodutos` (
  `produto_id` int(11) DEFAULT NULL,
  `desconto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `detalhespagamento`
--

CREATE TABLE `detalhespagamento` (
  `ID_detalhesPagamento` int(11) NOT NULL,
  `pagamento_id` int(11) DEFAULT NULL,
  `metodo_pagamento` enum('Cartão de Crédito','Cartão de Dédito','Boleto Bancário','PIX') DEFAULT NULL,
  `nome_titular` varchar(100) DEFAULT NULL,
  `numero_cartao` varchar(16) DEFAULT NULL,
  `data_validade` varchar(7) DEFAULT NULL,
  `codigo_boleto` varchar(20) DEFAULT NULL,
  `chave_pix` varchar(50) DEFAULT NULL,
  `outro_detalhe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucoesprodutos`
--

CREATE TABLE `devolucoesprodutos` (
  `ID_devolucao` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `data_devolucao` datetime DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `status` enum('Aguardando Avaliacao','Processada','Rejeitada','Concluída') DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `ID_endereco` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(60) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `historicoatividades`
--

CREATE TABLE `historicoatividades` (
  `ID_historicoAtivid` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensempedido`
--

CREATE TABLE `itensempedido` (
  `ID_itensPedido` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `listadesejos`
--

CREATE TABLE `listadesejos` (
  `ID_favoritos` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `data_adicao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notasfiscais`
--

CREATE TABLE `notasfiscais` (
  `ID_notasFiscais` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `numero_nota` int(11) DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `ID_notificacao` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `tipo` enum('Mensagem','Alerta','Atualizacao','Outro') DEFAULT NULL,
  `mensagem` text DEFAULT NULL,
  `lida` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `ID_pagamento` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `metodo_pagamento` enum('Cartão de Crédito','Cartão de Dédito','Boleto Bancário','PIX') DEFAULT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `data_pagamento` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_pagamento` enum('Aprovado','Aguardando Pagamento','Recusado','Estornada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_pedido` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `endereco_entrega_id` int(11) DEFAULT NULL,
  `transportadora_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `codigo_rastreamento` varchar(50) DEFAULT NULL,
  `custo_frete` decimal(10,2) DEFAULT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_pedido` decimal(10,2) NOT NULL,
  `status` enum('Pendente','Em Processamento','Enviado','Entregue','Cancelado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID_produtos` int(11) NOT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `nomeQuadro` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `estoque` int(11) NOT NULL,
  `avaliacaoMedia` decimal(3,2) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `cor` varchar(50) NOT NULL,
  `tamanho` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `suportecliente`
--

CREATE TABLE `suportecliente` (
  `ID_suporte` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `assunto` varchar(255) DEFAULT NULL,
  `mensagem` text DEFAULT NULL,
  `status` enum('Aberto','Em Andamento','Fechado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportadoras`
--

CREATE TABLE `transportadoras` (
  `ID_transportadora` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco_id` int(11) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_usuarios` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `confirmarSenha` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tipo` enum('Cliente','Vendedor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `ID_vendedores` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `razao_social` varchar(255) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `descricao_vendedor` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacoescomentarios`
--
ALTER TABLE `avaliacoescomentarios`
  ADD PRIMARY KEY (`ID_avaliacaoComent`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `carrinhodecompras`
--
ALTER TABLE `carrinhodecompras`
  ADD PRIMARY KEY (`ID_carrinhoCompras`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `categoriasprodutos`
--
ALTER TABLE `categoriasprodutos`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_clientes`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices para tabela `conversaschatbot`
--
ALTER TABLE `conversaschatbot`
  ADD PRIMARY KEY (`ID_chatBot`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`ID_cupom`),
  ADD KEY `desconto_id` (`desconto_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Índices para tabela `dashboardvendedores`
--
ALTER TABLE `dashboardvendedores`
  ADD PRIMARY KEY (`ID_dashboardVendedores`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- Índices para tabela `descontos`
--
ALTER TABLE `descontos`
  ADD PRIMARY KEY (`ID_descontos`);

--
-- Índices para tabela `descontosprodutos`
--
ALTER TABLE `descontosprodutos`
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `desconto_id` (`desconto_id`);

--
-- Índices para tabela `detalhespagamento`
--
ALTER TABLE `detalhespagamento`
  ADD PRIMARY KEY (`ID_detalhesPagamento`),
  ADD KEY `pagamento_id` (`pagamento_id`);

--
-- Índices para tabela `devolucoesprodutos`
--
ALTER TABLE `devolucoesprodutos`
  ADD PRIMARY KEY (`ID_devolucao`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`ID_endereco`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `historicoatividades`
--
ALTER TABLE `historicoatividades`
  ADD PRIMARY KEY (`ID_historicoAtivid`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `itensempedido`
--
ALTER TABLE `itensempedido`
  ADD PRIMARY KEY (`ID_itensPedido`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `listadesejos`
--
ALTER TABLE `listadesejos`
  ADD PRIMARY KEY (`ID_favoritos`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `notasfiscais`
--
ALTER TABLE `notasfiscais`
  ADD PRIMARY KEY (`ID_notasFiscais`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Índices para tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`ID_notificacao`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`ID_pagamento`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_pedido`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `endereco_entrega_id` (`endereco_entrega_id`),
  ADD KEY `transportadora_id` (`transportadora_id`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID_produtos`),
  ADD KEY `vendedor_id` (`vendedor_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Índices para tabela `suportecliente`
--
ALTER TABLE `suportecliente`
  ADD PRIMARY KEY (`ID_suporte`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD PRIMARY KEY (`ID_transportadora`),
  ADD UNIQUE KEY `cnpj` (`cnpj`),
  ADD KEY `endereco_id` (`endereco_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_usuarios`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`ID_vendedores`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacoescomentarios`
--
ALTER TABLE `avaliacoescomentarios`
  MODIFY `ID_avaliacaoComent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carrinhodecompras`
--
ALTER TABLE `carrinhodecompras`
  MODIFY `ID_carrinhoCompras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoriasprodutos`
--
ALTER TABLE `categoriasprodutos`
  MODIFY `ID_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_clientes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conversaschatbot`
--
ALTER TABLE `conversaschatbot`
  MODIFY `ID_chatBot` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cupons`
--
ALTER TABLE `cupons`
  MODIFY `ID_cupom` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dashboardvendedores`
--
ALTER TABLE `dashboardvendedores`
  MODIFY `ID_dashboardVendedores` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `descontos`
--
ALTER TABLE `descontos`
  MODIFY `ID_descontos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `detalhespagamento`
--
ALTER TABLE `detalhespagamento`
  MODIFY `ID_detalhesPagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `devolucoesprodutos`
--
ALTER TABLE `devolucoesprodutos`
  MODIFY `ID_devolucao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `ID_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historicoatividades`
--
ALTER TABLE `historicoatividades`
  MODIFY `ID_historicoAtivid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itensempedido`
--
ALTER TABLE `itensempedido`
  MODIFY `ID_itensPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `listadesejos`
--
ALTER TABLE `listadesejos`
  MODIFY `ID_favoritos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notasfiscais`
--
ALTER TABLE `notasfiscais`
  MODIFY `ID_notasFiscais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `ID_notificacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `ID_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `ID_produtos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `suportecliente`
--
ALTER TABLE `suportecliente`
  MODIFY `ID_suporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  MODIFY `ID_transportadora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_usuarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `ID_vendedores` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacoescomentarios`
--
ALTER TABLE `avaliacoescomentarios`
  ADD CONSTRAINT `avaliacoescomentarios_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`),
  ADD CONSTRAINT `avaliacoescomentarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `carrinhodecompras`
--
ALTER TABLE `carrinhodecompras`
  ADD CONSTRAINT `carrinhodecompras_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID_clientes`),
  ADD CONSTRAINT `carrinhodecompras_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `conversaschatbot`
--
ALTER TABLE `conversaschatbot`
  ADD CONSTRAINT `conversaschatbot_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `cupons`
--
ALTER TABLE `cupons`
  ADD CONSTRAINT `cupons_ibfk_1` FOREIGN KEY (`desconto_id`) REFERENCES `descontos` (`ID_descontos`),
  ADD CONSTRAINT `cupons_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID_clientes`),
  ADD CONSTRAINT `cupons_ibfk_3` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`);

--
-- Limitadores para a tabela `dashboardvendedores`
--
ALTER TABLE `dashboardvendedores`
  ADD CONSTRAINT `dashboardvendedores_ibfk_1` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`ID_vendedores`);

--
-- Limitadores para a tabela `descontosprodutos`
--
ALTER TABLE `descontosprodutos`
  ADD CONSTRAINT `descontosprodutos_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`),
  ADD CONSTRAINT `descontosprodutos_ibfk_2` FOREIGN KEY (`desconto_id`) REFERENCES `descontos` (`ID_descontos`);

--
-- Limitadores para a tabela `detalhespagamento`
--
ALTER TABLE `detalhespagamento`
  ADD CONSTRAINT `detalhespagamento_ibfk_1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamentos` (`ID_pagamento`);

--
-- Limitadores para a tabela `devolucoesprodutos`
--
ALTER TABLE `devolucoesprodutos`
  ADD CONSTRAINT `devolucoesprodutos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`),
  ADD CONSTRAINT `devolucoesprodutos_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `historicoatividades`
--
ALTER TABLE `historicoatividades`
  ADD CONSTRAINT `historicoatividades_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `itensempedido`
--
ALTER TABLE `itensempedido`
  ADD CONSTRAINT `itensempedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`),
  ADD CONSTRAINT `itensempedido_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

--
-- Limitadores para a tabela `listadesejos`
--
ALTER TABLE `listadesejos`
  ADD CONSTRAINT `listadesejos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`),
  ADD CONSTRAINT `listadesejos_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

--
-- Limitadores para a tabela `notasfiscais`
--
ALTER TABLE `notasfiscais`
  ADD CONSTRAINT `notasfiscais_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`);

--
-- Limitadores para a tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD CONSTRAINT `notificacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`);

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID_clientes`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`endereco_entrega_id`) REFERENCES `enderecos` (`ID_endereco`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`ID_transportadora`),
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`ID_vendedores`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`ID_vendedores`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoriasprodutos` (`ID_categoria`);

--
-- Limitadores para a tabela `suportecliente`
--
ALTER TABLE `suportecliente`
  ADD CONSTRAINT `suportecliente_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD CONSTRAINT `transportadoras_ibfk_1` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`ID_endereco`);

--
-- Limitadores para a tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
