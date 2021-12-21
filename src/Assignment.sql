1) Create table Salespeople.
Query:-
        CREATE TABLE Salespeople(
        SNUM int  PRIMARY KEY NOT NULL,
        SNAME varchar(40) NOT NULL,
        CITY  varchar(25) NOT NULL,
        COMM  int  NOT NULL
);
------------------------------------------------------------------------------------------------------------------------

2) Create table of customer.
Query :-
           CREATE TABLE Customers(
           CNUM  int PRIMARY KEY NOT NULL,
           CNAME varchar(40) NOT NULL,
           CITY  varchar(25) NOT NULL,
           RATING int NOT NULL,
           SNUM int NOT NULL,
           FOREIGN KEY (SNUM ) REFERENCES Salespeople(SNUM)
           );

------------------------------------------------------------------------------------------------------------------------

3) Create table orders.
Query :-
         CREATE TABLE Orders(
          ONUM int PRIMARY KEY NOT NULL,
          AMT  int NOT NULL,
          ODATE date NOT NULL,
          CNUM int NOT NULL,
          SNUM int NOT NULL,
          FOREIGN KEY (SNUM ) REFERENCES Salespeople(SNUM)
          FOREIGN KEY (CNUM ) REFERENCES Customers(CNUM)

         );
------------------------------------------------------------------------------------------------------------------------
1) List all the columns of the Salespeople table
Query  :-
           select * from salespeople;
Output :-
            +------+---------+-----------+------+
            | SNUM | SNAME   | CITY      | COMM |
            +------+---------+-----------+------+
            | 1001 | Peel    | London    |   12 |
            | 1002 | Serres  | SanJose   |   13 |
            | 1003 | AxelRod | New York  |   10 |
            | 1004 | Motika  | London    |   11 |
            | 1007 | Rifkin  | Barcelona |   15 |
            | 1008 | Fran    | London    |   25 |
            +------+---------+-----------+------+
------------------------------------------------------------------------------------------------------------------------
2) List all customers with a rating of 100
Query :-
          select CNUM from Customers where RATING=100;
Output :-
           +---------+
           | CNAME   |
           +---------+
           | Hoffman |
           | Clemens |
           | Pereira |
           +---------+
------------------------------------------------------------------------------------------------------------------------
3)Find the largest order taken by each salesperson on each date.

Query :-
          select SNUM,ODATE,max(AMT) from Orders group by ODATE ,SNUM;
Output :-
              +------+------------+----------+
              | SNUM | ODATE      | max(AMT) |
              +------+------------+----------+
              | 1001 | 1990-03-10 |   767.19 |
              | 1002 | 1990-03-10 |  5160.45 |
              | 1004 | 1990-03-10 |   1900.1 |
              | 1007 | 1990-03-10 |  1098.16 |
              | 1002 | 1990-04-10 |    75.75 |
              | 1003 | 1990-04-10 |  1713.23 |
              | 1001 | 1990-05-10 |     4723 |
              | 1001 | 1990-06-10 |  9891.88 |
              | 1002 | 1990-06-10 |  1309.95 |
              +------+------------+----------+
------------------------------------------------------------------------------------------------------------------------
4)Arrange the Order table by descending customer number.
Query :-
           select * from  Orders order by CNUM desc;
Output :-
            +------+---------+------------+------+------+
            | ONUM | AMT     | ODATE      | CNUM | SNUM |
            +------+---------+------------+------+------+
            | 3001 |   18.69 | 1990-03-10 | 2008 | 1007 |
            | 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
            | 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
            | 3008 |    4723 | 1990-05-10 | 2006 | 1001 |
            | 3011 | 9891.88 | 1990-06-10 | 2006 | 1001 |
            | 3007 |   75.75 | 1990-04-10 | 2004 | 1002 |
            | 3010 | 1309.95 | 1990-06-10 | 2004 | 1002 |
            | 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
            | 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
            | 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
            +------+---------+------------+------+------+
