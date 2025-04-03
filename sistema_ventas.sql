-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2025 a las 00:56:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `deuda` decimal(10,2) DEFAULT 0.00,
  `fecha_inicio` date DEFAULT NULL,
  `bloqueo` tinyint(1) DEFAULT 0,
  `id_compra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `telefono`, `correo`, `deuda`, `fecha_inicio`, `bloqueo`, `id_compra`) VALUES
(1, 'Ana Torres', '5544332211', 'ana@gmail.com', 0.00, '2025-04-16', 0, NULL),
(2, 'Luis Fernández', '5511223344', 'luisf@hotmail.com', 419.34, '2025-04-30', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_facturados`
--

CREATE TABLE `clientes_facturados` (
  `id_cliente_facturado` int(11) NOT NULL,
  `rfc_cliente` varchar(13) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `regimen_fiscal` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `id_compra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `id_descuento` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo` enum('porcentaje','monto') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento_producto`
--

CREATE TABLE `descuento_producto` (
  `id_descuento` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `factura` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `total`, `factura`) VALUES
(1, 3, 1, 4, 60.00, 0),
(2, 4, 1, 1, 15.00, 0),
(3, 5, 1, 1, 15.00, 0),
(4, 6, 1, 3, 45.00, 0),
(5, 7, 1, 2, 30.00, 0),
(6, 8, 2, 5, 92.50, 0),
(7, 8, 1, 3, 45.00, 0),
(8, 9, 2, 5, 92.50, 0),
(9, 9, 1, 5, 75.00, 0),
(10, 10, 1, 1, 15.00, 0),
(11, 11, 1, 1, 15.00, 0),
(12, 12, 1, 2, 30.00, 0),
(13, 12, 2, 1, 18.50, 0),
(14, 13, 1, 4, 60.00, 0),
(15, 13, 2, 3, 55.50, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `nombre_legal` varchar(255) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `regimen_fiscal` varchar(100) DEFAULT NULL,
  `direccion_fiscal` text DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `caja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `id_proveedor`) VALUES
(1, 'Coca-Cola 600ml', 'Refresco de cola', 15.00, 73, 1),
(2, 'Papas Sabritas 55g', 'Papas fritas sabor natural', 18.50, 36, 1),
(3, 'Leche Lala 1L', 'Leche entera', 25.00, 80, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_comercial` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_comercial`, `telefono`, `correo`) VALUES
(1, 'Distribuidora ABC', '5551234567', 'contacto@abc.com'),
(2, 'Suministros XYZ', '5557654321', 'ventas@xyz.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ApellidoP` varchar(100) DEFAULT NULL,
  `ApellidoM` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `rol` enum('cajero','admin') DEFAULT 'cajero'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `ApellidoP`, `ApellidoM`, `contrasena`, `rol`) VALUES
(1, 'Juan', 'Pérez', 'Gómez', '12345', 'admin'),
(2, 'María', 'López', 'Ramírez', 'abcde', 'cajero'),
(3, 'Carlos', 'Hernández', 'Díaz', 'qwerty', 'cajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `id_cliente` int(11) DEFAULT NULL,
  `id_cajero` int(11) DEFAULT NULL,
  `total_bruto` decimal(10,2) DEFAULT NULL,
  `descuento_total` decimal(10,2) DEFAULT NULL,
  `total_neto` decimal(10,2) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `estado` enum('completada','cancelada','pendiente') DEFAULT 'completada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `fecha`, `id_cliente`, `id_cajero`, `total_bruto`, `descuento_total`, `total_neto`, `metodo_pago`, `estado`) VALUES
(1, '2025-03-31 17:54:37', 1, 2, 100.00, 10.00, 90.00, 'Efectivo', 'completada'),
(2, '2025-03-31 17:54:37', 2, 3, 200.00, 0.00, 200.00, 'Tarjeta', 'pendiente'),
(3, '2025-04-03 10:56:09', NULL, NULL, 69.60, NULL, 69.60, 'efectivo', 'completada'),
(4, '2025-04-03 11:00:34', NULL, NULL, 17.40, NULL, 17.40, 'efectivo', 'completada'),
(5, '2025-04-03 11:00:37', NULL, NULL, 17.40, NULL, 17.40, 'efectivo', 'completada'),
(6, '2025-04-03 11:02:45', NULL, NULL, 52.20, NULL, 52.20, 'efectivo', 'completada'),
(7, '2025-04-03 13:47:13', 1, 1, 30.00, NULL, 34.80, 'fiado', 'completada'),
(8, '2025-04-03 13:48:26', 1, 1, 137.50, NULL, 159.50, 'fiado', 'completada'),
(9, '2025-04-03 13:52:54', 2, 1, 167.50, NULL, 194.30, 'fiado', 'completada'),
(10, '2025-04-03 14:06:32', 2, 1, 15.00, NULL, 17.40, 'fiado', 'completada'),
(11, '2025-04-03 14:08:19', 2, 1, 15.00, NULL, 17.40, 'fiado', 'completada'),
(12, '2025-04-03 15:30:16', 2, 1, 48.50, NULL, 56.26, 'fiado', 'completada'),
(13, '2025-04-03 15:36:46', 2, 1, 115.50, NULL, 133.98, 'fiado', 'completada');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_compra` (`id_compra`);

--
-- Indices de la tabla `clientes_facturados`
--
ALTER TABLE `clientes_facturados`
  ADD PRIMARY KEY (`id_cliente_facturado`),
  ADD KEY `id_compra` (`id_compra`);

--
-- Indices de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`id_descuento`);

--
-- Indices de la tabla `descuento_producto`
--
ALTER TABLE `descuento_producto`
  ADD PRIMARY KEY (`id_descuento`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_cajero` (`id_cajero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `clientes_facturados`
--
ALTER TABLE `clientes_facturados`
  MODIFY `id_cliente_facturado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `id_descuento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `ventas` (`id_venta`);

--
-- Filtros para la tabla `clientes_facturados`
--
ALTER TABLE `clientes_facturados`
  ADD CONSTRAINT `clientes_facturados_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `ventas` (`id_venta`);

--
-- Filtros para la tabla `descuento_producto`
--
ALTER TABLE `descuento_producto`
  ADD CONSTRAINT `descuento_producto_ibfk_1` FOREIGN KEY (`id_descuento`) REFERENCES `descuentos` (`id_descuento`),
  ADD CONSTRAINT `descuento_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cajero`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
