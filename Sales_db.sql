#Create a database
CREATE DATABASE Sales;
USE Sales;
#Create a table 
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,  -- Primary Key Constraint
    Customer_name VARCHAR(100) NOT NULL,  -- Not Null Constraint
    Product_Category VARCHAR(50) NOT NULL,  -- Not Null Constraint
    Ordered_item VARCHAR(100) NOT NULL,  -- Not Null Constraint
    Contact_No VARCHAR(15) UNIQUE NOT NULL  -- Unique and Not Null Constraint
);
#Add a new column named "order_quantity"
ALTER TABLE Orders
ADD order_quantity INT;
#Rename the "Orders" table to "sales_orders"
ALTER TABLE Orders
RENAME TO sales_orders;
select*from sales_orders;
#Insert 10 rows 
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES 
(1, 'John Doe', 'Electronics', 'Smartphone', '1234567890', 2),
(2, 'Jane Smith', 'Clothing', 'T-shirt', '0987654321', 5),
(3, 'Alex Brown', 'Groceries', 'Pasta', '1122334455', 3),
(4, 'Mia White', 'Furniture', 'Chair', '5566778899', 1),
(5, 'Chris Green', 'Electronics', 'Laptop', '2233445566', 1),
(6, 'Sarah Black', 'Books', 'Novel', '3344556677', 2),
(7, 'Tom Blue', 'Clothing', 'Jeans', '7788990011', 4),
(8, 'Olivia Grey', 'Groceries', 'Rice', '9988776655', 10),
(9, 'Emma King', 'Electronics', 'Tablet', '4455667788', 1),
(10, 'Liam Lee', 'Furniture', 'Table', '6677889900', 1);
#Retrieve Customer_name and Ordered_item from the "sales_orders" table
SELECT Customer_name, Ordered_item
FROM sales_orders;
#Update the product name for any row (let's change the product name for Order_Id = 1)
UPDATE sales_orders
SET Ordered_item = 'Smartwatch'
WHERE Order_Id = 1;
#Delete the "sales_orders" table from the database
DROP TABLE sales_orders;