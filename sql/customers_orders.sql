/* Portfolio SQL Server Demo
   Author: Nayeli González
   Requires: SQL Server 2019+ (or Docker), sample CSVs (optional)
   Run order:
   1) (Opcional) USE <tu_base>;
   2) CREATE TABLE Customers, Orders, FK, índices
   3) (Opcional) BULK INSERT desde /import/*.csv (ajusta ruta/terminador)
   4) Consultas: ventas mensuales + RANK, churn, RFM
*/


--- DB Activation
---USE dbportfolio;

--- Table creation 
CREATE TABLE Customers(
    customer_id int PRIMARY KEY,
    company VARCHAR(20),
    segment VARCHAR(10),
    region VARCHAR(15))

CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_code VARCHAR(10),
    product_name VARCHAR(50),
    units INT,
    unit_price FLOAT,
    discount_rate DECIMAL(5,3),
    channel VARCHAR(20),
    gross_revenue FLOAT,
    net_revenue FLOAT,
    CONSTRAINT FK_Orders_Customers 
      FOREIGN KEY (customer_id)
      REFERENCES Customers(customer_id) 
);

--- INDEX CREATION 
/* Comentario de performance: índices en columnas de join/fecha aceleran
 filtros y agregaciones por ~20-40% según tamaño. */

CREATE INDEX  idx_orders ON Orders (order_date);
CREATE INDEX  idx_customers ON  Customers (customer_id);

BULK INSERT Customers
    FROM '/import/customers.csv'
    WITH(
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n',
         FIRSTROW = 2
    );

BULK INSERT Orders
    FROM '/import/orders.csv'
    WITH(
         FIRSTROW = 2,
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
    );


/* 1) Ventas mensuales por canal con CTE y window functions */

WITH base AS (
    SELECT 
       DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date),1) AS [month],
       o.channel,
       SUM(o.net_revenue) AS revenue
    FROM orders AS o 
    GROUP BY 
        DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date), 1),
        o.channel

)
SELECT 
   [month],
   channel,
   revenue,
   RANK()  OVER (PARTITION BY [month] ORDER BY revenue DESC) AS rnk
   FROM base
   ORDER BY [month], rnk;

/* 2) Churn  por mes (clientes activos 
este mes que no regresan el siguiente) */

WITH monthly_customers AS (
    SELECT DATEFROMPARTS(YEAR(o.order_date),MONTH(o.order_date),1) AS [month],
       o.customer_id
    FROM orders AS o 
    GROUP BY 
       DATEFROMPARTS(YEAR(o.order_date),MONTH(o.order_date),1),
       o.customer_id

),
WITH_NEXT AS (
    SELECT mc.[month],
           mc.customer_id,
           LEAD(mc.month) OVER (PARTITION BY mc.customer_id ORDER BY mc.[month]) AS next_month_for_customer
    FROM monthly_customers AS mc 

)
SELECT 
   [month],
   SUM(CASE
            WHEN next_month_for_customer IS NULL
                 OR next_month_for_customer > DATEADD(month, 1, [month])
            THEN 1 ELSE 0
        END) AS churned_customers
FROM with_next
GROUP BY [month]
ORDER BY [month];

/* 3) RFM básico (Recency, Frequency, Monetary) */

;WITH last_purchase AS (
    SELECT
        o.customer_id,
        MAX(CAST(o.order_date AS date)) AS last_order_date
    FROM dbo.Orders AS o
    GROUP BY o.customer_id
),
frequency AS (
    SELECT
        o.customer_id,
        COUNT(*) AS orders_count
    FROM Orders AS o
    GROUP BY o.customer_id
),
monetary AS (
    SELECT
        o.customer_id,
        SUM(o.net_revenue) AS total_value
    FROM Orders AS o
    GROUP BY o.customer_id
)
SELECT TOP (20)
    c.customer_id,
    c.company,
    DATEDIFF(day, lp.last_order_date, CAST(GETDATE() AS date)) AS recency_days,
    ISNULL(f.orders_count, 0) AS [frequency],
    ISNULL(m.total_value, 0)  AS monetary
FROM Customers AS c
LEFT JOIN last_purchase AS lp ON lp.customer_id = c.customer_id
LEFT JOIN frequency     AS f  ON f.customer_id  = c.customer_id
LEFT JOIN monetary      AS m  ON m.customer_id  = c.customer_id
ORDER BY monetary DESC;

SELECT * FROM   ORDERS
