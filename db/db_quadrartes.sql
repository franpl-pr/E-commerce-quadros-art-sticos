-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 16-Abr-2024 às 12:00
-- Versão do servidor: 8.0.36-0ubuntu0.22.04.1
-- versão do PHP: 8.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

Create database quadrartes;
use quadrartes;
--
-- Banco de dados: `qadrartes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `artistas`
--

CREATE TABLE `artistas` (
  `ID_artista` int NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `razao_social` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnpj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao_vendedor` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `artistas`
--

INSERT INTO `artistas` (`ID_artista`, `usuario_id`, `razao_social`, `cnpj`, `descricao_vendedor`) VALUES
(1, 3, 'PinturaViva Arte & Quadros Ltda.', '45778241/0001-22.', '\"PinturaViva Arte & Quadros Ltda. é uma empresa dedicada à criação e comercialização de obras de arte exclusivas e quadros artísticos de alta qualidade. Nossa paixão pela arte e nosso compromisso com a expressão criativa se refletem em cada peça que produzimos.'),
(2, 4, 'ArtePintada Empreendimentos Artísticos Ltda.', '23.976.014/0001-77', '\"ArtePintada Empreendimentos Artísticos Ltda. é uma empresa apaixonada pelo mundo da arte, dedicada a promover a criatividade e a expressão artística. Nosso compromisso é proporcionar um espaço para artistas talentosos e suas obras maravilhosas, abrindo portas para que suas criações cheguem ao mundo. '),
(3, 8, 'Mundo das Telas Ltda.', '37698316/0004-22 ', 'Bem-vindo ao Mundo das Telas Ltda., onde a arte ganha vida e a criatividade conhece seu potencial ilimitado! Somos uma empresa dedicada a proporcionar uma experiência única no mundo da arte e da expressão visual.'),
(4, 9, 'Galeria de Arte & Design Ltda.', '54.802.699/0024-00', 'Na Galeria de Arte & Design, acreditamos que a arte e o design têm o poder de transformar e enriquecer nossas vidas. Nossa missão é criar um espaço onde a criatividade floresça, artistas talentosos encontrem uma plataforma para compartilhar suas visões e os amantes da arte encontrem inspiração única.'),
(5, 10, 'QuadrosExpress Arte & Design Ltda.', '24.587.172/0249-99 ', 'Bem-vindo à QuadrosExpress Arte & Design Ltda., onde a arte encontra o lar e o design se torna uma declaração. Somos apaixonados por proporcionar às pessoas a oportunidade de embelezar seus espaços com obras de arte excepcionais.'),
(6, 11, 'Pintura e Expressão Ltda.', '07.713.172/054-13', 'Bem-vindo à Pintura e Expressão Ltda., onde a arte se torna um meio de comunicação emocional e a expressão ganha vida através de cores e formas. Somos apaixonados por promover a apreciação da arte e dar voz a artistas talentosos.');

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
-- Estrutura da tabela `avaliacoescomentarios`
--

