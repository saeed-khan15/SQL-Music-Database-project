
/* 1. Which genres generated the highest revenue? */

SELECT g.Name AS Genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS TotalRevenue
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY TotalRevenue DESC;

/*2. What are the top 10 most purchased tracks by quantity?*/

SELECT 
t.name AS Track,
SUM(il.Quantity) AS TotalSold
FROM track t
JOIN invoice_line il 
ON t.track_id = il.track_id
GROUP BY t.Name
ORDER BY TotalSold DESC
LIMIT 10;

/*3. What is the average track length by genre?*/

SELECT 
g.Name AS Genre,
ROUND( AVG(t.Milliseconds))  AS AvgTrackLength
FROM Track t
JOIN  Genre g ON t.genre_id = g.genre_id
GROUP BY g.Name
ORDER BY AvgTrackLength DESC;

/*4. Which artists have generated the most revenue across all their tracks?*/

SELECT ar.Name AS Artist, SUM(il.unit_price * il.Quantity) AS Revenue
FROM invoice_line il
JOIN Track t
ON il.track_id = t.track_id
JOIN  Album a
ON t.album_id = a.album_id
JOIN Artist ar
ON a.artist_id = ar.artist_id
GROUP BY ar.Name
ORDER BY Revenue DESC;

/* 5. Which albums contain the highest number of tracks?*/

SELECT 
a.Title AS AlbumTitle,
ar.Name AS Artist,
COUNT(t.track_Id) AS NumberOfTracks
FROM album a
JOIN Artist ar
ON a.artist_id = ar.artist_id
JOIN Track t
ON a.album_id = t.album_id
GROUP BY 1,2
ORDER BY NumberOfTracks DESC;

/* 6. What is the total revenue generated per month?*/

SELECT DATE_TRUNC('month', invoice_date) AS month,
SUM(total) AS revenue
FROM invoice
GROUP BY 1
ORDER BY month;


/* 7. What is the average invoice value?*/

SELECT 
ROUND(AVG(Total)) AS AverageInvoiceValue
FROM Invoice;

/* 8. What are the top 5 invoices by total amount? */

SELECT 
    invoice_id,
    customer_id,
    invoice_date,
    Total
FROM Invoice
ORDER BY Total DESC
LIMIT 5;

/* 9. Which customers have spent the most? */

SELECT 
    c.first_name || ' ' || c.last_name AS CustomerName,
    ROUND(SUM(i.total) ) AS TotalSpent
FROM customer c
JOIN invoice i
ON c.Customer_id = i.Customer_id
GROUP BY c.Customer_id
ORDER BY TotalSpent DESC;

/* 10. How does revenue vary by country?*/

SELECT 
    c.Country,
    SUM(i.Total)AS Revenue
FROM customer c
JOIN invoice i 
ON c.customer_id = i.customer_id
GROUP BY c.Country
ORDER BY Revenue DESC;

/* 11. How many invoices has each customer generated? */

SELECT 
    c.Customer_id,
    c.first_name || ' ' || c.last_name AS CustomerName,
    COUNT(i.invoice_id) AS InvoiceCount
FROM customer c
LEFT JOIN Invoice i 
ON c.Customer_id = i.Customer_id
GROUP BY c.Customer_id, c.first_name, c.last_name
ORDER BY InvoiceCount DESC;

/* 12. How many customers does each employee manage?*/

SELECT 
    e.first_name || ' ' || e.last_name AS Employee,
    COUNT(c.customer_id) AS CustomerCount
FROM employee e
LEFT JOIN customer c 
ON e.employee_id = c.support_rep_id
GROUP BY e.employee_id;

/*  Find how much amount spent by each customer on best selling artist? Write a query to return customer name, artist name and total spent */

WITH best_selling_artist AS (
	SELECT artist.artist_id AS artist_id, artist.name AS artist_name, SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
	FROM invoice_line
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN album ON album.album_id = track.album_id
	JOIN artist ON artist.artist_id = album.artist_id
	GROUP BY 1
	ORDER BY 3 DESC
	LIMIT 1
)
SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name, SUM(il.unit_price*il.quantity) AS amount_spent
FROM invoice i
JOIN customer c ON c.customer_id = i.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t ON t.track_id = il.track_id
JOIN album alb ON alb.album_id = t.album_id
JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC;
