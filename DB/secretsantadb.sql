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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_date` DATETIME NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `profile_image_url` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `shopping_url` VARCHAR(3000) NULL,
  `description` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wishlist_item_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_wishlist_item_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_type` ;

CREATE TABLE IF NOT EXISTS `event_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exchange_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exchange_event` ;

CREATE TABLE IF NOT EXISTS `exchange_event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `custom_rules` TEXT NULL,
  `address_id` INT NULL,
  `begins_on` DATETIME NULL,
  `price_min` DOUBLE NULL,
  `price_max` DOUBLE NULL,
  `owner_id` INT NOT NULL,
  `complete` TINYINT NULL,
  `event_type_id` INT NOT NULL,
  `title` VARCHAR(200) NULL,
  `image_url` VARCHAR(3000) NULL,
  `last_update` DATETIME NULL,
  `rsvp_by` DATE NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exchange_address1_idx` (`address_id` ASC),
  INDEX `fk_exchange_user1_idx` (`owner_id` ASC),
  INDEX `fk_exchange_event_event_type1_idx` (`event_type_id` ASC),
  CONSTRAINT `fk_exchange_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exchange_user1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exchange_event_event_type1`
    FOREIGN KEY (`event_type_id`)
    REFERENCES `event_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_exchange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_exchange` ;

CREATE TABLE IF NOT EXISTS `user_exchange` (
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `giftee_id` INT NULL,
  `attending` TINYINT NULL,
  `comment` TEXT NULL,
  `date_invited` DATETIME NULL,
  PRIMARY KEY (`event_id`, `user_id`),
  INDEX `fk_exchange_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_exchange_has_user_exchange1_idx` (`event_id` ASC),
  INDEX `fk_user_exchange_user1_idx` (`giftee_id` ASC),
  CONSTRAINT `fk_exchange_has_user_exchange1`
    FOREIGN KEY (`event_id`)
    REFERENCES `exchange_event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exchange_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_exchange_user1`
    FOREIGN KEY (`giftee_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exchange_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exchange_item` ;

CREATE TABLE IF NOT EXISTS `exchange_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `url` VARCHAR(3000) NULL,
  `is_visible` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exchange_item_user_exchange1_idx` (`event_id` ASC, `user_id` ASC),
  CONSTRAINT `fk_exchange_item_user_exchange1`
    FOREIGN KEY (`event_id` , `user_id`)
    REFERENCES `user_exchange` (`event_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_friend` ;

CREATE TABLE IF NOT EXISTS `user_friend` (
  `user_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `friend_id`),
  INDEX `fk_user_has_user_user2_idx` (`friend_id` ASC),
  INDEX `fk_user_has_user_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`friend_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_comment` ;

CREATE TABLE IF NOT EXISTS `event_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `posted_on` DATETIME NULL,
  `reply_to` INT NULL,
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_comment_event_comment1_idx` (`reply_to` ASC),
  INDEX `fk_event_comment_user_exchange1_idx` (`event_id` ASC, `user_id` ASC),
  CONSTRAINT `fk_event_comment_event_comment1`
    FOREIGN KEY (`reply_to`)
    REFERENCES `event_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_comment_user_exchange1`
    FOREIGN KEY (`event_id` , `user_id`)
    REFERENCES `user_exchange` (`event_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_comment` ;

CREATE TABLE IF NOT EXISTS `item_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `posted_on` DATETIME NULL,
  `exchange_item_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `image_url` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exchange_item_comment_exchange_item1_idx` (`exchange_item_id` ASC),
  INDEX `fk_item_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_exchange_item_comment_exchange_item1`
    FOREIGN KEY (`exchange_item_id`)
    REFERENCES `exchange_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
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
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (1, '123 SomeWhere St.', 'Apt. 3', 'Out There', 'CO', '12345');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (1, 'admin@gmail.com', 'admin', '2021-10-10', 'Santa', 'Clause', 1, 1, 'Gifter', 'https://images-na.ssl-images-amazon.com/images/I/61meLNRcjnL.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `wishlist_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (1, 'Tech', 70, 1, 'https://m.media-amazon.com/images/I/61MPy3uLBNL._AC_UL1400_.jpg', 'Techy tech');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `event_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Secret Santa Test', 'Mic check 123', 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exchange_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `exchange_event` (`id`, `custom_rules`, `address_id`, `begins_on`, `price_min`, `price_max`, `owner_id`, `complete`, `event_type_id`, `title`, `image_url`, `last_update`, `rsvp_by`, `create_date`) VALUES (1, 'Take a drink everytime politics are mentioned', 1, '2021-12-24T01:01:01', 25.00, 75.00, 1, 0, 1, 'Secret Santa Test', 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg', '2021-12-11T01:01:01', '2021-12-20T01:01:01', '2021-12-01T01:01:01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_exchange`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (1, 1, NULL, 1, 'yo yo yo cant wait', '2021-12-11T01:01:01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exchange_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `exchange_item` (`id`, `event_id`, `user_id`, `title`, `description`, `url`, `is_visible`) VALUES (1, 1, 1, 'Best Gift', 'The bestest gift you could ask for', 'https://memegenerator.net/img/instances/80456411.jpg', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `event_comment` (`id`, `content`, `posted_on`, `reply_to`, `event_id`, `user_id`) VALUES (1, 'This will be THE event of the year', '2021-12-11T01:01:01', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `item_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `item_comment` (`id`, `content`, `posted_on`, `exchange_item_id`, `user_id`, `image_url`) VALUES (1, 'Wow, this is the best gift for sure', '2021-12-11T01:01:01', 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg');

COMMIT;

