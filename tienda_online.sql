-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2022 a las 09:37:53
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id` int(11) NOT NULL,
  `caracteristicas` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `caracteristicas`
--

INSERT INTO `caracteristicas` (`id`, `caracteristicas`, `activo`) VALUES
(1, 'Talle', 1),
(2, 'color', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `id_cliente` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `id_transaccion`, `fecha`, `estado`, `email`, `id_cliente`, `total`) VALUES
(1, '2H1932749C297405B', '2022-09-30 01:41:13', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(2, '1MJ86769NT910904R', '2022-09-30 07:24:18', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '280.46'),
(3, '0TB19065N1312554D', '2022-09-30 07:28:02', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '280.46'),
(4, '3V446502C9213710U', '2022-09-30 07:30:22', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '280.46'),
(5, '82131739PG8311522', '2022-09-30 07:33:25', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '280.46'),
(6, '7EK42901BM2974807', '2022-09-30 07:37:55', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '280.46'),
(7, '1SX28918XS929104R', '2022-09-30 07:50:56', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '280.46'),
(8, '8N076020YW092943V', '2022-09-30 07:55:14', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '280.46'),
(9, '5DW87151995383317', '2022-10-01 02:49:53', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(10, '7VR012516V850412S', '2022-10-01 02:52:14', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(11, '75F97833WT5612842', '2022-10-01 02:53:14', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(12, '1VN35198VM6404734', '2022-10-01 02:54:27', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(13, '9N617946J46421123', '2022-10-01 02:55:35', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(14, '93B34273YJ8410349', '2022-10-01 03:15:21', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(15, '4CU77870CC706062E', '2022-10-01 03:17:14', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(16, '44J22240V8975432F', '2022-10-01 03:17:43', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(17, '65U82453HX170943T', '2022-10-01 03:19:39', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(18, '25R179989P372352K', '2022-10-01 03:20:57', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '302.59'),
(19, '7MF78931FX2590217', '2022-10-01 06:51:09', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '516.66'),
(20, '2EJ52754DM4824156', '2022-10-01 07:01:10', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '516.66'),
(21, '53J71279RW551214F', '2022-10-01 07:02:35', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '516.66'),
(22, '1LV12503XS689284Y', '2022-10-01 07:28:05', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '516.66'),
(23, '0LD77555KD159921J', '2022-10-01 07:29:47', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '516.66'),
(24, '8HJ46803DW987335D', '2022-10-01 07:34:59', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '516.66'),
(25, '74S873575D312910T', '2022-10-01 07:35:30', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '516.66'),
(26, '9W452653YJ854834W', '2022-10-01 07:37:36', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '516.66'),
(27, '60D53711RP931373T', '2022-10-02 09:14:00', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(28, '5RN11734LY820952W', '2022-10-02 09:17:35', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(29, '26S67585TW8777127', '2022-10-02 09:19:28', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(30, '8TT81226NY2065809', '2022-10-02 09:20:00', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(31, '1RS32826GH6878445', '2022-10-02 09:20:53', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(32, '1E564774FY7319628', '2022-10-07 09:37:45', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '258.33'),
(33, '4PX26994H6137693N', '2022-10-07 09:39:44', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(34, '0E787122J99626347', '2022-10-07 09:40:26', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(35, '2L910692NH6997132', '2022-10-07 09:41:51', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(36, '9J828776AL181223N', '2022-10-07 09:43:38', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(37, '44C3790718702671S', '2022-10-07 09:44:48', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(38, '6XT71519TU522723K', '2022-10-07 09:48:40', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(39, '72J3214500870582N', '2022-10-07 09:50:18', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(40, '45W22757548643620', '2022-10-07 09:54:34', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(41, '7MU615807A495051G', '2022-10-07 09:58:51', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(42, '8SK0735768036152N', '2022-10-07 10:00:28', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '258.33'),
(43, '1AG324307U612992P', '2022-10-07 10:04:27', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(44, '5XR98660961508505', '2022-10-07 10:41:06', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '388.70'),
(45, '66P6240678533182V', '2022-10-07 10:42:12', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '388.70'),
(46, '1CP56017L69793424', '2022-10-07 10:43:13', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '388.70'),
(47, '3WL11972SN163520F', '2022-10-08 09:36:27', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(48, '8WN17563A17219612', '2022-10-08 09:46:50', 'COMPLETED', 'negavalos99@gmail.com', 'E4YFGXNBG94Y2', '388.70'),
(49, '0LS554436U9622332', '2022-10-08 09:28:10', 'COMPLETED', 'dshfjdhfjskah@gmail.com', 'DTR8T3E8DDC8E', '1338.32'),
(50, '1JM44787DR318313M', '2022-10-10 01:53:27', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '516.66'),
(51, '8RK19321UY229031P', '2022-10-10 01:57:25', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(52, '2MR00464E8418534R', '2022-10-10 01:59:46', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(53, '7HY77137YB214635H', '2022-10-10 02:06:21', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(54, '79T042763J0002736', '2022-10-10 02:07:21', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(55, '9BA81199EA917481A', '2022-10-10 02:11:55', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '108.24'),
(56, '5LF55569AN871405T', '2022-10-10 02:14:02', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(57, '22069034XN534462U', '2022-10-10 02:15:54', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(58, '3AW70262NJ819581E', '2022-10-10 02:17:31', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '194.35'),
(59, '9KG0155592341643U', '2022-10-10 02:21:32', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(60, '5UC17525LK587115T', '2022-10-10 02:24:49', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '108.24'),
(61, '6WT8728279120822E', '2022-10-10 02:27:36', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '108.24'),
(62, '4UR896225V410332G', '2022-10-10 02:30:29', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(63, '50752295NJ657194H', '2022-10-10 02:35:14', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(64, '5AJ382066K616984H', '2022-10-10 02:36:30', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(65, '6VR12263EW873373P', '2022-10-10 02:55:14', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(66, '6V483996DJ708580U', '2022-10-11 08:56:31', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(67, '6KH49415DB737403Y', '2022-10-11 08:59:32', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(68, '8YS997406M964310P', '2022-10-11 09:03:45', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(69, '72946395920498741', '2022-10-11 09:04:08', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(70, '8VR75695PK674931V', '2022-10-11 09:06:27', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(71, '7S150587D5044373D', '2022-10-11 09:17:53', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(72, '5YD33876MJ787282V', '2022-10-11 09:19:45', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '194.35'),
(73, '1RT18583FR900514F', '2022-10-11 10:38:31', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(74, '9DP11211YY988063A', '2022-10-11 10:43:53', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '194.35'),
(75, '24S1376853011640T', '2022-10-11 10:57:14', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(76, '3MP17909UY757234X', '2022-10-11 11:34:09', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '86.11'),
(77, '6A54796931362230J', '2022-10-12 06:34:42', 'COMPLETED', 'sb-mktqt21097710@personal.example.com', 'P9AFAP96S8PSJ', '172.22'),
(78, '19P90678LD189590X', '2022-10-12 06:38:17', 'COMPLETED', 'dhdhahhdhafdhfdjashfdj@gmail.com', 'DJ697JGKMXD34', '86.11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compra`
--

