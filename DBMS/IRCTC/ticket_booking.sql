-- Design a database schema for railway ticket booking using the E-R model and design tables 
-- accordingly using the relationship model
--  Entities: Customer, Train, Ticket.
--  Relational Entites: Resv_Train_Ticket, Unrsev_Ticket_Customer.
--  Strong Entity: Customer, Train
--  Weak Entity: Ticket. 

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Ticket_Booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ticket_Booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ticket_Booking` DEFAULT CHARACTER SET utf8 ;
USE `Ticket_Booking` ;

-- -----------------------------------------------------
-- Table `Ticket_Booking`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket_Booking`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `gender` VARCHAR(10) NULL,
  `contact_number` BIGINT(10) NULL,
  `ID_proof_type` VARCHAR(45) NULL,
  `ID_proof_id` VARCHAR(45) NULL,
  `address` VARCHAR(90) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket_Booking`.`Train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket_Booking`.`Train` (
  `Train_id` INT(5) NOT NULL,
  `train_name` VARCHAR(45) NOT NULL,
  `train_type` VARCHAR(45) NULL,
  `start_station` VARCHAR(45) NOT NULL,
  `final_station` VARCHAR(45) NOT NULL,
  `depature_time` DATETIME NOT NULL,
  `arrival_time` DATETIME NOT NULL,
  `total_num_res_seats` BIGINT NOT NULL,
  `num_resv_seats_available` BIGINT NULL,
  PRIMARY KEY (`Train_id`),
  UNIQUE INDEX `Train_id_UNIQUE` (`Train_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket_Booking`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket_Booking`.`Ticket` (
  `Ticket_id` BIGINT NOT NULL,
  `pnr` BIGINT(10) NOT NULL,
  `src_station` VARCHAR(45) NOT NULL,
  `dest_station` VARCHAR(45) NOT NULL,
  `resv_or_unresv` VARCHAR(10) NOT NULL,
  `booked_time` DATETIME NULL,
  `Train_id` INT(5) NOT NULL,
  PRIMARY KEY (`Ticket_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket_Booking`.`Resv_Train_Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket_Booking`.`Resv_Train_Ticket` (
  `Train_id` INT(5) NOT NULL,
  `Ticket_id` BIGINT NOT NULL,
  `customer_id` INT NOT NULL,
  `resv_status` VARCHAR(10) NOT NULL,
  `resv_coach_id` NVARCHAR(5) NOT NULL,
  `resv_seat_num` INT NOT NULL,
  INDEX `fk_Train_has_Ticket_Ticket1_idx` (`Ticket_id` ASC),
  INDEX `fk_Train_has_Ticket_Train_idx` (`Train_id` ASC),
  INDEX `fk_Resv_Train_Ticket_Customer1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_Train_has_Ticket_Train`
    FOREIGN KEY (`Train_id`)
    REFERENCES `Ticket_Booking`.`Train` (`Train_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Train_has_Ticket_Ticket1`
    FOREIGN KEY (`Ticket_id`)
    REFERENCES `Ticket_Booking`.`Ticket` (`Ticket_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Resv_Train_Ticket_Customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Ticket_Booking`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket_Booking`.`Unresv_Ticket_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket_Booking`.`Unresv_Ticket_customer` (
  `Ticket_id` BIGINT NOT NULL,
  `customer_id` INT NOT NULL,
  INDEX `fk_Ticket_has_Customer_Customer1_idx` (`customer_id` ASC),
  INDEX `fk_Ticket_has_Customer_Ticket1_idx` (`Ticket_id` ASC),
  CONSTRAINT `fk_Ticket_has_Customer_Ticket1`
    FOREIGN KEY (`Ticket_id`)
    REFERENCES `Ticket_Booking`.`Ticket` (`Ticket_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_has_Customer_Customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Ticket_Booking`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
