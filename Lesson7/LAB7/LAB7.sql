# Используя базу данных publishing
USE publishing;

# 1 Создать хранимую процедуру, которая возвращает максимальное из двух чисел.
DELIMITER |
CREATE PROCEDURE maxOfTwo(IN num1 INT, IN num2 INT, OUT info INT)
BEGIN
	IF (num1 > num2)
    THEN
    SET info = num1;
    ELSE
    SET info = num2;
    END IF;
END
|

DELIMITER |
CALL maxOfTwo(7, 5, @result); |
SELECT @result; |
DROP PROCEDURE maxOfTwo; |

# 2. Написать хранимую процедуру, которое будет отображать информацию
# обо всех авторах из определенной страны, название которой передается в процедуру при вызове.
DELIMITER |
CREATE PROCEDURE task2(IN country VARCHAR(25))
BEGIN
	SELECT a.id2f_author, a.FirstName, a.LastName FROM 2f_author a
    JOIN 2f_country c ON c.id2f_country = a.id_country
    WHERE c.name = country;
END
|

DELIMITER |
CALL task2('Ukraine'); |
DROP PROCEDURE task2; |

# 3. Написать процедуру, позволяющую просмотреть все книги определенного
# автора, при этом его имя передается при вызове.
DELIMITER |
CREATE PROCEDURE task3(IN afn VARCHAR(25), IN aln VARCHAR(25))
BEGIN
	SELECT bi.NameBook FROM 2f_books_info bi
    JOIN 2f_author a ON a.id2f_author = bi.id_author
    WHERE a.FirstName = afn AND a.LastName = aln;
END
|

DELIMITER |
CALL task3('John', 'Nork'); |
DROP PROCEDURE task3; |

# 4. Функцию, которая возвращает самую дорогую книгу указанной тематики.
CREATE FUNCTION ExpensiveBook(theme varchar(45))
RETURNS varchar(45)
DETERMINISTIC
BEGIN
	RETURN 
    (SELECT bi.NameBook FROM 2f_books_info bi
    JOIN 2f_themes t ON t.idthemes = bi.id_Theme
    WHERE bi.PriceOfBook = 
		(SELECT MAX(PriceOfBook) FROM 2f_books_info
        GROUP BY id_Theme HAVING id_Theme = t.idthemes)
	AND t.name = theme
	GROUP BY bi.id_Theme);
END
|
SELECT t.*, ExpensiveBook(t.name) FROM 2f_themes t;|
DROP FUNCTION IF EXISTS ExpensiveBook; |

# 5.Написать функцию, которая выводит информацию о количестве авторов,
# живущих в разных странах (название страны передается в качестве параметра).
CREATE FUNCTION CountAuthors(cname varchar(45))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN 
    (SELECT COUNT(CONCAT(a.FirstName, ' ', a.LastName)) AS CountAuthors FROM 2f_author a
    JOIN 2f_country c ON a.id_country = c.id2f_country
    GROUP BY c.name HAVING c.name = cname);
END
|
SELECT c.*, CountAuthors(c.name) FROM 2f_country c;|
DROP FUNCTION IF EXISTS CountAuthors; |

# 6 Функцию, которая возвращает количество магазинов, которые не продали ни одной книги издательства.
CREATE FUNCTION NoSales()
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN 
    (SELECT COUNT(*) FROM 2f_shops s
    LEFT JOIN 2f_books_sales bs ON bs.id_shop = s.id2f_shops
    WHERE bs.id_shop IS NULL);
END
|
SELECT NoSales(); |
DROP FUNCTION IF EXISTS NoSales; |