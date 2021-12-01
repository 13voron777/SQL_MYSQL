CREATE DATABASE hw2;

USE hw2;

   CREATE TABLE `hw2`.`providers` (
  `idprovider` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `product` VARCHAR(45) NULL,
  PRIMARY KEY (`idprovider`),
  UNIQUE INDEX `idprovider_UNIQUE` (`idprovider` ASC) VISIBLE);
  
  CREATE TABLE `hw2`.`personal` (
  `idEmployee` INT NOT NULL AUTO_INCREMENT,
  `position` VARCHAR(45) NULL,
  `experience` INT NULL,
  PRIMARY KEY (`idEmployee`),
  UNIQUE INDEX `idEmployee_UNIQUE` (`idEmployee` ASC) VISIBLE);
  
  CREATE TABLE `hw2`.`clients` (
  `idclient` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idclient`),
  UNIQUE INDEX `idclient_UNIQUE` (`idclient` ASC) VISIBLE);
  
  CREATE TABLE `hw2`.`purchases` (
  `idpurchase` INT NOT NULL AUTO_INCREMENT,
  `idProvider` INT NULL,
  `idPersonal` INT NULL,
  `idClient` INT NULL,
  PRIMARY KEY (`idpurchase`),
  UNIQUE INDEX `idpurchase_UNIQUE` (`idpurchase` ASC) VISIBLE,
  INDEX `idPr_idx` (`idProvider` ASC) VISIBLE,
  INDEX `idPe_idx` (`idPersonal` ASC) VISIBLE,
  INDEX `idCl_idx` (`idClient` ASC) VISIBLE,
  CONSTRAINT `idPr`
    FOREIGN KEY (`idProvider`)
    REFERENCES `hw2`.`providers` (`idprovider`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idPe`
    FOREIGN KEY (`idPersonal`)
    REFERENCES `hw2`.`personal` (`idEmployee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idCl`
    FOREIGN KEY (`idClient`)
    REFERENCES `hw2`.`clients` (`idclient`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
INSERT INTO `hw2`.`personal` (`position`, `experience`) VALUES ('salesman', '2');
INSERT INTO `hw2`.`personal` (`position`, `experience`) VALUES ('loader', '1');
INSERT INTO `hw2`.`personal` (`position`, `experience`) VALUES ('salesman', '5');

INSERT INTO `hw2`.`providers` (`name`, `product`) VALUES ('Gas', 'Coca Cola');
INSERT INTO `hw2`.`providers` (`name`, `product`) VALUES ('Ocean', 'Fish');
INSERT INTO `hw2`.`providers` (`name`, `product`) VALUES ('Funny milkman', 'Milk');

