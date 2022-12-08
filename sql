In this SQL, I am querying a database with multiple tables to quantify statistics about customers and order data

#1. How many orders were placed in January? 
SELECT COUNT(ORDERID) FROM JANSALES;

#2. How many of those orders were for an iPhone? 
SELECT count(orderid) FROM JANSALES WHERE PRODUCT='iPhone';


#3. Select the customer account numbers for all the orders that were placed in February. 
SELECT ACCTNUM FROM CUSTOMERS CUST
INNER JOIN FEBSALES ON CUST.ORDER_ID=FEBSALES.orderID;

#4. Which product was the cheapest one sold in January, and what was the price? 
SELECT DISTINCT PRODUCT,PRICE FROM JANSALES 
WHERE PRICE= (SELECT MIN(PRICE) FROM JANSALES);

#5. What is the total revenue for each product sold in January?
SELECT SUM(PRODUCT)*SUM(PRICE) GROUP BY PRODUCT;

#6. Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue?
select sum(Quantity), product, sum(quantity)*price as revenue FROM BIT_DB.FebSales 
WHERE location = '548 Lincoln St, Seattle, WA 98101'GROUP BY product;

#7. How many customers ordered more than 2 products at a time, and what was the average amount spent for those customers? 
select count(distinct cust.acctnum), avg(quantity*price) FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON FEB.orderid=cust.order_id
WHERE Feb.Quantity>2;

