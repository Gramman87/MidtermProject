-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema secretsantadb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `secretsantadb` ;

-- -----------------------------------------------------
-- Schema secretsantadb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `secretsantadb` DEFAULT CHARACTER SET utf8 ;
USE `secretsantadb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wishlist_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wishlist_category` ;

CREATE TABLE IF NOT EXISTS `wishlist_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wishlist_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wishlist_item` ;

CREATE TABLE IF NOT EXISTS `wishlist_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `cost` DOUBLE NULL,
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wishlist_item_user_idx` (`user_id` ASC),
  INDEX `fk_wishlist_item_wishlist_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_wishlist_item_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wishlist_item_wishlist_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `wishlist_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street1` VARCHAR(120) NULL,
  `street2` VARCHAR(120) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zipcode` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exchange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exchange` ;

CREATE TABLE IF NOT EXISTS `exchange` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('SECRET_SANTA', 'WHITE_ELEPHANT', 'POTLUCK', 'CUSTOM') NOT NULL,
  `custom_rules` TEXT NULL,
  `address_id` INT NOT NULL,
  `end_date` DATETIME NULL,
  `price_min` DOUBLE NULL,
  `price_max` DOUBLE NULL,
  `owner_id` INT NOT NULL,
  `status` ENUM('ACTIVE', 'PENDING', 'COMPLETE') NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exchange_address1_idx` (`address_id` ASC),
  INDEX `fk_exchange_user1_idx` (`owner_id` ASC),
  CONSTRAINT `fk_exchange_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exchange_user1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_exchange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_exchange` ;

CREATE TABLE IF NOT EXISTS `user_exchange` (
  `exchange_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`exchange_id`, `user_id`),
  INDEX `fk_exchange_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_exchange_has_user_exchange1_idx` (`exchange_id` ASC),
  CONSTRAINT `fk_exchange_has_user_exchange1`
    FOREIGN KEY (`exchange_id`)
    REFERENCES `exchange` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exchange_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `secret_santa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `secret_santa` ;

CREATE TABLE IF NOT EXISTS `secret_santa` (
  `santa_id` INT NOT NULL,
  `giftee_id` INT NOT NULL,
  `exchange_id` INT NOT NULL,
  PRIMARY KEY (`santa_id`, `giftee_id`, `exchange_id`),
  INDEX `fk_user_has_user_user2_idx` (`giftee_id` ASC),
  INDEX `fk_user_has_user_user1_idx` (`santa_id` ASC),
  INDEX `fk_secret_santa_exchange1_idx` (`exchange_id` ASC),
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`santa_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`giftee_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_secret_santa_exchange1`
    FOREIGN KEY (`exchange_id`)
    REFERENCES `exchange` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS secretsantauser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'secretsantauser'@'localhost' IDENTIFIED BY 'secretsantauser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'secretsantauser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `user` (`id`, `email`, `password`, `create_time`, `first_name`, `last_name`, `enabled`, `role`) VALUES (1, 'admin@gmail.com', 'admin', NULL, NULL, NULL, 1, NULL);

COMMIT;

