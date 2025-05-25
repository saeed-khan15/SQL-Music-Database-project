# 🎵 Music Sales and Trends Analysis Using SQL

## 📊 Project Overview

This project explores a relational database of a digital music store to derive meaningful business insights using SQL. The database includes information on artists, albums, tracks, genres, customers, invoices, and employees.

The goal is to analyze customer behavior, track popularity, revenue trends, and employee impact using SQL queries and optional visualizations.

## 🛠️ Tools Used

- **PostgreSQL** 
- **Power BI  for visualization**

- ## 📁 Database Schema
- - `Artist`, `Album`, `Track`, `Genre`, `MediaType`
- `Customer`, `Invoice`, `InvoiceLine`
- `Employee`
- `Playlist`, `PlaylistTrack`

> Relationships:  
> - One-to-many between Artist → Album → Track  
> - Track is linked with Genre, MediaType, Playlist  
> - Track sales are captured in InvoiceLine  
> - Invoices link to Customers and are supported by Employees

## 💡 Business Questions Answered with SQL

### 🎧 Track & Genre Analysis

**1. Which genres generated the highest revenue?**  
```sql
SELECT g.Name AS Genre, ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS TotalRevenue
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY TotalRevenue DESC;

**2. What are the top 10 most purchased tracks by quantity?**
```sql
SELECT 
    t.name AS Track,
    SUM(il.Quantity) AS TotalSold
FROM 
    track t
JOIN 
   invoice_line il 
   ON t.track_id = il.track_id
GROUP BY 
    t.Name
ORDER BY 
    TotalSold DESC
LIMIT 10;
