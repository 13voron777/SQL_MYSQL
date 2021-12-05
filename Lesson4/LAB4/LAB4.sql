USE PUBLISHING;

# 1
SELECT * FROM publishing.2f_books_info WHERE id_author IN (3, 6, 9);

# 2
SELECT * FROM publishing.2f_books_info WHERE PAGES BETWEEN 500 AND 650;

# 3
SELECT * FROM publishing.2f_books_info WHERE NameBook LIKE 'C%' OR NameBook LIKE 'H%';

# 4
SELECT b.id_book, b.NameBook, b.id_Theme, b.PriceOfBook, b.DrawingOfBook, b.pages, b.id_author
FROM publishing.2f_books_info b JOIN publishing.2f_themes t ON t.idthemes = b.id_Theme
WHERE t.name <> 'Computer science' AND b.DrawingOfBook > 20000;

# 5
SELECT * FROM publishing.2f_books_info WHERE PriceOfBook < 30;

# 6
SELECT * FROM publishing.2f_books_info WHERE NameBook LIKE 'HTML%' AND NameBook NOT LIKE '%0';

# 7
SELECT b.NameBook, b.id_Theme, CONCAT(a.FirstName, ' ', a.LastName) AS authorFull, 
(b.PriceOfBook / b.Pages) AS priceForPage 
FROM 2f_books_info b
JOIN publishing.2f_author a ON a.id2f_author = b.id_author
WHERE b.PriceOfBook / b.Pages < 0.1;

# 8
SELECT s.id2f_shops, s.name, s.id_country FROM publishing.2f_shops s
JOIN publishing.2f_country c ON c.id2f_country = s.id_country
WHERE c.name = 'Ukraine';