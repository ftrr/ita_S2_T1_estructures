-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`provincies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`provincies` (
  `idprovincies` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idprovincies`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`localitats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`localitats` (
  `id_localitats` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `provincia_id` INT NOT NULL,
  PRIMARY KEY (`id_localitats`, `provincia_id`),
  INDEX `fk_localitats_provincies1_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_localitats_provincies1`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `pizzeria`.`provincies` (`idprovincies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`clients` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `cognom1` VARCHAR(45) NULL,
  `cognom2` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `cp` INT NULL,
  `telefon` INT NULL,
  `localitat_id` INT NULL,
  PRIMARY KEY (`id_client`),
  INDEX `fk_clients_localitats1_idx` (`localitat_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_localitats1`
    FOREIGN KEY (`localitat_id`)
    REFERENCES `pizzeria`.`localitats` (`id_localitats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`botigues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`botigues` (
  `id_botiga` INT NOT NULL AUTO_INCREMENT,
  `adreça` VARCHAR(45) NULL,
  `cp` INT NULL,
  `localitat_id` INT NOT NULL,
  PRIMARY KEY (`id_botiga`, `localitat_id`),
  INDEX `fk_botigues_localitats1_idx` (`localitat_id` ASC) VISIBLE,
  CONSTRAINT `fk_botigues_localitats1`
    FOREIGN KEY (`localitat_id`)
    REFERENCES `pizzeria`.`localitats` (`id_localitats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleats` (
  `id_empleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) CHARACTER SET 'utf8' NULL,
  `cognom1` VARCHAR(45) CHARACTER SET 'utf8' NULL,
  `cognom2` VARCHAR(45) CHARACTER SET 'utf8' NULL,
  `nif` VARCHAR(45) CHARACTER SET 'utf8' NULL,
  `telefon` INT NULL,
  `botiga_id` INT NOT NULL,
  `tipus_empleat` ENUM('repartidor', 'cuiner') NULL,
  PRIMARY KEY (`id_empleat`, `botiga_id`),
  INDEX `fk_empleats_botigues1_idx` (`botiga_id` ASC) VISIBLE,
  UNIQUE INDEX `telefon_UNIQUE` (`telefon` ASC) VISIBLE,
  CONSTRAINT `fk_empleats_botigues1`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `pizzeria`.`botigues` (`id_botiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comandes` (
  `id_comandes` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NULL,
  `hora` TIMESTAMP(4) NULL,
  `preu` VARCHAR(45) NULL,
  `tipus_comanda` ENUM('domicili', 'botiga') NOT NULL,
  `client_id` INT NOT NULL,
  `botiga_id` INT NOT NULL,
  `empleat_id` INT NULL,
  `lliurament` DATETIME NULL,
  PRIMARY KEY (`id_comandes`, `client_id`, `botiga_id`),
  INDEX `fk_comandes_clients1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_comandes_botigues1_idx` (`botiga_id` ASC) VISIBLE,
  INDEX `fk_comandes_empleats1_idx` (`empleat_id` ASC) VISIBLE,
  CONSTRAINT `fk_comandes_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `pizzeria`.`clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comandes_botigues1`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `pizzeria`.`botigues` (`id_botiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comandes_empleats1`
    FOREIGN KEY (`empleat_id`)
    REFERENCES `pizzeria`.`empleats` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`categoria_producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria_producte` (
  `id_categoria_producte` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id_categoria_producte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`productes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`productes` (
  `id_productes` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `descripcio` VARCHAR(45) NULL,
  `foto` VARCHAR(45) NULL,
  `preu` VARCHAR(45) NULL,
  `categoria_producte_id` INT NULL,
  `tipus_producte` ENUM('hamburguesa', 'pizza', 'beguda') NULL,
  PRIMARY KEY (`id_productes`),
  INDEX `fk_productes_categoria_producte1_idx` (`categoria_producte_id` ASC) VISIBLE,
  CONSTRAINT `fk_productes_categoria_producte1`
    FOREIGN KEY (`categoria_producte_id`)
    REFERENCES `pizzeria`.`categoria_producte` (`id_categoria_producte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`comanda_te_producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda_te_producte` (
  `comanda_id` INT NOT NULL,
  `producte_id` INT NOT NULL,
  `quantitat` INT NOT NULL,
  PRIMARY KEY (`comanda_id`, `producte_id`),
  INDEX `fk_comanda_te_producte_productes1_idx` (`producte_id` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_te_producte_comandes1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `pizzeria`.`comandes` (`id_comandes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_te_producte_productes1`
    FOREIGN KEY (`producte_id`)
    REFERENCES `pizzeria`.`productes` (`id_productes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
