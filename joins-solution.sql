--1. Get all customers and their addresses.
SELECT "customers"."first_name", "customers"."last_name", "addresses"."street", "addresses"."city", "addresses"."state", "addresses"."zip" 
FROM "addresses" 
JOIN "customers" 
ON "addresses"."customer_id" = "customers"."id";

--2. Get all orders and their line items (orders, quantity and product).
SELECT "orders"."id" as order_id, "line_items"."product_id", "line_items"."quantity"
FROM "line_items"
JOIN "orders" 
ON "line_items"."order_id" = "orders"."id";

--3. Which warehouses have cheetos?
SELECT "products"."description" as Cheetos, "warehouse_product"."warehouse_id"
FROM "products"
JOIN "warehouse_product" 
ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos';

--4. Which warehouses have diet pepsi?
SELECT "products"."description" as Diet_Pepsi, "warehouse_product"."warehouse_id"
FROM "products"
JOIN "warehouse_product" 
ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "orders"."address_id", "customers"."first_name", "customers"."last_name",
COUNT ("address_id") as "number_orders"
FROM "orders"
JOIN "customers" 
ON "orders"."address_id" = "customers"."id"
GROUP BY "orders"."address_id","customers"."first_name", "customers"."last_name";


--6. How many customers do we have?
SELECT COUNT ("id") FROM "customers";

--7. How many products do we carry?
SELECT COUNT ("id") FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?

SELECT "warehouse_product"."product_id", "products"."description",
SUM ("on_hand")
FROM "warehouse_product"
JOIN "products"
ON "warehouse_product"."product_id" = "products"."id"
WHERE "warehouse_product"."product_id" = '6'
GROUP BY "products"."description", "warehouse_product"."product_id";
