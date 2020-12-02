-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 01-Dez-2020 às 05:06
-- Versão do servidor: 5.6.41-84.1
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trasscom_site`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog`
--

CREATE TABLE `blog` (
  `blogID` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL DEFAULT '',
  `descricaoface` varchar(2048) NOT NULL DEFAULT '',
  `descricao` text NOT NULL,
  `datacadastro` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blog`
--

INSERT INTO `blog` (`blogID`, `titulo`, `descricaoface`, `descricao`, `datacadastro`) VALUES
(1, '4 dicas para aumentar a produtividade em home office', 'Uma das tendências do mercado de trabalho está sendo a mudança de trabalho presencial para trabalho remoto, ou também conhecido atualmente como Home Office. Porém trabalhar em home office não é tão simples assim, o foco precisa ser dobrado, pois como você está em um ambiente que antes seria pra descanso, agora é também o seu novo escritório!', '<p> Uma das tendências do mercado de trabalho está sendo a mudança de trabalho presencial para trabalho remoto, ou também conhecido atualmente como Home Office.  Porém trabalhar em home office não é tão simples assim, o foco precisa ser dobrado, pois como você está em um ambiente que antes seria pra descanso, agora é também o seu novo escritório! </p> <p> Neste post, trouxemos 4 dicas para aumentar a produtividade em home office. Assim, você garante um bom desempenho sempre – para você e para os seus colaboradores. Confira: </p> <br> <h4>Dailies</h4> <p> Mesmo para empresas que não utilizam o SCRUM, realizar conversas diárias com as equipes é uma ótima forma de manter a produtividade e cumprir os prazos. As dailies são conversas de alinhamento, em que cada participante reporta o status de suas tarefas e os impeditivos para continuar (caso existam). Assim, você garante transparência na comunicação e pode agir rapidamente para corrigir possíveis empecilhos. </p> <br> <h4>Pomodoro</h4> <p> Essa técnica consiste em períodos de foco intercalados com pausas. São 25 minutos de concentração total e 5 minutos de intervalo ao fim de cada bloco. Para colocar em prática, você deve listar as atividades do dia e utilizar um timer para marcar o tempo. Existem aplicativos e extensões para o navegador que simplificam o acompanhamento. Uma pesquisa rápida por “pomodoro” na loja de apps do seu smartphone ou de extensões do browser retornará várias opções para a sua escolha. </p>   <br> <h4>Videochamadas</h4> <p> Manter a proximidade com os colegas pode ser desafiador, mas as ferramentas de videochamada vêm para facilitar esse contato. Fazer “calls” frequentes é um jeito de resolver assuntos rapidamente e garantir que todos estejam empenhados em realizar suas atividades, onde quer que estejam. </p>  <br> <h4>Tracking</h4> <p> Para quem preza por autonomia na equipe, existem aplicativos e plataformas que permitem registrar e acompanhar o andamento das tarefas em tempo real. Na hora de escolher, lembre-se de avaliar se a ferramenta é intuitiva e se permite a criação de relatórios, que podem servir de base para orientar estratégias e medir resultados. </p>', '2020-06-01'),
(2, 'Como salvar o seu negócio da crise', 'Descubra de que forma a transformação digital vai garantir a sua sobrevivência no mercado.', '<p>Muitas empresas adiaram ao máximo a adoção da tecnologia em suas operações. Entretanto, com as mudanças ocasionadas pela pandemia da COVID-19, levar os negócios para o digital não é mais uma opção. Assim, o “novo normal” exige ações rápidas e é preciso mais do que repensar estratégias e digitalizar rotinas. Por isso, vamos mostrar a você como salvar o seu negócio da crise e garantir receita mesmo em cenários desfavoráveis.</p> <br> <h4>O que é transformação digital?</h4> <p>Transformação digital é um tema recorrente em nosso blog e não é à toa. Sabemos da importância vital da modernização tecnológica para as empresas de hoje e de amanhã. Por isso, é fundamental reforçar que transformação digital não é apenas ter um site ou uma conta profissional no Instagram.</p> <br> <p>Levar esse conceito à realidade dos negócios também significa ter presença on-line, mas vai muito além disso. Dessa forma, podemos dizer que a transformação digital implica usar a tecnologia para:</p> <li>Resolver necessidades e facilitar a vida das pessoas;</li> <li>Ganhar agilidade com processos repetitivos;</li> <li>Conseguir alocar talentos humanos em áreas estratégicas;</li> <li>Extrair o máximo da capacidade produtiva sem desgastar ou comprometer a equipe;</li> <li>Tomar decisões mais acertadas e em menos tempo;</li> <li>Economizar com custos, reduzir prejuízos e evitar novas perdas;</li> <li>Aumentar ganhos e possibilitar o crescimento conjunto.</li>', '2020-06-02'),
(3, 'Impacto da tecnologia nas empresas', 'Desde a popularização da internet, as novas tecnologias não param mais de aparecer, assumindo um papel cada vez mais importante em nosso dia a dia. Nos relacionamos no mundo virtual, compramos e nos divertimos digitalmente: toda a nossa vida pessoal gira hoje em torno da rede. Veja mais como a tecnologia tem impactado as empresas.', '<p>\r\nDesde a popularização da internet, as novas tecnologias não param mais de aparecer, assumindo um papel cada vez mais importante em nosso dia a dia. Nos relacionamos no mundo virtual, compramos e nos divertimos digitalmente: toda a nossa vida pessoal gira hoje em torno da rede.\r\n</p>\r\n<p>\r\nÉ claro que uma revolução desse porte não deixaria de alcançar também o setor empresarial. E não é para menos: o impacto da tecnologia nas empresas que vemos hoje permite, entre outras coisas, alcançar maior eficiência na gestão, agilidade no contato com clientes e fornecedores e etc.\r\n</p>\r\n<p>Veja alguns dos pontos que a tecnologia tem impacto na sua empresa:\r\n<br>\r\n<h4>Reduzir custos da empresa</h4>\r\n<p>\r\nCom uma gestão mais eficiente, sua empresa poderá identificar de forma mais rápida e simples os gastos desnecessários.\r\n</p>\r\n<p>\r\nDa mesma forma, as mudanças tecnológicas nas empresas permitem acompanhar o retorno dos investimentos da sua empresa — investimentos financeiros, em marketing, contratações, entre outros.\r\n</p>\r\n<p>\r\nEsse acompanhamento possibilita orientar melhor os investimentos da sua empresa, evitando prejuízos, sua empresa ainda reduz custos com impressão e manutenção de equipamentos/computadores dentro de sua empresa.\r\n</p>\r\n<br>\r\n<h4>Mais vendas!</h4>\r\n<p>Simmm, exatamente, enquanto algumas empresas ficam esperando os clientes entrarem pra comprarem os produtos, com a tecnologia, muitas pessoas conseguem saber da sua loja sem mesmo entrar nela.</p>\r\n<p>\r\nPor exemplo, através de um <a style=\"color:#d6619c;\" href=\"../servicos/site\">site institucional</a> sua empresa consegue estar na internet, divulgar todos os seus respectivos produtos e serviços, o seu site pode estar vinculado ao Google e alcançar muito mais pessoas, consequentemente realizar muito mais vendas, do que ficar esperando atrás do balcão os clientes virem.\r\n</p>\r\n<br>\r\n<h4>Agilidade no contato com clientes e fornecedores</h4>\r\n<p>\r\nSe há um impacto da tecnologia nas empresas é a comunicação. Hoje, para além das formas convencionais de contato, como e-mail e telefone, já é possível contatar clientes e fornecedores até por aplicativos como WhatsApp, Telegram, Instagram e Facebook. Tudo isso garante maior rapidez na comunicação e um melhor impacto da tecnologia nas empresas.\r\n</p>\r\n<br>\r\n<h4>Maior alcance de clientes</h4>\r\n<p>\r\nQual o impacto da revolução digital na gestão organizacional? A internet abriu uma oportunidade para as empresas nunca antes vista: alcançar o mundo todo, de forma simples e descomplicada.\r\n</p>\r\n<p>\r\nAs novas soluções de marketing digital têm um impacto crescente na captação de novos leads para as companhias, tornando-se uma solução concreta para o crescimento e projeção da sua marca no mercado.\r\n</p>\r\n<p>\r\nQuer saber mais sobre o impacto da tecnologia nas empresas? Então confira, a seguir, as 3 áreas que mais podem se beneficiar por essas novas mudanças tecnológicas nas empresas.\r\n</p>\r\n<br>\r\n<h4>Marketing mais barato</h4>\r\n<p>\r\nAntigamente as únicas formas de divulgar sua empresa era através de jornais ou rádio, isso tinha um custo muito alto, e poucas pessoas na cidade conseguiam ver o anúncio de sua empresa.\r\n</p>\r\n<p>\r\nCasos mais sofisticados, como a utilização de vídeos em comerciais na televisão, eram estratosfericamente muito caras para criar um anúncio da sua empresa.\r\n</p>\r\n<p>\r\nHoje em dia com a internet, mais especificamente com as <a style=\"color:#d6619c;\" href=\"../servicos/conteudo\">mídias sociais</a>, sua empresa consegue divulgar seus produtos, criar anúncios, fazer vídeos, tudo de uma forma muito barata, e entregando para muito mais pessoas.\r\n</p>\r\n<br><br>\r\n', '2020-06-03'),
(4, '3 tendências tecnológicas que devem marcar o mundo pós Covid-19', 'Com a pandemia, diversas empresas de todos os setores terão um olhar mais atento para as tecnologias que podem fazer a diferença entre a prosperidade e a falência.', 'Com a pandemia, diversas empresas de todos os setores terão um olhar mais atento para as tecnologias que podem fazer a diferença entre a prosperidade e a falência. <p> A  evolução tecnológica foi um marco bem representativo do século 20. Durante esse período o mundo viu as empresas, que até então atuavam com trabalho desenvolvido por operários, serem dominadas pela automação dos processos, permitindo a produção em massa.  Há alguns historiadores que acreditam que faltava um fato histórico que marcasse o fim do século 20 e abrisse as portas para tudo o que o século 21 nos reserva. A pandemia do Coronavírus, parece ser esse divisor de águas. </p> </p> <p> Adaptabilidade, velocidade, flexibilidade, inovação, tecnologia, digitalização, colaboração são palavras centrais deste novo normal. A aceleração das mudanças vai abrindo portas para o crescimento exponencial e as relações interpessoais vão encontrando novos espaços e novos formatos nesta nova realidade. Acreditamos que o coronavírus facilitará a exponencialidade da tecnologia sim, mas acredito também que as pessoas entenderão cada vez mais o limite entre o mundo digital e o real nas suas vidas pessoais. E esse equilíbrio pode nos levar para a evolução que o mundo precisa, no âmbito econômico e de sustentabilidade. Confira abaixo algumas das tendências e avanços tecnológicos que terão durante e após esse pandemia:</p> <br> <h4>Home Office</h4> <p>Também conhecido como trabalho remoto, já é um exemplo de mudança atual. Já incorporado há algum tempo por empresas mais visionárias, a partir de agora passa a ganhar notoriedade inclusive para organizações mais tradicionais. Essa modalidade pode oferecer uma série de vantagens tanto para a empresa como para o colaborador.  </p> <br> <h4>Transformação Digital</h4> <p> Este é outro aspecto que será tratado ainda mais com um olhar atencioso. Leia também <a href=\"./blog/2\" style=\"color: #d6619c;\">Transformação Digital - Como salvar o seu negócio da crise</a> </p> <p> A pandemia mostrou de maneira definitiva o quanto os planos podem ser inúteis e até perigosos quando acontece uma mudança repentina de cenário. A capacidade de se adaptar rapidamente, de mudar passa a ser o elemento essencial e, neste contexto, não é possível prescindir da tecnologia. </p> <p> Empresas que não se viam atuando com processos digitais antes, viram  a sobrevivência do negócio sendo colocado em xeque da noite para o dia. Com isso, a transformação  digital deixou de ser um processo gradual e passou a ser algo urgente e necessário para a sobrevivência no  mercado. Quando se fala em transformação digital, se refere à fusão dos mundos físico, digital e biológico através da tecnologia, que segundo o executivo, estará cada vez mais presente no cotidiano de todos e também nos modelos de negócios. </p> <br> <h4>Inteligência Artificial</h4> <p> A inteligência artificial também será cada vez mais uma tendência de  mercado. No próprio combate ao coronavírus, a IA já vem se mostrando uma ferramenta importante para entender a dinâmica da pandemia e, com isso, traçar um plano de ação para minimizar os impactos.  </p>', '2020-06-04'),
(5, 'Etapas do desenvolvimento de um site', ' No desenvolvimento web, é necessário que profissionais de diferentes áreas atuem em sincronia para garantir o bom funcionamento da solução.  Designers, arquitetos de software, developers e analistas de qualidade complementam o trabalho uns dos outros.  As etapas do desenvolvimento e a sua ordenação variam conforme o projeto, mas, para aplicações web, algumas delas são imprescindíveis. ', '<p> No desenvolvimento web, é necessário que profissionais de diferentes áreas atuem em sincronia para garantir o bom funcionamento da solução. Designers, arquitetos de software, developers e analistas de qualidade complementam o trabalho uns dos outros. As etapas do desenvolvimento e a sua ordenação variam conforme o projeto, mas, para aplicações web, algumas delas são imprescindíveis. Por isso, neste texto, explicamos quais são as etapas do desenvolvimento de uma aplicação web. </p> <p>Confira abaixo as etapas do desenvolvimento de uma aplicação web: </p> <br> <h4>Estudo - Escopo</h4> <p> Todo desenvolvimento web passa pelo estudo e definição da experiência desejada na interação do usuário com a solução. Primeiramente, o designer cria o aspecto visual da solução por meio do layout, menus, botões, formulários, entre outros elementos. Na fase de UX/UI Design, o layout é estático e ainda não permite uma navegação completa entre as telas. Entretanto, essa etapa é crucial, pois auxiliará o desenvolvimento das funcionalidades da solução, conforme as regras de negócio. </p> <br> <h4>Estrutura</h4> <p> Nesta parte do projeto, são definidos os componentes da aplicação e a forma como eles vão se relacionar. Entram aqui as especificações de modelos, servidores, serviços e outros aspectos técnicos do projeto. </p> <br> <h4>Programação do código</h4> <p> Logo após definir a estrutura arquitetural do projeto, inicia-se o desenvolvimento do código. Ele é feito por duas frentes, back-end e front-end, que funcionam juntas e dependem uma da outra. De forma resumida, o back-end diz respeito à parte lógica da aplicação, do código que não é visto pelo usuário. Já o front-end “dá vida” ao back-end, por meio de códigos que permitem ao usuário executar ações pela interface. Ou seja: o front-end faz a integração entre o back-end e o UX/UI design das aplicações web. Ao mesmo tempo, o back-end é uma espécie de ponte entre o front-end e o servidor, enviando e recebendo requisições. As requisições recebidas pelo back-end são repassadas ao front-end, que transforma os dados em elementos visuais na interface da aplicação. </p> <br> <h4>Construção</h4> <p>Posteriormente ao desenvolvimento e à integração entre front-end e back-end, é necessário fazer o build da aplicação. Esta fase possibilita que a aplicação seja testada e homologada na etapa de controle de qualidade.</p> <br> <h4>Controle de Qualidade</h4> <p>Uma vez que foi feito o build da aplicação, o time de qualidade inicia a fase de testes. O objetivo é identificar problemas na solução já desenvolvida e agir para corrigi-los. O processo de tratamento, adequação, melhoria e manutenção da qualidade é realizado em conjunto com as outras áreas. Assim, garantimos uma entrega near-zero bugs. Como dissemos, a definição e a ordenação das etapas pode variar conforme o projeto. Entretanto, de forma geral, é assim que trabalhamos com o desenvolvimento de <a href=\"./servicos/site\" style=\"color: #d6619c;\">sites institucionais</a></p> <br>', '2020-06-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `blogcomentario`
--

CREATE TABLE `blogcomentario` (
  `blogcomentarioID` int(11) NOT NULL,
  `blogID` int(11) NOT NULL,
  `datacadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comentario` text NOT NULL,
  `comentaristaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blogfoto`
--

CREATE TABLE `blogfoto` (
  `blogfotoID` int(11) NOT NULL,
  `blogID` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT '',
  `datacadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `extensaofoto` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blogfoto`
--

INSERT INTO `blogfoto` (`blogfotoID`, `blogID`, `foto`, `datacadastro`, `extensaofoto`) VALUES
(1, 1, 'blog1.jpg', '2020-06-01 23:02:53', 'jpg'),
(2, 2, 'blog2.jpg', '2020-06-02 23:02:53', 'jpg'),
(3, 3, 'blog3.jpg', '2020-06-03 23:02:53', 'jpg'),
(4, 4, 'blog4.jpeg', '2020-06-04 23:02:53', 'jpeg'),
(5, 5, 'blog5.jpg', '2020-06-10 23:02:53', 'jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `bloghashtag`
--

CREATE TABLE `bloghashtag` (
  `bloghashtagID` int(11) NOT NULL,
  `blogID` int(11) NOT NULL,
  `hashtagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `bloghashtag`
--

INSERT INTO `bloghashtag` (`bloghashtagID`, `blogID`, `hashtagID`) VALUES
(2, 3, 2),
(3, 3, 3),
(4, 3, 6),
(5, 3, 7),
(6, 3, 8),
(7, 3, 9),
(8, 3, 10),
(9, 3, 11),
(10, 3, 13),
(16, 1, 14),
(17, 1, 10),
(18, 1, 6),
(19, 1, 9),
(20, 2, 2),
(21, 2, 3),
(22, 2, 7),
(23, 2, 8),
(24, 2, 9),
(25, 2, 10),
(26, 2, 14),
(27, 2, 13),
(28, 1, 2),
(29, 1, 3),
(30, 1, 12),
(31, 1, 13),
(32, 4, 14),
(33, 4, 8),
(34, 4, 7),
(35, 1, 6),
(36, 1, 5),
(37, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarista`
--

CREATE TABLE `comentarista` (
  `comentaristaID` int(11) NOT NULL,
  `nomecompleto` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `contatoID` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nomecompleto` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `telefone` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`contatoID`, `email`, `nomecompleto`, `telefone`) VALUES
(1, 'aronscapinello@gmail.com', 'Aron Scapinello Selhorst', '(49) 99993-4272'),
(2, 'franrosafran92@gmail.com', '', ''),
(3, '<script>alert(\"cuidado\")</script>', '<script>alert(\"cuidado\")</script>', '(12) 3123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatomensagem`
--

CREATE TABLE `contatomensagem` (
  `contatomensagemID` int(11) NOT NULL,
  `contatoID` int(11) NOT NULL DEFAULT '0',
  `datacadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mensagem` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `contatomensagem`
--

INSERT INTO `contatomensagem` (`contatomensagemID`, `contatoID`, `datacadastro`, `mensagem`) VALUES
(1, 1, '2020-06-09 21:57:05', 'Olá, gostaria de pedir um orçamento sobre este Serviço - Site Institucional '),
(2, 1, '2020-06-09 21:57:58', 'Olá, gostaria de pedir um orçamento sobre este Serviço - Site Institucional '),
(3, 1, '2020-06-10 23:50:05', 'asdadasd asda'),
(4, 2, '2020-06-10 23:52:50', 'Nenhuma'),
(5, 2, '2020-06-10 23:55:08', 'Njakakka'),
(6, 2, '2020-06-11 14:37:43', 'Njakakka'),
(7, 3, '2020-11-21 16:28:58', '<script>alert(\"cuidado\")</script>');

-- --------------------------------------------------------

--
-- Estrutura da tabela `depoimento`
--

CREATE TABLE `depoimento` (
  `depoimentoID` int(11) NOT NULL,
  `nomecompleto` varchar(255) NOT NULL DEFAULT '',
  `foto` varchar(255) NOT NULL DEFAULT '',
  `depoimento` text NOT NULL,
  `facebook` varchar(255) NOT NULL DEFAULT '',
  `instagram` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `linkedin` varchar(255) NOT NULL DEFAULT '',
  `empresa` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `depoimento`
--

INSERT INTO `depoimento` (`depoimentoID`, `nomecompleto`, `foto`, `depoimento`, `facebook`, `instagram`, `email`, `linkedin`, `empresa`) VALUES
(1, 'Francieli Rosa', 'francieli.jpg', 'A Trass tem o melhor custo-benefício comparado à outras empresas que fui atrás. Além disso eles tem um atendimento personalizado, são muito atenciosos. Recomendo!', 'docinhosdocinhoschapeco', 'docinhosdocinhos', '', '', 'Docinhos Docinhos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hashtag`
--

CREATE TABLE `hashtag` (
  `hashtagID` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `hashtag`
--

INSERT INTO `hashtag` (`hashtagID`, `nome`) VALUES
(2, 'SITE'),
(3, 'WEBSITE'),
(4, 'FACEBOOK'),
(5, 'INSTAGRAM'),
(6, 'GOOGLE'),
(7, 'CRISE'),
(8, 'SITE INSTITUCIONAL'),
(9, 'TRASS'),
(10, 'TECNOLOGIA'),
(11, 'MÍDIAS SOCIAIS'),
(12, 'ANÚNCIOS'),
(13, 'VENDAS'),
(14, 'DICAS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `projetoID` int(11) NOT NULL,
  `datacadastro` datetime NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `usuarioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`projetoID`, `datacadastro`, `nome`, `descricao`, `usuarioID`) VALUES
(1, '2020-11-22 15:41:51', 'projeto 1', '', 3),
(2, '2020-11-28 04:32:19', 'vida fitnesd', '', 0),
(3, '2020-11-28 04:32:20', 'vida fitnesd', '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuarioID` int(11) NOT NULL,
  `nome` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstaccess` tinyint(4) NOT NULL,
  `resetedpass` tinyint(4) NOT NULL,
  `keymaster` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `last_ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_access` datetime NOT NULL,
  `ativo` tinyint(4) NOT NULL DEFAULT '0',
  `motivobloqueio` varchar(1255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuarioID`, `nome`, `email`, `senha`, `firstaccess`, `resetedpass`, `keymaster`, `last_ip`, `last_access`, `ativo`, `motivobloqueio`) VALUES
(3, 'Aron Scapinello Selhorst', 'aronscapinello@gmail.com', 'xtGO1j+lDvpeDvcx9r8yKgHrrmo7siI78FdpDu4GD0eW0foeiBYFivM2323+cFJhu6+UsMIRxWepuxpSwDcE94YArN9Zw/kYTaDkEVo+Ia0=', 1, 1, '', '177.131.124.213', '2020-11-21 18:20:30', 1, ''),
(4, 'João da Silva Ssauro', 'joao@gmail.com', 'ADo02emuiEw3/r7N/EWBuscE+KhWDBStSJg7Bcl2hzAGrgLEKpeWqCbMWQfCaQM/QTt8xtpIqK6xyV7vn3LGsf3ZLEyNMraQYyvPQTdIAYE=\r\n', 1, 0, 'hb2Y2zOaXx7L1laQEPybGzF9zUMBO4rrUfsRY2J6r+/1jFVxNU+3s8oRi0ywk+yRX4CdgBVaSVqArMEg3qdKi/9VVoguiI6mueHP818NVbjGxaWbYSojNhoF2QDQulVV//KYMJPQ2zS1seOElf1nVvN9bWWTXFWeSujWsD9LrpxrEnTTxf4MRKo2Es5y0tCGnvuKdfdlCrMsEYPq2fZ0ob/LnRyeRap1FFdJ0SplHfs=', '177.131.124.213', '2020-11-24 23:20:24', 1, ''),
(23, 'Francieli Denise Da Rosa Scapinello Selhorst ', 'franrosafran92@gmail.com', 'Liiktv2fL//Vhn6T1i9gVZg9VwqCQFDHHHSgzgqElrwPIiGM84MDBAzYuBm7tdnr0Z5cRatAoXjf+vIp/RsritXNSusHLB4YqP+e0dRmTJ4=', 1, 0, '', '177.131.124.213', '2020-11-22 15:25:44', 1, ''),
(24, 'Gabriel Gerhard ', 'gabrielgerhard10@gmail.com', '4SY+JQ/8WUyTXwYRV3WK729WtE3rmnVbcSCzgsoO38inVSwlbh1IiYYdMJOy2J27PB8q/za26rzzS0OTCtG2AD6WTJGOGaEOvSB0Mk2uGlw=', 1, 0, 'YGRL77DmejYoptKP7XjKHSSp27+nMpXDYBF3uKdQEKmg+g7gcajZr2DN1FkTRJtPYnHtqZwPU5lckxFiTGnzI6KWggB4fe7vrC9XogIa9ndWC0Nza8yS7P/wRVmSHT600pNfn7Hv7e8IjtNDgQoXBbuRb3xU3SRRy9jGsTCQonZq+qDvviqmNKSz7lh9kk3qv7S7/4dbYXj/FWwVW29E+5X7FKrIl1pCdlzAuSHaNDXOEJJR+9QeUvWudRAC6/Fn', '170.84.58.229', '2020-11-28 04:31:54', 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuariotentativalogin`
--

CREATE TABLE `usuariotentativalogin` (
  `usuariotentativaloginID` int(11) NOT NULL,
  `usuarioID` int(11) NOT NULL,
  `datacadastro` datetime NOT NULL,
  `iptentativa` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `browser` varchar(1555) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `usuariotentativalogin`
--

INSERT INTO `usuariotentativalogin` (`usuariotentativaloginID`, `usuarioID`, `datacadastro`, `iptentativa`, `browser`) VALUES
(19, 3, '2020-11-21 18:44:53', '177.131.124.213', 'Dart/2.10 (dart:io)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blogID`);

--
-- Indexes for table `blogcomentario`
--
ALTER TABLE `blogcomentario`
  ADD PRIMARY KEY (`blogcomentarioID`);

--
-- Indexes for table `blogfoto`
--
ALTER TABLE `blogfoto`
  ADD PRIMARY KEY (`blogfotoID`),
  ADD KEY `blog_blogID` (`blogID`);

--
-- Indexes for table `bloghashtag`
--
ALTER TABLE `bloghashtag`
  ADD PRIMARY KEY (`bloghashtagID`),
  ADD KEY `blog_blog` (`blogID`),
  ADD KEY `bloghastag_hashtag` (`hashtagID`);

--
-- Indexes for table `comentarista`
--
ALTER TABLE `comentarista`
  ADD PRIMARY KEY (`comentaristaID`);

--
-- Indexes for table `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`contatoID`);

--
-- Indexes for table `contatomensagem`
--
ALTER TABLE `contatomensagem`
  ADD PRIMARY KEY (`contatomensagemID`);

--
-- Indexes for table `depoimento`
--
ALTER TABLE `depoimento`
  ADD PRIMARY KEY (`depoimentoID`);

--
-- Indexes for table `hashtag`
--
ALTER TABLE `hashtag`
  ADD PRIMARY KEY (`hashtagID`);

--
-- Indexes for table `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`projetoID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioID`);

--
-- Indexes for table `usuariotentativalogin`
--
ALTER TABLE `usuariotentativalogin`
  ADD PRIMARY KEY (`usuariotentativaloginID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `blogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogcomentario`
--
ALTER TABLE `blogcomentario`
  MODIFY `blogcomentarioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogfoto`
--
ALTER TABLE `blogfoto`
  MODIFY `blogfotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bloghashtag`
--
ALTER TABLE `bloghashtag`
  MODIFY `bloghashtagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `comentarista`
--
ALTER TABLE `comentarista`
  MODIFY `comentaristaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contato`
--
ALTER TABLE `contato`
  MODIFY `contatoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contatomensagem`
--
ALTER TABLE `contatomensagem`
  MODIFY `contatomensagemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `depoimento`
--
ALTER TABLE `depoimento`
  MODIFY `depoimentoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hashtag`
--
ALTER TABLE `hashtag`
  MODIFY `hashtagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `projeto`
--
ALTER TABLE `projeto`
  MODIFY `projetoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `usuariotentativalogin`
--
ALTER TABLE `usuariotentativalogin`
  MODIFY `usuariotentativaloginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `blogfoto`
--
ALTER TABLE `blogfoto`
  ADD CONSTRAINT `blog_blogID` FOREIGN KEY (`blogID`) REFERENCES `blog` (`blogID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `bloghashtag`
--
ALTER TABLE `bloghashtag`
  ADD CONSTRAINT `blog_blog` FOREIGN KEY (`blogID`) REFERENCES `blog` (`blogID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bloghastag_hashtag` FOREIGN KEY (`hashtagID`) REFERENCES `hashtag` (`hashtagID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
