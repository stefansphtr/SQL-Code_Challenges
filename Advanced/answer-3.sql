/*
Correct the swapped item
*/

-- Count the total number of orders
-- SELECT
--     COUNT(order_id) AS total_orders
-- FROM
--     orders;

/*
There is 15 orders for each item in the data.
Now we need to integrate the total num of orders with all
the order item from the orders table.
*/

-- Integrate the total orders
WITH order_counts AS (
    SELECT
        COUNT(order_id) AS total_orders
    FROM
        orders
)
SELECT
    *
FROM
    orders
CROSS JOIN
    order_counts;

-- Apply swapped order logics

/*
The logic should be following this rule:
1. If the order_id is odd and
it is not the last order, then
it should be swapped with the
next number (add one to the order_id).
2. If the order_id is even, then it
shoul be substracted by one.
3. If the order_id is odd number and
it is the last item, then
it should be remain the same.
*/
WITH order_counts AS (
    SELECT
        COUNT(order_id) AS total_orders
    FROM
        orders
)
SELECT
    order_id,
    CASE
        WHEN order_id % 2 != 0 AND order_id != total_orders THEN order_id + 1
        WHEN order_id % 2 != 0 AND order_id = total_orders THEN order_id
        ELSE order_id - 1
        -- WHEN order_id % 2 = 0 THEN order_id - 1
    END AS corrected_order_id,
    item
FROM
    orders
CROSS JOIN
    order_counts;

-- Finally, sort the results
WITH order_counts AS (
    SELECT
        COUNT(order_id) AS total_orders
    FROM
        orders
)
SELECT
    CASE
        WHEN order_id % 2 != 0 AND order_id != total_orders THEN order_id + 1
        WHEN order_id % 2 != 0 AND order_id = total_orders THEN order_id
        ELSE order_id - 1
    END AS corrected_order_id,
    item
FROM
    orders
CROSS JOIN
    order_counts
ORDER BY
    corrected_order_id;