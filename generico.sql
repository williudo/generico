/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : locadora

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-05 16:12:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `desativado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'Willian', 'willian@mail.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', '1', '2018-04-05 12:14:39', null, '2018-04-05 12:14:42');
INSERT INTO `admins` VALUES ('2', 'John Doe', 'john@mail.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', '1', '2018-04-05 12:14:39', null, '2018-04-05 12:14:39');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id_cliente` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `desativado_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', 'Willian', '38971015802', '1990-11-17', 'willian@mail.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', '1', '2018-04-05 15:33:39', '2018-04-05 15:33:42', null);

-- ----------------------------
-- Table structure for enderecos
-- ----------------------------
DROP TABLE IF EXISTS `enderecos`;
CREATE TABLE `enderecos` (
  `id_endereco` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `desativado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `cliente` (`id_cliente`),
  CONSTRAINT `cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of enderecos
-- ----------------------------

-- ----------------------------
-- Table structure for locacoes
-- ----------------------------
DROP TABLE IF EXISTS `locacoes`;
CREATE TABLE `locacoes` (
  `id_locacao` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `id_midia` bigint(11) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `porc_desconto` double DEFAULT NULL,
  `data_locado` datetime DEFAULT NULL,
  `data_a_devolver` datetime DEFAULT NULL,
  `data_devolvido` datetime DEFAULT NULL,
  PRIMARY KEY (`id_locacao`),
  KEY `cli` (`id_cliente`),
  KEY `mid` (`id_midia`),
  CONSTRAINT `cli` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mid` FOREIGN KEY (`id_midia`) REFERENCES `midias` (`id_midia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of locacoes
-- ----------------------------

-- ----------------------------
-- Table structure for midias
-- ----------------------------
DROP TABLE IF EXISTS `midias`;
CREATE TABLE `midias` (
  `id_midia` bigint(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `desativado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id_midia`),
  KEY `tipo` (`id_tipo`),
  CONSTRAINT `tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_midia` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of midias
-- ----------------------------

-- ----------------------------
-- Table structure for reservas
-- ----------------------------
DROP TABLE IF EXISTS `reservas`;
CREATE TABLE `reservas` (
  `id_reserva` bigint(20) NOT NULL,
  `id_midia` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `data_reserva` datetime DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `cl` (`id_cliente`),
  KEY `mi` (`id_midia`),
  CONSTRAINT `cl` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mi` FOREIGN KEY (`id_midia`) REFERENCES `midias` (`id_midia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reservas
-- ----------------------------

-- ----------------------------
-- Table structure for telefones
-- ----------------------------
DROP TABLE IF EXISTS `telefones`;
CREATE TABLE `telefones` (
  `id_telefone` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `ddd` varchar(2) DEFAULT NULL,
  `fone` varchar(10) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `desativado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of telefones
-- ----------------------------

-- ----------------------------
-- Table structure for tipos_midia
-- ----------------------------
DROP TABLE IF EXISTS `tipos_midia`;
CREATE TABLE `tipos_midia` (
  `id_tipo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `desativado_em` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tipos_midia
-- ----------------------------
