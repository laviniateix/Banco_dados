-- MySQL Script generated by MySQL Workbench
-- Fri Sep 20 07:48:25 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vendaproduto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendaproduto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendaproduto` DEFAULT CHARACTER SET utf8 ;
USE `vendaproduto` ;

-- -----------------------------------------------------
-- Table `vendaproduto`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaproduto`.`Categoria` (
  `idCategoria` 	INT NOT NULL,
  `DsCategoria` 	VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendaproduto`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaproduto`.`Produto` (
`idProduto` 				INT NOT NULL,
`DsProduto` 				VARCHAR(45) NOT NULL,
`preco` 					FLOAT NOT NULL,
`Quantidade` 				INT NOT NULL,
`Foto` 						LONGBLOB NOT NULL,
`Categoria_idCategoria` 	INT NOT NULL,
PRIMARY KEY 				(`idProduto`),
-- INDEX `fk_Produto_Categoria_idx` (`Categoria_idCategoria` ASC) VISIBLE, --
CONSTRAINT 					`fk_Produto_Categoria`
FOREIGN KEY 				(`Categoria_idCategoria`)
REFERENCES 					`vendaproduto`.`Categoria` (`idCategoria`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendaproduto`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaproduto`.`Cliente` (
  `idCliente` 		INT NOT NULL,
  `Nome` 			VARCHAR(100) NOT NULL,
  `Email`			VARCHAR(45) NOT NULL,
  `Senha` 			VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendaproduto`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaproduto`.`Pedidos` (
`idPedidos` 			INT NOT NULL,
`Data` 					DATE NOT NULL,
`Status` 				VARCHAR(45) NOT NULL,
`Sessao` 				VARCHAR(45) NOT NULL,
`Cliente_idCliente` 	INT NOT NULL,
PRIMARY KEY 			(`idPedidos`),
-- INDEX `fk_Pedidos_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE, --
CONSTRAINT				`fk_Pedidos_Cliente1`
FOREIGN KEY 			(`Cliente_idCliente`)
REFERENCES 				`vendaproduto`.`Cliente` (`idCliente`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendaproduto`.`PedidoItens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendaproduto`.`PedidoItens` (
`idPedidoItens` 			INT NOT NULL,
`Quantidade` 				INT NOT NULL,
`Preco` 					FLOAT NOT NULL,
`Total` 					FLOAT NOT NULL,
`Produto_idProduto` 		INT NOT NULL,
`Pedidos_idPedidos` 		INT NOT NULL,
PRIMARY KEY 				(`idPedidoItens`),
-- INDEX `fk_PedidoItens_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE, --
-- INDEX `fk_PedidoItens_Pedidos1_idx` (`Pedidos_idPedidos` ASC) VISIBLE, --
CONSTRAINT 					`fk_PedidoItens_Produto1`
FOREIGN KEY 				(`Produto_idProduto`)
REFERENCES 					`vendaproduto`.`Produto` (`idProduto`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT 					`fk_PedidoItens_Pedidos1`
FOREIGN KEY 				(`Pedidos_idPedidos`)
REFERENCES 					`vendaproduto`.`Pedidos` (`idPedidos`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
