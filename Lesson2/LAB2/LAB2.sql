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
    ON DELETE CASCADE
    ON UPDATE CASCADE);

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
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idOrg`
    FOREIGN KEY (`idOrganization`)
    REFERENCES `lab2`.`organization` (`idOrganization`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
 
    # one to more
    CREATE TABLE `lab2`.`information` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idOwner` INT NULL,
  `idOrganization` INT NOT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idOrganization_UNIQUE` (`idOrganization` ASC) VISIBLE,
  INDEX `idC_idx` (`idOwner` ASC) VISIBLE,
  CONSTRAINT `idC`
    FOREIGN KEY (`idOwner`)
    REFERENCES `lab2`.`citizen` (`idCitizen`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idO`
    FOREIGN KEY (`idOrganization`)
    REFERENCES `lab2`.`organization` (`idOrganization`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);