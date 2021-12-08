USE publishing;

# 1 Вывести информацию обо всех книгах, в имени которых больше 4-х слов.
SELECT * FROM 2f_books_info WHERE NameBook LIKE '% % % % %';

# 2 Показать количество авторов в базе данных. Результат сохранить в другую таблицу.
CREATE TABLE Query2
SELECT COUNT(*) FROM 2f_author;
SELECT * FROM Query2;

# 3 Показать среднеарифметическую цену продажи всех книг. Результат сохранить в временную таблицу.
CREATE TEMPORARY TABLE Query3
SELECT AVG(Price) FROM 2f_books_sales;
SELECT * FROM Query3;

# 4 Вывести информацию о книгах по «Computer Science» с наибольшим количеством страниц.
SELECT * FROM 2f_books_info WHERE Pages = 
	(SELECT MAX(Pages) FROM 2f_books_info as bi 
    JOIN 2f_themes as t ON t.idthemes = bi.id_Theme
    WHERE t.name = 'Computer Science');

# 5 Показать на экран сумму страниц по каждой из тематик, при этом учитывать только книги одной из следующих тематик: «Computer
# Science», «Science Fiction», «Web Technologies» и с количеством страниц более 300.
SELECT bi.id_Theme, t.name, SUM(bi.Pages) FROM 2f_books_info AS bi
JOIN 2f_themes AS t ON t.idthemes = bi.id_Theme
WHERE bi.id_Theme IN (SELECT idthemes FROM 2f_themes WHERE name IN ('Computer science', 'Programming', 'Web Development'))
GROUP BY bi.id_Theme;

# 6 Создать временную таблицу, содержащую самую дорогую книгу тематики, например, «Web Technologies».
CREATE TEMPORARY TABLE Query6
SELECT * FROM 2f_books_info WHERE PriceOfBook = 
	(SELECT MAX(PriceOfBook) from 2f_books_info AS bi
	JOIN 2f_themes AS t ON t.idthemes = bi.id_Theme
	WHERE t.name = 'Web Development'
    );
SELECT * FROM Query6;

# 7 Создать запрос, который позволяет вывести всю информацию о
# работе магазинов. Отсортировать выборку по странам в возрастающем и по названиям магазинов в убывающем порядке.
SELECT * FROM 2f_books_sales AS bs
JOIN 2f_shops AS s ON s.id2f_shops = bs.id_shop
JOIN 2f_country AS c ON c.id2f_country = s.id_country
ORDER BY c.name ASC, s.name DESC;

# 8 Создать запрос, показывающий самую популярную книгу (!)
SELECT bs.id_book, bi.NameBook, SUM(bs.Quantity) AS TotalQuantity FROM 2f_books_sales AS bs
JOIN 2f_books_info AS bi ON bi.id_book = bs.id_book
GROUP BY bs.id_book
HAVING TotalQuantity = 
	(SELECT MAX(SUB.TotalQuantity) FROM
		(
		SELECT bs.id_book, bi.NameBook, SUM(bs.Quantity) AS TotalQuantity FROM 2f_books_sales AS bs
		JOIN 2f_books_info AS bi ON bi.id_book = bs.id_book
		GROUP BY bs.id_book
		) AS SUB
	);

# 9 Создать временную таблицу, в которой предоставляется информация об авторах, имена которых начинаются с А или В.
CREATE TEMPORARY TABLE Query9
SELECT * FROM 2f_author WHERE FirstName LIKE 'A%' OR FirstName LIKE 'B%';
SELECT * FROM Query9;