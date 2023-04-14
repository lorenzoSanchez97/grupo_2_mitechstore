-- MySQL Script generated by MySQL Workbench
-- Fri Apr 14 15:26:18 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `price` DECIMAL(11,2) NOT NULL,
  `discount` INT NULL DEFAULT 0,
  `highlight` TINYINT NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  `year` INT(4) NOT NULL,
  `size` VARCHAR(100) NOT NULL,
  `weight` VARCHAR(45) NOT NULL,
  `inSale` TINYINT NULL,
  `categories_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_categories1_idx` (`categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `mydb`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NULL DEFAULT 'defaultProduct.png',
  `products_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_images_products_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_images_products`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`features`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`features` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_features_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_features_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`colors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`colors_has_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`colors_has_products` (
  `colors_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`colors_id`, `products_id`),
  INDEX `fk_colors_has_products_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_colors_has_products_colors1_idx` (`colors_id` ASC) VISIBLE,
  CONSTRAINT `fk_colors_has_products_colors1`
    FOREIGN KEY (`colors_id`)
    REFERENCES `mydb`.`colors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_colors_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`userprofile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`userprofile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` TEXT NOT NULL,
  `password` TEXT NOT NULL,
  `phone` TEXT NOT NULL,
  `avatar` TEXT NULL DEFAULT 'defaultUser.jpg',
  `region` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `zip` VARCHAR(45) NOT NULL,
  `address` TEXT NOT NULL,
  `userprofile_id` INT NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_users_userprofile1_idx` (`userprofile_id` ASC) VISIBLE,
  INDEX `fk_users_country1_idx` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_userprofile1`
    FOREIGN KEY (`userprofile_id`)
    REFERENCES `mydb`.`userprofile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `mydb`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
