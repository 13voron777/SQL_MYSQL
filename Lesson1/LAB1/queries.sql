SELECT * FROM cars.autos; #1

SELECT mark, model, max_speed FROM cars.autos; #2

SELECT * FROM cars.autos WHERE mark = 'AUDI'; #3

SELECT * FROM cars.autos WHERE mark in ('AUDI', 'BMW'); #4

SELECT * FROM cars.autos WHERE max_speed between 200 and 300; #5

SELECT * FROM cars.autos WHERE mark = 'AUDI' and engine_volume > 1.5; #6

SELECT * FROM cars.autos WHERE mark LIKE 'H%'; #7

SELECT * FROM cars.autos WHERE price in (2, 2.5, 3); #8

SELECT * FROM cars.autos order by mark; #9

SELECT * FROM cars.autos order by price; #10

SELECT * FROM cars.autos order by engine_volume, price; #11

SELECT * FROM cars.autos order by max_speed DESC; #12

SELECT sum(price) AS 'SUM PRICE AUDI' FROM cars.autos group by mark having mark = 'AUDI'; #13

SELECT count(*) FROM cars.autos where mark = 'AUDI' and model = 'A6'; #14

SELECT count(*) FROM cars.autos where mark = 'AUDI' and max_speed < 200; #15

SELECT avg(max_speed) FROM cars.autos where mark = 'HONDA'; #16

UPDATE cars.autos SET max_speed = 500 WHERE mark = 'AUDI'; #17

DELETE FROM cars.autos where price = 2; #18