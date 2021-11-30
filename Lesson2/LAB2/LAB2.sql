 CREATE SCHEMA `lab2`;
 
 USE `lab2`;
 
 CREATE TABLE `lab2`.`citizen` (
  `idCitizen` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idCitizen`),
  UNIQUE INDEX `idCitizen_UNIQUE` (`idCitizen` ASC) VISIBLE);
  
  CREATE TABLE `lab2`.`organization` (
    `idOrganization` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL,
    PRIMARY KEY (`idOrganization`)
);
  
   # one to one
  CREATE TABLE `lab2`.`passport` (
  `idPassport` INT NOT NULL AUTO_INCREMENT,
  `idCitizen` INT NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`idPassport`),
  UNIQUE INDEX `idPassport_UNIQUE` (`idPassport` ASC) VISIBLE,
  UNIQUE INDEX `idCitizen_UNIQUE` (`idCitizen` ASC) VISIBLE,
  CONSTRAINT `idCitizen`
    FOREIGN KEY (`idCitizen`)
    REFERENCES `lab2`.`citizen` (`idCitizen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

   # more to more
   CREATE TABLE `lab2`.`employees` (
  `idEmployee` INT NOT NULL AUTO_INCREMENT,
  `idCitizen` INT NULL,
  `idOrganization` INT NULL,
  PRIMARY KEY (`idEmployee`),
  UNIQUE INDEX `idEmployees_UNIQUE` (`idEmployee` ASC) VISIBLE,
  INDEX `idCitizen_idx` (`idCitizen` ASC) VISIBLE,
  CONSTRAINT `idCit`
    FOREIGN KEY (`idCitizen`)
    REFERENCES `lab2`.`citizen` (`idCitizen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idOrg`
    FOREIGN KEY (`idOrganization`)
    REFERENCES `lab2`.`organization` (`idOrganization`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
 
    # one to more
    