------------------------------------------------------------------------------------------------------------------------
5) Find which salespeople currently have orders in the order table.
Query :-
        select SNAME from Salespeople where SNUM in (select SNUM from Orders);
 Output :-
             +---------+
             | SName   |
             +---------+
             | Peel    |
             | Serres  |
             | AxelRod |
             | Motika  |
             | Rifkin  |
             +---------+
 -----------------------------------------------------------------------------------------------------------------------
 6) List names of all customers matched with the salespeople serving them.
 Query :-
        SELECT SP.SNAME, SP.CITY, C.CNAME from Salespeople SP, Customers C WHERE SP.SNUM= C.SNUM;
 Output :-
           +---------+-----------+----------+
           | SNAME   | CITY      | CNAME    |
           +---------+-----------+----------+
           | Peel    | London    | Hoffman  |
           | AxelRod | New York  | Giovanni |
           | Serres  | SanJose   | Liu      |
           | Serres  | SanJose   | Grass    |
           | Peel    | London    | Clemens  |
           | Motika  | London    | Pereira  |
           | Rifkin  | Barcelona | Cineros  |
           +---------+-----------+----------+
------------------------------------------------------------------------------------------------------------------------
7) Find the names and numbers of all salespeople who have more than one customer.
Query :-
   SELECT C.SNUM,SP.SNAME,COUNT(*) AS COUNT FROM Customers C, Salespeople SP WHERE C.SNUM = SP.SNUM group by C.SNUM;


Output :-
           +------+---------+-------+
           | SNUM | SNAME   | COUNT |
           +------+---------+-------+
           | 1001 | Peel    |     2 |
           | 1002 | Serres  |     2 |
           | 1003 | AxelRod |     1 |
           | 1004 | Motika  |     1 |
           | 1007 | Rifkin  |     1 |
           +------+---------+-------+
------------------------------------------------------------------------------------------------------------------------
8) Count the orders of each of the salespeople and output the results in descending order.
Query :-
       select count(ONUM),SNUM from Orders group by SNUM order by count(ONUM) desc;
Output :-
           +-------------+------+
           | count(ONUM) | SNUM |
           +-------------+------+
           |           3 | 1001 |
           |           3 | 1002 |
           |           2 | 1007 |
           |           1 | 1003 |
           |           1 | 1004 |
           +-------------+------+
------------------------------------------------------------------------------------------------------------------------
9) List the customer table if and only if one or more of the customers in the Customer table are located in SanJose.

Query :- select distinct c.CNUM ,c.CNAME,c.CITY,c.RATING,c.SNUM from Customers  c ,Customers  cs Where c.CITY='sanjose'
         and Cs. CITY='sanjose';
Output :-
           +------+---------+---------+--------+------+
           | CNUM | CNAME   | CITY    | RATING | SNUM |
           +------+---------+---------+--------+------+
           | 2003 | Liu     | SanJose |    200 | 1002 |
           | 2008 | Cineros | SanJose |    300 | 1007 |
           +------+---------+---------+--------+------+

------------------------------------------------------------------------------------------------------------------------
10) Match salespeople to customers according to what city they live in.
Query  :-
         select SNAME,CNAME,SP.CITY from Salespeople SP, Customers C where SP.CITY = C.CITY;
Output :-
+--------+---------+---------+
| SNAME  | CNAME   | CITY    |
+--------+---------+---------+
| Peel   | Hoffman | London  |
| Motika | Hoffman | London  |
| Fran   | Hoffman | London  |
| Serres | Liu     | SanJose |
| Peel   | mens Cle| London  |
| Motika | Clemens | London  |
| Fran   | Clemens | London  |
| Serres | Cineros | SanJose |
+--------+---------+---------+
------------------------------------------------------------------------------------------------------------------------
11) Find all the customers in SanJose who have a rating above 200.
 Query :-
         select * from Customers where rating>200;
  Output :-
            +------+---------+---------+--------+------+
            | CNUM | CNAME   | CITY    | RATING | SNUM |
            +------+---------+---------+--------+------+
            | 2004 | Grass   | Berlin  |    300 | 1002 |
            | 2008 | Cineros | SanJose |    300 | 1007 |
            +------+---------+---------+--------+------+