CREATE TABLE `detalles_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalles_compra`
--

INSERT INTO `detalles_compra` (`id`, `id_compra`, `id_producto`, `nombre`, `precio`, `cantidad`) VALUES
(1, 1, 4, 'notebook', '86.11', 1),
(2, 1, 5, 'celular', '108.24', 2),
(3, 2, 4, 'notebook', '86.11', 2),
(4, 2, 5, 'celular', '108.24', 1),
(5, 3, 4, 'notebook', '86.11', 2),
(6, 3, 5, 'celular', '108.24', 1),
(7, 4, 4, 'notebook', '86.11', 2),
(8, 4, 5, 'celular', '108.24', 1),
(9, 5, 4, 'notebook', '86.11', 2),
(10, 5, 5, 'celular', '108.24', 1),
(11, 6, 4, 'notebook', '86.11', 2),
(12, 6, 5, 'celular', '108.24', 1),
(13, 7, 4, 'notebook', '86.11', 2),
(14, 7, 5, 'celular', '108.24', 1),
(15, 8, 4, 'notebook', '86.11', 2),
(16, 8, 5, 'celular', '108.24', 1),
(17, 9, 4, 'notebook', '86.11', 1),
(18, 9, 5, 'celular', '108.24', 2),
(19, 10, 4, 'notebook', '86.11', 1),
(20, 10, 5, 'celular', '108.24', 2),
(21, 11, 4, 'notebook', '86.11', 1),
(22, 11, 5, 'celular', '108.24', 2),
(23, 12, 4, 'notebook', '86.11', 1),
(24, 12, 5, 'celular', '108.24', 2),
(25, 13, 4, 'notebook', '86.11', 1),
(26, 13, 5, 'celular', '108.24', 2),
(27, 14, 4, 'notebook', '86.11', 1),
(28, 14, 5, 'celular', '108.24', 2),
(29, 15, 4, 'notebook', '86.11', 1),
(30, 15, 5, 'celular', '108.24', 2),
(31, 16, 4, 'notebook', '86.11', 1),
(32, 16, 5, 'celular', '108.24', 2),
(33, 17, 4, 'notebook', '86.11', 1),
(34, 17, 5, 'celular', '108.24', 2),
(35, 18, 4, 'notebook', '86.11', 1),
(36, 18, 5, 'celular', '108.24', 2),
(37, 19, 4, 'notebook', '86.11', 6),
(38, 20, 4, 'notebook', '86.11', 6),
(39, 21, 4, 'notebook', '86.11', 6),
(40, 22, 4, 'notebook', '86.11', 6),
(41, 23, 4, 'notebook', '86.11', 6),
(42, 24, 4, 'notebook', '86.11', 6),
(43, 25, 4, 'notebook', '86.11', 6),
(44, 26, 4, 'notebook', '86.11', 6),
(45, 27, 4, 'notebook', '86.11', 2),
(46, 28, 4, 'notebook', '86.11', 1),
(47, 29, 4, 'notebook', '86.11', 1),
(48, 31, 4, 'notebook', '86.11', 2),
(49, 33, 4, 'notebook', '86.11', 2),
(50, 34, 4, 'notebook', '86.11', 2),
(51, 35, 4, 'notebook', '86.11', 2),
(52, 36, 4, 'notebook', '86.11', 2),
(53, 37, 4, 'notebook', '86.11', 2),
(54, 38, 4, 'notebook', '86.11', 1),
(55, 39, 4, 'notebook', '86.11', 1),
(56, 40, 4, 'notebook', '86.11', 1),
(57, 41, 4, 'notebook', '86.11', 1),
(58, 42, 4, 'notebook', '86.11', 3),
(59, 43, 4, 'notebook', '86.11', 2),
(60, 44, 4, 'notebook', '86.11', 2),
(61, 44, 5, 'celular', '108.24', 2),
(62, 45, 4, 'notebook', '86.11', 2),
(63, 45, 5, 'celular', '108.24', 2),
(64, 46, 4, 'notebook', '86.11', 2),
(65, 46, 5, 'celular', '108.24', 2),
(66, 47, 4, 'notebook', '86.11', 2),
(67, 48, 4, 'notebook', '86.11', 2),
(68, 48, 5, 'celular', '108.24', 2),
(69, 49, 4, 'notebook', '86.11', 8),
(70, 49, 5, 'celular', '108.24', 6),
(71, 50, 4, 'notebook', '86.11', 6),
(72, 51, 4, 'notebook', '86.11', 1),
(73, 52, 4, 'notebook', '86.11', 1),
(74, 53, 4, 'notebook', '86.11', 1),
(75, 54, 4, 'notebook', '86.11', 2),
(76, 55, 5, 'zapato', '108.24', 1),
(77, 56, 4, 'notebook', '86.11', 1),
(78, 57, 4, 'notebook', '86.11', 1),
(79, 58, 4, 'notebook', '86.11', 1),
(80, 58, 5, 'zapato', '108.24', 1),
(81, 59, 4, 'notebook', '86.11', 1),
(82, 60, 5, 'zapato', '108.24', 1),
(83, 61, 5, 'zapato', '108.24', 1),
(84, 62, 4, 'notebook', '86.11', 1),
(85, 63, 4, 'notebook', '86.11', 1),
(86, 64, 4, 'notebook', '86.11', 1),
(87, 65, 4, 'notebook', '86.11', 1),
(88, 66, 4, 'notebook', '86.11', 1),
(89, 67, 4, 'notebook', '86.11', 1),
(90, 68, 4, 'notebook', '86.11', 2),
(91, 70, 4, 'notebook', '86.11', 2),
(92, 71, 4, 'notebook', '86.11', 2),
(93, 72, 4, 'notebook', '86.11', 1),
(94, 72, 5, 'zapato', '108.24', 1),
(95, 73, 4, 'notebook', '86.11', 1),
(96, 74, 4, 'notebook', '86.11', 1),
(97, 74, 5, 'zapato', '108.24', 1),
(98, 75, 4, 'notebook', '86.11', 1),
(99, 76, 4, 'notebook', '86.11', 1),
(100, 77, 4, 'Netbook Bgh T295 Pantall Tactil /4gb /hd 500gb /bluetooth', '86.11', 2),
(101, 78, 4, 'Netbook Bgh T295 Pantall Tactil /4gb /hd 500gb /bluetooth', '86.11', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_product_caracter`
--

CREATE TABLE `det_product_caracter` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_caracteristica` int(11) NOT NULL,
  `valor` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `det_product_caracter`
--

INSERT INTO `det_product_caracter` (`id`, `id_producto`, `id_caracteristica`, `valor`, `stock`) VALUES
(1, 5, 1, '22', 5),
(2, 5, 1, '24', 3),
(3, 5, 1, '25', 6),
(4, 5, 1, '26', 10),
(5, 5, 2, 'blanco', 21),
(6, 5, 2, 'verde', 2),
(7, 5, 2, 'marron', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `descuento` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `Precio`, `id_categoria`, `activo`, `descuento`) VALUES
(4, 'Netbook Bgh T295 Pantall Tactil /4gb /hd 500gb /bluetooth', 'Tamaño de pantalla: 10.1\"<br>\nSistema operativo: Windows<br>\nTipo de pantalla: LED<br>\nCon HDMI: Sí<br>\nVelocidad del procesador: 1.58 GHz<br>\nCon USB: Sí<br>\nCon Bluetooth: Sí<br>\nCon pantalla táctil: Sí<br>', '109.00', 1, 1, 21),
(5, 'Zapatos De Hombre 100% Cuero Vacuno', 'Marca	Vulcano<br>\nLínea	Vestir<br>\nModelo	Premium<br>\nGénero	Hombre<br>\nEdad	Adultos<br>\nTipo de calzado	Mocasines<br>', '123.00', 1, 1, 12),
(6, 'Smart TV 4K UHD Samsung 50\" UN50AU7000', '\r\nLo que tenés que saber de este producto\r\nSu resolución es 4K.<br>\r\nTecnología HDR para una calidad de imagen mejorada.<br>\r\nModo de sonido: Dolby Digital.<br>\r\nTiene función Screen Share.<br>\r\nCon Netflix, YouTube.<br>\r\nControl LG Magic Remote no incluido.<br>\r\nSistema operativo Android.<br>\r\nCuenta con conexión HDMI y USB.<br>\r\nDimensiones: 111cm de ancho, 64.9cm de alto, 9cm de profundidad.<br>\r\nEntretenimiento y conectividad en un mismo lugar.<br>', '349.88', 1, 1, 30);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_compra`
--
ALTER TABLE `detalles_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `det_product_caracter`
--
ALTER TABLE `det_product_caracter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dt_product` (`id_producto`),
  ADD KEY `dk_dt_caracter` (`id_caracteristica`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `detalles_compra`
--
ALTER TABLE `detalles_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `det_product_caracter`
--
ALTER TABLE `det_product_caracter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `det_product_caracter`
--
ALTER TABLE `det_product_caracter`
  ADD CONSTRAINT `dk_dt_caracter` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas` (`id`),
  ADD CONSTRAINT `fk_dt_product` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
