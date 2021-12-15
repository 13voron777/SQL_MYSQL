USE carsshop;

DELIMITER |

CREATE FUNCTION MinAge()
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN 
    (SELECT MIN(AGE) FROM clients);
END
|
SELECT c.client_id, c.mark, c.model FROM cars c JOIN clients cl ON cl.id = c.client_id WHERE cl.age = MinAge(); |
DROP FUNCTION IF EXISTS MinAge; |