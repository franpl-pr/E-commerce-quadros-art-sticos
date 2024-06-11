-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/06/2024 às 01:42
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `testequadrartes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `artistas`
--

CREATE TABLE `artistas` (
  `ID_artista` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `razao_social` varchar(255) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `descricao_vendedor` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `artistas`
--

INSERT INTO `artistas` (`ID_artista`, `usuario_id`, `razao_social`, `cnpj`, `descricao_vendedor`) VALUES
(1, 2, 'PinturaViva Arte & Quadros Ltda.', '54510238574j', 'PinturaViva Arte & Quadros Ltda. é uma empresa dedicada à criação e comercialização de obras de arte exclusivas e quadros artísticos de alta qualidade. Nossa paixão pela arte e nosso compromisso com a expressão criativa se refletem em cada peça que produzimos.');

--
-- Acionadores `artistas`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaArtistas` AFTER UPDATE ON `artistas` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.ID_artista, 
				NOW(), 
				CONCAT('Atualização na artistas: Artista ', NEW.ID_artista, ' atualizado.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaArtistas` AFTER INSERT ON `artistas` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.ID_artista, 
				NOW(), 
				CONCAT('Inserção na artistas: ', NEW.ID_artista)); -- Assuma 'usuario_id' e 'colunaAlvo' como sendo colunas relevantes da 'tabelaAlvo'
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoescomentarios`
--

CREATE TABLE `avaliacoescomentarios` (
  `ID_avaliacaoComent` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `avaliacao` decimal(3,2) NOT NULL,
  `comentario` text DEFAULT NULL,
  `data_avaliacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Acionadores `avaliacoescomentarios`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaAvaliacoesComentarios` AFTER UPDATE ON `avaliacoescomentarios` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.usuario_id, 
				NOW(), 
				CONCAT('Atualização na avaliacoescomentarios: do quadro', NEW.produto_id, ' por ', NEW.usuario_id));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaAvaliacoesComentarios` AFTER DELETE ON `avaliacoescomentarios` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (OLD.usuario_id, 
				NOW(), 
				CONCAT('Deleção na avaliacoescomentarios: do quadro', OLD.produto_id, ' por ', OLD.usuario_id));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaAvaliacoesComentarios` AFTER INSERT ON `avaliacoescomentarios` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.usuario_id, 
				NOW(), 
				CONCAT('Inserção na avaliacoescomentarios: do quadro', NEW.produto_id, ' por ', NEW.usuario_id));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinhodecompras`
--

