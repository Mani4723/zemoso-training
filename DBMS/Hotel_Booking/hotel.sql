--  Question: Design a database schema for a hotel booking agency using the E-R model and design 
--  tables accordingly using the relationship model.
-- ------------------------------------------------------
--  Entites: Hotel, Customer
--  Relational Entity; Hotel_has_Customer.
--  Strong Entities: Hotel, Customer.
--  ----------------------------------------------------- 

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Hotel_Booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hotel_Booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hotel_Booking` DEFAULT CHARACTER SET utf8 ;
USE `Hotel_Booking` ;

-- -----------------------------------------------------
-- Table `Hotel_Booking`.`Hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Hotel_Booking`.`Hotel` ;

CREATE TABLE IF NOT EXISTS `Hotel_Booking`.`Hotel` (
  `hotel_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `contact_number` BIGINT(10) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `address` VARCHAR(90) NOT NULL,
  `num_of_rooms` INT NOT NULL,
  `num_of_avail_rooms` INT NULL,
  `types_of_rooms` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hotel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Booking`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Hotel_Booking`.`Customer` ;

CREATE TABLE IF NOT EXISTS `Hotel_Booking`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `first_time_user` VARCHAR(3) NOT NULL,
  `loyal_customer` VARCHAR(3) NOT NULL,
  `phone_num` BIGINT(10) NOT NULL,
  `address` VARCHAR(45) NULL,
  `ID_proof` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Booking`.`Hotel_has_Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Hotel_Booking`.`Hotel_has_Customer` ;

CREATE TABLE IF NOT EXISTS `Hotel_Booking`.`Hotel_has_Customer` (
  `hotel_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `booked_date` DATETIME NOT NULL,
  `check_In` DATETIME NOT NULL,
  `num_of_days` INT NOT NULL,
  `checkout` TIME NOT NULL,
  INDEX `fk_Hotel_has_Customer_Customer1_idx` (`customer_id` ASC),
  INDEX `fk_Hotel_has_Customer_Hotel_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_Hotel_has_Customer_Hotel`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `Hotel_Booking`.`Hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hotel_has_Customer_Customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Hotel_Booking`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
