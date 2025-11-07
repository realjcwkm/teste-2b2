-- MySQL Workbench Synchronization
-- Generated: 2025-11-07 11:09
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Aluno

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `petshop` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `petshop`.`clientes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `petshop`.`produtos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `petshop`.`servicos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `valor_total` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `clientes_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `clientes_id`),
  INDEX `fk_servicos_clientes_idx` (`clientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_servicos_clientes`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `petshop`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `petshop`.`servicos_has_products` (
  `produtos_id` INT(11) NOT NULL,
  `servicos_id` INT(11) NOT NULL,
  `servicos_clientes_id` INT(11) NOT NULL,
  `quantidade` INT(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`produtos_id`, `servicos_id`, `servicos_clientes_id`),
  INDEX `fk_produtos_has_servicos_servicos1_idx` (`servicos_id` ASC, `servicos_clientes_id` ASC) VISIBLE,
  INDEX `fk_produtos_has_servicos_produtos1_idx` (`produtos_id` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_has_servicos_produtos1`
    FOREIGN KEY (`produtos_id`)
    REFERENCES `petshop`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_has_servicos_servicos1`
    FOREIGN KEY (`servicos_id` , `servicos_clientes_id`)
    REFERENCES `petshop`.`servicos` (`id` , `clientes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
