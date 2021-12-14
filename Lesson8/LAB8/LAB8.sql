USE publishing;

# 1. Используя транзакцию добавьте несколько записей в любую из таблиц.
START TRANSACTION;
INSERT INTO `publishing`.`2f_country` (`id2f_country`, `name`) VALUES ('11', 'Canada');
INSERT INTO `publishing`.`2f_country` (`id2f_country`, `name`) VALUES ('12', 'Portugal');
COMMIT;

# 2. Используя транзакцию добавьте несколько записей в любую из таблиц, а потом откатите ее.
START TRANSACTION;
INSERT INTO `publishing`.`2f_themes` (`idthemes`, `name`) VALUES ('6', 'Algorithms');
INSERT INTO `publishing`.`2f_themes` (`idthemes`, `name`) VALUES ('7', 'Hucking');
ROLLBACK;


# 3. Используя транзакцию создайте точку, к кторой необходимо будет откатить транзакцию, 
# добавьте несколько записей в любую из таблиц, а потом откатите ее до этой точки.
START TRANSACTION;
INSERT INTO `publishing`.`2f_shops` (`id2f_shops`, `name`, `id_country`) VALUES ('8', 'Swiat ksiaszki', '7');
SAVEPOINT SavePoint3;
INSERT INTO `publishing`.`2f_shops` (`id2f_shops`, `name`, `id_country`) VALUES ('9', 'Ksiegarnia', '7');
ROLLBACK TO SAVEPOINT SavePoint3;
COMMIT;


# 4. Создайте триггер, который при удалении книги, копирует данные о ней в отдельную таблицу "DeletedBooks".
CREATE TABLE `DeletedBooks` (
  `id_book` int NOT NULL,
  `NameBook` varchar(45) DEFAULT NULL,
  `id_Theme` int DEFAULT NULL,
  `PriceOfBook` float DEFAULT NULL,
  `DrawingOfBook` int DEFAULT NULL,
  `Pages` int DEFAULT NULL,
  `id_author` int DEFAULT NULL
);

DELIMITER |
CREATE TRIGGER delete_book
BEFORE DELETE ON 2f_books_info
FOR EACH ROW 
  BEGIN
    INSERT INTO DeletedBooks SELECT * FROM 2f_books_info
    WHERE id_book = OLD.id_book;
 END;
    |