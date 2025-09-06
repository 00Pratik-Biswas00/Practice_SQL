-- Given a table of shipping records, where each shipping has a unique shipping_id, write 
-- an SQL query to retrieve the most recent shipping record for each customer. 
-- Assume a higher shipping_id means more recent.

CREATE TABLE shippings (
shipping_id INT NOT NULL PRIMARY KEY,
status VARCHAR(50),
customer INT NOT NULL
);

INSERT INTO shippings (shipping_id, status, customer) VALUES
(1, "Pending", 2),
(2, "Pending", 4),
(3, "Delivered", 6),
(4, "Pending", 4),
(5, "Delivered", 4);

    
WITH RankedShippings AS (
    SELECT 
        customer, 
        shipping_id, 
        status,
        ROW_NUMBER() OVER (
            PARTITION BY customer 
            ORDER BY shipping_id DESC
        ) AS rn
    FROM shippings
)
SELECT customer, shipping_id, status
FROM RankedShippings
WHERE rn = 1;






