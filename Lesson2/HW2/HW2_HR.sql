# Task Extra
CREATE SCHEMA HW2_HR;

USE HW2_HR;

CREATE TABLE `hw2_hr`.`employers` (
  `idEmployers` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmployers`),
  UNIQUE INDEX `idEmployers_UNIQUE` (`idEmployers` ASC) VISIBLE);
  
  CREATE TABLE `hw2_hr`.`hr_employers` (
  `idHR_employers` INT NOT NULL AUTO_INCREMENT,
  `Name_HR` VARCHAR(45) NULL,
  PRIMARY KEY (`idHR_employers`),
  UNIQUE INDEX `idHR_employers_UNIQUE` (`idHR_employers` ASC) VISIBLE);

CREATE TABLE `hw2_hr`.`accept_employers` (
  `idAccept` INT NOT NULL AUTO_INCREMENT,
  `dateAccept` DATE NULL,
  `empl_accepted` INT NULL,
  `HR_accepted` INT NULL,
  PRIMARY KEY (`idAccept`),
  UNIQUE INDEX `idAccept_UNIQUE` (`idAccept` ASC) VISIBLE,
  INDEX `em_a_idx` (`empl_accepted` ASC) VISIBLE,
  INDEX `em_h_idx` (`HR_accepted` ASC) VISIBLE,
  CONSTRAINT `em_a`
    FOREIGN KEY (`empl_accepted`)
    REFERENCES `hw2_hr`.`employers` (`idEmployers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `em_h`
    FOREIGN KEY (`HR_accepted`)
    REFERENCES `hw2_hr`.`hr_employers` (`idHR_employers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO `hw2_hr`.`hr_employers` (`Name_HR`) VALUES ('Anna');
INSERT INTO `hw2_hr`.`hr_employers` (`Name_HR`) VALUES ('Suzy');
INSERT INTO `hw2_hr`.`hr_employers` (`Name_HR`) VALUES ('Elena');
INSERT INTO `hw2_hr`.`hr_employers` (`Name_HR`) VALUES ('Alex');

INSERT INTO `hw2_hr`.`employers` (`Name`) VALUES ('Sergio');
INSERT INTO `hw2_hr`.`employers` (`Name`) VALUES ('Mateush');
INSERT INTO `hw2_hr`.`employers` (`Name`) VALUES ('Viktor');
INSERT INTO `hw2_hr`.`employers` (`Name`) VALUES ('Mike');
INSERT INTO `hw2_hr`.`employers` (`Name`) VALUES ('Vitalij');

INSERT INTO `hw2_hr`.`accept_employers` (`dateAccept`, `empl_accepted`, `HR_accepted`) VALUES ('21.04.2009', '1', '1');
INSERT INTO `hw2_hr`.`accept_employers` (`dateAccept`, `empl_accepted`, `HR_accepted`) VALUES ('30.07.2012', '2', '3');
INSERT INTO `hw2_hr`.`accept_employers` (`dateAccept`, `empl_accepted`, `HR_accepted`) VALUES ('04.08.2015', '3', '4');
INSERT INTO `hw2_hr`.`accept_employers` (`dateAccept`, `empl_accepted`, `HR_accepted`) VALUES ('02.05.2004', '4', '2');
INSERT INTO `hw2_hr`.`accept_employers` (`dateAccept`, `empl_accepted`, `HR_accepted`) VALUES ('11.10.2018', '5', '2');
