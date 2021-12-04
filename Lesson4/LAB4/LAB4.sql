USE PUBLISHING;

# 1
SELECT * FROM publishing.2f_books_info WHERE id_author IN (3, 6, 9);

# 2
SELECT * FROM publishing.2f_books_info WHERE PAGES BETWEEN 500 AND 650;

# 3
SELECT * FROM publishing.2f_books_info WHERE NameBook LIKE 'C%' OR NameBook LIKE 'H%';

# 4
SELECT * FROM publishing.2f_books_info WHERE id_Theme <> 1 AND DrawingOfBook > 20000;

# 5
