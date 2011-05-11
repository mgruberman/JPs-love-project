
DELIMITER $$

CREATE FUNCTION getShopReviewScore ( shop_id_in INT ) RETURNS float
	DETERMINISTIC
BEGIN 
	DECLARE score, no_more_reviews, score_sum, score_denum, r, reviewScore FLOAT DEFAULT 0;
	DECLARE review_cursor CURSOR FOR 
		SELECT id
		FROM reviews
		WHERE shop_id = shop_id_in;
	DECLARE  CONTINUE HANDLER FOR NOT FOUND SET no_more_reviews = 1;

sproc: BEGIN

	OPEN review_cursor;
	score_loop: LOOP
		FETCH review_cursor INTO r;
		IF no_more_reviews = 1 THEN
			LEAVE score_loop;
		END IF;

	SET reviewScore = getReviewScore(r);

		#score the fucker.
		IF isNumeric(reviewScore) THEN
			SET score_sum = score_sum + reviewScore;
			SET score_denum = score_denum + 1;
		END IF;

	END LOOP;

	CLOSE review_cursor;

	IF score_denum = 0 THEN
		SET score = NULL;
		LEAVE sproc;
	END IF;

	SET score = score_sum/score_denum;

END sproc;
	RETURN score;
END
