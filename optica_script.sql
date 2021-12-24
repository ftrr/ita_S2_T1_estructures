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
-- Table `optica`.`proveidors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveidors` (
  `id_proveidors` INT NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id_proveidors`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `id_ulleres` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `graduacio_esq` DECIMAL(4) NULL,
  `graduacio_dret` DECIMAL(4) NULL,
  `montura` VARCHAR(45) NULL,
  `montura_color` VARCHAR(45) NULL,
  `vidre_color` VARCHAR(45) NULL,
  `preu` DECIMAL(5) NULL,
  `id_proveidors` INT NOT NULL,
  PRIMARY KEY (`id_ulleres`, `id_proveidors`),
  INDEX `fk_ulleres_proveidors1_idx` (`id_proveidors` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_proveidors1`
    FOREIGN KEY (`id_proveidors`)
    REFERENCES `optica`.`proveidors` (`id_proveidors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`clients` (
  `id_clients` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `data_registre` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `data_venda` VARCHAR(45) NULL,
  `recomanador_client_id` INT NULL,
  PRIMARY KEY (`id_clients`),
  INDEX `fk_clients_clients1_idx` (`recomanador_client_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_clients1`
    FOREIGN KEY (`recomanador_client_id`)
    REFERENCES `optica`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`ulleres_clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres_clients` (
  `id_ulleres` INT NULL,
  `id_clients` INT NOT NULL,
  PRIMARY KEY (`id_ulleres`, `id_clients`),
  INDEX `fk_table1_clients1_idx` (`id_clients` ASC) VISIBLE,
  CONSTRAINT `fk_table1_ulleres1`
    FOREIGN KEY (`id_ulleres` , `id_clients`)
    REFERENCES `optica`.`ulleres` (`id_ulleres` , `id_ulleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_clients1`
    FOREIGN KEY (`id_clients`)
    REFERENCES `optica`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleats` (
  `id_empleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id_empleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleats_clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleats_clients` (
  `id_empleat` INT NULL,
  `id_clients` INT NOT NULL,
  PRIMARY KEY (`id_empleat`, `id_clients`),
  INDEX `fk_empleats_clients_clients1_idx` (`id_clients` ASC) VISIBLE,
  CONSTRAINT `fk_empleats_clients_empleats1`
    FOREIGN KEY (`id_empleat`)
    REFERENCES `optica`.`empleats` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleats_clients_clients1`
    FOREIGN KEY (`id_clients`)
    REFERENCES `optica`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
