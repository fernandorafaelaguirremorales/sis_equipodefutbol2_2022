-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-09-2023 a las 04:23:05
-- Versión del servidor: 8.0.31
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escueladefutbol`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `actualizar_mensualidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_mensualidad` (IN `f_inicio` DATE, IN `costo` INT)   UPDATE mensualidades SET fecha=f_inicio WHERE costo=costo$$

DROP PROCEDURE IF EXISTS `listado_mensualidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_mensualidad` (IN `f_inicio` DATE, IN `f_fin` DATE)   BEGIN

    SELECT costo
    FROM mensualidades
    WHERE fecha BETWEEN f_inicio AND f_fin
    AND estado='A';

    END$$

DROP PROCEDURE IF EXISTS `listado_mensualidades`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_mensualidades` (IN `f_inicio` DATE, IN `f_fin` DATE)   BEGIN

    SELECT *
    FROM mensualidades
    WHERE fecha BETWEEN f_inicio AND f_fin
    AND estado='A';

    END$$

DROP PROCEDURE IF EXISTS `listado_personas_fechas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_personas_fechas` (IN `f_inicio` DATE, IN `f_fin` DATE)   BEGIN


    SELECT *
    FROM personas
    WHERE fec_insercion BETWEEN f_inicio AND f_fin
    AND estado='A';

    END$$

