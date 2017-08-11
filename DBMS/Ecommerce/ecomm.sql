--  @Question: Design a database schema for an e-commerce app using the E-R model and design 
--  tables accordingly using the relationship model.
--  ---------------------------------------------------
--  Entites: Suppliers, Customers, Items, Orders. 
--  Relational tables: Suppliers-Items, Customers-Orders, Orders-Items.
--  ---------------------------------------------------
--  Strong Entity: Suppliers, Customers
--  Weak Entity: Orders, Items.
-- ----------------------------------------------------
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `Ecommerce` ;

-- -----------------------------------------------------
-- Table `Ecommerce`.`Suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Suppliers` (
  `supplier_id` INT NOT NULL AUTO_INCREMENT,
  `supp_name` VARCHAR(45) NOT NULL,
  `contact_num` BIGINT(10) NOT NULL,
  `address` VARCHAR(90) NOT NULL,
  `item_category` VARCHAR(45) NOT NULL,
  `num_of_items` VARCHAR(45) NOT NULL,
  `last_updated` TIMESTAMP NOT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(20) NOT NULL,
  `item_category` VARCHAR(45) NOT NULL,
  `brand_name` VARCHAR(20) NOT NULL,
  `cost` INT NOT NULL,
  `last_updated` TIMESTAMP NOT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Orders` (
  `order_id` INT NOT NULL,
  `num_of_items` INT NOT NULL,
  `total_amount` BIGINT(6) NOT NULL,
  `last_updated` TIMESTAMP NOT NULL,
  `order_recv_time` TIME NOT NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Customers` (
  `customer_jd` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `phone_num` BIGINT(10) NOT NULL,
  `address` VARCHAR(90) NOT NULL,
  `email_id` VARCHAR(45) NOT NULL,
  `last_updated` TIMESTAMP NOT NULL,
  PRIMARY KEY (`customer_jd`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Suppliers_Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Suppliers_Items` (
  `supplier_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  `last_updated` TIMESTAMP NOT NULL,
  INDEX `fk_Suppliers_Items_Items1_idx` (`item_id` ASC),
  INDEX `fk_Suppliers_Items_Suppliers_idx` (`supplier_id` ASC),
  CONSTRAINT `fk_Suppliers_has_Items_Suppliers`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `Ecommerce`.`Suppliers` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Suppliers_has_Items_Items1`
    FOREIGN KEY (`item_id`)
    REFERENCES `Ecommerce`.`Items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Customers_Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Customers_Orders` (
  `customer_jd` INT NOT NULL,
  `order_id` INT NOT NULL,
  `order_recv_date` DATE NOT NULL,
  `delivery_date` DATE NOT NULL,
  INDEX `fk_Customers_Orders_Orders1_idx` (`order_id` ASC),
  INDEX `fk_Customers_Orders_Customers1_idx` (`customer_jd` ASC),
  CONSTRAINT `fk_Customers_has_Orders_Customers1`
    FOREIGN KEY (`customer_jd`)
    REFERENCES `Ecommerce`.`Customers` (`customer_jd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customers_has_Orders_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `Ecommerce`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Orders_Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Orders_Items` (
  `order_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  `num_of_items` INT NOT NULL,
  INDEX `fk_Orders_Items_Items1_idx` (`item_id` ASC),
  INDEX `fk_Orders_Items_Orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_Orders_has_Items_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `Ecommerce`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_has_Items_Items1`
    FOREIGN KEY (`item_id`)
    REFERENCES `Ecommerce`.`Items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
