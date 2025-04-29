create database CS3

use CS3

select * from [Transaction]
select * from Customers
select * from Continent

1. Display the count of customers in each region who have done the transaction in the year 2020.

select count(customer_id) as Number_of_Customer from customers 
join [transaction] on customers.customer_ID = [transaction].customer_id
join Continent on Customers.region_id = continent.region_id

where year(txn_date) = '2020'
group by region_ID

 select count(c.customer_id) as No_of_customers, cnt.region_name from customers c 
 join continent cnt on cnt.region_id = c.region_id 
 join [dbo].[Transaction] t on t.customer_id = c.customer_id 
 where year(t.txn_date)='2020' 
 group by cnt.region_id


2. Display the maximum and minimum transaction amount of each transaction type.

select txn_type,
min(txn_amount) as min_txn_amt,
max(txn_amount) as max_txn_amt from [transaction]
group by txn_type 

3. Display the customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.

select c.customer_id,cnt.region_name,t.txn_amount from customers c 
join continent cnt on cnt.region_id = c.region_id 
join [Transaction] t on t.customer_id = c.customer_id 
where txn_type = 'deposit' and txn_amount > 2000

4. Find duplicate records in the Customer table.



5. Display the customer id, region name, transaction type and transaction amount for the minimum transaction amount in deposit.
6. Create a stored procedure to display details of customers in the Transaction table where the transaction date is greater than Jun 2020.
7. Create a stored procedure to insert a record in the Continent table.
8. Create a stored procedure to display the details of transactions that happened on a specific day.
9. Create a user defined function to add 10% of the transaction amount in a table.

