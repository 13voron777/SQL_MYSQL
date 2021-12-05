# Task 2
CREATE SCHEMA hw3;

USE hw3;

CREATE TABLE `hw3`.`guns` (
  `idGun` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idGun`),
  UNIQUE INDEX `idGun_UNIQUE` (`idGun` ASC) VISIBLE);
  
  CREATE TABLE `hw3`.`platoons` (
  `idPlatoon` INT NOT NULL,
  `platoonNumber` int NULL,
  `officeNumber` int NULL,
  PRIMARY KEY (`idPlatoon`),
  UNIQUE INDEX `idPlatoon_UNIQUE` (`idPlatoon` ASC) VISIBLE);
  
  CREATE TABLE `hw3`.`commanders` (
  `idCommander` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idCommander`),
  UNIQUE INDEX `idCommander_UNIQUE` (`idCommander` ASC) VISIBLE);
  
ALTER TABLE `hw3`.`commanders` 
ADD COLUMN `idRank` INT NULL AFTER `Name`,
ADD INDEX `rank_com_idx` (`idRank` ASC) VISIBLE;
ALTER TABLE `hw3`.`commanders` 
ADD CONSTRAINT `rank_com`
  FOREIGN KEY (`idRank`)
  REFERENCES `hw3`.`ranks` (`idRank`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
  CREATE TABLE `hw3`.`ranks` (
  `idRank` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idRank`),
  UNIQUE INDEX `idRank_UNIQUE` (`idRank` ASC) VISIBLE);
    
CREATE TABLE `hw3`.`soldiers` (
  `idSoldier` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `idPlatoon` INT NULL,
  PRIMARY KEY (`idSoldier`),
  UNIQUE INDEX `idSoldier_UNIQUE` (`idSoldier` ASC) VISIBLE,
  INDEX `plat_sold_idx` (`idPlatoon` ASC) VISIBLE,
  CONSTRAINT `plat_sold`
    FOREIGN KEY (`idPlatoon`)
    REFERENCES `hw3`.`platoons` (`idPlatoon`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE `hw3`.`distributions` (
  `idDistribution` INT NOT NULL,
  `idSoldier` INT NULL,
  `idGun` INT NULL,
  `idCommandier` INT NULL,
  PRIMARY KEY (`idDistribution`),
  UNIQUE INDEX `idDistribution_UNIQUE` (`idDistribution` ASC) VISIBLE,
  INDEX `sold_dist_idx` (`idSoldier` ASC) VISIBLE,
  INDEX `gun_dist_idx` (`idGun` ASC) VISIBLE,
  INDEX `comm_dist_idx` (`idCommandier` ASC) VISIBLE,
  CONSTRAINT `sold_dist`
    FOREIGN KEY (`idSoldier`)
    REFERENCES `hw3`.`soldiers` (`idSoldier`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `gun_dist`
    FOREIGN KEY (`idGun`)
    REFERENCES `hw3`.`guns` (`idGun`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `comm_dist`
    FOREIGN KEY (`idCommandier`)
    REFERENCES `hw3`.`commanders` (`idCommander`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
INSERT INTO `hw3`.`ranks` (`idRank`, `Name`) VALUES ('1', 'Майор');
INSERT INTO `hw3`.`ranks` (`idRank`, `Name`) VALUES ('2', 'Подполковник');

INSERT INTO `hw3`.`guns` (`idGun`, `Name`) VALUES ('1', 'АК-47');
INSERT INTO `hw3`.`guns` (`idGun`, `Name`) VALUES ('2', 'Глок20');
INSERT INTO `hw3`.`guns` (`idGun`, `Name`) VALUES ('3', 'АК-74');

INSERT INTO `hw3`.`platoons` (`idPlatoon`, `platoonNumber`, `officeNumber`) VALUES ('1', '222', '205');
INSERT INTO `hw3`.`platoons` (`idPlatoon`, `platoonNumber`, `officeNumber`) VALUES ('2', '232', '221');
INSERT INTO `hw3`.`platoons` (`idPlatoon`, `platoonNumber`, `officeNumber`) VALUES ('3', '212', '201');
INSERT INTO `hw3`.`platoons` (`idPlatoon`, `platoonNumber`) VALUES ('4', '200');

INSERT INTO `hw3`.`commanders` (`idCommander`, `Name`, `idRank`) VALUES ('1', 'Буров О. С.', '1');
INSERT INTO `hw3`.`commanders` (`idCommander`, `Name`, `idRank`) VALUES ('2', 'Рыбаков Н. Г.', '1');
INSERT INTO `hw3`.`commanders` (`idCommander`, `Name`, `idRank`) VALUES ('3', 'Деребанов В. Я.', '2');

INSERT INTO `hw3`.`soldiers` (`idSoldier`, `Name`, `idPlatoon`) VALUES ('1', 'Петров В. А.', '1');
INSERT INTO `hw3`.`soldiers` (`idSoldier`, `Name`, `idPlatoon`) VALUES ('2', 'Лодарев П. С.', '2');
INSERT INTO `hw3`.`soldiers` (`idSoldier`, `Name`, `idPlatoon`) VALUES ('3', 'Леонтьев К. В.', '3');
INSERT INTO `hw3`.`soldiers` (`idSoldier`, `Name`, `idPlatoon`) VALUES ('4', 'Духов Р. М.', '4');

INSERT INTO `hw3`.`distributions` (`idDistribution`, `idSoldier`, `idGun`, `idCommandier`) VALUES ('1', '1', '1', '1');
INSERT INTO `hw3`.`distributions` (`idDistribution`, `idSoldier`, `idGun`, `idCommandier`) VALUES ('2', '1', '2', '2');
INSERT INTO `hw3`.`distributions` (`idDistribution`, `idSoldier`, `idGun`, `idCommandier`) VALUES ('3', '2', '3', '3');
INSERT INTO `hw3`.`distributions` (`idDistribution`, `idSoldier`, `idGun`, `idCommandier`) VALUES ('4', '2', '2', '2');
INSERT INTO `hw3`.`distributions` (`idDistribution`, `idSoldier`, `idGun`, `idCommandier`) VALUES ('5', '3', '1', '1');
INSERT INTO `hw3`.`distributions` (`idDistribution`, `idSoldier`, `idGun`, `idCommandier`) VALUES ('6', '3', '2', '2');
INSERT INTO `hw3`.`distributions` (`idDistribution`, `idSoldier`, `idGun`, `idCommandier`) VALUES ('7', '4', '1', '1');
