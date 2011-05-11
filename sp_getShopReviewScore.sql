DELIMITER $$
CREATE PROCEDURE getShopReviewScore (IN shop_id_in INT ) BEGIN 
	DECLARE score, no_more_reviews, score_sum, score_denum, r FLOAT;
	DECLARE review_cursor CURSOR FOR 
		SELECT id
		FROM reviews
		WHERE shop_id = shop_id_in;
	DECLARE  CONTINUE HANDLER FOR NOT FOUND SET no_more_reviews = 1;

sproc: BEGIN

	OPEN review_cursor;
	score_loop: LOOP
		FETCH review_cursor INTO r;
		IF no_more_reviews=1 THEN
			LEAVE score_loop;
		END IF;

		#score the fucker.
		IF getReviewScore(r) IS NOT NULL THEN
			SET score_sum = score_sum + getReviewScore(r);
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
	SELECT score;
END;