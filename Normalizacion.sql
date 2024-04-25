CREATE TABLE `persona` (
  `ID_persona` int PRIMARY KEY,
  `Nombre` varchar(100),
  `Apellido` varchar(100),
  `Documento` varchar(100),
  `Celular` varchar(15)
);

CREATE TABLE `propietario` (
  `ID_propietario` int PRIMARY KEY,
  `ID_persona` int,
  `cuenta_bancaria` decimal(10,2)
);

CREATE TABLE `cliente` (
  `ID_cliente` int PRIMARY KEY,
  `ID_persona` int,
  `Estado_civil` varchar(50),
  `Ingresos_mensuales` decimal(10,2),
  `Referencias_personales` text
);

CREATE TABLE `tipo_inmueble` (
  `ID_tipo_inmueble` int PRIMARY KEY,
  `tipo_inmueble` varchar(100),
  `num_habitaciones` int,
  `num_baños` int
);

CREATE TABLE `inmueble` (
  `ID_inmueble` int PRIMARY KEY,
  `ID_propietario` int,
  `ID_tipo_inmueble` int,
  `amueblado` boolean,
  `Deposito` decimal(10,2)
);

CREATE TABLE `contrato` (
  `ID_contrato` int PRIMARY KEY,
  `ID_cliente` int,
  `ID_inmueble` int,
  `Estado_contrato` varchar(10),
  `Fecha_inicio` datetime,
  `Fecha_vencimiento` datetime,
  `Fecha_firma` datetime
);

CREATE TABLE `pago` (
  `ID_pago` int PRIMARY KEY,
  `MontoPagado` int,
  `Fecha_pago` datetime,
  `ID_contrato` int,
  `EstadoPago` varchar(10),
  `MetodoPago` varchar(20)
);

CREATE TABLE `Publicacion` (
  `ID_publicacion` int PRIMARY KEY,
  `ID_inmueble` int,
  `Fecha_publicacion` datetime,
  `Estado_publicacion` bool,
  `Precio_Solicitado` decimal(10,2),
  `Estado` bool
);

CREATE TABLE `inmueble_cliente` (
  `ID_inmueble` int,
  `ID_cliente` int,
  PRIMARY KEY (`ID_inmueble`, `ID_cliente`)
);

CREATE TABLE `inmueble_propietario` (
  `ID_propietario` int,
  `ID_inmueble` int,
  PRIMARY KEY (`ID_propietario`, `ID_inmueble`)
);

ALTER TABLE `propietario` ADD FOREIGN KEY (`ID_persona`) REFERENCES `persona` (`ID_persona`);

ALTER TABLE `cliente` ADD FOREIGN KEY (`ID_persona`) REFERENCES `persona` (`ID_persona`);

ALTER TABLE `inmueble` ADD FOREIGN KEY (`ID_tipo_inmueble`) REFERENCES `tipo_inmueble` (`ID_tipo_inmueble`);

ALTER TABLE `contrato` ADD FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`);

ALTER TABLE `contrato` ADD FOREIGN KEY (`ID_inmueble`) REFERENCES `inmueble` (`ID_inmueble`);

ALTER TABLE `pago` ADD FOREIGN KEY (`ID_contrato`) REFERENCES `contrato` (`ID_contrato`);

ALTER TABLE `Publicacion` ADD FOREIGN KEY (`ID_inmueble`) REFERENCES `inmueble` (`ID_inmueble`);

ALTER TABLE `inmueble_cliente` ADD FOREIGN KEY (`ID_inmueble`) REFERENCES `inmueble` (`ID_inmueble`);

ALTER TABLE `inmueble_cliente` ADD FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`);

ALTER TABLE `inmueble_propietario` ADD FOREIGN KEY (`ID_propietario`) REFERENCES `propietario` (`ID_propietario`);

ALTER TABLE `inmueble_propietario` ADD FOREIGN KEY (`ID_inmueble`) REFERENCES `inmueble` (`ID_inmueble`);
