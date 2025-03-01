-- Script that creates a stored procedure
-- that computes and store the average score for a student
drop procedure IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$ ;
CREATE PROCEDURE ComputeAverageScoreForUser(
	IN user_id INT
)
BEGIN
	UPDATE users
   	SET average_score=(SELECT AVG(score) FROM corrections
			     WHERE corrections.user_id=user_id)
	WHERE id=user_id;

END;$$
DELIMITER ;
