-- Требуется оценить эффективность продавцов. 
-- Создайте запрос, который вернёт количество и сумму продаж для каждого продавца, 
-- а также ранжирует продавцов по количеству продаж и по сумме продаж.

SELECT * 
	employee.id,
    employee.name,
    COUNT(sales.id) AS sales_c,
    RANK() OVER (ORDER BY COUNT(sales.id) DESC) AS sales_rank_c,
    SUM(sales.price) AS sales_s,
    RANK() OVER (ORDER BY SUM(sales.price) DESC) AS sales_rank_s
FROM employee
LEFT JOIN sales on employee.id = sales.employee_id
GROUP BY employee.id, employee.name;

-- Для решения задачи использовался сайт https://sql-academy.org/ru