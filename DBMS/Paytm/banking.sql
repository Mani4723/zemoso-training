--  @Question: Design a database schema for a banking app using the E-R model and design tables 
--  accordingly using the relationship model.
--  -----------------------------------------------------
--  Entites: Accounts, Branches, Customers.
--  Strong Entity: Customres, Branches.
--  Weak Entity: Accounts.

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Paytm` DEFAULT CHARACTER SET utf8 ;
USE `Paytm` ;

-- -----------------------------------------------------
-- Table `Paytm`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Paytm`.`Customers` ;

CREATE TABLE IF NOT EXISTS `Paytm`.`Customers` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `phone_num` BIGINT(10) NOT NULL,
  `email_id` VARCHAR(30) NOT NULL,
  `address` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Paytm`.`Accounts` ;

CREATE TABLE IF NOT EXISTS `Paytm`.`Accounts` (
  `account_id` INT NOT NULL AUTO_INCREMENT,
  `acc_num` BIGINT NOT NULL,
  `balance` BIGINT(6) NULL,
  `last_trans_details` VARCHAR(45) NULL,
  `last_updated` TIMESTAMP NOT NULL,
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Branches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Paytm`.`Branches` ;

CREATE TABLE IF NOT EXISTS `Paytm`.`Branches` (
  `branch_id` INT NOT NULL,
  `branch_name` VARCHAR(25) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_num` BIGINT(10) NOT NULL,
  PRIMARY KEY (`branch_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Customers_Accounts_Branches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Paytm`.`Customers_Accounts_Branches` ;

CREATE TABLE IF NOT EXISTS `Paytm`.`Customers_Accounts_Branches` (
  `customer_id` INT NOT NULL,
  `branch_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  INDEX `fk_Customers_Branches_Branches1_idx` (`branch_id` ASC),
  INDEX `fk_Customers_Branches_Customers_idx` (`customer_id` ASC),
  INDEX `fk_Customers_Branches_Accounts1_idx` (`account_id` ASC),
  CONSTRAINT `fk_Customers_has_Branches_Customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Paytm`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customers_has_Branches_Branches1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `Paytm`.`Branches` (`branch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customers_has_Branches_Accounts1`
    FOREIGN KEY (`account_id`)
    REFERENCES `Paytm`.`Accounts` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
