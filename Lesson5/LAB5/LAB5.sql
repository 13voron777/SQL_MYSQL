USE publishing;

# 1 Вывести информацию обо всех книгах, в имени которых больше 4-х слов.
SELECT * FROM 2f_books_info WHERE NameBook LIKE '% % % % %';

# 2 Показать количество авторов в базе данных. Результат сохранить в другую таблицу.
CREATE TABLE Query2
SELECT COUNT(*) FROM 2f_author;

# 3 Показать среднеарифметическую цену продажи всех книг. Результат сохранить в временную таблицу.
CREATE TEMPORARY TABLE Query3
SELECT AVG(Price) FROM 2f_books_sales;

# 4 Вывести информацию о книгах по «Computer Science» с наибольшим количеством страниц. (!)
SELECT * FROM 2f_books_info WHERE id_Theme = 
	(SELECT idthemes FROM 2f_themes WHERE name = 'Computer Science')
    AND PAGES = (SELECT MAX(Pages) FROM 2f_books_info);

# 5 Показать на экран сумму страниц по каждой из тематик, при этом учитывать только книги одной из следующих тематик: «Computer
# Science», «Science Fiction», «Web Technologies» и с количеством страниц более 300. (!)


# 6 Создать временную таблицу, содержащую самую дорогую книгу тематики, например, «Web Technologies».
#CREATE TEMPORARY TABLE Query6 (!)
SELECT * FROM
	(SELECT * FROM 2f_books_info WHERE id_Theme = 
		(SELECT idthemes FROM 2f_themes WHERE name = 'Web Development')
	) AS sub
WHERE PriceOfBook = MAX(sub.PriceOfBook);

# 7 Создать запрос, который позволяет вывести всю информацию о (!)
# работе магазинов. Отсортировать выборку по странам в возрастающем и по названиям магазинов в убывающем порядке.
SELECT * FROM 2f_shops ORDER BY id_country ASC;
#ORDER BY name DESC;

# 8 Создать запрос, показывающий самую популярную книгу (!)
SELECT * FROM 2f_books_sales WHERE id_Theme = 
	(SELECT idthemes FROM 2f_themes WHERE name = 'Computer Science')
    AND PAGES = (SELECT MAX(Pages) FROM 2f_books_info);

# 9 Создать временную таблицу, в которой предоставляется информация об авторах, имена которых начинаются с А или В.
CREATE TEMPORARY TABLE Query9
SELECT * FROM 2f_author WHERE FirstName LIKE 'A%' OR FirstName LIKE 'B%';