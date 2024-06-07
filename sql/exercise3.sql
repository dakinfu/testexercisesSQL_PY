-- Имеется таблица денежных переводов transfers.
-- from – номер аккаунта, с которого сделан перевод,
-- to – номер аккаунта, на который сделан перевод,
-- amount – сумма перевода,
-- tdate – дата перевода.
-- Требуется создать оператор выбора, который для каждого аккаунта выведет периоды постоянства остатков. 
-- Результат запроса должен содержать столбцы acc – номер аккаунта, dt_from - начало периода,
-- dt_to - конец периода, balance – остаток на счёте в данном периоде.
-- Дата конца последнего периода – 01.01.3000.

CREATE TEMPORARY TABLE BalanceChanges AS
SELECT tdate AS change_date, from AS acc, amount AS change_amount FROM transfers UNION ALL
SELECT tdate AS change_date, to AS acc, amount AS change_amount FROM transfers;

CREATE TEMPORARY TABLE AccountBalances AS 
SELECT acc, change_date AS dt_from,
    LEAD(change_date, 1, '3000-01-01') OVER (PARTITION BY acc ORDER BY change_date) AS dt_to, balance FROM AccountBalances;

SELECT acc, dt_from, dt_to, balance FROM BalancePeriods ORDER BY acc, dt_from

-- Для решения задачи использовался сайт https://sql-academy.org/ru