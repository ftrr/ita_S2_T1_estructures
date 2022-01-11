-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveidor` (
  `id_proveidor` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `carrer` VARCHAR(45) NULL,
  `numero` INT NULL,
  `pis` INT NULL,
  `porta` VARCHAR(3) NULL,
  `ciutat` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `fax` VARCHAR(45) NULL,
  `nif` VARCHAR(45) NULL,
  PRIMARY KEY (`id_proveidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`ullera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ullera` (
  `id_ullera` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `graduacio_esq` DECIMAL(4) NULL,
  `graduacio_dret` DECIMAL(4) NULL,
  `montura` ENUM('flotant', 'pasta', 'metalica') NULL,
  `montura_color` VARCHAR(45) NULL,
  `vidre_color` VARCHAR(45) NULL,
  `preu` DECIMAL(5) NULL,
  `proveidor_id` INT NOT NULL,
  PRIMARY KEY (`id_ullera`),
  INDEX `fk_ullera_proveidor1_idx` (`proveidor_id` ASC) VISIBLE,
  CONSTRAINT `fk_ullera_proveidor1`
    FOREIGN KEY (`proveidor_id`)
    REFERENCES `optica`.`proveidor` (`id_proveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`client` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `data_registre` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `recomanador_client_id` INT NULL,
  PRIMARY KEY (`id_client`),
  INDEX `fk_client_client1_idx` (`recomanador_client_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_client1`
    FOREIGN KEY (`recomanador_client_id`)
    REFERENCES `optica`.`client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleat` (
  `id_empleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id_empleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`venda` (
  `data_venda` VARCHAR(45) NOT NULL,
  `client_id` INT NOT NULL,
  `ullera_id` INT NOT NULL,
  `empleat_id` INT NOT NULL,
  PRIMARY KEY (`client_id`, `ullera_id`, `empleat_id`),
  INDEX `fk_ulleres_clients_empleats1_idx` (`empleat_id` ASC) VISIBLE,
  INDEX `fk_venda_client1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_venda_ullera1_idx` (`ullera_id` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_clients_empleats1`
    FOREIGN KEY (`empleat_id`)
    REFERENCES `optica`.`empleat` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `optica`.`client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_ullera1`
    FOREIGN KEY (`ullera_id`)
    REFERENCES `optica`.`ullera` (`id_ullera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
