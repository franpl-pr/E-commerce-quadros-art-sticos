-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Set-2023 às 02:01
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
-- Banco de dados: `quadros`
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

--
-- Extraindo dados da tabela `avaliacoescomentarios`
--

INSERT INTO `avaliacoescomentarios` (`ID_avaliacaoComent`, `produto_id`, `usuario_id`, `avaliacao`, `comentario`, `data_avaliacao`) VALUES
(1, 9, 2, 7.90, 'Chegou no prazo previsto, o quadro é muito bem trabalhado o material é durável além de ter ficado muito elegante no meu escritório. Muito obrigado.', '2023-09-12 01:44:31'),
(2, 11, 2, 6.90, 'O quadro chegou no prazo gostei muito da qualidade do retrato.', '2023-09-14 23:39:44'),
(3, 4, 4, 3.80, 'O produto veio com uns riscos, tive que trocá-lo.', '2023-09-14 23:58:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinhodecompras`
--

CREATE TABLE `carrinhodecompras` (
  `ID_carrinhoCompras` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `status` enum('Ativo','Vazio') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `carrinhodecompras`
--

INSERT INTO `carrinhodecompras` (`ID_carrinhoCompras`, `cliente_id`, `dataCriacao`, `status`) VALUES
(1, 1, '2023-05-10 09:40:34', 'Ativo'),
(2, 4, '2023-09-13 19:09:29', 'Ativo'),
(3, 3, '2023-09-10 19:09:29', 'Ativo'),
(4, 2, '2023-09-10 20:29:38', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoriasprodutos`
--

CREATE TABLE `categoriasprodutos` (
  `ID_categoria` int(11) NOT NULL,
  `tipoCategoria` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categoriasprodutos`
--

INSERT INTO `categoriasprodutos` (`ID_categoria`, `tipoCategoria`, `descricao`) VALUES
(1, 'Abstratos', 'A arte abstrata é caracterizada pela ausência de representações figurativas ou reconhecíveis, e muitos estilos diferentes de quadros abstratos foram desenvolvidos ao longo do tempo. '),
(2, 'Geométricos', 'Quadros geométricos são uma categoria específica de arte abstrata que se concentra na utilização de formas geométricas, como linhas, círculos, triângulos, quadrados e retângulos, para criar composições artísticas. Essas obras muitas vezes exploram padrões, simetria, equilíbrio '),
(3, 'Românticos', 'Quadros românticos são uma categoria de obras de arte que refletem os ideais e emoções do movimento romântico na arte. O Romantismo foi um movimento artístico que floresceu no final do século XVIII e início do século XIX e enfatizou emoções, imaginação, natureza e a expressão individual.'),
(4, 'Tipografia', 'Quadros de tipografia são obras de arte que apresentam letras, palavras, frases ou caracteres tipográficos como elemento central do design. Eles podem ser criados usando diferentes técnicas de impressão ou tipografia digital para transmitir mensagens, citações, ou apenas para explorar a estética visual das fontes e letras. '),
(5, 'Fashion', 'Quadros de moda são obras de arte que se concentram em representar elementos relacionados à moda, como roupas, acessórios, modelos ou cenas da indústria da moda. Eles capturam a estética e o glamour do mundo da moda e podem ser criados em diversos estilos artísticos.'),
(6, 'Surrealista', 'Quadros surrealistas são obras de arte que fazem parte do movimento artístico conhecido como Surrealismo. O Surrealismo é caracterizado por explorar o mundo dos sonhos, do subconsciente e do irracional, muitas vezes resultando em composições artísticas altamente imaginativas e não convencionais. '),
(7, 'Monalisas', 'A \"Mona Lisa\" é uma das pinturas mais famosas do mundo, criada pelo renomado artista italiano Leonardo da Vinci. Ela é conhecida pela sua enigmática e sutil expressão facial e é considerada um ícone da arte renascentista. '),
(8, 'Minimalista', 'Quadros minimalistas são obras de arte que seguem o estilo do minimalismo, um movimento artístico que se desenvolveu na segunda metade do século XX e se caracteriza pela simplicidade, simplicidade e foco na essência do objeto ou conceito retratado. '),
(9, 'Religiosos', 'Quadros religiosos são obras de arte que representam temas religiosos, históricos ou espirituais. Eles podem variar muito em estilo e conteúdo, dependendo da religião e da época em que foram criados. '),
(10, 'Natureza', 'Quadros de natureza são obras de arte que capturam cenas ou elementos da natureza, incluindo paisagens, animais, plantas, flores e outros elementos naturais. Eles são populares na arte ao longo da história devido à beleza e diversidade da natureza.');

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

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`ID_clientes`, `usuario_id`, `genero`, `cpf`) VALUES
(1, 2, 'Masculino', '48924697805'),
(2, 1, 'Feminino', '36504972108'),
(3, 5, 'Feminino', '123.456.789-00'),
(4, 6, 'Masculino', '987.654.321-00'),
(5, 7, 'Outro', '456.789.123-00');

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

--
-- Extraindo dados da tabela `conversaschatbot`
--

INSERT INTO `conversaschatbot` (`ID_chatBot`, `usuario_id`, `data_hora`, `mensagem_do_cliente`, `resposta_do_chatbot`) VALUES
(1, 1, '2023-09-10 08:30:00', 'Olá, tenho uma pergunta sobre um produto.', 'Olá! Estou aqui para ajudar. Qual é a sua pergunta?'),
(2, 1, '2023-09-11 14:15:00', 'Como faço para acompanhar meu pedido?', 'Para acompanhar seu pedido, acesse a página \"Minha Conta\".'),
(3, 5, '2023-09-12 09:45:00', 'Tem alguma promoção em andamento?', 'Sim, temos uma promoção de 10% de desconto em produtos selecionados.'),
(4, 6, '2023-09-14 11:10:00', 'Qual é o prazo de entrega para meu pedido?', 'O prazo de entrega varia de acordo com a região. Posso verificar para você.'),
(5, 6, '2023-09-15 17:30:00', 'Obrigado pela ajuda!', 'De nada! Estou sempre aqui para ajudar. Tenha um ótimo dia.'),
(6, 7, '2023-09-16 10:00:00', 'Como faço para entrar em contato por telefone?', 'Nosso suporte por telefone está disponível no número (11) 1234-5678.'),
(7, 1, '2023-09-17 12:45:00', 'Quais são os métodos de pagamento aceitos?', 'Aceitamos cartões de crédito, PayPal e Pix.'),
(8, 4, '2023-09-18 14:30:00', 'Qual é o horário de atendimento do suporte?', 'Nosso suporte está disponível das 9h às 18h, de segunda a sexta-feira.'),
(9, 5, '2023-09-19 09:20:00', 'Como posso rastrear meu pedido?', 'Você pode rastrear seu pedido na seção \"Rastrear Pedido\" em nossa página inicial.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom`
--

CREATE TABLE `cupom` (
  `ID_cupom` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `desconto_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `validade` datetime DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `pedido_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cupom`
--

INSERT INTO `cupom` (`ID_cupom`, `codigo`, `desconto_id`, `cliente_id`, `validade`, `ativo`, `pedido_id`) VALUES
(1, 'CUPOMEU20', 3, 3, '2023-09-15 23:00:00', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dashboardvendedores`
--

CREATE TABLE `dashboardvendedores` (
  `ID_dashboardVendedores` int(11) NOT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `tipo` enum('Vendas','Comissao','Produtos','Estoque') DEFAULT NULL,
  `HistoricoVendas` text DEFAULT NULL,
  `nivelVendedor` decimal(10,2) DEFAULT NULL,
  `faturamento` decimal(10,2) DEFAULT NULL,
  `comissao` decimal(10,2) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `pagamento_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `devolucoesTroca_id` int(11) DEFAULT NULL,
  `notasFiscais_id` int(11) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `cumpom_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `dashboardvendedores`
--

INSERT INTO `dashboardvendedores` (`ID_dashboardVendedores`, `vendedor_id`, `data`, `tipo`, `HistoricoVendas`, `nivelVendedor`, `faturamento`, `comissao`, `estoque`, `pagamento_id`, `cliente_id`, `pedido_id`, `produto_id`, `devolucoesTroca_id`, `notasFiscais_id`, `descricao`, `cumpom_ID`) VALUES
(1, 2, '2023-09-11', 'Vendas', 'Venda 1 - Quadro \'Retrato Clássico\'\r\nPagamento no Cartão de Débito', 5.00, 212.00, 120.00, 21, 1, 1, 1, 9, NULL, 1, 'Pedido entregue com êxito!', NULL),
(2, 6, '2023-09-14', 'Vendas', NULL, 8.00, 554.69, 69.99, 21, 2, 2, 2, 11, NULL, 2, NULL, NULL),
(3, 1, '2023-09-15', 'Vendas', 'Venda do quadro Pintura a óleo', 6.00, 245.69, 64.99, 13, 3, 4, 3, 4, 1, 3, NULL, NULL);

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

--
-- Extraindo dados da tabela `descontos`
--

INSERT INTO `descontos` (`ID_descontos`, `nome`, `tipo`, `valor`, `data_validade`, `descricao`, `ativo`) VALUES
(1, 'DESCONTO10', 'Porcentagem', 10.00, '2023-12-31', 'Desconto de 10% em todos os produtos', 1),
(2, 'FRETEGRATIS', 'Valor Fixo', 0.00, '2023-09-30', 'Frete grátis em compras acima de R$ 100,00', 1),
(3, 'DESCONTO20', 'Porcentagem', 20.00, '2023-10-15', 'Desconto de 20% em produtos selecionados', 1),
(4, 'PROMO2023', 'Valor Fixo', 50.00, '2023-12-31', 'Desconto de R$ 50,00 em qualquer compra', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `descontosprodutos`
--

CREATE TABLE `descontosprodutos` (
  `produto_id` int(11) DEFAULT NULL,
  `desconto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `descontosprodutos`
--

INSERT INTO `descontosprodutos` (`produto_id`, `desconto_id`) VALUES
(7, 1),
(6, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucoestroca`
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
-- Extraindo dados da tabela `devolucoestroca`
--

INSERT INTO `devolucoestroca` (`ID_devolucaoTroca`, `pedido_id`, `produto_id`, `data_devolucao`, `motivo`, `status`, `observacoes`) VALUES
(1, 3, 4, '2023-09-19 20:52:04', 'O quadro veio com uns riscos, gostaria de trocar', 'Aguardando Avaliacao', 'Troca de produto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecoentrega`
--

CREATE TABLE `enderecoentrega` (
  `ID_enderecoEntrega` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(60) NOT NULL,
  `estado` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `enderecoentrega`
--

INSERT INTO `enderecoentrega` (`ID_enderecoEntrega`, `cliente_id`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`) VALUES
(1, 2, 'Avenida Principal Brasil', 78, 'Casa', 'Jardim Amanda 2', 'Hortolândia', 'SP', '19025749'),
(2, 1, 'Rua Odair Gonçalo, antiga 3', 78, 'casa', 'Jardim das Maravilhas', 'Campos Dourados', 'PR', '134679-87'),
(3, 3, 'Avenida Santana Miguel, andar 3', 534, 'Apartamento', 'Jardim da Conceição', 'Diamantina', 'MG', '1435-8974'),
(4, 4, 'Rua são bernardo campos', 46, 'Casa', 'Jardim Campos Dourados', 'Santa Maria da Vitória', 'BA', '4687924');

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
  `estado` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `enderecos`
--

INSERT INTO `enderecos` (`ID_endereco`, `usuario_id`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`) VALUES
(1, 2, 'Avenida Principal Brasil', 78, 'Casa', 'Jardim Amanda 2', 'Hortolândia', 'SP', '19025749'),
(2, 1, 'Rua 16 Estibinita jorge Cruz', 478, 'Apartamento', 'Aparecida de Góias', 'Brasilândia', 'GO', '13476243'),
(3, 4, 'Rua 34, José Alexandre Gonçalo', 47, 'Apartamento', 'Jardim do Bosque', 'Anaurilândia', 'MT', '13457224'),
(4, 3, 'Rua Mirantes Garcia Luz', 22, 'Comércio', 'Jardim Alvorada', 'Nova Ponte', 'RJ', '17984641'),
(5, 5, 'Rua Pimentel Cros', 455, 'Apto 101', 'Bairro Boa Vista', 'Maringá', 'PR', '1345-678'),
(6, 6, 'Avenida Brasil', 456, 'comercio', 'Bairro Boa Esperança', 'Jaú', 'AM', '23456-672'),
(7, 7, 'Rua Casimiro Goi', 789, 'casa', 'Bairro Campos Elisios', 'Cosmopólis', 'SP', '1474-890'),
(8, 8, 'Avenida Dutra Cruz', 101, 'Apto 32', 'Bairro DaTerra', 'Diamantina', 'MG', '1547901'),
(9, 9, 'Rua 45, Liz da Cunha', 234, 'Comercio', 'Bairro Esmeralda', 'Campinas', 'SP', '134571-012'),
(10, 10, 'Rua Santo André De NÓS', 456, 'Condomínio', 'Jardim Santa Clara', 'Artur Nogueira', 'PB', '1497582'),
(11, 11, 'Rua 38 Santo Amaro de Fonseca', 11, 'Casa', 'Jardim Cascavel', 'Monte Alegre', 'ES', '1294255');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecostransportadora`
--

CREATE TABLE `enderecostransportadora` (
  `ID_enderecoTransportadora` int(11) NOT NULL,
  `transportadora_id` int(11) DEFAULT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(60) NOT NULL,
  `estado` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `enderecostransportadora`
--

INSERT INTO `enderecostransportadora` (`ID_enderecoTransportadora`, `transportadora_id`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`) VALUES
(1, 1, 'Rua São Sebastião de Almeida', 45, 'Correio', 'Jardim Julia', 'Nova Ponte', 'RJ', '14987524'),
(2, 1, 'Avenida Antonio Peixoto de Aguirre', 743, 'Correio', 'Jadim Santo Antônio', 'Campinas', 'SP', '1346798'),
(3, 1, 'Rua Barbosa Ferraz Junior', 44, 'Correio', 'Jardim Porto Velho', 'BLUMENAU ', 'SC', '17469-584');

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

--
-- Extraindo dados da tabela `historicoatividades`
--

INSERT INTO `historicoatividades` (`ID_historicoAtivid`, `usuario_id`, `data_hora`, `descricao`) VALUES
(1, 1, '2023-09-10 08:30:00', 'Acesso à página inicial da loja'),
(2, 2, '2023-09-11 14:15:00', 'Visualização de produtos na categoria \"Arte Abstrata\"'),
(3, 1, '2023-09-12 09:45:00', 'Realização de uma compra no valor de R$ 212,00'),
(4, 4, '2023-09-13 16:20:00', 'Atualização de informações de perfil'),
(5, 5, '2023-09-14 11:10:00', 'Pesquisa por produtos relacionados a \"paisagem\"'),
(6, 1, '2023-09-15 17:30:00', 'Adição de produtos à lista de desejos'),
(7, 1, '2023-09-16 10:00:00', 'Consulta ao histórico de pedidos'),
(8, 5, '2023-09-17 12:45:00', 'Recebimento de uma notificação de promoção'),
(9, 7, '2023-09-18 14:30:00', 'Visualização do carrinho de compras'),
(10, 1, '2023-09-19 09:20:00', 'Envio de uma mensagem para o suporte ao cliente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itenscarrinhodecompra`
--

CREATE TABLE `itenscarrinhodecompra` (
  `ID_ItensCarrinhoCompra` int(11) NOT NULL,
  `carrinhoCompras_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `precoUnitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `itenscarrinhodecompra`
--

INSERT INTO `itenscarrinhodecompra` (`ID_ItensCarrinhoCompra`, `carrinhoCompras_id`, `produto_id`, `quantidade`, `precoUnitario`) VALUES
(1, 1, 9, 1, 199.99),
(2, 4, 11, 1, 109.00),
(3, 2, 4, 1, 99.99);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensdopedido`
--

CREATE TABLE `itensdopedido` (
  `ID_itensPedido` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `itensdopedido`
--

INSERT INTO `itensdopedido` (`ID_itensPedido`, `pedido_id`, `produto_id`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 9, 1, 199.99),
(2, 2, 11, 1, 109.00),
(3, 3, 4, 1, 99.99);

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

--
-- Extraindo dados da tabela `listadesejos`
--

INSERT INTO `listadesejos` (`ID_favoritos`, `usuario_id`, `produto_id`, `data_adicao`) VALUES
(1, 2, 1, '2023-09-03 16:30:37'),
(2, 1, 3, '2023-09-10 10:15:00'),
(3, 2, 6, '2023-09-11 14:30:00'),
(4, 1, 1, '2023-09-12 09:45:00'),
(5, 5, 7, '2023-09-13 16:20:00'),
(6, 5, 5, '2023-09-14 11:10:00'),
(7, 6, 2, '2023-09-15 17:30:00'),
(8, 2, 9, '2023-09-16 10:00:00'),
(9, 7, 4, '2023-09-17 12:45:00'),
(10, 7, 8, '2023-09-18 14:30:00'),
(11, 1, 9, '2023-09-19 09:20:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notasfiscais`
--

CREATE TABLE `notasfiscais` (
  `ID_notasFiscais` int(11) NOT NULL,
  `pagamento_id` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `numero_nota` int(11) DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `notasfiscais`
--

INSERT INTO `notasfiscais` (`ID_notasFiscais`, `pagamento_id`, `pedido_id`, `produto_id`, `numero_nota`, `data_emissao`, `valor_total`, `observacoes`) VALUES
(1, 1, 1, 9, 254911, '2023-09-11', 212.00, 'Empresa ArtePintada Empreendimentos Artísticos Ltda.'),
(2, 2, 2, 11, 34887, '2023-09-13', 109.00, NULL),
(3, 3, 3, 4, 6454, '2023-09-15', 99.99, NULL);

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

--
-- Extraindo dados da tabela `notificacoes`
--

INSERT INTO `notificacoes` (`ID_notificacao`, `usuario_id`, `data_hora`, `tipo`, `mensagem`, `lida`) VALUES
(1, 1, '2023-09-10 08:30:00', 'Mensagem', 'Você tem uma nova mensagem de suporte.', 0),
(2, 2, '2023-09-11 14:15:00', 'Alerta', 'Promoção especial de hoje!', 1),
(3, 3, '2023-09-12 09:45:00', 'Atualizacao', 'Atualização importante do sistema disponível.', 0),
(4, 5, '2023-09-13 16:20:00', 'Mensagem', 'Seu pedido #12345 foi confirmado.', 1),
(5, 6, '2023-09-14 11:10:00', 'Alerta', 'Estoque limitado para o produto XYZ.', 0),
(6, 7, '2023-09-15 17:30:00', 'Atualizacao', 'Nova versão disponível.', 0),
(7, 2, '2023-09-16 10:00:00', 'Mensagem', 'Seu pagamento foi processado com sucesso.', 1),
(8, 3, '2023-09-17 12:45:00', 'Mensagem', 'Você tem uma nova mensagem de suporte.', 0),
(9, 8, '2023-09-18 14:30:00', 'Alerta', 'Desconto especial para clientes premium.', 1),
(10, 9, '2023-09-19 09:20:00', 'Atualizacao', 'Nova coleção de produtos disponível.', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `ID_pagamento` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `metodo_pagamento` enum('Cartão de Crédito','Cartão de Dédito','Boleto Bancário','PIX') DEFAULT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `data_pagamento` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_pagamento` enum('Aprovado','Aguardando Pagamento','Recusado','Estornada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`ID_pagamento`, `pedido_id`, `metodo_pagamento`, `valor_pago`, `data_pagamento`, `status_pagamento`) VALUES
(1, 1, 'Cartão de Dédito', 212.00, '2023-09-12 01:38:19', 'Aprovado'),
(2, 2, 'PIX', 109.00, '2023-09-12 22:11:51', 'Aprovado'),
(3, 3, 'Boleto Bancário', 99.99, '2023-09-14 23:49:55', 'Aprovado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentoboleto`
--

CREATE TABLE `pagamentoboleto` (
  `ID_pagamentoBoleto` int(11) NOT NULL,
  `pagamento_id` int(11) DEFAULT NULL,
  `numeroBoleto` varchar(50) DEFAULT NULL,
  `valorBoleto` decimal(10,2) DEFAULT NULL,
  `dataVencimento` date NOT NULL,
  `dataPagamento` date NOT NULL,
  `beneficiario` varchar(100) DEFAULT NULL,
  `agencia` varchar(60) DEFAULT NULL,
  `codigoBarra` varchar(100) NOT NULL,
  `outro_detalhe` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pagamentoboleto`
--

INSERT INTO `pagamentoboleto` (`ID_pagamentoBoleto`, `pagamento_id`, `numeroBoleto`, `valorBoleto`, `dataVencimento`, `dataPagamento`, `beneficiario`, `agencia`, `codigoBarra`, `outro_detalhe`) VALUES
(1, 3, '84942-8', 99.99, '2023-09-15', '2023-09-15', 'PinturaViva Arte & Quadros Ltda.', '9487-65', '515487984545185476513', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentocartao`
--

CREATE TABLE `pagamentocartao` (
  `ID_pagamentoCartao` int(11) NOT NULL,
  `pagamento_id` int(11) DEFAULT NULL,
  `numerocartao` varchar(50) NOT NULL,
  `nomeTitular` varchar(100) NOT NULL,
  `BandeiraCartao` enum('Visa','MasterCard','American','Express','Outra') DEFAULT NULL,
  `tipoCartao` enum('Crédito','Débito') NOT NULL,
  `valorPagamento` decimal(10,2) NOT NULL,
  `taxasCustos` decimal(10,2) DEFAULT NULL,
  `outro_detalhe` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pagamentocartao`
--

INSERT INTO `pagamentocartao` (`ID_pagamentoCartao`, `pagamento_id`, `numerocartao`, `nomeTitular`, `BandeiraCartao`, `tipoCartao`, `valorPagamento`, `taxasCustos`, `outro_detalhe`) VALUES
(1, 1, '658481649-823', 'Hugo Perez Santos', 'Visa', 'Débito', 212.00, 0.00, 'Pagamento a vista sem desconto com frete');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentopix`
--

CREATE TABLE `pagamentopix` (
  `ID_pagamentoPix` int(11) NOT NULL,
  `pagamento_id` int(11) DEFAULT NULL,
  `numeroConta` varchar(50) DEFAULT NULL,
  `tipoChave` enum('CPF','CNPJ','Telefone','Email','ChaveAleatoria') DEFAULT NULL,
  `chavePixRemetente` varchar(60) NOT NULL,
  `chavePixDestinatario` varchar(60) NOT NULL,
  `valorTransacao` decimal(10,2) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `outro_detalhe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pagamentopix`
--

INSERT INTO `pagamentopix` (`ID_pagamentoPix`, `pagamento_id`, `numeroConta`, `tipoChave`, `chavePixRemetente`, `chavePixDestinatario`, `valorTransacao`, `data_hora`, `outro_detalhe`) VALUES
(1, 2, '64587-465', 'CPF', '36504972108', '46791254972', 109.00, '2023-09-13 22:13:17', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_pedido` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `endereco_entrega_id` int(11) DEFAULT NULL,
  `data_estimadaEntrega` date DEFAULT NULL,
  `enderecoTransportadora_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `codigo_rastreamento` varchar(50) DEFAULT NULL,
  `custo_frete` decimal(10,2) DEFAULT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_pedido` decimal(10,2) NOT NULL,
  `status` enum('Pendente','Em Processamento','Enviado','Entregue','Cancelado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`ID_pedido`, `cliente_id`, `endereco_entrega_id`, `data_estimadaEntrega`, `enderecoTransportadora_id`, `vendedor_id`, `codigo_rastreamento`, `custo_frete`, `data_pedido`, `total_pedido`, `status`) VALUES
(1, 1, 1, '2023-09-13', 1, 2, '8494854KIS445', 12.00, '2023-09-12 01:35:42', 212.00, 'Entregue'),
(2, 2, 2, '2023-09-14', 1, 6, '5JOHAU53#JAmG99', 0.00, '2023-09-12 01:35:42', 109.00, 'Em Processamento'),
(3, 4, 4, '2023-09-18', 3, 1, '9979854W', NULL, '2023-09-14 23:47:42', 99.99, 'Entregue');

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
  `tamanho` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`ID_produtos`, `vendedor_id`, `nomeQuadro`, `descricao`, `preco`, `imagem`, `estoque`, `avaliacaoMedia`, `categoria_id`, `cor`, `tamanho`) VALUES
(1, 1, 'Bauhaus Geométrico – Vermelho', 'O \"Quadro Bauhaus Geométrico - Vermelho Azul Amarelo\" é uma obra que se inspira na estética da Escola Bauhaus, um movimento artístico e escola de design fundada na Alemanha no início do século XX. A Escola Bauhaus foi conhecida por sua abordagem modernista e foco na simplicidade, geometria e cores primárias, incluindo vermelho, azul e amarelo.', 60.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2022/08/006.png', 5, NULL, 1, 'Vermelho', '60 x 60 cm'),
(2, 1, 'Quadro Frida Kahlo Graphics', 'Obra de arte que é inspirada na famosa artista mexicana Frida Kahlo. Frida Kahlo é conhecida por suas pinturas autorretrato e pelo uso de cores vibrantes e simbolismo em suas obras. ', 180.00, 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2019/03/Frida-graphics-Geometrico-351x496.png', 9, NULL, 2, 'Preto', '70 x 60 cm'),
(3, 1, 'Quadro Abstrato', '\r\nQuadro de arte abstrata em tons de azul.', 99.99, 'quadro1.jpg', 10, 4.50, 1, 'Azul', '40 x 40 cm'),
(4, 1, 'Pintura a Óleo', 'Pintura a óleo em tela de paisagem', 149.00, 'quadropaisagem.png', 14, 3.50, 4, 'Verde', '80 x 90 cm'),
(5, 3, 'Retrato Moderno', 'Retrato moderno de uma mulher.', 79.00, 'quadroMulher.jpg', 29, 5.00, 5, 'Vermelho', '60 x 60 cm'),
(6, 3, 'Natureza Morta', 'Natureza morta com frutas em óleo.', 129.99, 'narezamorta.jpg', 7, 4.90, 10, 'Verde', '80 x 80 cm'),
(7, 4, 'Abstrato Geométrico', 'Abstrato Geométrico', 89.99, NULL, 12, 3.60, 2, 'Rosa claro', '40 x 60 cm'),
(8, 4, 'Pintura em Aquarela', 'Pintura em aquarela de uma paisagem tropical.', 69.99, 'aquarelaqudro.jpg', 44, 8.00, 3, 'Rosa, vermelho, roxo e preto', '100x120 '),
(9, 2, 'Retrato Clássico', 'Retrato clássico de uma figura histórica.', 199.99, 'retratoclass.jpg', 22, 6.80, 6, 'Preto, cinza, bege e laranja', '10 x 10 cm'),
(10, 5, '\"Noite Estrelada\"', '\"Noite Estrelada\" é um nome de quadro que evoca imagens de um cenário noturno repleto de estrelas e beleza. Este nome é conhecido por ser uma referência a uma famosa obra do pintor Vincent van Gogh chamada \"A Noite Estrelada\" (\"Starry Night\" em inglês). ', 130.00, 'noiteestrelada.jpg', 15, 6.90, 6, 'Preto, azul, verde', '100x160cm'),
(11, 6, 'A Dança das Cores', '\"A Dança das Cores\" é um nome encantador e evocativo para um quadro artístico. Ele sugere uma combinação de movimento, energia e expressão visual através das cores.\"', 109.00, 'dancaCores.jpg', 22, 6.80, 1, 'Variações de cores', '40 x 80 cm');

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

--
-- Extraindo dados da tabela `suportecliente`
--

INSERT INTO `suportecliente` (`ID_suporte`, `usuario_id`, `data_hora`, `assunto`, `mensagem`, `status`) VALUES
(1, 1, '2023-09-10 08:30:00', 'Sugestão para o Site', 'Tenho uma sugestão para melhorar a experiência do site.', 'Aberto'),
(2, 2, '2023-09-11 14:15:00', 'Dúvida sobre Produtos', 'Gostaria de obter mais informações sobre os produtos.', 'Em Andamento'),
(3, 4, '2023-09-13 16:20:00', 'Problema com Pagamento', 'Meu pagamento não foi processado corretamente.', 'Aberto'),
(4, 5, '2023-09-14 11:10:00', 'Sugestão para o Site', 'Tenho uma sugestão para melhorar a experiência do site.', 'Em Andamento'),
(5, 5, '2023-06-08 21:44:06', 'Dúvida sobre o ChatBot', 'Gostaria de obter mais informações sobre as sugestões do ChatBot com os produtos em promoções.', 'Fechado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportadora`
--

CREATE TABLE `transportadora` (
  `ID_transportadora` int(11) NOT NULL,
  `razaoSocial` varchar(100) NOT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `transportadora`
--

INSERT INTO `transportadora` (`ID_transportadora`, `razaoSocial`, `cnpj`, `telefone`, `email`, `site`, `descricao`) VALUES
(1, 'Empresa Brasileira de Correios e Telégrafos - Correios', '34028316/000707', '0800 725 0100', 'atendimento@correios.com.br', 'https://www.correios.com.br/', 'Por meio da celebração do contrato comercial com os Correios, ou da inclusão do serviço no contrato já existente, as empresas integram seu e-commerce com o sistema logístico dos Correios; o que irá permitir que após a compra feita pelo cliente o pedido seja direcionado ao Armazém dos Correios.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_usuarios` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `confirmarSenha` varchar(100) NOT NULL,
  `login` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tipo` enum('Cliente','Vendedor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`ID_usuarios`, `nome`, `email`, `senha`, `confirmarSenha`, `login`, `telefone`, `tipo`) VALUES
(1, 'Luana Souza Dias', 'luanasouza87@gmail.com', '8475#fsqi', '8475#fsqi', 'luana456Souza', '019982479891', 'Cliente'),
(2, 'Hugo Perez Santos', 'perezhugo959@gmail.com', 'hugi78@', 'hugi78@', 'perez46Higo', '01894763218', 'Cliente'),
(3, 'Geovana Liz Fagundes', 'lizgiovana45@gmail.com', '7859@gh$sw', '7859@gh$sw', 'lizgio76', '0213879-4522', 'Vendedor'),
(4, 'Fabio Melo Santos', 'melo45santos@gmail.com', '754hjei87u&', '754hjei87u&', 'meloFabio46', '0783874-6417', 'Vendedor'),
(5, 'Juliana Gomes Silva', 'gomes.silva45@.com', '8yun@jkf', '8yun@jkf', 'jugomes9', '(11) 9848-7852', 'Cliente'),
(6, 'Antonio Mirante Souza', 'antonio.souza@mirante.com', 'antonio87k#', 'antonio87k#', 'mirantonio33', '(22) 98745-5487', 'Cliente'),
(7, 'Isabela Lucia Santos', 'lucia.santos@isabela.com', 'jilucia870', 'jilucia870', 'IsaLUC88', '(19) 9785-6578', 'Cliente'),
(8, 'Domingues Pedro Rodrigues', 'pedro.rodrigues@domin65.com', 'domPedi8778', 'domPedi8778', 'PEDROdom3', '(44) 97854-2871', 'Vendedor'),
(9, 'Cassia Adala Lima', 'adala.lima@cassia.com', '548CasiADl', '548CasiADl', 'adalCass09', '(21) 3917-7890', 'Vendedor'),
(10, 'Renata Aicher', 'aicherrrenta53@gmail.com', 'rent464#Ai', 'rent464#Ai', 'Aicher35', '02638716634', 'Vendedor'),
(11, 'Fernando Nogueira', 'nogueirafernando4@gmail.com', '51aKaj21Bsi', '51aKaj21Bsi', 'noguFern46', '193647-9982', 'Vendedor');

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
-- Extraindo dados da tabela `vendedores`
--

INSERT INTO `vendedores` (`ID_vendedores`, `usuario_id`, `razao_social`, `cnpj`, `descricao_vendedor`) VALUES
(1, 3, 'PinturaViva Arte & Quadros Ltda.', '45778241/0001-22.', '\"PinturaViva Arte & Quadros Ltda. é uma empresa dedicada à criação e comercialização de obras de arte exclusivas e quadros artísticos de alta qualidade. Nossa paixão pela arte e nosso compromisso com a expressão criativa se refletem em cada peça que produzimos.'),
(2, 4, 'ArtePintada Empreendimentos Artísticos Ltda.', '23.976.014/0001-77', '\"ArtePintada Empreendimentos Artísticos Ltda. é uma empresa apaixonada pelo mundo da arte, dedicada a promover a criatividade e a expressão artística. Nosso compromisso é proporcionar um espaço para artistas talentosos e suas obras maravilhosas, abrindo portas para que suas criações cheguem ao mundo. '),
(3, 8, 'Mundo das Telas Ltda.', '37698316/0004-22 ', 'Bem-vindo ao Mundo das Telas Ltda., onde a arte ganha vida e a criatividade conhece seu potencial ilimitado! Somos uma empresa dedicada a proporcionar uma experiência única no mundo da arte e da expressão visual.'),
(4, 9, 'Galeria de Arte & Design Ltda.', '54.802.699/0024-00', 'Na Galeria de Arte & Design, acreditamos que a arte e o design têm o poder de transformar e enriquecer nossas vidas. Nossa missão é criar um espaço onde a criatividade floresça, artistas talentosos encontrem uma plataforma para compartilhar suas visões e os amantes da arte encontrem inspiração única.'),
(5, 10, 'QuadrosExpress Arte & Design Ltda.', '24.587.172/0249-99 ', 'Bem-vindo à QuadrosExpress Arte & Design Ltda., onde a arte encontra o lar e o design se torna uma declaração. Somos apaixonados por proporcionar às pessoas a oportunidade de embelezar seus espaços com obras de arte excepcionais.'),
(6, 11, 'Pintura e Expressão Ltda.', '07.713.172/054-13', 'Bem-vindo à Pintura e Expressão Ltda., onde a arte se torna um meio de comunicação emocional e a expressão ganha vida através de cores e formas. Somos apaixonados por promover a apreciação da arte e dar voz a artistas talentosos.');

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
  ADD KEY `cliente_id` (`cliente_id`);

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
-- Índices para tabela `cupom`
--
ALTER TABLE `cupom`
  ADD PRIMARY KEY (`ID_cupom`),
  ADD KEY `desconto_id` (`desconto_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Índices para tabela `dashboardvendedores`
--
ALTER TABLE `dashboardvendedores`
  ADD PRIMARY KEY (`ID_dashboardVendedores`),
  ADD KEY `vendedor_id` (`vendedor_id`),
  ADD KEY `pagamento_id` (`pagamento_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `cumpom_ID` (`cumpom_ID`),
  ADD KEY `notasFiscais_id` (`notasFiscais_id`),
  ADD KEY `devolucoesTroca_id` (`devolucoesTroca_id`);

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
-- Índices para tabela `devolucoestroca`
--
ALTER TABLE `devolucoestroca`
  ADD PRIMARY KEY (`ID_devolucaoTroca`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `enderecoentrega`
--
ALTER TABLE `enderecoentrega`
  ADD PRIMARY KEY (`ID_enderecoEntrega`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices para tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`ID_endereco`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `enderecostransportadora`
--
ALTER TABLE `enderecostransportadora`
  ADD PRIMARY KEY (`ID_enderecoTransportadora`),
  ADD KEY `transportadora_id` (`transportadora_id`);

--
-- Índices para tabela `historicoatividades`
--
ALTER TABLE `historicoatividades`
  ADD PRIMARY KEY (`ID_historicoAtivid`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `itenscarrinhodecompra`
--
ALTER TABLE `itenscarrinhodecompra`
  ADD PRIMARY KEY (`ID_ItensCarrinhoCompra`),
  ADD KEY `carrinhoCompras_id` (`carrinhoCompras_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `itensdopedido`
--
ALTER TABLE `itensdopedido`
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
  ADD KEY `pagamento_id` (`pagamento_id`),
  ADD KEY `pedido_id` (`pedido_id`,`produto_id`),
  ADD KEY `notasfiscais_ibfk_3` (`produto_id`);

--
-- Índices para tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`ID_notificacao`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`ID_pagamento`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Índices para tabela `pagamentoboleto`
--
ALTER TABLE `pagamentoboleto`
  ADD PRIMARY KEY (`ID_pagamentoBoleto`),
  ADD KEY `pagamento_id` (`pagamento_id`);

--
-- Índices para tabela `pagamentocartao`
--
ALTER TABLE `pagamentocartao`
  ADD PRIMARY KEY (`ID_pagamentoCartao`),
  ADD KEY `pagamento_id` (`pagamento_id`);

--
-- Índices para tabela `pagamentopix`
--
ALTER TABLE `pagamentopix`
  ADD PRIMARY KEY (`ID_pagamentoPix`),
  ADD KEY `pagamento_id` (`pagamento_id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_pedido`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `endereco_entrega_id` (`endereco_entrega_id`),
  ADD KEY `vendedor_id` (`vendedor_id`),
  ADD KEY `transportadora_id` (`enderecoTransportadora_id`),
  ADD KEY `enderecoTransportadora_id` (`enderecoTransportadora_id`);

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
-- Índices para tabela `transportadora`
--
ALTER TABLE `transportadora`
  ADD PRIMARY KEY (`ID_transportadora`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_usuarios`);

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
  MODIFY `ID_avaliacaoComent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `conversaschatbot`
--
ALTER TABLE `conversaschatbot`
  MODIFY `ID_chatBot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `dashboardvendedores`
--
ALTER TABLE `dashboardvendedores`
  MODIFY `ID_dashboardVendedores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `ID_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `historicoatividades`
--
ALTER TABLE `historicoatividades`
  MODIFY `ID_historicoAtivid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `itenscarrinhodecompra`
--
ALTER TABLE `itenscarrinhodecompra`
  MODIFY `ID_ItensCarrinhoCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `itensdopedido`
--
ALTER TABLE `itensdopedido`
  MODIFY `ID_itensPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `listadesejos`
--
ALTER TABLE `listadesejos`
  MODIFY `ID_favoritos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `ID_notificacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pagamentoboleto`
--
ALTER TABLE `pagamentoboleto`
  MODIFY `ID_pagamentoBoleto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pagamentocartao`
--
ALTER TABLE `pagamentocartao`
  MODIFY `ID_pagamentoCartao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pagamentopix`
--
ALTER TABLE `pagamentopix`
  MODIFY `ID_pagamentoPix` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `suportecliente`
--
ALTER TABLE `suportecliente`
  MODIFY `ID_suporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `carrinhodecompras_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID_clientes`);

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
-- Limitadores para a tabela `cupom`
--
ALTER TABLE `cupom`
  ADD CONSTRAINT `cupom_ibfk_1` FOREIGN KEY (`desconto_id`) REFERENCES `descontos` (`ID_descontos`),
  ADD CONSTRAINT `cupom_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID_clientes`),
  ADD CONSTRAINT `cupom_ibfk_3` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`);

--
-- Limitadores para a tabela `dashboardvendedores`
--
ALTER TABLE `dashboardvendedores`
  ADD CONSTRAINT `dashboardvendedores_ibfk_1` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`ID_vendedores`),
  ADD CONSTRAINT `dashboardvendedores_ibfk_10` FOREIGN KEY (`cumpom_ID`) REFERENCES `cupom` (`ID_cupom`),
  ADD CONSTRAINT `dashboardvendedores_ibfk_11` FOREIGN KEY (`notasFiscais_id`) REFERENCES `notasfiscais` (`ID_notasFiscais`),
  ADD CONSTRAINT `dashboardvendedores_ibfk_2` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`ID_pagamento`),
  ADD CONSTRAINT `dashboardvendedores_ibfk_3` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID_clientes`),
  ADD CONSTRAINT `dashboardvendedores_ibfk_4` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`),
  ADD CONSTRAINT `dashboardvendedores_ibfk_7` FOREIGN KEY (`cumpom_ID`) REFERENCES `cupom` (`ID_cupom`),
  ADD CONSTRAINT `dashboardvendedores_ibfk_8` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`),
  ADD CONSTRAINT `dashboardvendedores_ibfk_9` FOREIGN KEY (`devolucoesTroca_id`) REFERENCES `devolucoestroca` (`ID_devolucaoTroca`);

--
-- Limitadores para a tabela `descontosprodutos`
--
ALTER TABLE `descontosprodutos`
  ADD CONSTRAINT `descontosprodutos_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`),
  ADD CONSTRAINT `descontosprodutos_ibfk_2` FOREIGN KEY (`desconto_id`) REFERENCES `descontos` (`ID_descontos`);

--
-- Limitadores para a tabela `devolucoestroca`
--
ALTER TABLE `devolucoestroca`
  ADD CONSTRAINT `devolucoesTroca_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`),
  ADD CONSTRAINT `devolucoesTroca_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

--
-- Limitadores para a tabela `enderecoentrega`
--
ALTER TABLE `enderecoentrega`
  ADD CONSTRAINT `enderecoEntrega_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID_clientes`);

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `enderecostransportadora`
--
ALTER TABLE `enderecostransportadora`
  ADD CONSTRAINT `enderecosTransportadora_ibfk_1` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadora` (`ID_transportadora`);

--
-- Limitadores para a tabela `historicoatividades`
--
ALTER TABLE `historicoatividades`
  ADD CONSTRAINT `historicoatividades_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `itenscarrinhodecompra`
--
ALTER TABLE `itenscarrinhodecompra`
  ADD CONSTRAINT `ItensCarrinhodeCompra_ibfk_1` FOREIGN KEY (`carrinhoCompras_id`) REFERENCES `carrinhodecompras` (`ID_carrinhoCompras`),
  ADD CONSTRAINT `ItensCarrinhodeCompra_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

--
-- Limitadores para a tabela `itensdopedido`
--
ALTER TABLE `itensdopedido`
  ADD CONSTRAINT `itensDopedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`),
  ADD CONSTRAINT `itensDopedido_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

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
  ADD CONSTRAINT `notasfiscais_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`),
  ADD CONSTRAINT `notasfiscais_ibfk_2` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`ID_pagamento`),
  ADD CONSTRAINT `notasfiscais_ibfk_3` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

--
-- Limitadores para a tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD CONSTRAINT `notificacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`);

--
-- Limitadores para a tabela `pagamentoboleto`
--
ALTER TABLE `pagamentoboleto`
  ADD CONSTRAINT `pagamentoBoleto_ibfk_1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`ID_pagamento`);

--
-- Limitadores para a tabela `pagamentocartao`
--
ALTER TABLE `pagamentocartao`
  ADD CONSTRAINT `pagamentoCartao_ibfk_1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`ID_pagamento`);

--
-- Limitadores para a tabela `pagamentopix`
--
ALTER TABLE `pagamentopix`
  ADD CONSTRAINT `pagamentoPix_ibfk_1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`ID_pagamento`);

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID_clientes`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`endereco_entrega_id`) REFERENCES `enderecoentrega` (`ID_enderecoEntrega`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`enderecoTransportadora_id`) REFERENCES `enderecostransportadora` (`ID_enderecoTransportadora`),
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
-- Limitadores para a tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