------------------------------------------------------------------------------------------------------------------------
12) List the names and commissions of all salespeople in London.
  Query :-
           select SNUM, COMM from Salespeople where CITY = 'London';
  Output :-
            +------+------+
            | SNUM | COMM |
            +------+------+
            | 1001 |   12 |
            | 1004 |   11 |
            | 1008 |   25 |
            +------+------+
------------------------------------------------------------------------------------------------------------------------
13) List all the orders of Salesperson Motika from the orders table.
Query :-
         select ONUM from Orders where SNUM =(select SNUM from Salespeople where SNAME='Motika');
Output :-
           +------+
           | ONUM |
           +------+
           | 3002 |
           +------+
------------------------------------------------------------------------------------------------------------------------
14) Find all customers who booked orders on October 3.
Query :-
          SELECT c. CNUM, CNAME, CITY, RATING,c. SNUM  FROM customers c, orders o where c.CNUM = o.CNUM
          AND ODATE ='1990-03-10';
Output :-
           +------+---------+---------+--------+------+
           | CNUM | CNAME   | CITY    | RATING | SNUM |
           +------+---------+---------+--------+------+
           | 2008 | Cineros | SanJose |    300 | 1007 |
           | 2007 | Pereira | Rome    |    100 | 1004 |
           | 2001 | Hoffman | London  |    100 | 1001 |
           | 2003 | Liu     | SanJose |    200 | 1002 |
           | 2008 | Cineros | SanJose |    300 | 1007 |
           +------+---------+---------+--------+------+
------------------------------------------------------------------------------------------------------------------------
15) Give the sums of the amounts from the Orders table, grouped by date, eliminating all those dates where the SUM was
    not at least 2000 above the maximum Amount.
Query :-
        select ODATE,sum(AMT) from Orders group by ODATE;
Output :-
         +------------+----------+
         | ODATE      | sum(AMT) |
         +------------+----------+
         | 1990-03-10 |  8944.59 |
         | 1990-04-10 |  1788.98 |
         | 1990-05-10 |     4723 |
         | 1990-06-10 | 11201.83 |
         +------------+----------+
------------------------------------------------------------------------------------------------------------------------
16) Select all orders that had amounts that were greater than at least one of the orders from October 6.
Query :-

Output:-
------------------------------------------------------------------------------------------------------------------------
17) Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
   Query :-

   Output :-
------------------------------------------------------------------------------------------------------------------------
18) Find all customers whose cnum is 1000 above the snum of Serres.

Query :-
        SELECT CNUM, CNAME FROM customers WHERE CNUM > (SELECT SNUM FROM salespeople WHERE SNAME LIKE 'Serres');
Output :-
         +------+----------+
         | CNUM | CNAME    |
         +------+----------+
         | 2001 | Hoffman  |
         | 2002 | Giovanni |
         | 2003 | Liu      |
         | 2004 | Grass    |
         | 2006 | Clemens  |
         | 2007 | Pereira  |
         | 2008 | Cineros  |
         +------+----------+
------------------------------------------------------------------------------------------------------------------------
19) Give the salespeople’s commissions as percentages instead of decimal numbers.

Query :-
      select concat(COMM , '%') as Percente from salespeople;
Output :-
           +------------+
           | Percentage |
           +------------+
           | 12%        |
           | 13%        |
           | 10%        |
           | 11%        |
           | 15%        |
           | 25%        |
           +------------+
------------------------------------------------------------------------------------------------------------------------
20) Find the largest order taken by each salesperson on each date, eliminating those Maximum orders,
    which are less than 3000.
 Query :- Select ODATE, SNUM, max(AMT) from Orders  where AMT > 3000 group by ODATE, SNUM order by ODATE,SNUM;

 Output:-
           +------------+------+----------+
           | ODATE      | SNUM | max(AMT) |
           +------------+------+----------+
           | 1990-03-10 | 1002 |  5160.45 |
           | 1990-05-10 | 1001 |     4723 |
           | 1990-06-10 | 1001 |  9891.88 |
           +------------+------+----------+

