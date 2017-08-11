-- Queston: Design a database schema for a movie and tv series database using the E-R model and 
-- design tables accordingly using the relationship model. 
-- -----------------------------------------------------
-- Entites: Movies, Actors, TV_series. Relational: Movies_Actors, TV_series_Actors
-- Strong Entites: Actors
-- Weak Entites: Movies, TV_series.
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IMDB` DEFAULT CHARACTER SET utf8 ;
USE `IMDB` ;

-- -----------------------------------------------------
-- Table `IMDB`.`Actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Actors` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Actors` (
  `actor_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `about` MULTILINESTRING NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Movies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Movies` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Movies` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(20) NOT NULL,
  `Last_updated` TIMESTAMP NOT NULL,
  `release_year` YEAR NOT NULL,
  `num_of_actors` INT NOT NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`TV_series`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`TV_series` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`TV_series` (
  `series_id` INT NOT NULL AUTO_INCREMENT,
  `series_name` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(20) NOT NULL,
  `start_date` DATE NOT NULL,
  `num_of_seasons` INT NOT NULL,
  `num_of_actors` INT NOT NULL,
  PRIMARY KEY (`series_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Movies_Actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Movies_Actors` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Movies_Actors` (
  `movie_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  `Last_updated` TIMESTAMP NOT NULL,
  INDEX `fk_Movies_has_Actors_Actors1_idx` (`actor_id` ASC),
  INDEX `fk_Movies_has_Actors_Movies_idx` (`movie_id` ASC),
  CONSTRAINT `fk_Movies_has_Actors_Movies`
    FOREIGN KEY (`movie_id`)
    REFERENCES `IMDB`.`Movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movies_has_Actors_Actors1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `IMDB`.`Actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`TV_series_Actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`TV_series_Actors` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`TV_series_Actors` (
  `series_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  `Last_updated` TIMESTAMP NOT NULL,
  INDEX `fk_TV_series_has_Actors_Actors1_idx` (`actor_id` ASC),
  INDEX `fk_TV_series_has_Actors_TV_series1_idx` (`series_id` ASC),
  CONSTRAINT `fk_TV_series_has_Actors_TV_series1`
    FOREIGN KEY (`series_id`)
    REFERENCES `IMDB`.`TV_series` (`series_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TV_series_has_Actors_Actors1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `IMDB`.`Actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
