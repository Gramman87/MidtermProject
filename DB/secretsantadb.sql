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
  `address_id` INT NULL,
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
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (1, '123 SomeWhere St.', 'Apt. 3', 'Out There', 'Colorado', '12345');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (2, '456 Belter Way', 'Astroid 3', 'Eros Station', 'Eros', '99999');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (3, '789 Slums', 'Street 4', 'Baltimore', 'Maryland', '56565');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (4, '565 Aspen Dr.', NULL, 'New York', 'New York', '54102');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (5, '745 Apple Ct.', NULL, 'Denver', 'Colorado', '12560');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (6, '901 Copper St.', NULL, 'Boulder', 'Colorado', '09812');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (7, '430 Bella Rd.', NULL, 'Fort Collins', 'Colorado', '78990');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (8, '145 Winter Cir.', NULL, 'Colorado Springs', 'Colorado', '12505');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (9, '579 Summer Dr.', NULL, 'Parker', 'Colorado', '51255');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zipcode`) VALUES (10, '754 YouDontWantToLiveHere St.', NULL, 'Skid Row', 'California', '12405');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (1, 'admin@gmail.com', 'admin', '2021-10-10', 'Santa', 'Clause', 1, 1, 'Admin', 'https://images-na.ssl-images-amazon.com/images/I/61meLNRcjnL.jpg');
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (2, 'JamesHolden@gmail.com', 'JamesHolden', '2018-11-01', 'James', 'Holden', 2, 1, 'User', 'https://images-na.ssl-images-amazon.com/images/I/61meLNRcjnL.jpg');
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (3, 'AmosBurton@gmail.com', 'AmosBurton', '2018-12-01', 'Amos', 'Burton', 3, 1, 'User', 'https://images-na.ssl-images-amazon.com/images/I/61meLNRcjnL.jpg');
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (4, 'NaomiNigata@gmail.com', 'NaomiNigata', '2018-12-04', 'Naomi', 'Nigata', 2, 1, 'User', 'https://images-na.ssl-images-amazon.com/images/I/61meLNRcjnL.jpg');
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (5, 'JJ@gmail.com', 'JJpass', '2015-02-04', 'Jay', 'Jamison', 4, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (6, 'EmmyT@gmail.com', 'BestPass', '2015-05-04', 'Emmy', 'Teee', 5, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (7, 'DaneS@gmail.com', 'DanesPass', '2020-05-10', 'Dane', 'S', 6, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (8, 'GrahamA@gmail.com', 'GrahamPass', '2015-05-11', 'Graham', 'A', 7, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (9, 'JordanT@gmail.com', 'JordanPass', '2015-05-12', 'Jordan', 'T', 8, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (10, 'JackH@gmail.com', 'JackPass', '2015-05-13', 'Jack', 'H', 9, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (11, 'JoeM@gmail.com', 'JoePass', '2015-05-14', 'Joe', 'Mix', 10, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (12, 'JimL@gmail.com', 'JimPass', '2015-05-15', 'Jim', 'Lix', 10, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (13, 'LauraL@gmail.com', 'LauraPass', '2015-05-16', 'Laura', 'Lutz', 9, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (14, 'MaryH@gmail.com', 'MaryPass', '2015-05-17', 'Mary', 'Higs', 8, 1, 'User', NULL);
INSERT INTO `user` (`id`, `email`, `password`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`, `role`, `profile_image_url`) VALUES (15, 'FredJ@gmail.com', 'FredPass', '2015-05-18', 'Fred', 'Johnson', 7, 1, 'User', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wishlist_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (1, 'Tech', 70, 1, 'https://m.media-amazon.com/images/I/61MPy3uLBNL._AC_UL1400_.jpg', 'Techy tech');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (2, 'MagBoots', 1000, 2, 'https://m.media-amazon.com/images/I/61MPy3uLBNL._AC_UL1400_.jpg', 'Keeps my feet to the ground');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (3, 'Food', 2, 3, 'https://m.media-amazon.com/images/I/61MPy3uLBNL._AC_UL1400_.jpg', 'Food please');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (4, 'Socks', 20, 1, NULL, 'Warmness');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (5, 'Baseball Glove', 40, 2, NULL, 'To catch baseballs');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (6, 'Sun Glasses', 100, 1, NULL, 'Sunnyday + northpole snow = my eyes hurt');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (7, 'Pillow', 50, 4, NULL, 'Better pillow');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (8, 'Phone', 600, 5, NULL, 'Better new phone');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (9, 'TV', 1000, 6, NULL, '4K is beautiful');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (10, 'Pineapple', 5, 7, NULL, 'Heard about Pluto?');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (11, 'Sleeping Bag', 150, 8, NULL, 'New Camping equipment');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (12, 'Water Bottle', 40, 9, NULL, 'Insolated fo sho');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (13, 'Snowboard', 400, 10, NULL, 'Shred some gnar');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (14, 'Headphones', 80, 11, NULL, 'Something to listen with');
INSERT INTO `wishlist_item` (`id`, `name`, `cost`, `user_id`, `shopping_url`, `description`) VALUES (15, 'Car', 15000, 12, NULL, 'Who actually buys a car for chirstmas??');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `event_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Secret Santa', 'Anonymously give a gift to a randomly assigned member from your group. Be sure to checkout that persons wishlist and see what items they want. When its time for the event, everyone puts their wrapped gifts at a designated spot and opens their gift. After opening their gift, try to guess who your secret Santa was! If conducted virtually, your recipients address can be found here on the website. ', 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg');
INSERT INTO `event_type` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Pot Luck', 'Coordinate with your group about the details of your potluck. Including location, what you’re bringing, and leave comments for each other about anything Pot Luck related!', 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg');
INSERT INTO `event_type` (`id`, `name`, `description`, `image_url`) VALUES (3, 'White Elephant', 'Everyone playing brings a gift and puts it in the middle of the table. The order of picking is randomly assigned to each participant. The first person must pick a gift from the middle and open it. Everyone after has the option of stealing an open gift or picking a new gift to open. A gift cannot have more than 2 steals, after which it is safe with whoever stole it last. Continue opening until all gifts are open.', 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exchange_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `exchange_event` (`id`, `custom_rules`, `address_id`, `begins_on`, `price_min`, `price_max`, `owner_id`, `complete`, `event_type_id`, `title`, `image_url`, `last_update`, `rsvp_by`, `create_date`) VALUES (1, 'Take a drink everytime politics are mentioned', 1, '2021-12-24T01:01:01', 25.00, 75.00, 1, 0, 1, 'Secret Santa Test', 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg', '2021-12-11T01:01:01', '2021-12-20T01:01:01', '2021-12-01T01:01:01');
INSERT INTO `exchange_event` (`id`, `custom_rules`, `address_id`, `begins_on`, `price_min`, `price_max`, `owner_id`, `complete`, `event_type_id`, `title`, `image_url`, `last_update`, `rsvp_by`, `create_date`) VALUES (2, 'Nah', 2, '2021-12-24T01:01:01', 1, 1000, 2, 0, 3, 'Rocinante White Elephant', 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg', '2021-11-11T01:01:01', '2021-12-13T01:01:01', '2021-12-11T01:01:01');
INSERT INTO `exchange_event` (`id`, `custom_rules`, `address_id`, `begins_on`, `price_min`, `price_max`, `owner_id`, `complete`, `event_type_id`, `title`, `image_url`, `last_update`, `rsvp_by`, `create_date`) VALUES (3, 'Only rule, there ARE no rules', 3, '2021-12-24T01:01:01', 10, 15, 3, 1, 2, 'Potluck event', 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg', '2021-10-11T01:01:01', '2021-12-11T01:01:01', '2021-12-11T01:01:01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_exchange`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (1, 1, 2, 1, 'yo yo yo cant wait', '2021-12-11T01:01:01');
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (2, 2, 3, 1, 'Meet yall on the Rocinante', '2020-09-11T01:01:01');
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (3, 3, 1, 1, 'Yupppppp', '2020-09-10T01:01:01');
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (1, 2, 1, 1, 'Very excite', '2020-10-10T01:01:01');
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (1, 3, 3, 1, 'Youll never guess', '2020-08-10T01:01:01');
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (2, 4, 2, 1, 'Something clever', '2019-08-10T01:01:01');
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (2, 5, 4, 1, 'Running low on ideas', '2018-08-10T01:01:01');
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (2, 3, 5, 1, 'But thats okay', '2020-08-11T01:01:01');
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (3, 1, 8, 1, 'We are almost done', '2020-08-20T01:01:01');
INSERT INTO `user_exchange` (`event_id`, `user_id`, `giftee_id`, `attending`, `comment`, `date_invited`) VALUES (3, 8, 3, 1, 'Last sample comment', '2020-08-25T01:01:01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exchange_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `exchange_item` (`id`, `event_id`, `user_id`, `title`, `description`, `url`, `is_visible`) VALUES (1, 1, 1, 'Best Gift', 'The bestest gift you could ask for', 'https://memegenerator.net/img/instances/80456411.jpg', 1);
INSERT INTO `exchange_item` (`id`, `event_id`, `user_id`, `title`, `description`, `url`, `is_visible`) VALUES (2, 2, 2, 'Food gift', 'Yummy food', 'https://memegenerator.net/img/instances/80456411.jpg', 1);
INSERT INTO `exchange_item` (`id`, `event_id`, `user_id`, `title`, `description`, `url`, `is_visible`) VALUES (3, 3, 3, 'white elephant gift', 'MagLock boots', 'https://memegenerator.net/img/instances/80456411.jpg', 0);
INSERT INTO `exchange_item` (`id`, `event_id`, `user_id`, `title`, `description`, `url`, `is_visible`) VALUES (4, 1, 2, 'Something good', 'Youre going to like this one', 'https://memegenerator.net/img/instances/80456411.jpg', 1);
INSERT INTO `exchange_item` (`id`, `event_id`, `user_id`, `title`, `description`, `url`, `is_visible`) VALUES (5, 1, 3, 'Something better', 'Even better than that other guys gift', 'https://memegenerator.net/img/instances/80456411.jpg', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `event_comment` (`id`, `content`, `posted_on`, `reply_to`, `event_id`, `user_id`) VALUES (1, 'This will be THE event of the year', '2021-12-11T01:01:01', 1, 1, 1);
INSERT INTO `event_comment` (`id`, `content`, `posted_on`, `reply_to`, `event_id`, `user_id`) VALUES (2, 'Something about protomolecule', '2020-09-11T01:01:01', 2, 2, 2);
INSERT INTO `event_comment` (`id`, `content`, `posted_on`, `reply_to`, `event_id`, `user_id`) VALUES (3, 'Idk, something clever', '2020-09-16T01:01:01', 3, 3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `item_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `secretsantadb`;
INSERT INTO `item_comment` (`id`, `content`, `posted_on`, `exchange_item_id`, `user_id`, `image_url`) VALUES (1, 'Wow, this is the best gift for sure', '2021-12-11T01:01:01', 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg');
INSERT INTO `item_comment` (`id`, `content`, `posted_on`, `exchange_item_id`, `user_id`, `image_url`) VALUES (2, 'Bomb food', '2021-12-10T01:01:01', 2, 2, 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg');
INSERT INTO `item_comment` (`id`, `content`, `posted_on`, `exchange_item_id`, `user_id`, `image_url`) VALUES (3, 'Nice boots', '2021-12-09T01:01:01', 3, 3, 'https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg');

COMMIT;

