-- Требуется составить расписание случайных проверок. 
-- Создайте оператор выбора, который выдаст 100 дат, начиная с текущей, 
-- при этом каждая дата отличается от предыдущей на 2-7 дней.

CREATE TEMPORARY TABLE RandomDateForTest (
  CheckDate DATE
);

SET @current_date = CURDATE();

SET @i = 1;

WHILE @i <= 100 DO
    SET @interval = FLOOR(2 + (RAND() * 6)); 
    SET @current_date = DATE_ADD(@current_date, INTERVAL @interval DAY);
    INSERT INTO RandomDateForTest (CheckDate)
    VALUES (@current_date);
    SET @i = @i + 1;
END WHILE;

SELECT * FROM RandomDateForTest;

-- Для решения задачи использовался сайт https://sql-academy.org/ru