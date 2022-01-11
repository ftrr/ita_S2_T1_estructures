-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;
USE `spotify` ;

-- -----------------------------------------------------
-- Table `spotify`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATETIME NULL,
  `gender` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `date_subscribtion` DATETIME NULL,
  `date_renovation` DATETIME NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`payment` (
  `id_payment` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `date` DATETIME NULL,
  `order` VARCHAR(45) NULL,
  `total` INT NULL,
  `credit_card_num` INT NULL,
  `credit_card_cvv` INT NULL,
  `credit_card_caducity` VARCHAR(45) NULL,
  `paypal_user` VARCHAR(45) NULL,
  PRIMARY KEY (`id_payment`),
  UNIQUE INDEX `order_UNIQUE` (`order` ASC) VISIBLE,
  INDEX `fk_payment_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`id_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `total_songs` INT NULL,
  `date_creation` DATETIME NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX `fk_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`id_user`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artist` (
  `id_artist` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `picture` VARCHAR(45) NULL,
  PRIMARY KEY (`id_artist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `year` INT NULL,
  `image` VARCHAR(45) NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`id_album`),
  INDEX `fk_album_artista1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artist` (`id_artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`song` (
  `id_song` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `duration` INT NULL,
  `total_plays` INT NULL,
  `album_id` INT NULL,
  PRIMARY KEY (`id_song`),
  INDEX `fk_song_album1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_song_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `spotify`.`album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`user_edit_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user_edit_playlist` (
  `playlist_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  INDEX `fk_user_edit_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_edit_playlist_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  PRIMARY KEY (`playlist_id`, `song_id`),
  INDEX `fk_user_edit_playlist_song1_idx` (`song_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_edit_playlist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`id_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_edit_playlist_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_edit_playlist_song1`
    FOREIGN KEY (`song_id`)
    REFERENCES `spotify`.`song` (`id_song`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist_deleted`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist_deleted` (
  `playlist_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `total_songs` INT NULL,
  `date_creation` DATETIME NULL,
  `date_deleted` DATETIME NULL,
  `user_id` INT NOT NULL,
  INDEX `fk_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`playlist_id`),
  CONSTRAINT `fk_playlist_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`id_user`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_deleted_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist_deleted`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist_deleted` (
  `playlist_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `total_songs` INT NULL,
  `date_creation` DATETIME NULL,
  `date_deleted` DATETIME NULL,
  `user_id` INT NOT NULL,
  INDEX `fk_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`playlist_id`),
  CONSTRAINT `fk_playlist_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`id_user`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_deleted_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`user_likes_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user_likes_song` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  INDEX `fk_user_likes_song_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_likes_song_song1_idx` (`song_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`, `song_id`),
  CONSTRAINT `fk_user_likes_song_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_likes_song_song1`
    FOREIGN KEY (`song_id`)
    REFERENCES `spotify`.`song` (`id_song`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`user_likes_album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user_likes_album` (
  `user_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  INDEX `fk_user_likes_album_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_likes_album_album1_idx` (`album_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`, `album_id`),
  CONSTRAINT `fk_user_likes_album_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`id_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_likes_album_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `spotify`.`album` (`id_album`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`user_follows_artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user_follows_artist` (
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artist_id`),
  INDEX `fk_user_follows_artist_artista1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_follows_artist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_follows_artist_artista1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artist` (`id_artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artist_relationships`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artist_relationships` (
  `artist_id` INT NOT NULL,
  `related_id` INT NOT NULL,
  INDEX `fk_artist_relates_artist_artist1_idx` (`artist_id` ASC) VISIBLE,
  INDEX `fk_artist_relates_artist_artist2_idx` (`related_id` ASC) VISIBLE,
  PRIMARY KEY (`artist_id`, `related_id`),
  CONSTRAINT `fk_artist_relates_artist_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artist` (`id_artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artist_relates_artist_artist2`
    FOREIGN KEY (`related_id`)
    REFERENCES `spotify`.`artist` (`id_artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
