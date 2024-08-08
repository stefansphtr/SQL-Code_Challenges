/*
Identifies Customer ID from the Supercloud customer

Feature to display:
customer_id

Additional Note:
customer identified as who has buy the product at least once
*/

-- Query to identify the customer_id who has bought the product at least once
WITH customer_cte AS (
    SELECT
        c.customer_id,
        COUNT(DISTINCT(p.product_category)) AS count_product_bought
    FROM
        customer_contracts AS c
    INNER JOIN
        products AS p
    ON
        c.product_id = p.product_id
    GROUP BY
        c.customer_id
)
SELECT
    customer_id
FROM
    customer_cte
WHERE
    count_product_bought = (
        SELECT
            COUNT(DISTINCT(product_category))
        FROM
            products
    );