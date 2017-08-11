-- Design a database schema for a cab rental agency using the E-R model and design 
-- tables accordingly using the relationship model.
-- -----------------------------------------------------
-- Entites: Customers, Cabs, Driver
-- Relational Entites: Cabs_Customers, Driver_Cabs
-- -----------------------------------------------------
-- Strong Entity: Customers, Cabs
-- Weak Entity: Cabs, Because each cab must have a driver. So cabs depend on Drivers.


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Cab_Rental
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cab_Rental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cab_Rental` DEFAULT CHARACTER SET utf8 ;
USE `Cab_Rental` ;

-- -----------------------------------------------------
-- Table `Cab_Rental`.`Cabs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cab_Rental`.`Cabs` ;

CREATE TABLE IF NOT EXISTS `Cab_Rental`.`Cabs` (
  `cab_id` INT NOT NULL,
  `car_Number` NVARCHAR(15) NOT NULL,
  `type` VARCHAR(45) NULL,
  `num_of_seats` INT NOT NULL,
  PRIMARY KEY (`cab_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cab_Rental`.`Driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cab_Rental`.`Driver` ;

CREATE TABLE IF NOT EXISTS `Cab_Rental`.`Driver` (
  `driver_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `age` INT NULL,
  `driving_lic_id` VARCHAR(45) NOT NULL,
  `phone` BIGINT(10) NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`driver_id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
  UNIQUE INDEX `driving_lic_id_UNIQUE` (`driving_lic_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cab_Rental`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cab_Rental`.`Customers` ;

CREATE TABLE IF NOT EXISTS `Cab_Rental`.`Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(10) NULL,
  `phone_num` BIGINT(10) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `Customer_id_UNIQUE` (`customer_id` ASC),
  UNIQUE INDEX `phone_num_UNIQUE` (`phone_num` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cab_Rental`.`Driver_Cabs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cab_Rental`.`Driver_Cabs` ;

CREATE TABLE IF NOT EXISTS `Cab_Rental`.`Driver_Cabs` (
  `driver_id` INT NOT NULL,
  `cabs_id` INT NOT NULL,
  `assinged_date` DATE NOT NULL,
  INDEX `fk_Driver_has_Cabs_Cabs1_idx` (`cabs_id` ASC),
  INDEX `fk_Driver_has_Cabs_Driver_idx` (`driver_id` ASC),
  CONSTRAINT `fk_Driver_has_Cabs_Driver`
    FOREIGN KEY (`driver_id`)
    REFERENCES `Cab_Rental`.`Driver` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Driver_has_Cabs_Cabs1`
    FOREIGN KEY (`cabs_id`)
    REFERENCES `Cab_Rental`.`Cabs` (`cab_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cab_Rental`.`Cabs_Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cab_Rental`.`Cabs_Customers` ;

CREATE TABLE IF NOT EXISTS `Cab_Rental`.`Cabs_Customers` (
  `cabs_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `num_of_seats_occupied` VARCHAR(45) NOT NULL,
  `start_time` TIMESTAMP NOT NULL,
  `end_time` TIMESTAMP NOT NULL,
  INDEX `fk_Cabs_has_Customers_Customers1_idx` (`customer_id` ASC),
  INDEX `fk_Cabs_has_Customers_Cabs1_idx` (`cabs_id` ASC),
  UNIQUE INDEX `cabs_id_UNIQUE` (`cabs_id` ASC),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC),
  CONSTRAINT `fk_Cabs_has_Customers_Cabs1`
    FOREIGN KEY (`cabs_id`)
    REFERENCES `Cab_Rental`.`Cabs` (`cab_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cabs_has_Customers_Customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Cab_Rental`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
