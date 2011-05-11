DELIMITER $$
CREATE FUNCTION getReviewScore (review_id_in INT ) 
	RETURNS FLOAT
	DETERMINISTIC
BEGIN 
	DECLARE e, c, d, p, a, score, score_num, score_denom FLOAT DEFAULT 0;
	DECLARE coffeeWeight FLOAT DEFAULT 4;
	DECLARE shopWeight FLOAT DEFAULT 1;
	SELECT espressoscore, cappuccinoscore, dripscore, personalityscore, atmospherescore INTO e,c,d,p,a FROM reviews WHERE id = review_id_in;

	IF e IS NOT NULL THEN
		SET score_num = score_num + (e*coffeeWeight);
		SET score_denom = score_denom + coffeeWeight;
	END IF;
	IF c IS NOT NULL THEN
		SET score_num = score_num + (c*coffeeWeight);
		SET score_denom = score_denom + coffeeWeight;
	END IF;
	IF d IS NOT NULL THEN
		SET score_num = score_num + (d*coffeeWeight);
		SET score_denom = score_denom + coffeeWeight;
	END IF;
	IF p IS NOT NULL THEN
		SET score_num = score_num + (p*shopWeight);
		SET score_denom = score_denom + shopWeight;
	END IF;
	IF a IS NOT NULL THEN
		SET score_num = score_num + (a*shopWeight);
		SET score_denom = score_denom + shopWeight;
	END IF;

	IF score_denom = 0 THEN
		SET score = NULL;
	ELSE 
		SET score = score_num/score_denom;
	END IF;

	RETURN score;
END$$
