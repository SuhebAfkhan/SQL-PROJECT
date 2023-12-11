create database SQL_PROJECT;
USE SQL_PROJECT;

CREATE table USERS(USER_ID INTEGER,EMAIL_DOMAIN TEXT,COUNTRY TEXT,CITY TEXT,POSTAL INTEGER,MOBILE_APP TEXT,SIGN_UP_AT DATETIME);
CREATE table PROGRESS(USER_ID INTEGER,LEARN_CPP TEXT,LEARN_SQL TEXT,LEARN_HTML TEXT,LEARN_JAVASCRIPT TEXT,LEARN_JAVA TEXT);
-- First, use SELECT * from both tables and use your knowledge of queries and aggregate functions to get to know the data:

SELECT * FROM USERS LIMIT 20;
SELECT * FROM PROGRESS LIMIT 20;

-- (i)What are the Top 25 schools (.edu domains)?
select email_domain,count(*)
from users
group by 1
order by 2 desc
limit 25;

-- (ii)How many .edu learners are located in New York?
select city, 
count(*)
from users
where city="New York";

-- (iii)The mobile_app column contains either mobile-user or NULL. How many of these Codecademy learners are using the mobile app?
select mobile_app,
count(*)
from users
group by 1;

-- using strftime function, query for the sign up counts for each hour.
SELECT HOUR(sign_up_at) AS signup_hour, COUNT(*) AS count_per_hour
FROM users
GROUP BY signup_hour
ORDER BY signup_hour;

-- Do different schools (.edu domains) prefer different courses?
SELECT users.user_id,
   users.email_domain,
   users.city,
   users.country,
   progress.learn_cpp,
   progress.learn_sql,
   progress.learn_html,
   progress.learn_javascript,
   progress.learn_java
FROM users
JOIN progress
  ON users.user_id = progress.user_id
LIMIT 10;

-- What courses are the New Yorkers students taking?
SELECT progress.learn_cpp,
       progress.learn_sql,
       progress.learn_html,
       progress.learn_javascript,
       progress.learn_java
FROM users
JOIN progress ON users.user_id = progress.user_id
WHERE users.city = 'New York';

-- What courses are the Chicago students taking?
SELECT 
progress.learn_cpp,
progress.learn_sql,
progress.learn_html,
progress.learn_javascript,
progress.learn_java
FROM users
JOIN progress ON users.user_id = progress.user_id
WHERE users.city = 'Chicago';