CREATE SCHEMA Publishing;

USE Publishing;

CREATE TABLE `publishing`.`books_original` (
  `idBook` INT NOT NULL,
  `NameBook` VARCHAR(45) NULL,
  `NameTheme` VARCHAR(45) NULL,
  `PriceOfBook` FLOAT NULL,
  `Books_originalcol` VARCHAR(45) NULL,
  `DrawingOfBook` INT NULL,
  `Pages` INT NULL,
  `Price` FLOAT NULL,
  `Quantity` INT NULL,
  `NameShop` VARCHAR(45) NULL,
  `NameCountry` VARCHAR(45) NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  PRIMARY KEY (`idBook`),
  UNIQUE INDEX `idBook_UNIQUE` (`idBook` ASC) VISIBLE);

ALTER TABLE `publishing`.`books_original` 
DROP COLUMN `Books_originalcol`;

INSERT INTO `publishing`.`books_original` (`idBook`, `NameBook`, `NameTheme`, `PriceOfBook`, `DrawingOfBook`, `Pages`, `Price`, `Quantity`, `NameShop`, `NameCountry`, `FirstName`, `LastName`) VALUES ('1', 'Sky', 'Nature', '5', '10', '300', '5', '7', 'Books World', 'USA', 'Kenny', 'Wilson');
INSERT INTO `publishing`.`books_original` (`idBook`, `NameBook`, `NameTheme`, `PriceOfBook`, `DrawingOfBook`, `Pages`, `Price`, `Quantity`, `NameShop`, `NameCountry`, `FirstName`, `LastName`) VALUES ('2', 'Metro', 'Transport', '7', '15', '400', '7', '10', 'Swiat Ksiazki', 'Poland', 'Mateush', 'Gorcinski');
INSERT INTO `publishing`.`books_original` (`idBook`, `NameBook`, `NameTheme`, `PriceOfBook`, `DrawingOfBook`, `Pages`, `Price`, `Quantity`, `NameShop`, `NameCountry`, `FirstName`, `LastName`) VALUES ('3', 'Urbanistik', 'Transport', '6', '20', '350', '6', '12', 'Auchan', 'Russia', 'Arkadiy', 'Gertz');


#1 NF
CREATE TABLE `publishing`.`1f_books_info` (
  `idBook` INT NOT NULL,
  `NameBook` VARCHAR(45) NULL,
  `NameTheme` VARCHAR(45) NULL,
  `PriceOfBook` FLOAT NULL,
  `Pages` INT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  PRIMARY KEY (`idBook`),
  UNIQUE INDEX `idBook_UNIQUE` (`idBook` ASC) VISIBLE);

CREATE TABLE `publishing`.`1f_books_sales` (
  `sale_id` INT NOT NULL,
  `id_book` INT NULL,
  `DrawingOfBook` INT NULL,
  `Price` FLOAT NULL,
  `Quantity` VARCHAR(45) NULL,
  `NameShop` VARCHAR(45) NULL,
  `NameCountry` VARCHAR(45) NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE INDEX `sale_id_UNIQUE` (`sale_id` ASC) VISIBLE,
  INDEX `ibook_idx` (`id_book` ASC) VISIBLE,
  CONSTRAINT `ibook`
    FOREIGN KEY (`id_book`)
    REFERENCES `publishing`.`1f_books_info` (`idBook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `publishing`.`1f_books_info` (`idBook`, `NameBook`, `NameTheme`, `PriceOfBook`, `Pages`, `FirstName`, `LastName`) VALUES ('1', 'Sky', 'Nature', '5', '300', 'Kenny', 'Wilson');
INSERT INTO `publishing`.`1f_books_info` (`idBook`, `NameBook`, `NameTheme`, `PriceOfBook`, `Pages`, `FirstName`, `LastName`) VALUES ('2', 'Metro', 'Transport', '7', '400', 'Mateush', 'Gorcinski');
INSERT INTO `publishing`.`1f_books_info` (`idBook`, `NameBook`, `NameTheme`, `PriceOfBook`, `Pages`, `FirstName`, `LastName`) VALUES ('3', 'Urbanistik', 'Transport', '6', '350', 'Arkadiy', 'Gertz');

INSERT INTO `publishing`.`1f_books_sales` (`sale_id`, `id_book`, `DrawingOfBook`, `Price`, `Quantity`, `NameShop`, `NameCountry`) VALUES ('1', '1', '10', '5', '7', 'Books World', 'USA');
INSERT INTO `publishing`.`1f_books_sales` (`sale_id`, `id_book`, `DrawingOfBook`, `Price`, `Quantity`, `NameShop`, `NameCountry`) VALUES ('2', '2', '15', '7', '10', 'Swiat Ksiazki', 'Poland');
INSERT INTO `publishing`.`1f_books_sales` (`sale_id`, `id_book`, `DrawingOfBook`, `Price`, `Quantity`, `NameShop`, `NameCountry`) VALUES ('3', '3', '20', '6', '12', 'Auchan', 'Russia');