------------------------------------------------------------------------------------------------------------------------
21) List all the largest orders for October 3, for each salesperson.
Query :-

Output :-
------------------------------------------------------------------------------------------------------------------------
22) Find all customers located in cities where Serres has customers.
Query :-

Output:-
------------------------------------------------------------------------------------------------------------------------
23) Select all customers with a rating above 200.

Query :-
         select * from Customers where RATING > 200;
 output :-
          +------+---------+---------+--------+------+
          | CNUM | CNAME   | CITY    | RATING | SNUM |
          +------+---------+---------+--------+------+
          | 2004 | Grass   | Berlin  |    300 | 1002 |
          | 2008 | Cineros | SanJose |    300 | 1007 |
          +------+---------+---------+--------+------+
------------------------------------------------------------------------------------------------------------------------

24) Count the number of salespeople currently having orders in the orders table.
 Query :-
         select count(Distinct SNUM) from Orders;
 Output :-
            +----------------------+
            | count(Distinct SNUM) |
            +----------------------+
            |                    5 |
            +----------------------+
------------------------------------------------------------------------------------------------------------------------
25) Write a query that produces all customers serviced by salespeople with a commission above 12%.
    Output the customer’s name,salesperson’s name and the salesperson’s rate of commission.
Query :-

Output:-
------------------------------------------------------------------------------------------------------------------------
26) Find salespeople who have multiple customers.
Query :- select s.SNAME,c.CNAME from Salespeople s,Customers c where s.SNUM=c.SNUM;


Output :-
          +---------+----------+
          | SNAME   | CNAME    |
          +---------+----------+
          | Peel    | Hoffman  |
          | AxelRod | Giovanni |
          | Serres  | Liu      |
          | Serres  | Grass    |
          | Peel    | Clemens  |
          | Motika  | Pereira  |
          | Rifkin  | Cineros  |
          +---------+----------+

------------------------------------------------------------------------------------------------------------------------
27) Find salespeople with customers located in their own cities.
 Query :-
             select s.SNAME,s.CITY,c.CNAME from Salespeople s,Customers c where s.CITY=c.CITY;
 Output :-
               +--------+---------+---------+
               | SNAME  | CITY    | CNAME   |
               +--------+---------+---------+
               | Peel   | London  | Hoffman |
               | Motika | London  | Hoffman |
               | Fran   | London  | Hoffman |
               | Serres | SanJose | Liu     |
               | Peel   | London  | Clemens |
               | Motika | London  | Clemens |
               | Fran   | London  | Clemens |
               | Serres | SanJose | Cineros |
               +--------+---------+---------+

------------------------------------------------------------------------------------------------------------------------
28) Find all salespeople whose name starts with ‘P’ and fourth character is ‘I’.
 Query :-
          select * from Salespeople where SNAME like 'p__l';
 Output :-
            +------+-------+--------+------+
            | SNUM | SNAME | CITY   | COMM |
            +------+-------+--------+------+
            | 1001 | Peel  | London |   12 |
            +------+-------+--------+------+
 -----------------------------------------------------------------------------------------------------------------------
29) Write a query that uses a subquery to obtain all orders for the customer named ‘Cisneros’.
     Assume you do not know his customer number.
Query :-
Output :-
------------------------------------------------------------------------------------------------------------------------
30) Find the largest orders for Serres and Rifkin.
Query :-

Output :-
------------------------------------------------------------------------------------------------------------------------
31) Sort the salespeople table in the following order: snum, sname, commission, city.
Query :-
        select SNUM , SNAME , COMM, CITY from Salespeople;
Output :-
            +------+---------+------+-----------+
            | SNUM | SNAME   | COMM | CITY      |
            +------+---------+------+-----------+
            | 1001 | Peel    |   12 | London    |
            | 1002 | Serres  |   13 | SanJose   |
            | 1003 | AxelRod |   10 | New York  |
            | 1004 | Motika  |   11 | London    |
            | 1007 | Rifkin  |   15 | Barcelona |
            | 1008 | Fran    |   25 | London    |
            +------+---------+------+-----------+
