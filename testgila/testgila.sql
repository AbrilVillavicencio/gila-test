-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.4.20-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para test_gila
CREATE DATABASE IF NOT EXISTS `test_gila` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `test_gila`;

-- Volcando estructura para tabla test_gila.category
CREATE TABLE IF NOT EXISTS `category` (
  `idcategory` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `status_cat` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 active 0 inactive',
  PRIMARY KEY (`idcategory`),
  KEY `status` (`status_cat`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla test_gila.category: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`idcategory`, `description`, `status_cat`) VALUES
	(1, 'Sports', 1),
	(2, 'Finance', 1),
	(3, 'Movies', 1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Volcando estructura para tabla test_gila.log_notif
CREATE TABLE IF NOT EXISTS `log_notif` (
  `idlog` bigint(20) NOT NULL AUTO_INCREMENT,
  `idcategory` bigint(20) NOT NULL,
  `message` varchar(250) NOT NULL,
  `datelog` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idlog`),
  KEY `idrel` (`idcategory`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla test_gila.log_notif: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `log_notif` DISABLE KEYS */;
INSERT INTO `log_notif` (`idlog`, `idcategory`, `message`, `datelog`) VALUES
	(1, 1, 'prueba 1', '2023-09-06 22:32:37'),
	(2, 1, 'prueba 2', '2023-09-06 22:40:44'),
	(3, 1, 'prueba 3', '2023-09-06 22:41:33'),
	(4, 1, 'prueba 5', '2023-09-06 22:43:45'),
	(5, 1, 'prueba 6 cat sports', '2023-09-06 22:53:06'),
	(6, 1, 'prueba 7 status', '2023-09-06 22:55:57'),
	(7, 1, 'prueba 8 status', '2023-09-06 22:57:25'),
	(22, 1, 'prueba 11', '2023-09-06 23:13:34'),
	(23, 2, 'prueba 11', '2023-09-06 23:16:09'),
	(24, 2, 'prueba 12', '2023-09-06 23:17:07'),
	(25, 2, 'prueba log', '2023-09-06 23:57:55'),
	(26, 1, 'prueba sp', '2023-09-07 00:05:29'),
	(27, 1, 'prueba sp', '2023-09-07 00:07:35'),
	(28, 2, 'Vendan sus acciones de facebook!!!', '2023-09-07 09:17:15'),
	(29, 1, 'Se pronostica que América sea campeón esta temporada', '2023-09-07 09:17:54'),
	(30, 2, 'hola', '2023-09-07 09:27:43'),
	(31, 2, 'prueba', '2023-09-07 09:28:48'),
	(32, 2, 'Test 1000', '2023-09-07 10:01:50'),
	(33, 1, 'Test 1001', '2023-09-07 10:02:08'),
	(34, 2, 'Test 1002', '2023-09-07 10:02:32'),
	(35, 3, 'Test 1003', '2023-09-07 10:02:43');
/*!40000 ALTER TABLE `log_notif` ENABLE KEYS */;

-- Volcando estructura para tabla test_gila.notification
CREATE TABLE IF NOT EXISTS `notification` (
  `idnotification` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL,
  `status_notif` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 active 0 inactive',
  PRIMARY KEY (`idnotification`),
  KEY `status_notif` (`status_notif`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla test_gila.notification: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` (`idnotification`, `description`, `status_notif`) VALUES
	(1, 'SMS', 1),
	(2, 'E-Mail', 1),
	(3, 'Push Notification', 1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;

-- Volcando estructura para tabla test_gila.rel_log_user
CREATE TABLE IF NOT EXISTS `rel_log_user` (
  `idlog` bigint(20) NOT NULL,
  `idrel` bigint(20) NOT NULL,
  KEY `idlog` (`idlog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla test_gila.rel_log_user: ~32 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_log_user` DISABLE KEYS */;
INSERT INTO `rel_log_user` (`idlog`, `idrel`) VALUES
	(5, 1),
	(6, 2),
	(22, 1),
	(22, 2),
	(23, 3),
	(25, 3),
	(26, 1),
	(26, 2),
	(27, 1),
	(27, 2),
	(28, 3),
	(29, 1),
	(29, 2),
	(30, 3),
	(31, 3),
	(32, 3),
	(32, 6),
	(32, 9),
	(32, 10),
	(33, 1),
	(33, 2),
	(33, 7),
	(33, 13),
	(34, 3),
	(34, 6),
	(34, 9),
	(34, 10),
	(35, 4),
	(35, 5),
	(35, 8),
	(35, 11),
	(35, 12);
/*!40000 ALTER TABLE `rel_log_user` ENABLE KEYS */;

-- Volcando estructura para tabla test_gila.rel_user_catnotif
CREATE TABLE IF NOT EXISTS `rel_user_catnotif` (
  `idrel` bigint(20) NOT NULL AUTO_INCREMENT,
  `iduser` bigint(20) NOT NULL,
  `idcategory` int(11) NOT NULL,
  `idnotification` int(11) NOT NULL,
  PRIMARY KEY (`idrel`),
  KEY `iduser` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla test_gila.rel_user_catnotif: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_user_catnotif` DISABLE KEYS */;
INSERT INTO `rel_user_catnotif` (`idrel`, `iduser`, `idcategory`, `idnotification`) VALUES
	(1, 1, 1, 1),
	(2, 1, 1, 2),
	(3, 2, 2, 1),
	(4, 5, 3, 1),
	(5, 50, 3, 2),
	(6, 45, 2, 3),
	(7, 30, 1, 1),
	(8, 30, 3, 2),
	(9, 28, 2, 3),
	(10, 80, 2, 3),
	(11, 75, 3, 3),
	(12, 90, 3, 3),
	(13, 5, 1, 3);
/*!40000 ALTER TABLE `rel_user_catnotif` ENABLE KEYS */;

-- Volcando estructura para tabla test_gila.user_info
CREATE TABLE IF NOT EXISTS `user_info` (
  `iduser` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_user` varchar(250) NOT NULL,
  `email_user` varchar(250) NOT NULL,
  `phone_user` varchar(10) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla test_gila.user_info: ~103 rows (aproximadamente)
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`iduser`, `name_user`, `email_user`, `phone_user`) VALUES
	(1, 'Abril Villavicencio', 'cvillavicencio@alugama.com.mx', '6221723256'),
	(2, 'Blanca Ruiz', 'bruiz@alugama.com.mx', '5555555555'),
	(3, 'Test', 'test@test.com', '5555555555'),
	(4, 'Vielka Lawson', 'enim.commodo@aol.couk', '3074218225'),
	(5, 'Tatiana Cobb', 'ut.sagittis@aol.couk', '4615311734'),
	(6, 'Tyler Castaneda', 'ipsum@google.net', '2549288726'),
	(7, 'Paloma Graham', 'lacus.mauris.non@hotmail.com', '7881749188'),
	(8, 'Velma English', 'augue@yahoo.com', '6779311196'),
	(9, 'Brielle Jennings', 'non@hotmail.org', '5128415144'),
	(10, 'Zia Sawyer', 'ultricies@outlook.com', '5815412195'),
	(11, 'Preston Boone', 'vivamus.nisi@icloud.couk', '3238333152'),
	(12, 'Pascale Burks', 'et.arcu@aol.edu', '6333863728'),
	(13, 'Lewis Fuller', 'fusce.dolor@yahoo.edu', '7328611523'),
	(14, 'Justina Daniel', 'dapibus.rutrum@outlook.edu', '6338195275'),
	(15, 'Mannix Ingram', 'dui.quis@google.com', '2138299468'),
	(16, 'Karly Maxwell', 'velit@yahoo.couk', '8361921432'),
	(17, 'Carter Ingram', 'vulputate.nisi@icloud.edu', '5644121795'),
	(18, 'Ursa Buckner', 'donec.at@icloud.edu', '7572024141'),
	(19, 'Brenda Nolan', 'vel.lectus@hotmail.org', '6412351719'),
	(20, 'Ruby Huber', 'elit@google.ca', '0497205248'),
	(21, 'Avye Roach', 'libero.lacus@icloud.couk', '3345683463'),
	(22, 'Omar Goff', 'mollis.duis.sit@icloud.edu', '6852383927'),
	(23, 'Blake Gallegos', 'convallis.ligula@yahoo.couk', '1291921698'),
	(24, 'Jordan Martin', 'fermentum@protonmail.com', '2857668775'),
	(25, 'Fredericka Riddle', 'pede.nonummy.ut@protonmail.net', '4680123265'),
	(26, 'William Hansen', 'sed.nec@hotmail.org', '3116738720'),
	(27, 'Miriam Dominguez', 'elementum@icloud.ca', '2277339296'),
	(28, 'Amelia Lyons', 'pretium.neque@protonmail.couk', '6093137686'),
	(29, 'Coby Cox', 'nam.ligula.elit@outlook.edu', '6874376634'),
	(30, 'Briar Nieves', 'nunc.sollicitudin@protonmail.ca', '5825318523'),
	(31, 'Jerry Howe', 'orci@protonmail.org', '3708144047'),
	(32, 'Harriet Gordon', 'eu.odio@aol.couk', '2997104397'),
	(33, 'Drake Vargas', 'rhoncus.id@aol.edu', '6415858420'),
	(34, 'Laura Wolf', 'praesent.interdum@yahoo.ca', '0275168782'),
	(35, 'Xenos David', 'ornare.in@yahoo.edu', '6908230897'),
	(36, 'Chancellor Mccormick', 'vivamus@protonmail.org', '8384235762'),
	(37, 'Finn Mcclain', 'ultrices.vivamus@protonmail.edu', '7212121358'),
	(38, 'Breanna Bernard', 'luctus.vulputate.nisi@protonmail.ca', '2050716066'),
	(39, 'Isabelle Blake', 'tellus@hotmail.ca', '8216945994'),
	(40, 'Garrison Warren', 'convallis.dolor@google.net', '8097551727'),
	(41, 'Kiara Howell', 'dolor.donec.fringilla@icloud.net', '3300129288'),
	(42, 'Octavius Baldwin', 'ut.nec@google.edu', '7237776198'),
	(43, 'Dean Bowman', 'lacinia.at@icloud.couk', '1209458326'),
	(44, 'Steel Finch', 'auctor.ullamcorper@protonmail.org', '1761684846'),
	(45, 'Brenden Tyson', 'sem.semper@yahoo.net', '8856548713'),
	(46, 'Laurel Brewer', 'elit.fermentum@aol.ca', '4651062763'),
	(47, 'Julian David', 'semper.dui@hotmail.net', '4833946324'),
	(48, 'Dante Holland', 'imperdiet.ullamcorper.duis@outlook.com', '8703689026'),
	(49, 'McKenzie Wolfe', 'dapibus.quam@google.net', '5507611634'),
	(50, 'Florence Henry', 'ridiculus@aol.net', '1018026662'),
	(51, 'Quynn Romero', 'donec.porttitor.tellus@yahoo.couk', '7621516468'),
	(52, 'Cailin Roth', 'mi.felis@protonmail.ca', '3516481673'),
	(53, 'Ishmael Newton', 'quam.vel@aol.edu', '4504680613'),
	(54, 'Rafael Wilkinson', 'volutpat@hotmail.com', '2841593376'),
	(55, 'Demetria Pate', 'et.pede.nunc@icloud.net', '3625706844'),
	(56, 'Jackson Snow', 'magna.tellus.faucibus@yahoo.ca', '5316143864'),
	(57, 'Garth Ashley', 'morbi.accumsan.laoreet@aol.net', '1328710774'),
	(58, 'Aurelia Britt', 'ac.facilisis@hotmail.com', '6720362545'),
	(59, 'Teegan Hutchinson', 'aenean.eget@protonmail.edu', '3533163273'),
	(60, 'Kimberly Wilder', 'ac.ipsum@hotmail.org', '3677178553'),
	(61, 'Coby Flowers', 'donec.dignissim.magna@hotmail.ca', '2481120258'),
	(62, 'Veda Tanner', 'morbi@google.edu', '1357663700'),
	(63, 'Nero Fernandez', 'id.ante@google.edu', '5856357023'),
	(64, 'Silas Haney', 'eleifend.cras@yahoo.couk', '2744342729'),
	(65, 'Martha Bradley', 'a.sollicitudin@google.net', '3833935259'),
	(66, 'Sacha Lee', 'nibh@outlook.org', '9589275736'),
	(67, 'Lionel Blake', 'ut.molestie@google.org', '8751306443'),
	(68, 'Lewis Maddox', 'ante.blandit.viverra@icloud.net', '7297592617'),
	(69, 'Keane Solomon', 'varius.ultrices.mauris@yahoo.couk', '9391225622'),
	(70, 'Lance Owens', 'dignissim.tempor@yahoo.org', '1383194492'),
	(71, 'Aaron Warren', 'cum.sociis@aol.net', '2459017751'),
	(72, 'Hilda Warner', 'fusce@protonmail.org', '4412607573'),
	(73, 'Bruce Welch', 'sagittis.lobortis@aol.net', '1762266451'),
	(74, 'Jocelyn Stevens', 'sagittis.semper@yahoo.com', '6074131541'),
	(75, 'Wynne Gordon', 'nascetur@google.net', '1449236777'),
	(76, 'Jared Estes', 'blandit.congue.in@outlook.edu', '1693848158'),
	(77, 'Michelle Cochran', 'nascetur@google.edu', '4924808939'),
	(78, 'Colorado Albert', 'vivamus.nisi@hotmail.couk', '5616315663'),
	(79, 'Shana Tate', 'arcu.imperdiet.ullamcorper@protonmail.com', '5081873565'),
	(80, 'Mannix Ochoa', 'enim.etiam@yahoo.couk', '5783742563'),
	(81, 'Demetria William', 'natoque.penatibus.et@icloud.com', '1721226450'),
	(82, 'Chanda Castillo', 'eros.proin@yahoo.com', '6485321457'),
	(83, 'Ivor Juarez', 'sociis.natoque.penatibus@yahoo.ca', '5523521144'),
	(84, 'William Case', 'magna.tellus.faucibus@protonmail.couk', '0318342073'),
	(85, 'Maggy Mueller', 'aliquam.nec@google.com', '7338833776'),
	(86, 'Philip Morton', 'donec@aol.org', '3245916416'),
	(87, 'Erica Salinas', 'ante.lectus.convallis@outlook.com', '7533666725'),
	(88, 'Hilel Rosa', 'blandit.mattis@outlook.couk', '0692042171'),
	(89, 'Donna Moon', 'sed@protonmail.ca', '7389192050'),
	(90, 'Amery Soto', 'facilisis@icloud.com', '1468702745'),
	(91, 'Honorato Sandoval', 'tempor.augue@protonmail.edu', '3485755283'),
	(92, 'Christen Conley', 'etiam.bibendum.fermentum@google.com', '6674697361'),
	(93, 'Jemima Green', 'diam.at.pretium@google.edu', '6614774719'),
	(94, 'Abraham Hoover', 'placerat.cras.dictum@hotmail.net', '7476430368'),
	(95, 'Anthony Olsen', 'nulla@yahoo.org', '8532577928'),
	(96, 'Howard England', 'neque.morbi@yahoo.net', '1942923741'),
	(97, 'Harrison Roberts', 'mollis@yahoo.net', '8335714800'),
	(98, 'Beck Decker', 'erat.semper.rutrum@yahoo.ca', '5734212826'),
	(99, 'Tamara Slater', 'vitae.orci.phasellus@aol.com', '4126712597'),
	(100, 'Dane Floyd', 'proin.ultrices@aol.net', '0382720605'),
	(101, 'Mercedes Harrell', 'nulla.tincidunt@aol.edu', '8333454444'),
	(102, 'Jael Tillman', 'nulla@icloud.edu', '5510299886'),
	(103, 'Vernon Koch', 'nisl.elementum.purus@outlook.edu', '7363541878');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

-- Volcando estructura para procedimiento test_gila.sp_addmessage
DELIMITER //
CREATE PROCEDURE `sp_addmessage`(
	IN `par_idcategory` INT,
	IN `par_message` VARCHAR(250)
)
    SQL SECURITY INVOKER
BEGIN
	
	/* Inicializar Variables de respuesta */
	set @Res = 0;
	set @AlertMessage = "Error sending the message.";

	/* Declarar Variables obtenidas por el usuario */
	set @IdCategory = par_idcategory;
	set @Message 	= par_message;
	
	/* Validar si la categoria esta relacionada a un usuario */
	set @CategoryUsed = (select count(*) from rel_user_catnotif where idcategory = @IdCategory); 
	
	/* Si al menos un usuario si tiene relacionada la categoria, se registra en el log*/
	if @CategoryUsed > 0 then
	
		/* Ejecutar el insert a la tabla log_notif para agregar el nuevo mensaje */
		insert into log_notif (idcategory, message) values (@IdCategory, @Message);
		
		/* Se declara nuevamente con nuevos mensajes la respuesta que tendra el usuario */
		set @Res = 1;
		set @AlertMessage = "Message sent successfully.";
	
	end if;
	
	/* Respuesta que tendra el usuario al ejecutar el procedimiento */
	select @Res, @AlertMessage;

END//
DELIMITER ;

-- Volcando estructura para disparador test_gila.trg_log_rel
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_log_rel` AFTER INSERT ON `log_notif` FOR EACH ROW BEGIN

	/* Obtener IdCategory insertado en la tabla log_notif */
	set @idcategory = new.idcategory;
	
	/* Insertar registro en la tabla rel_log_user 
			con el idlog y idrel de usuario-categoria */
	insert into  rel_log_user (idlog, idrel)
					select new.idlog, a.idrel 
					from 	rel_user_catnotif a,
							category b, 
							notification c
					where 	a.idcategory = @idcategory and
							a.idcategory = b.idcategory and
							b.status_cat = 1 and
							a.idnotification = c.idnotification and 
							c.status_notif = 1;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
