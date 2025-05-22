SELECT sale_seller_id , COUNT(sale_seller_id)
FROM mock_data
GROUP BY sale_seller_id
--HAVING COUNT(sale_seller_id) > 1

select customer_first_name , customer_last_name , count(*)
from mock_data md 
group by customer_first_name , customer_last_name 


select store_name, COUNT(1)
from mock_data md 
group by store_name 
HAVING COUNT(*) > 1

SELECT DISTINCT
    customer_first_name,
    customer_last_name
FROM mock_data
INTERSECT
SELECT DISTINCT
    seller_first_name,
    seller_last_name
FROM mock_data;

select distinct
	store_name
from mock_data md 
intersect
select distinct 
	supplier_name 
from mock_data md2

SELECT email, COUNT(*) AS occurrences
FROM (
    SELECT customer_email AS email FROM mock_data
    UNION ALL
    SELECT seller_email FROM mock_data
    UNION ALL
    SELECT store_email FROM mock_data
    UNION ALL
    SELECT supplier_email FROM mock_data
) all_emails
GROUP BY email
HAVING COUNT(*) > 1;

SELECT
    product_name,
    seller_first_name,
    seller_last_name,
    seller_email,
    supplier_name,
    supplier_email
FROM mock_data
WHERE store_name = supplier_name;

select product_name, store_name, supplier_name
from mock_data md
where supplier_name = store_name 