------------------------------------------------------------------------------------------------------------------------
32) Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
Query :-
        select CNAME from Customers where CNAME between 'A' and 'G';
Output :-
           +---------+
           | CNAME   |
           +---------+
           | Clemens |
           | Cineros |
           +---------+
------------------------------------------------------------------------------------------------------------------------
33) Select all the possible combinations of customers you can assign.
Query :-  select c.CNAME,s.SNAME from Customers c join  Salespeople s on c.SNUM=s.SNUM;
Output :- +----------+---------+
          | CNAME    | SNAME   |
          +----------+---------+
          | Hoffman  | Peel    |
          | Giovanni | AxelRod |
          | Liu      | Serres  |
          | Grass    | Serres  |
          | Clemens  | Peel    |
          | Pereira  | Motika  |
          | Cineros  | Rifkin  |
          +----------+---------+
------------------------------------------------------------------------------------------------------------------------
34) Select all orders that are greater than the average for October 4.
Query :-  SELECT * FROM Orders WHERE AMT>(SELECT  AVG(AMT) FROM Orders WHERE ODATE ='1990-04-10');
Output :-  +------+---------+------------+------+------+
           | ONUM | AMT     | ODATE      | CNUM | SNUM |
           +------+---------+------------+------+------+
           | 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
           | 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
           | 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
           | 3008 |    4723 | 1990-05-10 | 2006 | 1001 |
           | 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
           | 3010 | 1309.95 | 1990-06-10 | 2004 | 1002 |
           | 3011 | 9891.88 | 1990-06-10 | 2006 | 1001 |
           +------+---------+------------+------+------+
------------------------------------------------------------------------------------------------------------------------
35)   Write a select command using correlated subquery that selects the
      names and numbers of all customers with ratings equal to the maximum for their city.
------------------------------------------------------------------------------------------------------------------------
36) Write a query that totals the orders for each day and places the results in descending order.
Query :-    select COUNT(ODATE) "TOTAL ORDERS", ODATE  FROM Orders group by ODATE order by "TOTAL ORDERS";

Output :-
         +--------------+------------+
         | TOTAL ORDERS | ODATE      |
         +--------------+------------+
         |            5 | 1990-03-10 |
         |            2 | 1990-04-10 |
         |            1 | 1990-05-10 |
         |            2 | 1990-06-10 |
         +--------------+------------+

------------------------------------------------------------------------------------------------------------------------

37) Write a select command that produces the rating followed by the name of each customer in SanJose.
Query :-
       select rating , CNAME from Customers where CITY in (select CITY from Salespeople where CITY = 'SanJose' );
Output:-
        +--------+---------+
        | rating | CNAME   |
        +--------+---------+
        |    200 | Liu     |
        |    300 | Cineros |
        +--------+---------+
------------------------------------------------------------------------------------------------------------------------
38) Find all orders with amounts smaller than any amount for a customer in SanJose.

Query:- select * from Orders where AMT < ANY (select AMT from Orders o,
       ->Customers c where  o.CNUM=c.CNUM AND c.city='SanJose');
Output :-
          +------+---------+------------+------+------+
          | ONUM | AMT     | ODATE      | CNUM | SNUM |
          +------+---------+------------+------+------+
          | 3001 |   18.69 | 1990-03-10 | 2008 | 1007 |
          | 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
          | 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
          | 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
          | 3007 |   75.75 | 1990-04-10 | 2004 | 1002 |
          | 3008 |    4723 | 1990-05-10 | 2006 | 1001 |
          | 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
          | 3010 | 1309.95 | 1990-06-10 | 2004 | 1002 |
          +------+---------+------------+------+------+
------------------------------------------------------------------------------------------------------------------------
39) Find all orders with above average amounts for their customers.
  Query :-
  output :-