--
-- Funciones
--
DROP FUNCTION IF EXISTS `contar_registros`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_registros` () RETURNS INT  BEGIN
DECLARE resultado INT;

    SELECT COUNT(id_persona) INTO resultado
    FROM personas
    WHERE estado='A';
    
    RETURN resultado;

    END$$

DROP FUNCTION IF EXISTS `maxima_mensualidad_del_jugador`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `maxima_mensualidad_del_jugador` () RETURNS INT  BEGIN
DECLARE resultado INT;

    SELECT MAX(me.costo) INTO resultado
    FROM mensualidades me 
    WHERE estado='A';
    
    RETURN resultado;

    END$$

DROP FUNCTION IF EXISTS `sumar_mensualidad_dia`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `sumar_mensualidad_dia` () RETURNS INT  BEGIN
DECLARE resultado INT;

    SELECT SUM(costo) INTO resultado
    FROM mensualidades 
    WHERE estado='A';
    
    RETURN resultado;

    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

DROP TABLE IF EXISTS `accesos`;
CREATE TABLE IF NOT EXISTS `accesos` (
  `id_acceso` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `id_opcion` int NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_acceso`),
  KEY `id_rol` (`id_rol`),
  KEY `id_opcion` (`id_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`id_acceso`, `id_rol`, `id_opcion`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, '2023-04-19 03:20:59', '2023-04-19 03:20:59', 1, 'A'),
(2, 1, 2, '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(3, 1, 3, '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(4, 1, 4, '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(5, 1, 5, '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(6, 1, 6, '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(7, 1, 7, '2023-04-19 03:22:28', '2023-04-19 03:22:28', 1, 'A'),
(8, 1, 8, '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(9, 1, 9, '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(10, 1, 10, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(11, 1, 11, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(12, 1, 12, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(13, 1, 13, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(14, 1, 14, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(15, 1, 15, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(16, 1, 16, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(17, 1, 17, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(18, 1, 18, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(19, 1, 19, '2023-03-29 02:36:29', '2023-03-29 02:36:29', 1, 'A'),
(20, 1, 20, '2023-04-14 03:06:23', '2023-04-14 02:08:21', 1, 'A'),
(21, 3, 1, '2023-04-19 03:16:38', '2023-04-19 05:57:24', 1, 'A'),
(22, 3, 2, '2023-04-19 03:16:38', '2023-04-19 05:57:29', 1, 'A'),
(23, 3, 3, '2023-04-19 03:16:38', '2023-04-19 05:57:34', 1, 'A'),
(24, 1, 24, '2023-06-02 02:29:44', '2023-06-02 02:29:44', 1, 'A'),
(25, 1, 25, '2023-06-02 02:30:46', '2023-06-02 02:30:46', 1, 'A'),
(26, 2, 11, '2023-04-19 03:50:31', '2023-04-19 04:02:51', 1, 'A'),
(27, 2, 12, '2023-04-19 03:50:31', '2023-04-19 04:02:55', 1, 'A'),
(28, 2, 13, '2023-04-19 03:50:31', '2023-04-19 04:03:00', 1, 'A'),
(29, 3, 6, '2023-04-19 05:59:40', '2023-04-19 05:59:40', 1, 'A'),
(30, 2, 14, '2023-04-19 05:59:40', '2023-04-19 05:59:40', 1, 'A'),
(31, 1, 21, '2023-04-28 02:14:00', '2023-04-28 02:27:11', 1, 'A'),
(32, 1, 22, '2023-05-08 03:31:29', '2023-05-08 03:31:29', 1, 'A'),
(33, 1, 23, '2023-05-08 04:09:51', '2023-05-08 04:09:51', 1, 'A'),
(34, 2, 24, '2023-06-02 02:20:57', '2023-06-02 02:20:57', 1, 'A'),
(35, 2, 25, '2023-06-02 02:20:57', '2023-06-02 02:20:57', 1, 'A'),
(36, 1, 26, '2023-06-14 02:13:09', '2023-06-14 02:13:09', 1, 'A'),
(37, 1, 27, '2023-06-16 01:59:29', '2023-06-16 01:59:29', 1, 'A'),
(38, 1, 28, '2023-06-21 02:19:34', '2023-06-21 02:19:34', 1, 'A'),
(39, 1, 29, '2023-06-28 02:55:00', '2023-06-28 02:55:00', 1, 'A'),
(40, 1, 30, '2023-06-28 06:02:25', '2023-06-28 06:02:25', 1, 'A'),
(41, 1, 31, '2023-06-30 02:09:04', '2023-06-30 02:09:04', 1, 'A'),
(42, 1, 32, '2023-07-30 05:13:02', '2023-07-30 05:13:02', 1, 'A'),
(43, 1, 33, '2023-08-02 02:29:55', '2023-08-02 02:29:55', 1, 'A'),
(44, 1, 34, '2023-08-09 02:30:38', '2023-08-09 02:30:38', 1, 'A'),
(45, 1, 35, '2023-08-09 03:02:56', '2023-08-09 03:02:56', 1, 'A'),
(46, 1, 36, '2023-08-11 01:57:49', '2023-08-11 01:57:49', 1, 'A'),
(47, 1, 37, '2023-09-06 01:42:08', '2023-09-06 01:42:08', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `cargo` varchar(40) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'sub99dgf', '99añossg', '2023-03-29 02:36:25', '2023-09-08 03:51:35', 1, 'A'),
(22, 'DDDDDDDDD', 'DDDD', '2023-08-30 03:44:31', '2023-08-29 20:44:38', 1, 'x'),
(23, 'asfa', 'asfdas', '0000-00-00 00:00:00', '2023-09-08 03:06:51', 1, 'x'),
(34, 'sgas', 'dsavd', '0000-00-00 00:00:00', '2023-09-08 05:02:07', 1, 'A'),
(35, 'avav', 'asvav', '0000-00-00 00:00:00', '2023-09-08 05:03:51', 1, 'X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_index`
--

DROP TABLE IF EXISTS `categorias_index`;
CREATE TABLE IF NOT EXISTS `categorias_index` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `i_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `ap` varchar(20) DEFAULT NULL,
  `am` varchar(20) DEFAULT NULL,
  `ci` varchar(20) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `ap`, `am`, `ci`, `direccion`, `telefono`) VALUES
(1, 'RAMIRO', 'DAZA', 'AGUILAR', '8620563', 'Av. Domingo paz y Gral Trigo', 79102220),
(2, 'MAYERLI', 'CRUZ', 'BURGOS', '10649614', 'Av. Domingo paz y Gral Trigo', 72755958),
(3, 'SERGIO ', 'SANCHEZ', 'BURGOS', '5049565', 'Froilan Tejerina y Enrique Pantoja', 62861911),
(4, 'MARIA', 'RENE', 'ACOSTA', '7203936', 'Av Membrillos calle Mejillones', 69137637),
(5, 'KARLA LORENA', 'CHOQUE', 'CABEZAS', '10677287', 'Av. Domingo paz y Gral Trigo', 64396438),
(6, 'BEATRIZ', 'IÑIGUEZ', 'CASTILLO', '7190122', 'Av. Domingo paz y Gral Trigo', 75163260),
(7, 'GUIDO', 'RODRIGUEZ', 'CASTILLO', '10644567', 'Froilan Tejerina y Enrique Pantoja', 73716672),
(8, 'FLAVIO', 'CHOQUE', 'CASTRILLO', '5787287', 'Av. Domingo paz y Gral Trigo', 63362733),
(9, 'RUBEN', 'VARGAS', 'DONOSO', '5032729', 'Av. Domingo paz y Gral Trigo', 71434154),
(10, 'CECILIA', 'VILLA', 'FERREIRA', '5799461', 'Av Membrillos calle Mejillones', 68879519);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_heladeria_pasteleria` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `ap` varchar(30) DEFAULT NULL,
  `am` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `fecha_nac` date NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_heladeria_pasteleria` (`id_heladeria_pasteleria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_cargos`
--

DROP TABLE IF EXISTS `empleados_cargos`;
CREATE TABLE IF NOT EXISTS `empleados_cargos` (
  `id_empleado_cargo` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `id_cargo` int NOT NULL,
  `salario` float NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_empleado_cargo`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_cargo` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenadores`
--

DROP TABLE IF EXISTS `entrenadores`;
CREATE TABLE IF NOT EXISTS `entrenadores` (
  `id_entrenador` int NOT NULL AUTO_INCREMENT,
  `id_escuela_futbol` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `ap` varchar(25) DEFAULT NULL,
  `am` varchar(25) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_entrenador`),
  KEY `id_escuela_futbol` (`id_escuela_futbol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entrenadores`
--

INSERT INTO `entrenadores` (`id_entrenador`, `id_escuela_futbol`, `nombre`, `ap`, `am`, `telefono`, `direccion`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'Juan', 'Mamani', 'Mendoza', '78654345', 'tabladitall', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(2, 1, 'Carlo', 'Mastinez', 'Aparicio', '78654345', 'Alto Senas', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(3, 1, 'Boris', 'Aguirre', 'Cuevas', '68564322', 'Mendes Arcos', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(4, 1, 'Jenry', 'Cuevas', 'Aparicio', '9573834', 'Tabladita', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(5, 1, 'Ramiro', 'Ancasi', 'Romero', '5675466', '6 De Agosto', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(6, 1, 'Samuel', 'Roman', 'Mendes', '77270805', 'Circunvalacion', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(7, 1, 'Pedro', 'Maradona', 'Cuevas', '3456754', '1De Mayo', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(8, 1, 'Manuel', 'Contreras', 'Castro', '78654345', 'Tabladitall', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(9, 1, 'Carlos', 'Cuevas', 'Mendoza', '78654345', 'Tablada', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(10, 1, 'Fredi', 'Subia', 'Morales', '78654345', 'San Andres ', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela_de_futbol`
--

DROP TABLE IF EXISTS `escuela_de_futbol`;
CREATE TABLE IF NOT EXISTS `escuela_de_futbol` (
  `id_escuela_futbol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `nit` varchar(25) NOT NULL,
  `logo` varchar(20) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_escuela_futbol`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `escuela_de_futbol`
--

INSERT INTO `escuela_de_futbol` (`id_escuela_futbol`, `nombre`, `nit`, `logo`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'MagisterioFutbolClub', '1', '123.', '2023-03-29 02:36:24', '2023-09-05 03:35:38', 1, 'A'),
(2, 'hguyg', 'yfyttf', 'fgcf', '0000-00-00 00:00:00', '2023-08-27 04:23:36', 0, ''),
(7, 'garcia', '123', '456', '0000-00-00 00:00:00', '2023-08-27 21:04:40', 0, ''),
(8, 'GHHF', 'HKJH', 'JKLKJ', '0000-00-00 00:00:00', '2023-08-27 21:16:59', 0, ''),
(9, 'jhghjh', 'hjkjh', 'lñkñk', '0000-00-00 00:00:00', '2023-08-27 22:06:05', 0, ''),
(10, 'CCLON', '12', '12', '0000-00-00 00:00:00', '2023-08-27 22:22:43', 0, ''),
(11, 'municipal', '123', '678', '0000-00-00 00:00:00', '2023-08-28 00:25:20', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `grupo` varchar(20) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id_grupo`, `grupo`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'HERRAMIENTAS', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(2, 'PARAMETROS', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(3, 'ESCUELA FUTBOL', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(4, 'REPORTES', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(6, 'PRUEBA DE GRUPO', '2023-04-14 02:46:36', '2023-04-14 01:47:45', 1, 'A'),
(7, 'FERNANDO', '2023-04-14 02:56:36', '2023-04-14 01:58:12', 1, 'A'),
(8, 'EVA PRIMER BIMESTRE', '2023-04-28 02:01:56', '2023-04-28 02:01:56', 1, 'A'),
(9, 'MUEBLES 2 ', '2023-05-08 04:06:06', '2023-05-08 04:06:06', 1, 'A'),
(10, 'EVA SEGUNDO BIMESTRE', '2023-06-02 02:14:37', '2023-06-02 02:14:37', 1, 'A'),
(11, 'EVA SEGUNDO BIMESTRE', '2023-06-21 02:10:12', '2023-06-21 02:10:12', 1, 'A'),
(12, 'TERCER BIMESTRE-BDII', '2023-08-09 01:54:35', '2023-08-09 01:54:35', 1, 'A'),
(13, 'TERCER BIMESTRE-BDII', '2023-08-09 02:02:09', '2023-08-09 02:02:09', 1, 'A'),
(14, 'TERCER-BIMESTRE-DWII', '2023-08-11 01:52:24', '2023-08-11 01:52:24', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `heladeria_pasteleria`
--

DROP TABLE IF EXISTS `heladeria_pasteleria`;
CREATE TABLE IF NOT EXISTS `heladeria_pasteleria` (
  `id_heladeria_pasteleria` int NOT NULL AUTO_INCREMENT,
  `nombre_heladeria_pasteleria` varchar(30) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_heladeria_pasteleria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `heladeria_pasteleria`
--

INSERT INTO `heladeria_pasteleria` (`id_heladeria_pasteleria`, `nombre_heladeria_pasteleria`, `direccion`, `telefono`) VALUES
(1, 'ISCELA', 'BARRIO LAS PANOSAS CALLE LA MADRID', '6669870'),
(2, 'CAKE', 'COLON CASI INGAVI', '7464644'),
(3, 'DONUT', 'PLAZUELA SUCRE', '2324449');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helados`
--

DROP TABLE IF EXISTS `helados`;
CREATE TABLE IF NOT EXISTS `helados` (
  `id_helado` int NOT NULL AUTO_INCREMENT,
  `id_heladeria_pasteleria` int NOT NULL,
  `nombre_helado` varchar(35) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_helado`),
  KEY `id_heladeria_pasteleria` (`id_heladeria_pasteleria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `helados`
--

INSERT INTO `helados` (`id_helado`, `id_heladeria_pasteleria`, `nombre_helado`, `descripcion`) VALUES
(1, 1, 'SIMPLE', 'ESTE ES EL HELADO MAS SIMPLE Y ESTA A UN PRECIO DE 3.50 BS'),
(2, 1, 'DOBLE', 'ESTE HELADO TIENE UNA PORCION MAS QUE EL SIMPLE Y ESTA AUN PRECIO DE 7 BS'),
(3, 1, 'TRIPLE', 'ESTE ES EL HELADO TIENE UNA PORCION MAS QUE EL DOBLE Y ESTA A UN PRECIO DE 10BS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
CREATE TABLE IF NOT EXISTS `jugadores` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `id_escuela_futbol` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `ci` varchar(15) NOT NULL,
  `fecha_nac` date NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `id_escuela_futbol` (`id_escuela_futbol`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `id_escuela_futbol`, `id_categoria`, `nombre`, `apellidos`, `ci`, `fecha_nac`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, 'Marcelo', 'Morales', '1234567', '2021-12-07', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(2, 1, 1, 'Carlos', 'Mendoza', '222222', '2021-12-07', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(3, 1, 1, 'Fernando', 'Morales', '333333', '2021-12-07', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(4, 1, 1, 'Juan', 'Aparicio', '444444', '2021-12-07', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(5, 1, 1, 'Mario', 'Almazan', '55555', '2021-12-07', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(6, 1, 1, 'Luis', 'Jimenes', '666666', '2021-12-07', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(7, 1, 1, 'Alfredo', 'Aramayo', '777777', '2021-12-07', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(8, 1, 1, 'Jorge', 'Mora', '888888', '2021-12-07', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(9, 1, 1, 'Luis', 'Moreira', '999999', '2021-12-07', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(10, 1, 1, 'Ariel', 'Camacho', '1234567', '2021-12-07', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores1`
--

DROP TABLE IF EXISTS `jugadores1`;
CREATE TABLE IF NOT EXISTS `jugadores1` (
  `id_jugador1` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(30) NOT NULL,
  `cantidad` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_jugador1`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `jugadores1`
--

INSERT INTO `jugadores1` (`id_jugador1`, `categoria`, `cantidad`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'Sub 5', '14', '2023-09-06 03:46:58', '2023-09-06 03:46:58', 1, 'A'),
(2, 'Sub 6', '15', '2023-09-06 03:46:58', '2023-09-06 03:46:58', 1, 'A'),
(3, 'Sub 7', '18', '2023-09-06 03:46:58', '2023-09-06 03:46:58', 1, 'A'),
(4, 'Sub 8', '14', '2023-09-06 03:46:58', '2023-09-06 03:46:58', 1, 'A'),
(5, 'Sub 9', '20', '2023-09-06 03:46:59', '2023-09-06 15:47:56', 1, 'A'),
(6, 'Sub 10', '11', '2023-09-06 03:46:59', '2023-09-06 03:46:59', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores_index`
--

DROP TABLE IF EXISTS `jugadores_index`;
CREATE TABLE IF NOT EXISTS `jugadores_index` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `id_escuela_futbol` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `ci` varchar(15) NOT NULL,
  `fecha_nac` date NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_jugador`),
  UNIQUE KEY `i_ci` (`ci`),
  KEY `id_escuela_futbol` (`id_escuela_futbol`),
  KEY `id_categoria` (`id_categoria`),
  KEY `i_nombre` (`nombre`),
  KEY `i_apellidos` (`apellidos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores_titulares`
--

DROP TABLE IF EXISTS `jugadores_titulares`;
CREATE TABLE IF NOT EXISTS `jugadores_titulares` (
  `id_jugador_titular` int NOT NULL AUTO_INCREMENT,
  `id_jugador` int NOT NULL,
  `certificado` varchar(30) NOT NULL,
  `foto` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_jugador_titular`),
  KEY `id_jugador` (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugadores_titulares`
--

INSERT INTO `jugadores_titulares` (`id_jugador_titular`, `id_jugador`, `certificado`, `foto`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'CER_Marcelo.jpg', 'Morales.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(2, 1, 'CER_Carlos.jpg', 'Mendoza.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(3, 1, 'CER_Fernando.jpg', 'Morales.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(4, 1, 'CER_Juan.jpg', 'Aparicio.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(5, 1, 'CER_Mario.jpg', 'Almazan.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(6, 1, 'CER_Luis,jpg', 'Jimenes.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(7, 1, 'CER_Alfredo.jpg', 'Aramayo.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(8, 1, 'CER_Jorge.jpg', 'Mora.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(9, 1, 'CER_Luis.jpg', 'Moreira.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(10, 1, 'CER_Ariel.jpg', 'Camacho.jpg', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores_titulares_index`
--

DROP TABLE IF EXISTS `jugadores_titulares_index`;
CREATE TABLE IF NOT EXISTS `jugadores_titulares_index` (
  `id_jugador_titular` int NOT NULL AUTO_INCREMENT,
  `id_jugador` int NOT NULL,
  `certificado` varchar(30) NOT NULL,
  `foto` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_jugador_titular`),
  KEY `id_jugador` (`id_jugador`),
  KEY `i_certificado` (`certificado`),
  KEY `i_foto` (`foto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensualidades`
--

DROP TABLE IF EXISTS `mensualidades`;
CREATE TABLE IF NOT EXISTS `mensualidades` (
  `id_mensualidad` int NOT NULL AUTO_INCREMENT,
  `id_jugador` int NOT NULL,
  `fecha` date NOT NULL,
  `costo` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_mensualidad`),
  KEY `id_jugador` (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensualidades`
--

INSERT INTO `mensualidades` (`id_mensualidad`, `id_jugador`, `fecha`, `costo`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, '2021-12-01', '70bs', '2023-04-05 13:50:09', '2023-04-05 06:50:38', 1, 'A'),
(4, 1, '2021-12-01', '80bs', '2023-04-05 13:50:04', '2023-04-05 06:50:38', 1, 'A'),
(5, 1, '2021-12-01', '70bs', '2023-04-05 13:49:58', '2023-04-05 06:50:38', 1, 'A'),
(8, 1, '2021-12-01', '70bs', '2023-04-05 13:49:52', '2023-07-30 05:55:12', 1, 'x'),
(9, 1, '2021-12-01', '70bs', '2023-03-29 02:36:26', '2023-04-05 06:48:36', 1, 'x'),
(11, 2, '2021-12-01', '98', '2023-04-05 13:49:44', '2023-07-30 05:55:09', 1, 'x'),
(12, 1, '2021-12-01', '7', '2023-03-31 09:49:29', '2023-04-05 06:48:36', 1, 'x'),
(13, 1, '2021-12-01', '45', '2023-03-31 10:11:44', '2023-04-05 06:48:36', 1, 'x'),
(14, 4, '2021-12-01', '70', '2023-03-31 12:44:06', '2023-04-05 06:48:36', 1, 'x'),
(15, 5, '2023-04-18', 'xv', '2023-04-28 11:27:42', '2023-07-30 05:55:07', 1, 'x'),
(16, 6, '2023-07-04', '50', '2023-07-30 12:54:21', '2023-07-30 05:55:04', 1, 'x'),
(17, 2, '2023-08-04', '90', '2023-08-04 11:45:21', '2023-08-04 04:45:21', 1, 'A'),
(18, 1, '2023-08-03', '400', '2023-08-13 08:45:46', '2023-08-13 01:45:46', 1, 'A'),
(19, 1, '2023-08-24', '55', '2023-08-30 04:56:33', '2023-08-29 21:56:33', 1, 'A'),
(20, 1, '2023-08-25', '44444444', '2023-08-30 04:56:27', '2023-08-29 21:56:27', 1, 'A'),
(21, 1, '2023-08-29', '88888', '2023-08-31 07:01:37', '2023-08-31 00:01:38', 1, 'A'),
(22, 1, '2023-08-30', '777', '2023-08-31 07:31:23', '2023-08-31 00:31:23', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensualidades_index`
--

DROP TABLE IF EXISTS `mensualidades_index`;
CREATE TABLE IF NOT EXISTS `mensualidades_index` (
  `id_mensualidad` int NOT NULL AUTO_INCREMENT,
  `id_jugador` int NOT NULL,
  `fecha` date NOT NULL,
  `costo` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_mensualidad`),
  KEY `id_jugador` (`id_jugador`),
  KEY `i_costo` (`costo`),
  KEY `i_fecha` (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muebles`
--

DROP TABLE IF EXISTS `muebles`;
CREATE TABLE IF NOT EXISTS `muebles` (
  `id_mueble` int NOT NULL AUTO_INCREMENT,
  `tipo_mueble` varchar(20) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `color` varchar(15) DEFAULT NULL,
  `tamaño` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_mueble`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `muebles`
--

INSERT INTO `muebles` (`id_mueble`, `tipo_mueble`, `nombres`, `codigo`, `color`, `tamaño`) VALUES
(1, 'oficina', 'escritorio', 'ES_001', 'timbuya', 'mediano'),
(2, 'oficina', 'mesa', 'ME_0001', 'timbuya', 'pequeño'),
(3, 'oficina', 'estante', 'EST_020', 'timbuya', 'grande'),
(4, 'oficina', 'silla', 'SI_030', 'negro', 'normal'),
(5, 'oficina', 'Modulo de cómputo', 'MO_1234', 'timbuya', 'mediano'),
(6, 'cocina', 'alacena', 'AL_000012', 'cafe', 'mediano'),
(7, 'cocina', 'mesa', 'ME_000014', 'cafe', 'grande'),
(8, 'cocina', 'sillas', 'SI_000013', 'cafe', 'normal'),
(9, 'cocina', 'vitrina', 'VI_000015', 'cafe', 'grande'),
(10, 'dormitorio', 'velador', 'VE_9966', 'plomo', 'pequeño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

DROP TABLE IF EXISTS `opciones`;
CREATE TABLE IF NOT EXISTS `opciones` (
  `id_opcion` int NOT NULL AUTO_INCREMENT,
  `id_grupo` int NOT NULL,
  `opcion` varchar(30) NOT NULL,
  `contenido` varchar(70) NOT NULL,
  `orden` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_opcion`),
  KEY `id_grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id_opcion`, `id_grupo`, `opcion`, `contenido`, `orden`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'Personas', '../privada/personas/personas.php', '10', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(2, 1, 'Usuarios', '../privada/usuarios/usuarios.php', '20', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(3, 1, 'Grupos', '../privada/grupo/grupo.php', '30', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(4, 1, 'Roles', '../privada/roles/roles.php', '40', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(5, 1, 'Usuariosroles', '../privada/usuario_roles/usuario_roles.php', '50', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(6, 1, 'Opciones', '../privada/opciones/opciones.php', '60', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(7, 1, 'Accesos', '../privada/accesos /accesos.php', '70', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(8, 2, 'Categorias', '../privada/categorias/categorias.php', '10', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(9, 3, 'Datos Escuela futbol', '../privada/escuela_futbol/escuela_futbol.php', '10', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(10, 3, 'Propietario', '../privada/propietario/propietario.php', '20', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(11, 3, 'Uniformes', '../privada/uniformes/uniformes.php', '30', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(12, 3, 'Entrenadores', '../privada/entrenadores/entrenadores.php', '40', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(13, 3, 'Jugadores', '../privada/jugadores/jugadores.php', '50', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(14, 3, 'Mensualidades', '../privada/mensualidades/mensualidades.php', '60', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(15, 3, 'Jugadores Titulares', '../privada/jugadores_titulares/jugadores_titulares.php', '70', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(16, 3, 'Torneos', '../privada/torneos/torneos.php', '80', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(17, 3, 'Partidos', '../privada/partidos/partidos.php', '90', '2023-03-29 02:36:28', '2023-03-29 02:36:28', 1, 'A'),
(18, 4, 'Rpt Personas con Usuarios', '../privada/reportes/personas_usuarios.php', '10', '2023-03-29 02:36:28', '2023-04-17 03:57:01', 1, 'A'),
(19, 4, 'Rpt Personas con fechas', '../privada/reportes/personas_fechas.php', '20', '2023-03-29 02:36:28', '2023-04-17 03:57:08', 1, 'A'),
(20, 7, 'FERNANDO RAFAEL', '../privada/fernando/fernando.php', '10', '2023-04-14 02:59:13', '2023-04-14 02:04:51', 1, 'A'),
(21, 8, 'PRECIO MUEBLES', '../privada/precios_muebles/precios_muebles.php', '20', '2023-04-28 02:09:30', '2023-04-28 03:10:10', 1, 'A'),
(22, 4, 'Rtp Muebles', '../privada/reporte_muebles/reporte_mueble.php', '20', '2023-05-08 03:28:14', '2023-05-08 03:28:14', 1, 'A'),
(23, 8, 'PRECIOS MUEBLES 2', '../privada/muebles/muebles.php', '20', '2023-05-08 04:07:06', '2023-05-08 04:28:45', 1, 'A'),
(24, 10, 'Precios Muebles', '../privada/precios_muebles/precios_muebles.php', '20', '2023-06-02 02:17:48', '2023-06-02 02:37:42', 1, 'A'),
(25, 10, 'Precios Muebles 2', '../privada/muebles/muebles.php', '20', '2023-06-02 02:17:48', '2023-06-02 02:37:14', 1, 'A'),
(26, 4, 'Rpt Persona Por Genero', '../privada/reportes/personas_genero.php', '20', '2023-06-14 02:10:13', '2023-06-14 02:23:26', 1, 'A'),
(27, 4, 'Ficha tecnico de personas', '../privada/reportes/ficha_tec_personas.php', '20', '2023-06-16 01:57:38', '2023-06-16 03:04:33', 1, 'A'),
(28, 11, 'RPT pedidos por cliente', '../privada/reportes/RPT_pedidos_clientes.php', '20', '2023-06-21 02:15:18', '2023-06-21 02:55:58', 1, 'A'),
(29, 11, 'RPT Precios x Helados', '../privada/reportes/RPT_Precios _Helados.php', '20', '2023-06-28 02:53:25', '2023-06-28 03:12:45', 1, 'A'),
(30, 10, 'Ficha Técnica de Precios-Helad', '../privada/reportes/ficha_tecnica_helado.php', '20', '2023-06-28 06:01:29', '2023-06-28 06:01:29', 1, 'A'),
(31, 11, 'TORTAS', '../privada/tortas/tortas.php', '20', '2023-06-30 02:07:56', '2023-06-30 02:07:56', 1, 'A'),
(32, 4, 'REPORTE MENSUALIDADES DEL JUGA', '../privada/reportes/mensualidades_jugadores.php', '20', '2023-07-30 05:08:32', '2023-07-30 05:16:33', 1, 'A'),
(33, 4, 'REPORTE ESTADISTICOS', '../privada/reportes/reportes_estadisticos.php', '20', '2023-08-02 02:27:43', '2023-08-02 03:10:05', 1, 'A'),
(34, 13, 'REPORTE PDF', '../privada/reportes/jugadores_titulares.php', '20', '2023-08-09 02:10:12', '2023-08-09 02:36:25', 1, 'A'),
(35, 13, 'REPORTE GRAFICO', '../privada/reportes/jugadores_estadisticos.php', '20', '2023-08-09 03:02:12', '2023-08-09 03:33:03', 1, 'A'),
(36, 14, 'LISTADO CON PAGINACION', '../privada/precios_muebles/precios_muebles.php', '20', '2023-08-11 01:56:17', '2023-08-11 02:21:10', 1, 'A'),
(37, 13, 'REPORTE EVALUACION', '../privada/reportes/jugador_titular.php', '30', '2023-09-06 01:41:12', '2023-09-06 01:55:28', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

DROP TABLE IF EXISTS `partidos`;
CREATE TABLE IF NOT EXISTS `partidos` (
  `id_partido` int NOT NULL AUTO_INCREMENT,
  `id_jugador_titular` int NOT NULL,
  `id_torneo` int NOT NULL,
  `lugar` varchar(30) DEFAULT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_partido`),
  KEY `id_jugador_titular` (`id_jugador_titular`),
  KEY `id_torneo` (`id_torneo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id_partido`, `id_jugador_titular`, `id_torneo`, `lugar`, `hora`, `fecha`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, 'Garcia Agrega', '17:00:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(2, 1, 1, 'Garcia Agreda Cancha B', '14:00:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(3, 1, 1, 'La bombonera', '13:30:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(4, 1, 1, 'Cancha la Hoyada', '17:40:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(5, 1, 1, 'Cancha Lourdes', '17:12:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(6, 1, 1, 'Garcia Agrega Cancha A', '11:00:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(7, 1, 1, 'Garcia Agrega Cancha B', '13:00:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(8, 1, 1, 'Bombonera ', '12:30:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(9, 1, 1, 'Estadion Tabladita II ', '18:00:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(10, 1, 1, 'Garcia Agrega Chanca C ', '17:00:00', '2021-02-21', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `mont_pedido` float NOT NULL,
  `entrega` varchar(5) NOT NULL,
  `fec_pedido` date NOT NULL,
  `fec_entrega` date NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `mont_pedido`, `entrega`, `fec_pedido`, `fec_entrega`) VALUES
(1, 1, 323, 'SI', '2020-08-22', '2020-08-23'),
(2, 2, 35, 'NO', '2020-02-11', '2020-02-12'),
(3, 6, 45, 'SI', '2020-07-14', '2020-07-15'),
(4, 7, 67, 'SI', '2020-04-25', '2020-04-26'),
(5, 3, 32, 'NO', '2020-07-20', '2020-07-21'),
(6, 5, 68, 'SI', '2020-12-22', '2020-12-23'),
(7, 7, 97, 'NO', '2020-04-07', '2020-04-08'),
(8, 9, 33, 'NO', '2020-08-26', '2020-08-27'),
(9, 10, 54, 'SI', '2020-09-10', '2020-09-11'),
(10, 4, 45, 'SI', '2020-11-02', '2020-11-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `ap` varchar(20) DEFAULT NULL,
  `am` varchar(20) DEFAULT NULL,
  `ci` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `nombre`, `ap`, `am`, `ci`, `telefono`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`, `genero`) VALUES
(1, 'Fernando ', 'Aguirre morales', 'Morales', '10660832', '', '2023-03-29 02:36:27', '2023-09-08 03:20:06', 1, 'A', 'M'),
(3, 'DFFFFFFFFFFFFF', 'AAAAAAA', 'GGGGG', '111111111', '69330505', '2023-03-29 02:36:27', '2023-06-14 02:17:19', 1, 'A', 'M'),
(14, 'JUAN', 'ANIBAL', 'SANCHEZ', '10101010', '70236598', '2023-04-19 09:57:27', '2023-06-14 02:18:16', 1, 'A', 'M'),
(15, 'SHIBELY', 'AGUIRRE', 'FRANCO', '20202020', '69330505', '2023-04-19 09:57:57', '2023-06-14 02:18:21', 1, 'A', 'F'),
(18, 'C', 'a', 'B', '1', '2', '2023-05-31 23:40:00', '2023-06-14 02:18:33', 1, 'A', 'F');

--
-- Disparadores `personas`
--
DROP TRIGGER IF EXISTS `insertar_registro_huellas`;
DELIMITER $$
CREATE TRIGGER `insertar_registro_huellas` BEFORE INSERT ON `personas` FOR EACH ROW BEGIN
    INSERT INTO registro_huellas (consulta, fecha_insercion, usuario)VALUES
    ("INSERT-PERSONAS",NEW.fec_insercion, NEW.usuario);
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios_helados`
--

DROP TABLE IF EXISTS `precios_helados`;
CREATE TABLE IF NOT EXISTS `precios_helados` (
  `id_precio_helado` int NOT NULL AUTO_INCREMENT,
  `id_helado` int NOT NULL,
  `precios_helados` float NOT NULL,
  `fecha_precio_helado` date NOT NULL,
  PRIMARY KEY (`id_precio_helado`),
  KEY `id_helado` (`id_helado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `precios_helados`
--

INSERT INTO `precios_helados` (`id_precio_helado`, `id_helado`, `precios_helados`, `fecha_precio_helado`) VALUES
(1, 1, 3, '2017-03-05'),
(2, 2, 6, '2017-05-06'),
(3, 3, 9, '2017-03-20'),
(4, 2, 6.5, '2018-03-06'),
(5, 1, 3.5, '2018-03-05'),
(6, 2, 6, '2017-03-06'),
(7, 3, 9.5, '2018-08-05'),
(8, 2, 6, '2018-06-06'),
(9, 3, 10, '2018-09-05'),
(10, 3, 10, '2018-05-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios_muebles`
--

DROP TABLE IF EXISTS `precios_muebles`;
CREATE TABLE IF NOT EXISTS `precios_muebles` (
  `id_precio_mueble` int NOT NULL AUTO_INCREMENT,
  `id_mueble` int NOT NULL,
  `precio_venta` float NOT NULL,
  `precio_compra` float NOT NULL,
  `fecha_prec_venta` date NOT NULL,
  `fecha_prec_compra` date NOT NULL,
  PRIMARY KEY (`id_precio_mueble`),
  KEY `id_mueble` (`id_mueble`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `precios_muebles`
--

INSERT INTO `precios_muebles` (`id_precio_mueble`, `id_mueble`, `precio_venta`, `precio_compra`, `fecha_prec_venta`, `fecha_prec_compra`) VALUES
(1, 1, 2000, 1500, '2019-05-13', '2018-04-21'),
(2, 2, 1000, 500, '2019-05-13', '2018-04-21'),
(3, 3, 1000, 700, '2019-05-13', '2018-04-21'),
(4, 4, 100, 90, '2019-05-13', '2018-04-21'),
(5, 5, 4000, 3500, '2019-05-13', '2018-04-21'),
(6, 6, 6000, 5000, '2019-05-13', '2018-04-21'),
(7, 7, 1000, 600, '2019-05-13', '2018-04-21'),
(8, 8, 150, 100, '2019-05-13', '2018-04-21'),
(9, 9, 3000, 2500, '2019-05-13', '2018-04-21'),
(10, 10, 200, 150, '2019-05-13', '2018-04-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

DROP TABLE IF EXISTS `propietario`;
CREATE TABLE IF NOT EXISTS `propietario` (
  `id_propietario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `am` varchar(20) DEFAULT NULL,
  `ap` varchar(20) DEFAULT NULL,
  `ci` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`id_propietario`, `nombre`, `am`, `ap`, `ci`, `telefono`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(6, 'fernando rafael', 'morales ', 'aguirre', '1010101', '', '0000-00-00 00:00:00', '2023-09-08 02:15:35', 0, ''),
(10, 'jose ', 'marques', 'peres', '121', '131313', '0000-00-00 00:00:00', '2023-09-08 02:14:58', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_huellas`
--

DROP TABLE IF EXISTS `registro_huellas`;
CREATE TABLE IF NOT EXISTS `registro_huellas` (
  `id_registro_huella` int NOT NULL AUTO_INCREMENT,
  `consulta` varchar(50) NOT NULL,
  `fecha_insercion` timestamp NOT NULL,
  `usuario` int NOT NULL,
  PRIMARY KEY (`id_registro_huella`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro_huellas`
--

INSERT INTO `registro_huellas` (`id_registro_huella`, `consulta`, `fecha_insercion`, `usuario`) VALUES
(1, 'INSERT-PERSONAS', '2023-04-05 10:26:17', 1),
(2, 'INSERT-PERSONAS', '2023-04-05 10:31:53', 1),
(3, 'INSERT-PERSONAS', '2023-04-08 23:44:19', 1),
(4, 'INSERT-PERSONAS', '2023-04-19 09:57:27', 1),
(5, 'INSERT-PERSONAS', '2023-04-19 09:57:57', 1),
(6, 'INSERT-PERSONAS', '2023-05-19 13:48:46', 1),
(7, 'INSERT-PERSONAS', '2023-05-31 09:19:40', 1),
(8, 'INSERT-PERSONAS', '2023-05-31 23:40:00', 1),
(9, 'INSERT-PERSONAS', '2023-05-31 23:41:48', 1),
(10, 'INSERT-PERSONAS', '2023-08-04 11:31:56', 1),
(11, 'INSERT-PERSONAS', '2023-08-13 08:31:01', 1),
(12, 'INSERT-PERSONAS', '2023-08-22 10:59:32', 1),
(13, 'INSERT-PERSONAS', '2023-08-22 11:02:00', 1),
(14, 'INSERT-PERSONAS', '2023-08-31 00:43:44', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `ROL` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `ROL`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'ADMINISTRADOR', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(2, 'USUARIO PRUEBA 1', '2023-04-19 02:56:05', '2023-04-19 02:56:05', 1, 'A'),
(3, 'USUARIO PRUEBA 2', '2023-04-19 02:56:05', '2023-04-19 02:56:05', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneos`
--

DROP TABLE IF EXISTS `torneos`;
CREATE TABLE IF NOT EXISTS `torneos` (
  `id_torneo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `lugar` varchar(30) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_torneo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `torneos`
--

INSERT INTO `torneos` (`id_torneo`, `nombre`, `lugar`, `fecha_inicio`, `fecha_fin`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'Tornea tabladita', 'barrio tabladita', '2021-08-21', '2021-12-24', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(2, 'Tornea ATF', 'Garcia Agrega', '2021-09-21', '2021-11-24', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(3, 'Tornea tomatitas', 'Tomatitas', '2021-03-21', '2021-11-24', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(4, 'Tornea ATF', 'Garcia Agreda', '2021-04-21', '2021-12-24', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(5, 'Tornea ATF', 'Garcia Agreda', '2021-03-21', '2021-11-24', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(6, 'Tornea tabladita', 'barrio tabladita', '2021-05-21', '2021-10-24', '2023-03-29 02:36:26', '2023-03-29 02:36:26', 1, 'A'),
(7, 'Tornea San Andres', 'Comunidad San andres', '2021-04-21', '2021-12-24', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(8, 'Tornea tabladitall', 'barrio tabladitall', '2021-07-21', '2021-12-24', '2023-03-29 02:36:27', '2023-03-30 21:45:45', 1, 'x'),
(9, 'Tornea Mendes Arcos', 'barrio mendes arcos', '2021-03-21', '2021-10-24', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(10, 'ddddd', 'A', '2023-03-31', '2023-04-07', '2023-03-29 02:36:27', '2023-03-31 03:30:59', 1, 'x'),
(11, 'sdfsafsdv', 'VSD', '2023-03-29', '2023-03-30', '2023-03-30 07:38:28', '2023-03-30 21:43:14', 1, 'x'),
(12, 'aaaaa', 'FFFFFF', '2023-04-01', '2023-04-08', '2023-03-31 04:33:45', '2023-03-30 21:43:11', 1, 'x'),
(13, 'VVVV', 'WWWWW', '2023-04-02', '2023-04-09', '2023-03-31 04:43:34', '2023-03-30 21:44:16', 1, 'x'),
(14, 'GGFFASSA', 'GGGGG', '2023-03-07', '2023-03-15', '2023-03-31 10:32:25', '2023-03-31 05:38:10', 1, 'A'),
(15, 'vrvvr', 'FFFF', '2023-03-09', '2023-03-15', '2023-03-31 10:32:57', '2023-03-31 05:38:00', 1, 'x'),
(16, 'GGGGG', 'GGGG', '2023-03-31', '2023-04-01', '2023-03-31 12:30:26', '2023-03-31 05:37:55', 1, 'A'),
(17, 'dddd', '', '2023-03-30', '2023-03-31', '2023-03-31 12:31:13', '2023-03-31 05:31:27', 1, 'x');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tortas`
--

DROP TABLE IF EXISTS `tortas`;
CREATE TABLE IF NOT EXISTS `tortas` (
  `id_torta` int NOT NULL AUTO_INCREMENT,
  `id_heladeria_pasteleria` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `cantidad` int NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY (`id_torta`),
  KEY `id_heladeria_pasteleria` (`id_heladeria_pasteleria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tortas`
--

INSERT INTO `tortas` (`id_torta`, `id_heladeria_pasteleria`, `nombre`, `cantidad`, `precio`) VALUES
(1, 1, 'TORTA DE DULCE DE LECHE', 20, 140),
(2, 2, 'TORTA DE MOKKA', 10, 130),
(3, 3, 'TORTA DE TRES LECHES', 15, 150),
(4, 1, 'TORTA DE FRUTAS', 12, 160),
(5, 2, 'TORTA DE CHOCOLATE', 25, 140);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uniformes`
--

DROP TABLE IF EXISTS `uniformes`;
CREATE TABLE IF NOT EXISTS `uniformes` (
  `id_uniforme` int NOT NULL AUTO_INCREMENT,
  `id_escuela_futbol` int NOT NULL,
  `nro_prenda` char(30) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_uniforme`),
  KEY `id_escuela_futbol` (`id_escuela_futbol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `uniformes`
--

INSERT INTO `uniformes` (`id_uniforme`, `id_escuela_futbol`, `nro_prenda`, `descripcion`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'dos', 'pantalon', '2023-03-29 02:36:24', '2023-03-29 02:36:24', 1, 'A'),
(2, 1, 'tres', 'polera', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(3, 1, 'cuatro', 'canilleras', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(4, 1, 'dos', 'polera', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(5, 1, 'una', 'gorra', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(6, 1, 'dos', 'canilleras', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(7, 1, 'tres', 'pantalon', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(8, 1, 'cuatro', 'campera', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(9, 1, 'una', 'imperniable', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A'),
(10, 1, 'dos', 'pantalon', '2023-03-29 02:36:25', '2023-03-29 02:36:25', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uniformes_index`
--

DROP TABLE IF EXISTS `uniformes_index`;
CREATE TABLE IF NOT EXISTS `uniformes_index` (
  `id_uniforme` int NOT NULL AUTO_INCREMENT,
  `id_escuela_futbol` int NOT NULL,
  `nro_prenda` char(30) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_uniforme`),
  KEY `id_escuela_futbol` (`id_escuela_futbol`),
  KEY `i_nro_prenda` (`nro_prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `clave` varchar(100) NOT NULL,
  `nom_usu` varchar(20) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_persona`, `clave`, `nom_usu`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', 'admin', '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(2, 15, '$2y$10$lDYudyzmGjQW3Bui175a2uYVf8R3CnCOC5srisu8boR5DDZZAwEX6', 'shibe', '2023-03-31 09:33:50', '2023-04-19 05:52:58', 1, 'A'),
(3, 14, '$2y$10$fwJwpBFZgzj5hUs/PUBkH.UVb4w.lFztoGn8NAPqtlaOB/DhzDr96', 'anibal', '2023-04-19 10:02:47', '2023-04-19 03:02:47', 1, 'A'),
(4, 15, '$2y$10$HcwcW0WGPRPrwcLDZ2WbzuIwfm9JZYqC1eMXIdyIlpU2zITP5Ap5a', 'shibely', '2023-04-19 10:03:27', '2023-04-19 03:54:41', 1, 'A'),
(5, 18, '$2y$10$p8jvCv1zjpU2SDMSXXkHPeAU4JVvvZMaz8.hYrcPsrE9Im/Sro5oW', 'aa', '2023-05-31 23:41:19', '2023-05-31 16:41:19', 1, 'A'),
(6, 3, '$2y$10$T/xkK5hnNhKFfZZoNrPL6eRYjqJugJMSz0SAwG/M6XoqQYVr3dWUm', 'ee', '2023-05-31 23:42:02', '2023-08-29 22:04:09', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_roles`
--

DROP TABLE IF EXISTS `usuario_roles`;
CREATE TABLE IF NOT EXISTS `usuario_roles` (
  `id_usuario_rol` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  KEY `id_rol` (`id_rol`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_roles`
--

INSERT INTO `usuario_roles` (`id_usuario_rol`, `id_rol`, `id_usuario`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, '2023-03-29 02:36:27', '2023-03-29 02:36:27', 1, 'A'),
(2, 2, 2, '2023-04-19 03:09:01', '2023-04-19 03:09:01', 1, 'A'),
(3, 3, 3, '2023-04-19 03:09:01', '2023-04-19 03:09:01', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_sitio`
--

DROP TABLE IF EXISTS `visita_sitio`;
CREATE TABLE IF NOT EXISTS `visita_sitio` (
  `id_visita` int NOT NULL AUTO_INCREMENT,
  `pagina_visitada` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_visita`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `visita_sitio`
--

INSERT INTO `visita_sitio` (`id_visita`, `pagina_visitada`, `cantidad`) VALUES
(1, 'CURSO DE PHP', 24),
(2, 'CURSO DE HTML', 41),
(3, 'CURSO DE CSS', 28),
(4, 'CURSO DE MODELO E-R', 21),
(5, 'CURSO DE MODELO RELACIONAL', 23),
(6, 'CURSO DE MYSQL BASICO', 23),
(7, 'CURSO DE MYSQL AVANZADO', 26),
(8, 'CURSO DE GIT', 28),
(9, 'CURSO DE NO SQL', 30);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_categoria`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_categoria`;
CREATE TABLE IF NOT EXISTS `vista_categoria` (
`nombre` varchar(30)
,`descripcion` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_mensualidades`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_mensualidades`;
CREATE TABLE IF NOT EXISTS `vista_mensualidades` (
`costo` varchar(30)
,`nombre` varchar(30)
,`apellidos` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_personas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_personas`;
CREATE TABLE IF NOT EXISTS `vista_personas` (
`ci` varchar(15)
,`nombre` varchar(30)
,`ap` varchar(20)
,`am` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_categoria`
--
DROP TABLE IF EXISTS `vista_categoria`;

DROP VIEW IF EXISTS `vista_categoria`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_categoria`  AS SELECT `categorias`.`nombre` AS `nombre`, `categorias`.`descripcion` AS `descripcion` FROM `categorias` WHERE (`categorias`.`estado` = 'A')  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_mensualidades`
--
DROP TABLE IF EXISTS `vista_mensualidades`;

DROP VIEW IF EXISTS `vista_mensualidades`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_mensualidades`  AS SELECT `me`.`costo` AS `costo`, `ju`.`nombre` AS `nombre`, `ju`.`apellidos` AS `apellidos` FROM (`mensualidades` `me` join `jugadores` `ju` on((`ju`.`id_jugador` = `me`.`id_jugador`))) WHERE ((`ju`.`estado` = 'A') AND (`me`.`estado` = 'A'))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_personas`
--
DROP TABLE IF EXISTS `vista_personas`;

DROP VIEW IF EXISTS `vista_personas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_personas`  AS SELECT `personas`.`ci` AS `ci`, `personas`.`nombre` AS `nombre`, `personas`.`ap` AS `ap`, `personas`.`am` AS `am` FROM `personas` WHERE (`personas`.`estado` = 'A')  ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `accesos_ibfk_2` FOREIGN KEY (`id_opcion`) REFERENCES `opciones` (`id_opcion`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_heladeria_pasteleria`) REFERENCES `heladeria_pasteleria` (`id_heladeria_pasteleria`);

--
-- Filtros para la tabla `empleados_cargos`
--
ALTER TABLE `empleados_cargos`
  ADD CONSTRAINT `empleados_cargos_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `empleados_cargos_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`);

--
-- Filtros para la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  ADD CONSTRAINT `entrenadores_ibfk_1` FOREIGN KEY (`id_escuela_futbol`) REFERENCES `escuela_de_futbol` (`id_escuela_futbol`);

--
-- Filtros para la tabla `helados`
--
ALTER TABLE `helados`
  ADD CONSTRAINT `helados_ibfk_1` FOREIGN KEY (`id_heladeria_pasteleria`) REFERENCES `heladeria_pasteleria` (`id_heladeria_pasteleria`);

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`id_escuela_futbol`) REFERENCES `escuela_de_futbol` (`id_escuela_futbol`),
  ADD CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `jugadores_index`
--
ALTER TABLE `jugadores_index`
  ADD CONSTRAINT `jugadores_index_ibfk_1` FOREIGN KEY (`id_escuela_futbol`) REFERENCES `escuela_de_futbol` (`id_escuela_futbol`),
  ADD CONSTRAINT `jugadores_index_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `jugadores_titulares`
--
ALTER TABLE `jugadores_titulares`
  ADD CONSTRAINT `jugadores_titulares_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`);

--
-- Filtros para la tabla `jugadores_titulares_index`
--
ALTER TABLE `jugadores_titulares_index`
  ADD CONSTRAINT `jugadores_titulares_index_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`);

--
-- Filtros para la tabla `mensualidades`
--
ALTER TABLE `mensualidades`
  ADD CONSTRAINT `mensualidades_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`);

--
-- Filtros para la tabla `mensualidades_index`
--
ALTER TABLE `mensualidades_index`
  ADD CONSTRAINT `mensualidades_index_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`);

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `opciones_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`);

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`id_jugador_titular`) REFERENCES `jugadores_titulares` (`id_jugador_titular`),
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`id_torneo`) REFERENCES `torneos` (`id_torneo`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `precios_helados`
--
ALTER TABLE `precios_helados`
  ADD CONSTRAINT `precios_helados_ibfk_1` FOREIGN KEY (`id_helado`) REFERENCES `helados` (`id_helado`);

--
-- Filtros para la tabla `precios_muebles`
--
ALTER TABLE `precios_muebles`
  ADD CONSTRAINT `precios_muebles_ibfk_1` FOREIGN KEY (`id_mueble`) REFERENCES `precios_muebles` (`id_precio_mueble`);

--
-- Filtros para la tabla `tortas`
--
ALTER TABLE `tortas`
  ADD CONSTRAINT `tortas_ibfk_1` FOREIGN KEY (`id_heladeria_pasteleria`) REFERENCES `heladeria_pasteleria` (`id_heladeria_pasteleria`);

--
-- Filtros para la tabla `uniformes`
--
ALTER TABLE `uniformes`
  ADD CONSTRAINT `uniformes_ibfk_1` FOREIGN KEY (`id_escuela_futbol`) REFERENCES `escuela_de_futbol` (`id_escuela_futbol`);

--
-- Filtros para la tabla `uniformes_index`
--
ALTER TABLE `uniformes_index`
  ADD CONSTRAINT `uniformes_index_ibfk_1` FOREIGN KEY (`id_escuela_futbol`) REFERENCES `escuela_de_futbol` (`id_escuela_futbol`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `usuario_roles`
--
ALTER TABLE `usuario_roles`
  ADD CONSTRAINT `usuario_roles_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `usuario_roles_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
