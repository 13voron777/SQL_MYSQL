USE publishing;

# 1.Создайте кластеризованный индекс по имени автора для таблицы Authors.
CREATE INDEX FirstName ON 2f_author(FirstName);

# 2.Создайте кластеризованный составной индекс, содержащий цену и название каждой книги. 
CREATE INDEX PriceNameBook ON 2f_books_info(PriceOfBook, NameBook);

# 3.Создайте представление, в котором выберите из таблицы продажи все книг, стоимостью больше 55 грн. 
CREATE VIEW SubLab63 AS
SELECT * FROM 2f_books_sales
WHERE Price > 55;
SELECT * FROM SubLab63;

# 4.Для таблицы «Авторы» отключить кластеризированный индекс. Проверить возможность выбора данных из таблицы. Подключить обратно индекс.
DROP INDEX FirstName ON 2f_author;
SELECT * FROM 2f_author;
CREATE INDEX FirstName ON 2f_author(FirstName);
SELECT * FROM 2f_author;

# 5.Написать представление, которое будет отображать информацию о книгах, которые имели тираж более 10 экземпляров.
CREATE VIEW SubLab65 AS
SELECT * FROM 2f_books_sales
WHERE Price > 55;
SELECT * FROM SubLab65;

# 6. Написать представление, которое содержит информацию о суммах, на которые были проданы книги каждым магазином.
CREATE VIEW SubLab66 AS
SELECT * FROM 2f_books_sales
WHERE Price > 55;
SELECT * FROM SubLab66;

# 7. Показать на экран среднее количество страниц по каждой из тематик, при этом показать только тематики, в которых среднее количество более 400.
CREATE VIEW SubLab67 AS
SELECT t.name, AVG(bi.Pages) AS AvgPgs FROM 2f_books_info AS bi
JOIN 2f_themes AS t ON t.idthemes = bi.id_Theme
GROUP BY bi.id_Theme;
DROP VIEW SubLab67;
SELECT * FROM SubLab67 WHERE AvgPgs > 560;