USE publishing;

INSERT INTO `publishing`.`2f_themes`
(idthemes, name)
VALUES (1, 'Computer science'),
	(2, 'Programming'),
	(3, 'Web Development'),
	(4, 'Database theory'),
	(5, 'Networks ans security');
    
    INSERT INTO `publishing`.`2f_country`
(id2f_country, name)
VALUES (1, 'USA'),
	(2, 'France'),
	(3, 'Germany'),
	(4, 'England'),
	(5, 'Ukraine'),
	(6, 'Sweden'),
	(7, 'Poland'),
	(8, 'Italy'),
	(9, 'Spain'),
	(10, 'Greece');
    
    INSERT INTO `publishing`.`2f_author`
(id2f_author, FirstName, LastName, id_country)
VALUES (1, 'Patrick', 'Fluince', 2),
	(2, 'Mark', 'Schaize', 3),
	(3, 'Sam', 'Duck', 4),
	(4, 'Ganna', 'Lyisko', 5),
	(5, 'Drek', 'Frucken', 6),
	(6, 'Janush', 'Navak', 7),
	(7, 'Vlad', 'Ole', 8),
	(8, 'Eden', 'Speilenman', 9),
	(9, 'Aristotel', 'Greckiy', 10),
	(10, 'John', 'Nork', 1);
    
    INSERT INTO `publishing`.`2f_books_info`
(id_book, NameBook, PriceOfBook, DrawingOfBook, Pages, id_Theme, id_author)
VALUES (1, 'First steps on PC', 59.99, 10000, 345, 1, 10),
	(2, 'PC it is pro100', 29.99, 5000, 444, 1, 10),
	(3, 'C++ for newbies', 35.99, 15000, 542, 2, 3),
	(4, 'C++ for professional', 39.99, 25000, 245, 2, 3),
	(5, 'HTML + CSS', 25.99, 50000, 564, 3, 3),
	(6, 'HTML 5.0', 20.99, 45000, 600, 3, 3),
	(7, 'MS SQL', 15.95, 65000, 755, 4, 4),
	(8, 'NoSQL', 55.55, 85000, 350, 4, 4),
	(9, 'Theory of TCP\IP', 15.95, 20000, 588, 5, 5),
	(10, 'Introducing on network', 17.95, 22000, 754, 5, 5),
	(11, 'Newest PC', 95.59, 75000, 792, 1, 6),
	(12, 'Overclocking PC', 105.59, 97000, 379, 1, 6),
	(13, 'Java for newbies', 58.49, 38000, 555, 2, 7),
	(14, 'C# and WPF for professional', 55.99, 50000, 888, 2, 7),
	(15, 'Phyton for web', 76.55, 50000, 564, 3, 8),
	(16, 'JavaScript for web', 67.50, 45000, 600, 3, 8),
	(17, 'MS SQL 2017', 15.95, 95000, 755, 4, 9),
	(18, 'Introducing to NoSQL', 144.99, 77550, 350, 4, 9),
	(19, 'TCP\IP protocol', 99.95, 24000, 788, 5, 10),
	(20, 'Hacking on networks', 87.95, 27000, 454, 5, 10);
    
    INSERT INTO `publishing`.`2f_shops`
(id2f_shops, name, id_country)
VALUES (1, 'Books for IT', 2),
	(2, 'ITBook', 3),
	(3, 'Book.com', 4),
	(4, 'Books.Kingdom', 5),
	(5, 'RidniBooks', 6),
	(6, 'Readers.SW', 7),
	(7, 'Bukwoedy', 8);
    
    INSERT INTO `publishing`.`2f_books_sales`
(sale_id, id_book, Price, Quantity, id_shop)
VALUES 
(1, 5, 88.75, 11, 5),
(2, 3, 43.99, 33, 6),
(3, 1, 39.99, 44, 7),
(4, 6, 11.75, 9, 1),
(5, 9, 35.75, 8, 2),
(6, 10, 44.15, 65, 3),
(7, 3, 22.15, 56, 4),
(8, 2, 115.55, 32, 5),
(9, 4, 79.99, 27, 6),
(10, 7, 95.49, 67, 7),
(11, 8, 13.95, 14, 3),
(12, 4, 137.95, 53, 2),
(13, 2, 225.00, 12, 1),
(14, 8, 145.95, 23, 5),
(15, 1, 88.75, 45, 7);