# 🎵 Music Sales and Trends Analysis Using SQL

## 📊 Project Overview

This project explores a relational database of a digital music store to derive meaningful business insights using SQL. The database includes information on artists, albums, tracks, genres, customers, invoices, and employees.

The goal is to analyze customer behavior, track popularity, revenue trends, and employee impact using SQL queries and optional visualizations.

## 🛠️ Tools Used

- **SQL** (PostgreSQL )
- **Optional**: Power BI  for visualization

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
