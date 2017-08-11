-- Design a database schema for food ordering and delivery agency 
-- using the E-R model and design tables accordingly using the relationship model. 
--  ----------------------------------------------------
--  Entites: Restuarant, Customer, Order, Delivery_Person.
--  Strong Entites: Restuarant, Customers.
--  Weak Entites: Order, Delivery_Person.
-- -----------------------------------------------------
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Food_Order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Food_Order
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Food_Order` DEFAULT CHARACTER SET utf8 ;
USE `Food_Order` ;

-- -----------------------------------------------------
-- Table `Food_Order`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Food_Order`.`Customer` ;

CREATE TABLE IF NOT EXISTS `Food_Order`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(90) NOT NULL,
  `phone_num` BIGINT(10) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Food_Order`.`Restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Food_Order`.`Restaurant` ;

CREATE TABLE IF NOT EXISTS `Food_Order`.`Restaurant` (
  `Restaurant_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `address` VARCHAR(90) NOT NULL,
  `phone_num` BIGINT NOT NULL,
  `menu` VARCHAR(200) NULL,
  PRIMARY KEY (`Restaurant_id`),
  UNIQUE INDEX `Restaurant_id_UNIQUE` (`Restaurant_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Food_Order`.`Delivery_Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Food_Order`.`Delivery_Person` ;

CREATE TABLE IF NOT EXISTS `Food_Order`.`Delivery_Person` (
  `delivery_boy_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `available_status` VARCHAR(5) NOT NULL,
  `mobile_num` BIGINT(10) NOT NULL,
  `address` VARCHAR(90) NOT NULL,
  `num_of_del` INT NULL,
  PRIMARY KEY (`delivery_boy_id`),
  UNIQUE INDEX `delivery_boy_id_UNIQUE` (`delivery_boy_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Food_Order`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Food_Order`.`Orders` ;

CREATE TABLE IF NOT EXISTS `Food_Order`.`Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `restaurant_id` INT NOT NULL,
  `delivery_boy_id` INT NOT NULL,
  `order_recv_time` TIMESTAMP NOT NULL,
  `order_del_time` TIME NOT NULL,
  `num_of_items` INT NOT NULL,
  `amount` INT NOT NULL,
  INDEX `fk_Customer_has_Restaurant_Restaurant1_idx` (`restaurant_id` ASC),
  INDEX `fk_Customer_has_Restaurant_Customer_idx` (`customer_id` ASC),
  INDEX `fk_Orders_Delivery_Person1_idx` (`delivery_boy_id` ASC),
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC),
  CONSTRAINT `fk_Customer_has_Restaurant_Customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Food_Order`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_Restaurant_Restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `Food_Order`.`Restaurant` (`Restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery_Person1`
    FOREIGN KEY (`delivery_boy_id`)
    REFERENCES `Food_Order`.`Delivery_Person` (`delivery_boy_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
