DELIMITER $$
CREATE FUNCTION getDistance (a1 FLOAT, a2 FLOAT, b1 FLOAT, b2 FLOAT) 
	RETURNS FLOAT
	DETERMINISTIC
BEGIN 
	DECLARE dist FLOAT;
	 IF isNumeric(a1) AND  isNumeric(a2) AND isNumeric(b1) AND isNumeric(b2) THEN
		SET dist = POW((POW((a1-b1),2) + POW((a2-b2),2)),-2);
	 ELSE
		SET dist = NULL;
	 END IF;

	RETURN dist;
END$$
  