-----------------------------------------------------------------------------------------------------------------------
40) Write a query that selects the highest rating in each city.
Query :- select CITY,max(RATING)from Customers group by CITY;
Output :-
          +---------+-------------+
          | CITY    | max(RATING) |
          +---------+-------------+
          | Berlin  |         300 |
          | London  |         100 |
          | Rome    |         200 |
          | SanJose |         300 |
          +---------+-------------+
------------------------------------------------------------------------------------------------------------------------
41) Write a query that calculates the amount of the salesperson’s commission
    on each order by a customer with a rating above 100.00.
Query :-
Output :-
------------------------------------------------------------------------------------------------------------------------
42) Count the customers with ratings above SanJose’s average.
Query :-
output:-
------------------------------------------------------------------------------------------------------------------------
43) Find all salespeople that are located in either Barcelona or London.

Query :- select * from salespeople where city='barcelona' or 'london';
Output :- +------+--------+-----------+------+
          | SNUM | SNAME  | CITY      | COMM |
          +------+--------+-----------+------+
          | 1007 | Rifkin | Barcelona |   15 |
          +------+--------+-----------+------+
------------------------------------------------------------------------------------------------------------------------
44) Find all salespeople with only one customer.
Query :- SELECT SNUM , SNAME FROM Salespeople GROUP BY SNUM  HAVING COUNT(SNUM)<=1;
Output :-
          +------+---------+
          | SNUM | SNAME   |
          +------+---------+
          | 1001 | Peel    |
          | 1002 | Serres  |
          | 1003 | AxelRod |
          | 1004 | Motika  |
          | 1007 | Rifkin  |
          | 1008 | Fran    |
          +------+---------+
------------------------------------------------------------------------------------------------------------------------

45) Write a query that joins the Customer table to itself to find all pairs or customers served by a single salesperson.
Query :-
Output:-
------------------------------------------------------------------------------------------------------------------------
46) Write a query that will give you all orders for more than $1000.00.
Query : -  select * from Orders where AMT>1000;
Output :-
         +------+---------+----------+------+------+
         | ONUM | AMT     | ODATE    | CNUM | SNUM |
         +------+---------+----------+------+------+
         | 3002 | 1900.10 | 10/03/90 | 2007 | 1004 |
         | 3005 | 5160.45 | 10/03/90 | 2003 | 1002 |
         | 3006 | 1098.16 | 10/03/90 | 2008 | 1007 |
         | 3008 | 4723.00 | 10/05/90 | 2006 | 1001 |
         | 3009 | 1713.23 | 10/04/90 | 2002 | 1003 |
         | 3010 | 1309.95 | 10/06/90 | 2004 | 1002 |
         | 3011 | 9891.88 | 10/06/90 | 2006 | 1001 |
         +------+---------+----------+------+------+
------------------------------------------------------------------------------------------------------------------------

47) Write a query that lists each order number followed by the name of the customer who made that order.
Query :-
          select OD.ONUM, CS.CNAME from Orders OD ,Customers CS where OD.CNUM = CS.CNUM order by ONUM ;
Output :-
          +------+----------+
          | ONUM | CNAME    |
          +------+----------+
          | 3001 | Cineros  |
          | 3002 | Pereira  |
          | 3003 | Hoffman  |
          | 3005 | Liu      |
          | 3006 | Cineros  |
          | 3007 | Grass    |
          | 3008 | Clemens  |
          | 3009 | Giovanni |
          | 3010 | Grass    |
          | 3011 | Clemens  |
          +------+----------+
------------------------------------------------------------------------------------------------------------------------
48) Write a query that selects all the customers whose ratings are equal to or greater than ANY(in the SQL sense) of
    ‘Serres’.
------------------------------------------------------------------------------------------------------------------------
49) Write two queries that will produce all orders taken on October 3 or October 4.
Query :-
             select * from Orders where Odate in('1990-03-10','1990-04-10');
Output :-
             +------+---------+------------+------+------+
             | ONUM | AMT     | ODATE      | CNUM | SNUM |
             +------+---------+------------+------+------+
             | 3001 |   18.69 | 1990-03-10 | 2008 | 1007 |
             | 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
             | 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
             | 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
             | 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
             | 3007 |   75.75 | 1990-04-10 | 2004 | 1002 |
             | 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
             +------+---------+------------+------+------+
