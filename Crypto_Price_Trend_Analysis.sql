create database Crypto_Price_Trend_Analysis;
use Crypto_Price_Trend_Analysis;
select * from customer;

select min(price) from customer;
select max(price) from customer;
select avg(price) from customer;

select min(market_cap_rank) from customer;
select max(market_cap_rank) from customer;
select avg(market_cap_rank) from customer;


#1 : Find all unique coin names
select DISTINCT coin_name
FROM customer;

#2 : count total price on per coin
select coin_name,count(*) as total 
from customer
group by coin_name;

#3 : find average price on per coin
select coin_name,avg(price) as total 
from customer
group by coin_name;

#4 : find out most expensive coin 
select *
from customer 
order by  price desc
limit 1;

#4 : find out most cheap coin 
select *
from customer 
order by  price asc
limit 1;

#5 : count coin by there type
SELECT coin_name, COUNT(*) AS total_name
FROM customer
GROUP BY coin_name;

#6 : How do you fetch crypto data for a specific date range
SELECT * 
FROM customer
WHERE date BETWEEN '2024-01-01' AND '2024-12-31';

#7 : How do you calculate daily price change
SELECT 
  date,
  coin_name,
  daily_return - volume AS daily_price_change
FROM customer;

#8 : How do you identify the most volatile day
SELECT 
  date,
  coin_name,
  (daily_return - volume) AS volatility
FROM customer
ORDER BY volatility DESC
LIMIT 1;

SELECT 
  date,
  coin_name,
  AVG(cumulative_return) OVER (
    PARTITION BY coin_name
    ORDER BY date
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS moving_avg_7d
FROM customer;

