DROP FUNCTION IF EXISTS format_seconds;

DELIMITER //

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;
    DECLARE result VARCHAR(255);

    SET days = FLOOR(seconds / 86400);
    SET hours = FLOOR((seconds % 86400) / 3600);
    SET minutes = FLOOR((seconds % 3600) / 60);
    SET remaining_seconds = seconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds');
    RETURN result;
END //

DELIMITER ;
SELECT format_seconds(123456) AS formatted_time;

SELECT number
FROM (
    SELECT 1 AS number UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5 UNION ALL
    SELECT 6 UNION ALL
    SELECT 7 UNION ALL
    SELECT 8 UNION ALL
    SELECT 9 UNION ALL
    SELECT 10
) AS numbers
WHERE number % 2 = 0;


