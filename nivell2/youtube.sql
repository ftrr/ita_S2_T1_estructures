-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;
USE `youtube` ;

-- -----------------------------------------------------
-- Table `youtube`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `birthdate` DATETIME NULL,
  `gender` VARCHAR(2) NULL,
  `country` VARCHAR(45) NULL,
  `postal_code` INT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video_visibility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video_visibility` (
  `id_video_visibility` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_video_visibility`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `id_video` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `description` MEDIUMTEXT NULL,
  `size` INT NULL,
  `file_name` VARCHAR(45) NULL,
  `duration` INT NULL,
  `thumbnail` VARCHAR(45) NULL,
  `plays` INT NULL,
  `likes` INT NULL,
  `dislikes` INT NULL,
  `user_id` INT NOT NULL,
  `date_creation` DATETIME NULL,
  `video_visibility_id` INT NOT NULL,
  PRIMARY KEY (`id_video`),
  INDEX `fk_video_usuari_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_video_video_visibility1_idx` (`video_visibility_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_usuari`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_video_visibility1`
    FOREIGN KEY (`video_visibility_id`)
    REFERENCES `youtube`.`video_visibility` (`id_video_visibility`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`tag` (
  `id_tags` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tags`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video_has_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video_has_tag` (
  `video_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  INDEX `fk_video_has_tag_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_video_has_tag_tag1_idx` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_has_tag_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `youtube`.`tag` (`id_tags`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`channel` (
  `id_channel` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` MEDIUMTEXT NULL,
  `date_creation` DATETIME NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id_channel`),
  INDEX `fk_channel_usuari1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_usuari1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`user_subscribe_channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user_subscribe_channel` (
  `user_id` INT NOT NULL,
  `channel_id` INT NOT NULL,
  INDEX `fk_user_subscribe channel_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_subscribe channel_channel1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_subscribe channel_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_subscribe channel_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `youtube`.`channel` (`id_channel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`rate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`rate` (
  `id_rates` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id_rates`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`user_rate_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user_rate_video` (
  `user_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `rate_id` INT NOT NULL,
  `date` DATETIME NULL,
  INDEX `fk_user_rate_video_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_rate_video_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_user_rate_video_rates1_idx` (`rate_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_rate_video_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_rate_video_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_rate_video_rates1`
    FOREIGN KEY (`rate_id`)
    REFERENCES `youtube`.`rate` (`id_rates`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlist_access`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist_access` (
  `id_playlist` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id_playlist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `date_creation` DATETIME NULL,
  `playlist_access_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX `fk_playlist_playlist_access1_idx` (`playlist_access_id` ASC) VISIBLE,
  INDEX `fk_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_playlist_access1`
    FOREIGN KEY (`playlist_access_id`)
    REFERENCES `youtube`.`playlist_access` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comment` (
  `id_comment` INT NOT NULL AUTO_INCREMENT,
  `comment` MEDIUMTEXT NULL,
  `user_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `date_creation` DATETIME NULL,
  PRIMARY KEY (`id_comment`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_comment_video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`user_rate_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user_rate_comment` (
  `user_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  `rate_id` INT NOT NULL,
  `date_creation` DATETIME NULL,
  INDEX `fk_user_rate_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_rate_comment_comment1_idx` (`comment_id` ASC) VISIBLE,
  INDEX `fk_user_rate_comment_rate1_idx` (`rate_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_rate_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_rate_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `youtube`.`comment` (`id_comment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_rate_comment_rate1`
    FOREIGN KEY (`rate_id`)
    REFERENCES `youtube`.`rate` (`id_rates`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