CREATE TABLE `carrinhodecompras` (
  `ID_carrinhoCompras` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `dataCriacao` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('Ativo','Vazio') NOT NULL DEFAULT 'Vazio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `carrinhodecompras`
--

INSERT INTO `carrinhodecompras` (`ID_carrinhoCompras`, `cliente_id`, `dataCriacao`, `status`) VALUES
(1, 1, '2024-05-21 19:12:47', 'Vazio'),
(2, 1, '2024-05-22 20:44:53', 'Vazio');

--
-- Acionadores `carrinhodecompras`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaCarrinhoDeCompras` AFTER UPDATE ON `carrinhodecompras` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.cliente_id, 
				NOW(), 
				CONCAT('Atualização na carrinhodecompras: O cliente', NEW.cliente_id, ' atualizou o carrinho ', NEW.ID_carrinhoCompras));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaCarrinhoDeCompras` AFTER DELETE ON `carrinhodecompras` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (OLD.cliente_id, 
				NOW(), 
				CONCAT('Deleção na carrinhodecompras: O cliente', OLD.cliente_id, ' deletou o carrinho ', OLD.ID_carrinhoCompras));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaCarrinhoDeCompras` AFTER INSERT ON `carrinhodecompras` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.cliente_id, 
				NOW(), 
				CONCAT('Inserção na carrinhodecompras: O cliente', NEW.cliente_id, ' criou o carrinho ', NEW.ID_carrinhoCompras));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoriasprodutos`
--

CREATE TABLE `categoriasprodutos` (
  `ID_categoria` int(11) NOT NULL,
  `tipoCategoria` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categoriasprodutos`
--

INSERT INTO `categoriasprodutos` (`ID_categoria`, `tipoCategoria`, `descricao`) VALUES
(1, 'Abstratos', 'A arte abstrata é caracterizada pela ausência de representações figurativas. '),
(2, 'Geométricos', 'Quadros geométricos são uma categoria específica de arte abstrata que se concentra na utilização de formas geométricas.'),
(3, 'Românticos', 'Quadros românticos são uma categoria de obras de arte que refletem os ideais e emoções do movimento romântico na arte. '),
(4, 'Tipografia', 'Quadros de tipografia são obras de arte que apresentam letras, palavras, frases ou caracteres tipográficos.'),
(5, 'Fashion', 'Quadros de moda são obras de arte que se concentram em representar elementos relacionados à moda.'),
(6, 'Surrealista', 'Quadros surrealistas são obras de arte que fazem parte do movimento artístico conhecido como Surrealismo.  '),
(7, 'Monalisas', 'A \"Mona Lisa\" é uma das pinturas mais famosas do mundo, criada pelo renomado artista italiano Leonardo da Vinci.'),
(8, 'Minimalista', 'Quadros minimalistas são obras de arte que seguem o estilo do minimalismo. '),
(9, 'Religiosos', 'Quadros religiosos são obras de arte que representam temas religiosos, históricos ou espirituais.  '),
(10, 'Natureza', 'Quadros de natureza são obras de arte que capturam cenas ou elementos da natureza, incluindo paisagens.');

--
-- Acionadores `categoriasprodutos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaCategoriasProdutos` AFTER UPDATE ON `categoriasprodutos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na categoriasprodutos: A categoria', NEW.ID_categoria, ' foi atualizada.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaCategoriasProdutos` AFTER DELETE ON `categoriasprodutos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na categoriasprodutos: A categoria', OLD.ID_categoria, ' foi deletada.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaCategoriasProdutos` AFTER INSERT ON `categoriasprodutos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Inserção na categoriasprodutos: A categoria', NEW.ID_categoria, ' foi adicionada.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `ID_clientes` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cpf` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`ID_clientes`, `usuario_id`, `cpf`) VALUES
(1, 1, '47358647');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comprovante`
--

CREATE TABLE `comprovante` (
  `ID_comprovante` int(11) NOT NULL,
  `pagamento_id` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Acionadores `comprovante`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaComprovante` AFTER UPDATE ON `comprovante` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na comprovante: O comprovante ', NEW.pedido_id, ' foi atualizado.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaComprovante` AFTER DELETE ON `comprovante` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na comprovante: O comprovante ', OLD.pedido_id, ' foi deletado.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaComprovante` AFTER INSERT ON `comprovante` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Inserção na comprovante: O pedido ', NEW.pedido_id, ' gerou comprovante ', NEW.ID_comprovante));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dashboardvendedores`
--

CREATE TABLE `dashboardvendedores` (
  `ID_dashboardVendedores` int(11) NOT NULL,
  `artista_id` int(11) DEFAULT NULL,
  `tipo` enum('Vendas','Comissao','Produtos','Estoque') DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `id_referencia` int(11) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Acionadores `dashboardvendedores`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaDashboardVendedores` AFTER UPDATE ON `dashboardvendedores` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na dashboardvendedores: O pedido ', NEW.pedido_id, ' foi atualizado do dashboard.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaDashboardVendedores` AFTER DELETE ON `dashboardvendedores` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na dashboardvendedores: O pedido ', OLD.pedido_id, ' foi deletado do dashboard.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaDashboardVendedores` AFTER INSERT ON `dashboardvendedores` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Inserção na dashboardvendedores: O pedido ', NEW.pedido_id, ' foi incluido no dashboard.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `devolucoestroca`
--

CREATE TABLE `devolucoestroca` (
  `ID_devolucaoTroca` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `data_devolucao` datetime DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `status` enum('Aguardando Avaliacao','Processada','Rejeitada','Concluída') DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Acionadores `devolucoestroca`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaDevolucoesTroca` AFTER UPDATE ON `devolucoestroca` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na devolucoestroca: O pedido ', NEW.pedido_id, ' devolvido foi atualizado.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaDevolucoesTroca` AFTER DELETE ON `devolucoestroca` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na devolucoestroca: O pedido ', OLD.pedido_id, ' devolvido foi deletado.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaDevolucoesTroca` AFTER INSERT ON `devolucoestroca` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Inserção na devolucoestroca: O pedido ', NEW.pedido_id, ' foi devolvido.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `ID_endereco` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(60) NOT NULL,
  `estado` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `enderecos`
--

INSERT INTO `enderecos` (`ID_endereco`, `usuario_id`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`) VALUES
(6, 2, 'Avenida Antonio Prado', 456, NULL, 'Jardim Eldorado', 'Campinas', 'SP', '134679-87'),
(7, 3, 'Rua Antonio', 456, NULL, 'Jardim Oliveira', 'Campos Dourados', 'PE', '19025749'),
(13, 1, 'Rua odair', 45, NULL, 'Jadim Mira', 'Nova Ponte', 'AM', '1346798');

--
-- Acionadores `enderecos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaEnderecos` AFTER UPDATE ON `enderecos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na enderecos: O usuário ', NEW.usuario_id, ' deatualizou o endereco.', NEW.ID_endereco,'.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaEnderecos` AFTER DELETE ON `enderecos` FOR EACH ROW BEGIN  
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na enderecos: O usuário ', OLD.usuario_id, ' deletou o endereco.', OLD.ID_endereco,'.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaEnderecos` AFTER INSERT ON `enderecos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Inserção na enderecos: O usuário ', usuario_id, ' adicionou um novo endereco.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historicoatividades`
--

CREATE TABLE `historicoatividades` (
  `ID_historicoAtivid` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `historicoatividades`
--

INSERT INTO `historicoatividades` (`ID_historicoAtivid`, `usuario_id`, `data_hora`, `descricao`) VALUES
(0, 1, '2024-06-06 08:58:08', 'Deleção na produtos: O vendedor 1 deletou o produto 1.'),
(1, 1, '2024-05-21 17:54:43', 'Inserção na usuarios: O usuário 1 foi cadastrado.'),
(2, 2, '2024-05-21 17:55:55', 'Inserção na usuarios: O usuário 2 foi cadastrado.'),
(3, 1, '2024-05-21 17:59:17', 'Inserção na artistas: 1'),
(4, 1, '2024-05-21 19:12:47', 'Inserção na carrinhodecompras: O cliente1 criou o carrinho 1'),
(5, 3, '2024-05-22 15:58:44', 'Inserção na usuarios: O usuário 3 foi cadastrado.'),
(7, 1, '2024-05-22 20:03:00', 'Inserção na produtos: O vendedor 1 cadastrou o produto 3.'),
(14, 1, '2024-05-22 20:44:53', 'Inserção na carrinhodecompras: O cliente1 criou o carrinho 2'),
(15, 4, '2024-06-04 15:18:13', 'Inserção na usuarios: O usuário 4 foi cadastrado.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenscarrinhodecompra`
--

CREATE TABLE `itenscarrinhodecompra` (
  `ID_ItensCarrinhoCompra` int(11) NOT NULL,
  `carrinhoCompras_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `precoUnitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Acionadores `itenscarrinhodecompra`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaItensCarrinhoDeCompra` AFTER UPDATE ON `itenscarrinhodecompra` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na itenscarrinhodecompra: O produto ', NEW.produto_id, ' foi atualizado do carrinho', NEW.carrinhoCompras_id,'.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaItensCarrinhoDeCompra` AFTER DELETE ON `itenscarrinhodecompra` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na itenscarrinhodecompra: O produto ', OLD.produto_id, ' foi deletado do carrinho', OLD.carrinhoCompras_id,'.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaItensCarrinhoDeCompra` AFTER INSERT ON `itenscarrinhodecompra` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Inserção na itenscarrinhodecompra: O produto ', NEW.produto_id, ' foi adicionado ao carrinho', NEW.carrinhoCompras_id,'.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `listadesejos`
--

CREATE TABLE `listadesejos` (
  `ID_favoritos` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `data_adicao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `listadesejos`
--

INSERT INTO `listadesejos` (`ID_favoritos`, `usuario_id`, `produto_id`, `data_adicao`) VALUES
(1, 1, 1, '2024-05-22 19:20:24'),
(7, 1, 3, '2024-05-22 20:43:45');

--
-- Acionadores `listadesejos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaListaDesejos` AFTER UPDATE ON `listadesejos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na listadesejos: O usuário ', NEW.usuario_id, ' atualizou o produto ', NEW.produto_id,' da lista de desejo ', ID_listadesejos,'.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaListaDesejos` AFTER DELETE ON `listadesejos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na listadesejos: O usuário ', OLD.usuario_id, ' deletou o produto ', OLD.produto_id,' da lista de desejo ', ID_listadesejos,'.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `ID_pagamento` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `metodo_pagamento` enum('Cartão de Crédito','Cartão de Débito','Boleto Bancário','PIX') DEFAULT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `data_pagamento` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_pagamento` enum('Aprovado','Aguardando Pagamento','Recusado','Estornada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Acionadores `pagamento`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaPagamento` AFTER UPDATE ON `pagamento` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na pagamento: O pagamento ', NEW.ID_pagamento, ' foi atualizado.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaPagamento` AFTER DELETE ON `pagamento` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na pagamento: O pagamento ', OLD.ID_pagamento, ' foi deletado.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaPagamento` AFTER INSERT ON `pagamento` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Inserção na pagamento: O pagamento ', NEW.ID_pagamento, ' foi cadastrado.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentoboleto`
--

CREATE TABLE `pagamentoboleto` (
  `ID_pagamentoBoleto` int(11) NOT NULL,
  `pagamento_id` int(11) DEFAULT NULL,
  `dataVencimento` date NOT NULL,
  `dataPagamento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentocartao`
--

CREATE TABLE `pagamentocartao` (
  `ID_pagamentoCartao` int(11) NOT NULL,
  `pagamento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentopix`
--

CREATE TABLE `pagamentopix` (
  `ID_pagamentoPix` int(11) NOT NULL,
  `pagamento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_pedido` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `endereco_id` int(11) NOT NULL,
  `data_estimadaEntrega` date DEFAULT NULL,
  `ID_artista` int(11) NOT NULL,
  `custo_frete` decimal(10,2) DEFAULT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_pedido` decimal(10,2) NOT NULL,
  `status` enum('Pendente','Em Processamento','Enviado','Entregue','Cancelado') NOT NULL DEFAULT 'Pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Acionadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaPedidos` AFTER UPDATE ON `pedidos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na pedidos: O pedido ', NEW.ID_pedido, ' foi atualizado pelo cliente', NEW.cliente_id,'.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaPedidos` AFTER DELETE ON `pedidos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na pedidos: O pedido ', OLD.ID_pedido, ' foi deletado pelo cliente', OLD.cliente_id,'.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaPedidos` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Inserção na pedidos: O pedido ', NEW.ID_pedido, ' foi cadastrado pelo cliente', NEW.cliente_id,'.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfilartista`
--

CREATE TABLE `perfilartista` (
  `perfilArtista_id` int(11) NOT NULL,
  `tipoarte` text NOT NULL,
  `fotoperfil` varchar(255) NOT NULL,
  `biografia` text NOT NULL,
  `ID_artista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `perfilartista`
--

INSERT INTO `perfilartista` (`perfilArtista_id`, `tipoarte`, `fotoperfil`, `biografia`, `ID_artista`) VALUES
(6, 'Abstrata', 'https://this-person-does-not-exist.com/img/avatar-genf8a7df661492760d4e1ff5f91fc67041.jpg', '', 1);

--
-- Acionadores `perfilartista`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaPerfilartista` AFTER UPDATE ON `perfilartista` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Atualização na perfilartista: O artista ', NEW.ID_artista, ' atualizou o seu perfil.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaPerfilartista` AFTER DELETE ON `perfilartista` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Deleção na perfilartista: O artista ', OLD.ID_artista, ' deletou o seu perfil.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaPerfilartista` AFTER INSERT ON `perfilartista` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES ("Sistema", 
				NOW(), 
				CONCAT('Inserção na perfilartista: O artista ', NEW.ID_artista, ' cadastrou o seu perfil.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID_produtos` int(11) NOT NULL,
  `artista_id` int(11) NOT NULL,
  `nomeQuadro` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `estoque` int(11) NOT NULL,
  `avaliacaoMedia` decimal(3,2) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  `cor` varchar(50) NOT NULL,
  `tamanho` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`ID_produtos`, `artista_id`, `nomeQuadro`, `descricao`, `preco`, `imagem`, `estoque`, `avaliacaoMedia`, `categoria_id`, `cor`, `tamanho`) VALUES
(2, 1, 'Quadro Gato lendo jornal', 'Quadro Gato lendo jornal no banheiro – preto e branco', 180.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2022/04/gato-lendo-jornal-pb.png', 9, NULL, 1, 'Preto', '70 x 60 cm'),
(3, 1, 'Quadro Golden Retriever', 'Quadro Golden Retriever Geométrico', 99.99, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2019/03/golden-retriever-Animais-351x496.png', 1, 4.50, 1, 'Azul', '40 x 40 cm'),
(4, 3, 'Quadro É lhama ou alpaca?', 'Quadro É lhama ou alpaca?', 126.89, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2020/06/lhama-ou-alpaca.png', 14, 3.50, 5, 'Marrom', '80 x 90 cm'),
(5, 3, 'Quadro Raio-X de tulipas', 'Quadro Raio-X de tulipas.', 79.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2019/08/Raio-X-de-Tulipas-abertas.png', 29, 5.00, 10, 'Vermelho', '60 x 60 cm'),
(6, 3, 'Quadro Orange Robin', 'Quadro Orange Robin', 129.99, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2022/01/Orange-Robin-a063ab79.png', 7, 4.90, 10, 'Verde', '80 x 80 cm'),
(7, 4, 'Quadro Coqueiros Por do Sol', 'Quadro Coqueiros Por do Sol', 89.99, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2022/03/CoqueiroPordoSolPNG-6c0d7bad.png', 12, 3.60, 10, 'Rosa claro', '40 x 60 cm'),
(8, 4, 'Quadro Folhagem Rosa', 'Quadro Folhagem Rosa', 69.99, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2022/04/folhagem-rosa-e-azukl.png', 44, 8.00, 8, 'Rosa, vermelho, roxo e preto', '100 x 120'),
(9, 2, 'Quadro Deus é perfeito em tudo que faz', 'Quadro Deus é perfeito em tudo que faz', 76.30, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2017/07/quadro-poster-Deus-e%CC%81-perfeito-em-tudo-que-faz-01.png', 22, 6.80, 9, 'Preto, cinza', '10 x 10 cm'),
(10, 5, 'Quadro Antes de tudo fé', 'Quadro Antes de tudo fé', 130.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2020/12/antes_de_tudo_fe_tb.png', 15, 6.90, 9, 'Preto', '100 x 160 '),
(11, 6, 'Quadro Montanhas geometricas', 'Quadro Montanhas geometricas', 109.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2018/09/Montanhas-escandinavas-1.png', 22, 6.80, 8, 'Variações de cores', '40 x 80 cm'),
(12, 1, 'Quadro Efeito borboleta', 'Quadro Efeito borboleta', 88.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2018/02/quadro-decorativo-poster-Efeito-borboleta-01.png', 3, NULL, 1, 'Preto', '60 x 60 cm'),
(13, 1, 'Quadro Corações rose com glitter', 'Quadro Corações rose com glitter', 68.40, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2018/09/Corac%CC%A7o%CC%83es-com-gliter-rose.png', 3, NULL, 1, 'Preto', '70 x 60 cm'),
(14, 1, 'Quadro Buquê negro', 'Quadro Buquê negro', 99.99, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2018/02/quadro-decorativo-poster-Buque-negro-01.png', 1, 4.50, 5, 'Azul', '40 x 40 cm'),
(15, 3, 'Quadro Pense positivo, seja otimista', 'Quadro Pense positivo, seja otimista', 59.60, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2018/05/quadro-poster-Pense-positivo-seja-otimista-01.png', 14, 3.50, 4, 'Marrom', '80 x 90 cm'),
(16, 3, 'Quadro Aqui reunimos nossa família e amigos', 'Quadro Aqui reunimos nossa família e amigos', 79.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2018/12/Quadro-decorativo-Aqui-reunimos-nossa-familia-e-amigos.png', 29, 5.00, 4, 'Preto', '60 x 60 cm'),
(17, 3, 'Quadro Preguiça é o ato de descansar Antes de estar cansado – Homer Simpson', 'Quadro Preguiça é o ato de descansar Antes de estar cansado – Homer Simpson', 129.99, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2017/07/mini_homer_preguica.png', 7, 4.90, 4, 'Amarelo', '80 x 80 cm'),
(18, 4, 'Quadro Coqueiros Por do Sol', 'Quadro Coqueiros Por do Sol', 89.99, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2022/03/CoqueiroPordoSolPNG-6c0d7bad.png', 12, 3.60, 10, 'Rosa claro', '40 x 60 cm'),
(19, 4, 'Quadro Darth Vader Graphics', 'Quadro Darth Vader Graphics', 134.99, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2022/04/darth_vader_grafico-2399091d.png', 44, 8.00, 6, 'Rosa, vermelho, roxo e preto', '100 x 120'),
(20, 2, 'Quadro The Troopers', 'Quadro The Troopers', 84.30, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2024/05/23-2.png', 22, 6.80, 6, 'Preto, cinza', '10 x 10 cm'),
(21, 5, 'Quadro Batman', 'Quadro Batman', 140.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2017/07/92.png', 15, 6.90, 6, 'Preto', '100 x 160 '),
(22, 6, 'Quadro Pinceladas abstratas', 'Quadro Pinceladas abstratas', 199.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2022/06/pinceladas.png', 22, 6.80, 1, 'Variações de cores', '40 x 80 cm');

--
-- Acionadores `produtos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaProdutos` AFTER UPDATE ON `produtos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.artista_id, 
				NOW(), 
				CONCAT('Atualização na produtos: O vendedor ', NEW.artista_id, ' atualizou o produto ', NEW.ID_produtos,'.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaProdutos` AFTER DELETE ON `produtos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (OLD.artista_id, 
				NOW(), 
				CONCAT('Deleção na produtos: O vendedor ', OLD.artista_id, ' deletou o produto ', OLD.ID_produtos,'.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaProdutos` AFTER INSERT ON `produtos` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.artista_id, 
				NOW(), 
				CONCAT('Inserção na produtos: O vendedor ', NEW.artista_id, ' cadastrou o produto ', NEW.ID_produtos,'.'));
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_usuarios` int(11) NOT NULL,
  `nomeCompleto` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `login` varchar(50) NOT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `tipo` enum('Cliente','Vendedor') NOT NULL,
  `genero` enum('Masculino','Feminino','Outro') NOT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`ID_usuarios`, `nomeCompleto`, `email`, `senha`, `login`, `telefone`, `tipo`, `genero`, `data_nascimento`) VALUES
(1, 'Roberto Nunes', 'roberto@gmail.com', '456', 'roberto123', '1998657985', 'Cliente', 'Masculino', '1994-06-20'),
(2, 'Julia Mira', 'julia56mira@gmail.com', '8954feaf', 'juliaI8MIRA', '6498785469', 'Vendedor', 'Feminino', '1998-04-22'),
(3, 'Luciano Rocha', 'luciano@gmail', '5184151', 'lun563', '1998657985', 'Cliente', 'Masculino', '1994-06-20'),
(4, 'Vanessa Lima', 'vanessalima@gmail.com', '45898', 'van456', '1998657985', 'Cliente', 'Feminino', '2024-06-18');

--
-- Acionadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaUsuarios` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.ID_usuarios, 
				NOW(), 
				CONCAT('Atualização na usuarios: O usuário ', NEW.ID_usuarios, ' foi atualizado.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaUsuarios` AFTER DELETE ON `usuarios` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (OLD.ID_usuarios, 
				NOW(), 
				CONCAT('Deleção na usuarios: O usuário ', OLD.ID_usuarios, ' foi deletado.'));
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaUsuarios` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
		INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
		VALUES (NEW.ID_usuarios, 
				NOW(), 
				CONCAT('Inserção na usuarios: O usuário ', NEW.ID_usuarios, ' foi cadastrado.'));
	END
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`ID_artista`),
  ADD UNIQUE KEY `cnpj_UNIQUE` (`cnpj`),
  ADD KEY `usuario_id_fk_artista` (`usuario_id`);

--
-- Índices de tabela `avaliacoescomentarios`
--
ALTER TABLE `avaliacoescomentarios`
  ADD PRIMARY KEY (`ID_avaliacaoComent`),
  ADD KEY `produto_id_fk` (`produto_id`),
  ADD KEY `usuario_id_fk_avaliacao` (`usuario_id`);

--
-- Índices de tabela `carrinhodecompras`
--
ALTER TABLE `carrinhodecompras`
  ADD PRIMARY KEY (`ID_carrinhoCompras`),
  ADD KEY `cliente_id_fk` (`cliente_id`);

--
-- Índices de tabela `categoriasprodutos`
--
ALTER TABLE `categoriasprodutos`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_clientes`),
  ADD UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  ADD KEY `usuario_id_fk` (`usuario_id`);

--
-- Índices de tabela `comprovante`
--
ALTER TABLE `comprovante`
  ADD PRIMARY KEY (`ID_comprovante`),
  ADD KEY `pagamento_id_fk` (`pagamento_id`),
  ADD KEY `pedido_id_fk_comprovante` (`pedido_id`);

--
-- Índices de tabela `dashboardvendedores`
--
ALTER TABLE `dashboardvendedores`
  ADD PRIMARY KEY (`ID_dashboardVendedores`),
  ADD KEY `artista_id_fk_dashboard` (`artista_id`),
  ADD KEY `pedido_id_fk_dashboard` (`pedido_id`);

--
-- Índices de tabela `devolucoestroca`
--
ALTER TABLE `devolucoestroca`
  ADD PRIMARY KEY (`ID_devolucaoTroca`),
  ADD KEY `pedido_id_fk_devolucao` (`pedido_id`),
  ADD KEY `produto_id_fk_devolucao` (`produto_id`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`ID_endereco`),
  ADD KEY `usuario_id_fk_endereco` (`usuario_id`);

--
-- Índices de tabela `historicoatividades`
--
ALTER TABLE `historicoatividades`
  ADD PRIMARY KEY (`ID_historicoAtivid`),
  ADD KEY `usuario_id_fk_historico` (`usuario_id`);

--
-- Índices de tabela `itenscarrinhodecompra`
--
ALTER TABLE `itenscarrinhodecompra`
  ADD PRIMARY KEY (`ID_ItensCarrinhoCompra`),
  ADD KEY `carrinhoCompras_id_fk` (`carrinhoCompras_id`),
  ADD KEY `produto_id_fk_itensCarrinho` (`produto_id`);

--
-- Índices de tabela `listadesejos`
--
ALTER TABLE `listadesejos`
  ADD PRIMARY KEY (`ID_favoritos`),
  ADD KEY `usuario_id_fk_listadesejos` (`usuario_id`),
  ADD KEY `produto_id_fk_listadesejos` (`produto_id`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`ID_pagamento`),
  ADD KEY `pedido_id_fk_pagamento` (`pedido_id`);

--
-- Índices de tabela `pagamentoboleto`
--
ALTER TABLE `pagamentoboleto`
  ADD PRIMARY KEY (`ID_pagamentoBoleto`),
  ADD KEY `pagamento_id_fk_boleto` (`pagamento_id`);

--
-- Índices de tabela `pagamentocartao`
--
ALTER TABLE `pagamentocartao`
  ADD PRIMARY KEY (`ID_pagamentoCartao`),
  ADD KEY `pagamento_id_fk_cartao` (`pagamento_id`);

--
-- Índices de tabela `pagamentopix`
--
ALTER TABLE `pagamentopix`
  ADD PRIMARY KEY (`ID_pagamentoPix`),
  ADD KEY `pagamento_id_fk_pix` (`pagamento_id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_pedido`),
  ADD KEY `cliente_id_fk_pedido` (`cliente_id`),
  ADD KEY `endereco_id_fk` (`endereco_id`),
  ADD KEY `ID_artista_fk_pedido` (`ID_artista`);

--
-- Índices de tabela `perfilartista`
--
ALTER TABLE `perfilartista`
  ADD PRIMARY KEY (`perfilArtista_id`),
  ADD KEY `ID_artista_fk` (`ID_artista`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID_produtos`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_usuarios`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `ID_produtos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;