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

#2 NF
CREATE TABLE `publishing`.`2f_country` (
  `id2f_country` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id2f_country`),
  UNIQUE INDEX `id2f_country_UNIQUE` (`id2f_country` ASC) VISIBLE);

CREATE TABLE `publishing`.`2f_author` (
  `id2f_author` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  PRIMARY KEY (`id2f_author`),
  UNIQUE INDEX `id2f_author_UNIQUE` (`id2f_author` ASC) VISIBLE);

ALTER TABLE `publishing`.`2f_author` 
ADD COLUMN `id_country` INT NULL AFTER `LastName`,
ADD INDEX `country_author_idx` (`id_country` ASC) VISIBLE;
;
ALTER TABLE `publishing`.`2f_author` 
ADD CONSTRAINT `country_author`
  FOREIGN KEY (`id_country`)
  REFERENCES `publishing`.`2f_country` (`id2f_country`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

CREATE TABLE `publishing`.`2f_shops` (
  `id2f_shops` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `id_country` INT NULL,
  PRIMARY KEY (`id2f_shops`),
  UNIQUE INDEX `id2f_shops_UNIQUE` (`id2f_shops` ASC) VISIBLE,
  INDEX `country_shop_idx` (`id_country` ASC) VISIBLE,
  CONSTRAINT `country_shop`
    FOREIGN KEY (`id_country`)
    REFERENCES `publishing`.`2f_country` (`id2f_country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `publishing`.`2f_books_info` (
  `id_book` INT NOT NULL,
  `NameBook` VARCHAR(45) NULL,
  `NameTheme` VARCHAR(45) NULL,
  `PriceOfBook` FLOAT NULL,
  `Pages` INT NULL,
  `id_author` INT NULL,
  PRIMARY KEY (`id_book`),
  UNIQUE INDEX `id_book_UNIQUE` (`id_book` ASC) VISIBLE,
  INDEX `author_idx` (`id_author` ASC) VISIBLE,
  CONSTRAINT `author`
    FOREIGN KEY (`id_author`)
    REFERENCES `publishing`.`2f_author` (`id2f_author`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `publishing`.`2f_books_sales` (
  `sale_id` INT NOT NULL,
  `id_book` INT NULL,
  `DrawingOfBook` INT NULL,
  `Price` FLOAT NULL,
  `Quantity` INT NULL,
  `id_shop` INT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE INDEX `sale_id_UNIQUE` (`sale_id` ASC) VISIBLE,
  INDEX `shop_idx` (`id_shop` ASC) VISIBLE,
  CONSTRAINT `shop`
    FOREIGN KEY (`id_shop`)
    REFERENCES `publishing`.`2f_shops` (`id2f_shops`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `publishing`.`2f_themes` (
  `idthemes` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idthemes`),
  UNIQUE INDEX `idthemes_UNIQUE` (`idthemes` ASC) VISIBLE);

ALTER TABLE `publishing`.`2f_books_info` 
CHANGE COLUMN `NameTheme` `id_Theme` INT NULL DEFAULT NULL ,
ADD INDEX `theme_idx` (`id_Theme` ASC) VISIBLE;
;
ALTER TABLE `publishing`.`2f_books_info` 
ADD CONSTRAINT `theme`
  FOREIGN KEY (`id_Theme`)
  REFERENCES `publishing`.`2f_themes` (`idthemes`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `publishing`.`2f_books_sales` 
DROP COLUMN `DrawingOfBook`;

ALTER TABLE `publishing`.`2f_books_info` 
ADD COLUMN `DrawingOfBook` INT NULL AFTER `PriceOfBook`;