CREATE TABLE `avaliacoescomentarios` (
  `ID_avaliacaoComent` int NOT NULL,
  `produto_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `avaliacao` decimal(3,2) NOT NULL,
  `comentario` text COLLATE utf8mb4_unicode_ci,
  `data_avaliacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `avaliacoescomentarios`
--

INSERT INTO `avaliacoescomentarios` (`ID_avaliacaoComent`, `produto_id`, `usuario_id`, `avaliacao`, `comentario`, `data_avaliacao`) VALUES
(1, 9, 2, '7.90', 'Chegou no prazo previsto, o quadro é muito bem trabalhado o material é durável além de ter ficado muito elegante no meu escritório. Muito obrigado.', '2023-09-12 01:44:31'),
(2, 11, 2, '6.90', 'O quadro chegou no prazo gostei muito da qualidade do retrato.', '2023-09-14 23:39:44'),
(3, 4, 4, '3.80', 'O produto veio com uns riscos, tive que trocá-lo.', '2023-09-14 23:58:18');

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
-- Estrutura da tabela `carrinhodecompras`
--

CREATE TABLE `carrinhodecompras` (
  `ID_carrinhoCompras` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `status` enum('Ativo','Vazio') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `carrinhodecompras`
--

INSERT INTO `carrinhodecompras` (`ID_carrinhoCompras`, `cliente_id`, `dataCriacao`, `status`) VALUES
(1, 1, '2023-05-10 09:40:34', 'Ativo'),
(2, 4, '2023-09-13 19:09:29', 'Ativo'),
(3, 3, '2023-09-10 19:09:29', 'Ativo'),
(4, 2, '2023-09-10 20:29:38', 'Ativo');

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
-- Estrutura da tabela `categoriasprodutos`
--

CREATE TABLE `categoriasprodutos` (
  `ID_categoria` int NOT NULL,
  `tipoCategoria` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci
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

--
-- Acionadores `categoriasprodutos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaCategoriasProdutos` AFTER UPDATE ON `categoriasprodutos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na categoriasprodutos: A categoria', NEW.ID_categoria, ' foi atualizada.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaCategoriasProdutos` AFTER DELETE ON `categoriasprodutos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na categoriasprodutos: A categoria', OLD.ID_categoria, ' foi deletada.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaCategoriasProdutos` AFTER INSERT ON `categoriasprodutos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na categoriasprodutos: A categoria', NEW.ID_categoria, ' foi adicionada.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `ID_clientes` int NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `cpf` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`ID_clientes`, `usuario_id`, `cpf`) VALUES
(1, 2, '48924697805'),
(2, 1, '36504972108'),
(3, 5, '123.456.789-00'),
(4, 6, '987.654.321-00'),
(5, 7, '456.789.123-00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comprovante`
--

CREATE TABLE `comprovante` (
  `ID_comprovante` int NOT NULL,
  `pagamento_id` int DEFAULT NULL,
  `pedido_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `observacoes` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `comprovante`
--

INSERT INTO `comprovante` (`ID_comprovante`, `pagamento_id`, `pedido_id`, `produto_id`, `data_emissao`, `valor_total`, `observacoes`) VALUES
(1, 1, 1, 9, '2023-09-11', '212.00', 'Empresa ArtePintada Empreendimentos Artísticos Ltda.'),
(2, 2, 2, 11, '2023-09-13', '109.00', NULL),
(3, 3, 3, 4, '2023-09-15', '99.99', NULL);

--
-- Acionadores `comprovante`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaComprovante` AFTER UPDATE ON `comprovante` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na comprovante: O comprovante ', NEW.pedido_id, ' foi atualizado.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaComprovante` AFTER DELETE ON `comprovante` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na comprovante: O comprovante ', OLD.pedido_id, ' foi deletado.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaComprovante` AFTER INSERT ON `comprovante` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na comprovante: O pedido ', NEW.pedido_id, ' gerou comprovante ', NEW.ID_comprovante));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dashboardvendedores`
--

CREATE TABLE `dashboardvendedores` (
  `ID_dashboardVendedores` int NOT NULL,
  `vendedor_id` int DEFAULT NULL,
  `tipo` enum('Vendas','Comissao','Produtos','Estoque') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faturamento` decimal(10,2) DEFAULT NULL,
  `comissao` decimal(10,2) DEFAULT NULL,
  `estoque` int DEFAULT NULL,
  `pagamento_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `pedido_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `devolucoesTroca_id` int DEFAULT NULL,
  `comprovante_id` int DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `dashboardvendedores`
--

INSERT INTO `dashboardvendedores` (`ID_dashboardVendedores`, `vendedor_id`, `tipo`, `faturamento`, `comissao`, `estoque`, `pagamento_id`, `cliente_id`, `pedido_id`, `produto_id`, `devolucoesTroca_id`, `comprovante_id`, `descricao`) VALUES
(1, 2, 'Vendas', '212.00', '120.00', 21, 1, 1, 1, 9, NULL, 1, 'Pedido entregue com êxito!'),
(2, 6, 'Vendas', '554.69', '69.99', 21, 2, 2, 2, 11, NULL, 2, NULL),
(3, 1, 'Vendas', '245.69', '64.99', 13, 3, 4, 3, 4, 1, 3, NULL);

--
-- Acionadores `dashboardvendedores`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaDashboardVendedores` AFTER UPDATE ON `dashboardvendedores` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na dashboardvendedores: O pedido ', NEW.pedido_id, ' foi atualizado do dashboard.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaDashboardVendedores` AFTER DELETE ON `dashboardvendedores` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na dashboardvendedores: O pedido ', OLD.pedido_id, ' foi deletado do dashboard.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaDashboardVendedores` AFTER INSERT ON `dashboardvendedores` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na dashboardvendedores: O pedido ', NEW.pedido_id, ' foi incluido no dashboard.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucoestroca`
--

CREATE TABLE `devolucoestroca` (
  `ID_devolucaoTroca` int NOT NULL,
  `pedido_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `data_devolucao` datetime DEFAULT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Aguardando Avaliacao','Processada','Rejeitada','Concluída') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `devolucoestroca`
--

INSERT INTO `devolucoestroca` (`ID_devolucaoTroca`, `pedido_id`, `produto_id`, `data_devolucao`, `motivo`, `status`, `observacoes`) VALUES
(1, 3, 4, '2023-09-19 20:52:04', 'O quadro veio com uns riscos, gostaria de trocar', 'Aguardando Avaliacao', 'Troca de produto');

--
-- Acionadores `devolucoestroca`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaDevolucoesTroca` AFTER UPDATE ON `devolucoestroca` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na devolucoestroca: O pedido ', NEW.pedido_id, ' devolvido foi atualizado.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaDevolucoesTroca` AFTER DELETE ON `devolucoestroca` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na devolucoestroca: O pedido ', OLD.pedido_id, ' devolvido foi deletado.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaDevolucoesTroca` AFTER INSERT ON `devolucoestroca` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na devolucoestroca: O pedido ', NEW.pedido_id, ' foi devolvido.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `ID_endereco` int NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `logradouro` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` int DEFAULT NULL,
  `complemento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
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

--
-- Acionadores `enderecos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaEnderecos` AFTER UPDATE ON `enderecos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na enderecos: O usuário ', NEW.usuario_id, ' deatualizou o endereco.', NEW.ID_endereco,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaEnderecos` AFTER DELETE ON `enderecos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na enderecos: O usuário ', OLD.usuario_id, ' deletou o endereco.', OLD.ID_endereco,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaEnderecos` AFTER INSERT ON `enderecos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na enderecos: O usuário ', NEW.usuario_id, ' adicionou um novo endereco.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `historicoatividades`
--

CREATE TABLE `historicoatividades` (
  `ID_historicoAtivid` int NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci
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
  `ID_ItensCarrinhoCompra` int NOT NULL,
  `carrinhoCompras_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `precoUnitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `itenscarrinhodecompra`
--

INSERT INTO `itenscarrinhodecompra` (`ID_ItensCarrinhoCompra`, `carrinhoCompras_id`, `produto_id`, `quantidade`, `precoUnitario`) VALUES
(1, 1, 9, 1, '199.99'),
(2, 4, 11, 1, '109.00'),
(3, 2, 4, 1, '99.99');

--
-- Acionadores `itenscarrinhodecompra`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaItensCarrinhoDeCompra` AFTER UPDATE ON `itenscarrinhodecompra` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na itenscarrinhodecompra: O produto ', NEW.produto_id, ' foi atualizado do carrinho', NEW.carrinhoCompras_id,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaItensCarrinhoDeCompra` AFTER DELETE ON `itenscarrinhodecompra` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na itenscarrinhodecompra: O produto ', OLD.produto_id, ' foi deletado do carrinho', OLD.carrinhoCompras_id,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaItensCarrinhoDeCompra` AFTER INSERT ON `itenscarrinhodecompra` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na itenscarrinhodecompra: O produto ', NEW.produto_id, ' foi adicionado ao carrinho', NEW.carrinhoCompras_id,'.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `listadesejos`
--

CREATE TABLE `listadesejos` (
  `ID_favoritos` int NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
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

--
-- Acionadores `listadesejos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaListaDesejos` AFTER UPDATE ON `listadesejos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na listadesejos: O usuário ', NEW.usuario_id, ' atualizou o produto ', NEW.produto_id,' da lista de desejo ', ID_listadesejos,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaListaDesejos` AFTER DELETE ON `listadesejos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na listadesejos: O usuário ', OLD.usuario_id, ' deletou o produto ', OLD.produto_id,' da lista de desejo ', ID_listadesejos,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaListaDesejos` AFTER INSERT ON `listadesejos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na listadesejos: O usuário ', NEW.usuario_id, ' adicionou a lista de desejo o produto ', NEW.produto_id,'.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `ID_pagamento` int NOT NULL,
  `pedido_id` int DEFAULT NULL,
  `metodo_pagamento` enum('Cartão de Crédito','Cartão de Dédito','Boleto Bancário','PIX') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `data_pagamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_pagamento` enum('Aprovado','Aguardando Pagamento','Recusado','Estornada') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`ID_pagamento`, `pedido_id`, `metodo_pagamento`, `valor_pago`, `data_pagamento`, `status_pagamento`) VALUES
(1, 1, 'Cartão de Dédito', '212.00', '2023-09-12 01:38:19', 'Aprovado'),
(2, 2, 'PIX', '109.00', '2023-09-12 22:11:51', 'Aprovado'),
(3, 3, 'Boleto Bancário', '99.99', '2023-09-14 23:49:55', 'Aprovado');

--
-- Acionadores `pagamento`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaPagamento` AFTER UPDATE ON `pagamento` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na pagamento: O pagamento ', NEW.ID_pagamento, ' foi atualizado.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaPagamento` AFTER DELETE ON `pagamento` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na pagamento: O pagamento ', OLD.ID_pagamento, ' foi deletado.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaPagamento` AFTER INSERT ON `pagamento` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na pagamento: O pagamento ', NEW.ID_pagamento, ' foi cadastrado.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentoboleto`
--

CREATE TABLE `pagamentoboleto` (
  `ID_pagamentoBoleto` int NOT NULL,
  `pagamento_id` int DEFAULT NULL,
  `dataVencimento` date NOT NULL,
  `dataPagamento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pagamentoboleto`
--

INSERT INTO `pagamentoboleto` (`ID_pagamentoBoleto`, `pagamento_id`, `dataVencimento`, `dataPagamento`) VALUES
(1, 3, '2023-09-15', '2023-09-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentocartao`
--

CREATE TABLE `pagamentocartao` (
  `ID_pagamentoCartao` int NOT NULL,
  `pagamento_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pagamentocartao`
--

INSERT INTO `pagamentocartao` (`ID_pagamentoCartao`, `pagamento_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentopix`
--

CREATE TABLE `pagamentopix` (
  `ID_pagamentoPix` int NOT NULL,
  `pagamento_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pagamentopix`
--

INSERT INTO `pagamentopix` (`ID_pagamentoPix`, `pagamento_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_pedido` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `endereco_id` int DEFAULT NULL,
  `data_estimadaEntrega` date DEFAULT NULL,
  `vendedor_id` int DEFAULT NULL,
  `custo_frete` decimal(10,2) DEFAULT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_pedido` decimal(10,2) NOT NULL,
  `status` enum('Pendente','Em Processamento','Enviado','Entregue','Cancelado') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`ID_pedido`, `cliente_id`, `endereco_id`, `data_estimadaEntrega`, `vendedor_id`, `custo_frete`, `data_pedido`, `total_pedido`, `status`) VALUES
(1, 1, 1, '2023-09-13', 2, '12.00', '2023-09-12 01:35:42', '212.00', 'Entregue'),
(2, 2, 2, '2023-09-14', 6, '0.00', '2023-09-12 01:35:42', '109.00', 'Em Processamento'),
(3, 4, 4, '2023-09-18', 1, NULL, '2023-09-14 23:47:42', '99.99', 'Entregue');

--
-- Acionadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaPedidos` AFTER UPDATE ON `pedidos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na pedidos: O pedido ', NEW.ID_pedido, ' foi atualizado pelo cliente', NEW.cliente_id,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaPedidos` AFTER DELETE ON `pedidos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na pedidos: O pedido ', OLD.ID_pedido, ' foi deletado pelo cliente', OLD.cliente_id,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaPedidos` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na pedidos: O pedido ', NEW.ID_pedido, ' foi cadastrado pelo cliente', NEW.cliente_id,'.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfilartista`
--

CREATE TABLE `perfilartista` (
  `perfilArtista_id` int NOT NULL,
  `tipoarte` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fotoperfil` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biografia` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_artista` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Acionadores `perfilartista`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaPerfilartista` AFTER UPDATE ON `perfilartista` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Atualização na perfilartista: O artista ', NEW.ID_artista, ' atualizou o seu perfil.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaPerfilartista` AFTER DELETE ON `perfilartista` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Deleção na perfilartista: O artista ', OLD.ID_artista, ' deletou o seu perfil.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaPerfilartista` AFTER INSERT ON `perfilartista` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (mysql.user.User, 
            NOW(), 
            CONCAT('Inserção na perfilartista: O artista ', NEW.ID_artista, ' cadastrou o seu perfil.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID_produtos` int NOT NULL,
  `vendedor_id` int DEFAULT NULL,
  `nomeQuadro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estoque` int NOT NULL,
  `avaliacaoMedia` decimal(3,2) DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `cor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamanho` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`ID_produtos`, `vendedor_id`, `nomeQuadro`, `descricao`, `preco`, `imagem`, `estoque`, `avaliacaoMedia`, `categoria_id`, `cor`, `tamanho`) VALUES
(1, 1, 'Bauhaus Geométrico – Vermelho', 'O \"Quadro Bauhaus Geométrico - Vermelho Azul Amarelo\" é uma obra que se inspira na estética da Escola Bauhaus, um movimento artístico e escola de design fundada na Alemanha no início do século XX. A Escola Bauhaus foi conhecida por sua abordagem modernista e foco na simplicidade, geometria e cores primárias, incluindo vermelho, azul e amarelo.', '60.00', 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2022/08/006.png', 5, NULL, 1, 'Vermelho', '60 x 60 cm'),
(2, 1, 'Quadro Frida Kahlo Graphics', 'Obra de arte que é inspirada na famosa artista mexicana Frida Kahlo. Frida Kahlo é conhecida por suas pinturas autorretrato e pelo uso de cores vibrantes e simbolismo em suas obras. ', '180.00', 'https://www.quadrorama.com.br/imagens/quadro-decorativo/?quadro=2019/03/Frida-graphics-Geometrico-351x496.png', 9, NULL, 2, 'Preto', '70 x 60 cm'),
(3, 1, 'Quadro Abstrato', '\r\nQuadro de arte abstrata em tons de azul.', '99.99', 'quadro1.jpg', 10, '4.50', 1, 'Azul', '40 x 40 cm'),
(4, 1, 'Pintura a Óleo', 'Pintura a óleo em tela de paisagem', '149.00', 'quadropaisagem.png', 14, '3.50', 4, 'Verde', '80 x 90 cm'),
(5, 3, 'Retrato Moderno', 'Retrato moderno de uma mulher.', '79.00', 'quadroMulher.jpg', 29, '5.00', 5, 'Vermelho', '60 x 60 cm'),
(6, 3, 'Natureza Morta', 'Natureza morta com frutas em óleo.', '129.99', 'narezamorta.jpg', 7, '4.90', 10, 'Verde', '80 x 80 cm'),
(7, 4, 'Abstrato Geométrico', 'Abstrato Geométrico', '89.99', NULL, 12, '3.60', 2, 'Rosa claro', '40 x 60 cm'),
(8, 4, 'Pintura em Aquarela', 'Pintura em aquarela de uma paisagem tropical.', '69.99', 'aquarelaqudro.jpg', 44, '8.00', 3, 'Rosa, vermelho, roxo e preto', '100x120 '),
(9, 2, 'Retrato Clássico', 'Retrato clássico de uma figura histórica.', '199.99', 'retratoclass.jpg', 22, '6.80', 6, 'Preto, cinza, bege e laranja', '10 x 10 cm'),
(10, 5, '\"Noite Estrelada\"', '\"Noite Estrelada\" é um nome de quadro que evoca imagens de um cenário noturno repleto de estrelas e beleza. Este nome é conhecido por ser uma referência a uma famosa obra do pintor Vincent van Gogh chamada \"A Noite Estrelada\" (\"Starry Night\" em inglês). ', '130.00', 'noiteestrelada.jpg', 15, '6.90', 6, 'Preto, azul, verde', '100x160cm'),
(11, 6, 'A Dança das Cores', '\"A Dança das Cores\" é um nome encantador e evocativo para um quadro artístico. Ele sugere uma combinação de movimento, energia e expressão visual através das cores.\"', '109.00', 'dancaCores.jpg', 22, '6.80', 1, 'Variações de cores', '40 x 80 cm');

--
-- Acionadores `produtos`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaProdutos` AFTER UPDATE ON `produtos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (NEW.vendedor_id, 
            NOW(), 
            CONCAT('Atualização na produtos: O vendedor ', NEW.vendedor_id, ' atualizou o produto ', NEW.ID_produtos,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaProdutos` AFTER DELETE ON `produtos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (OLD.vendedor_id, 
            NOW(), 
            CONCAT('Deleção na produtos: O vendedor ', OLD.vendedor_id, ' deletou o produto ', OLD.ID_produtos,'.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaProdutos` AFTER INSERT ON `produtos` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (NEW.vendedor_id, 
            NOW(), 
            CONCAT('Inserção na produtos: O vendedor ', NEW.vendedor_id, ' cadastrou o produto ', NEW.ID_produtos,'.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `suportecliente`
--

CREATE TABLE `suportecliente` (
  `ID_suporte` int NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `assunto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mensagem` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Aberto','Em Andamento','Fechado') COLLATE utf8mb4_unicode_ci DEFAULT NULL
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

--
-- Acionadores `suportecliente`
--
DELIMITER $$
CREATE TRIGGER `AposAtualizacaoNaSuporteCliente` AFTER UPDATE ON `suportecliente` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (NEW.usuario_id, 
            NOW(), 
            CONCAT('Atualização na suportecliente: A requisição de suporte ', NEW.ID_suporte,'foi deletada.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposDelecaoNaSuporteCliente` AFTER DELETE ON `suportecliente` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (OLD.usuario_id, 
            NOW(), 
            CONCAT('Deleção na suportecliente: A requisição de suporte ', OLD.ID_suporte,'foi deletada.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AposInsercaoNaSuporteCliente` AFTER INSERT ON `suportecliente` FOR EACH ROW BEGIN
    INSERT INTO historicoatividades(usuario_id, data_hora, descricao)
    VALUES (NEW.usuario_id, 
            NOW(), 
            CONCAT('Inserção na suportecliente: O usuário ', NEW.usuario_id, ' requisitou suporte ', NEW.ID_suporte,'.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_usuarios` int NOT NULL,
  `nomeCompleto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('Cliente','Vendedor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` enum('Masculino','Feminino','Outro') COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`ID_usuarios`, `nomeCompleto`, `email`, `senha`, `login`, `telefone`, `tipo`, `genero`, `data_nascimento`) VALUES
(1, 'Luana Souza Dias', 'luanasouza87@gmail.com', '8475#fsqi', 'luana456Souza', '019982479891', 'Cliente', 'Masculino', NULL),
(2, 'Hugo Perez Santos', 'perezhugo959@gmail.com', 'hugi78@', 'perez46Higo', '01894763218', 'Cliente', 'Masculino', NULL),
(3, 'Geovana Liz Fagundes', 'lizgiovana45@gmail.com', '7859@gh$sw', 'lizgio76', '0213879-4522', 'Vendedor', 'Masculino', NULL),
(4, 'Fabio Melo Santos', 'melo45santos@gmail.com', '754hjei87u&', 'meloFabio46', '0783874-6417', 'Vendedor', 'Masculino', NULL),
(5, 'Juliana Gomes Silva', 'gomes.silva45@.com', '8yun@jkf', 'jugomes9', '(11) 9848-7852', 'Cliente', 'Masculino', NULL),
(6, 'Antonio Mirante Souza', 'antonio.souza@mirante.com', 'antonio87k#', 'mirantonio33', '(22) 98745-5487', 'Cliente', 'Masculino', NULL),
(7, 'Isabela Lucia Santos', 'lucia.santos@isabela.com', 'jilucia870', 'IsaLUC88', '(19) 9785-6578', 'Cliente', 'Masculino', NULL),
(8, 'Domingues Pedro Rodrigues', 'pedro.rodrigues@domin65.com', 'domPedi8778', 'PEDROdom3', '(44) 97854-2871', 'Vendedor', 'Masculino', NULL),
(9, 'Cassia Adala Lima', 'adala.lima@cassia.com', '548CasiADl', 'adalCass09', '(21) 3917-7890', 'Vendedor', 'Masculino', NULL),
(10, 'Renata Aicher', 'aicherrrenta53@gmail.com', 'rent464#Ai', 'Aicher35', '02638716634', 'Vendedor', 'Masculino', NULL),
(11, 'Fernando Nogueira', 'nogueirafernando4@gmail.com', '51aKaj21Bsi', 'noguFern46', '193647-9982', 'Vendedor', 'Masculino', NULL);

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
-- Índices para tabela `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`ID_artista`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

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
-- Índices para tabela `comprovante`
--
ALTER TABLE `comprovante`
  ADD PRIMARY KEY (`ID_comprovante`),
  ADD KEY `pagamento_id` (`pagamento_id`),
  ADD KEY `pedido_id` (`pedido_id`,`produto_id`),
  ADD KEY `notasfiscais_ibfk_3` (`produto_id`);

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
  ADD KEY `notasFiscais_id` (`comprovante_id`),
  ADD KEY `devolucoesTroca_id` (`devolucoesTroca_id`);

--
-- Índices para tabela `devolucoestroca`
--
ALTER TABLE `devolucoestroca`
  ADD PRIMARY KEY (`ID_devolucaoTroca`),
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
-- Índices para tabela `itenscarrinhodecompra`
--
ALTER TABLE `itenscarrinhodecompra`
  ADD PRIMARY KEY (`ID_ItensCarrinhoCompra`),
  ADD KEY `carrinhoCompras_id` (`carrinhoCompras_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `listadesejos`
--
ALTER TABLE `listadesejos`
  ADD PRIMARY KEY (`ID_favoritos`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `produto_id` (`produto_id`);

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
  ADD KEY `endereco_entrega_id` (`endereco_id`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- Índices para tabela `perfilartista`
--
ALTER TABLE `perfilartista`
  ADD PRIMARY KEY (`perfilArtista_id`,`ID_artista`),
  ADD KEY `FK-artistaID` (`ID_artista`);

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
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_usuarios`);

--
-- AUTO_INCREMENT de tabelas despejadas

-- AUTO_INCREMENT de tabela `artistas`
--
ALTER TABLE `artistas`
  MODIFY `ID_artista` int NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela `avaliacoescomentarios`
--
ALTER TABLE `avaliacoescomentarios`
  MODIFY `ID_avaliacaoComent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT de tabela `carrinhodecompras`
--
ALTER TABLE `carrinhodecompras`
  MODIFY `ID_carrinhoCompras` int NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela `categoriasprodutos`
--
ALTER TABLE `categoriasprodutos`
  MODIFY `ID_categoria` int NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_clientes` int NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela `comprovante`
--
ALTER TABLE `comprovante`
  MODIFY `ID_comprovante` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `dashboardvendedores`
--
ALTER TABLE `dashboardvendedores`
  MODIFY `ID_dashboardVendedores` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT de tabela `devolucoestroca`
--
ALTER TABLE `devolucoestroca`
  MODIFY `ID_devolucaoTroca` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `ID_endereco` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `historicoatividades`
--
ALTER TABLE `historicoatividades`
  MODIFY `ID_historicoAtivid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `itenscarrinhodecompra`
--
ALTER TABLE `itenscarrinhodecompra`
  MODIFY `ID_ItensCarrinhoCompra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `listadesejos`
--
ALTER TABLE `listadesejos`
  MODIFY `ID_favoritos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `ID_pagamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pagamentoboleto`
--
ALTER TABLE `pagamentoboleto`
  MODIFY `ID_pagamentoBoleto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pagamentocartao`
--
ALTER TABLE `pagamentocartao`
  MODIFY `ID_pagamentoCartao` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pagamentopix`
--
ALTER TABLE `pagamentopix`
  MODIFY `ID_pagamentoPix` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `perfilartista`
--

ALTER TABLE `perfilartista` 
  CHANGE  `perfilArtista_id` INT(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  CHANGE `ID_produtos` `ID_produtos` int NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT de tabela `suportecliente`
--
ALTER TABLE `suportecliente`
  CHANGE `ID_suporte` `ID_suporte` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios` 
  CHANGE `ID_usuarios` `ID_usuarios` INT(11) NOT NULL AUTO_INCREMENT;
--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `artistas`
--
ALTER TABLE `artistas`
  ADD CONSTRAINT `artistas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID_usuarios`);

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
-- Limitadores para a tabela `comprovante`
--
ALTER TABLE `comprovante`
  ADD CONSTRAINT `comprovante_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`),
  ADD CONSTRAINT `comprovante_ibfk_2` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`ID_pagamento`),
  ADD CONSTRAINT `comprovante_ibfk_3` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

--
-- Limitadores para a tabela `devolucoestroca`
--
ALTER TABLE `devolucoestroca`
  ADD CONSTRAINT `devolucoesTroca_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID_pedido`),
  ADD CONSTRAINT `devolucoesTroca_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID_produtos`);

--
-- Limitadores para a tabela `perfilartista`
--
ALTER TABLE `perfilartista`
  ADD CONSTRAINT `FK-artistaID` FOREIGN KEY (`ID_artista`) REFERENCES `artistas` (`ID_artista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