------------------------------------------------------------------------------------------------------------------------


50) Find only those customers whose ratings are higher than every customer in Rome.
51) Write a query on the Customers table whose output will exclude all customers with a rating<= 100.00, unless they are located in Rome.
52) Find all rows from the customer’s table for which the salesperson number is 1001.
53) Find the total amount in orders for each salesperson where their total of amounts are greater than the amount of the largest order in the table.
54) Write a query that selects all orders save those with zeroes or NULL in the amount file.
55) Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a
rating of less than 200.
56) Find all salespeople name and commission.
57) Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s cnum
rather than his rating, so that it would still be usable if his rating is changed.
58) Find all salespeople for whom there are customers that follow them in alphabetical order.
59) Write a query that produces the names and ratings of all customers who have average orders.
60) Find the SUM of all Amounts from the orders table.
61) Write a SELECT command that produces the order number, amount, and the date from rows in the order table.
62) Count the number of non NULL rating fields in the Customers table (including repeats).
63) Write a query that gives the names of both the salesperson and the customer for each order after the order number.
64) List the commissions of all salespeople servicing customers in London.
65) Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
66) Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.
67) Write a query that selects all customers serviced by Peel or Motika. (Hint: The snum field relates the 2 tables to one another.)
68) Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should
be counted only once.)
69) Find all orders attributed to salespeople who live in London.
70) Find all orders by customers not located in the same cities as their salespeople.
71) Find all salespeople who have customers with more than one current order.
72) Write a query that extracts from the customer’s table every customer assigned to a salesperson, who is currently having at least one another
customer(besides the customer being selected) with orders in the Orders Table.
73) Write a query on the customer’s table that will find the highest rating in each city. Put the output in this form: for the city (city), the highest
rating is (rating).
74) Write a query that will produce the snum values of all salespeople with orders, having amt greater than 1000 in the Orders Table(without
repeats).
75) Write a query that lists customers in a descending order of rating. Output the rating field first, followed by the customer’s names and numbers.
76) Find the average commission for salespeople in London.
77) Find all orders credited to the same salesperson who services Hoffman.(cnum 2001).
78) Find all salespeople whose commission is in between 0.10 and 0.12(both inclusive).
79) Write a query that will give you the names and cities of all salespeople in London with a commission above 0.10.

80) Write a query that selects each customer’s smallest order.
81) Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.
82) Write a query that counts the number of different non NULL city values in the customers table.
83) Find the average amount from the Orders Table.
84) Find all customers who are not located in SanJose and whose rating is above 200.
85) Give a simpler way to write this query.SELECT snum, sname, city, comm FROM salespeople WHERE (comm > + 0.12 OR comm < 0.14);
86) Which salespersons attend to customers not in the city they have been assigned to?
87) Which salespeople get commission greater than 0.11 are serving customers rated less than 250?
88) Which salespeople have been assigned to the same city but get different commission percentages?
89) Which salesperson has earned the maximum commission?
90) Does the customer who has placed the maximum number of orders have the maximum rating?
91) List all customers in descending order of customer rating.
92) On which days has Hoffman placed orders?
93) Which salesmen have no orders between 10/03/1990 and 10/05/1990?
94) How many salespersons have succeeded in getting orders?
95) How many customers have placed orders?
96) On which date has each salesman booked an order of maximum value?
97) Who is the most successful salesperson?
98) Which customers have the same rating?
99) Find all orders greater than the average for October 4th.
100) List all customers with ratings above Grass’s average.
101) Which customers have above average orders?
102) Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.
103) Give names and numbers of all salespersons that have more than one customer?
104) Select all salespeople by name and number who have customers in their city whom they don’t service.
105) Does the total amount in orders by customer in Rome and London, exceed the commission paid to salesperson in London, and New York by
more than 5 times?
106) Which are the date, order number, amt and city for each salesperson (by name) for themaximum order he has obtained?
107) Which salesperson is having lowest commission?