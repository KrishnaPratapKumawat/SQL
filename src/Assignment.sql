1) Create table Salespeople.
Query:-
        CREATE TABLE Salespeople(
        SNUM int  PRIMARY KEY NOT NULL,
        SNAME varchar(40) NOT NULL,
        CITY  varchar(25) NOT NULL,
        COMM  int  NOT NULL
);
------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------

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
------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------
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
 ------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------