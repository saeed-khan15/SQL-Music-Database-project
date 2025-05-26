# 🎵 Music Sales and Trends Analysis Using SQL
## 📊 Project Overview
This project explores a relational database of a digital music store to derive meaningful business insights using SQL. The database includes information on artists, albums, tracks, genres, customers, invoices, and employees.

The goal is to analyze customer behavior, track popularity, revenue trends, and employee impact using SQL queries and optional visualizations.
## 🛠️ Tools Used

- **PostgreSQL** 
- **Power BI  for visualization**

- ## 📁 Database Schema
- - - `Artist`, `Album`, `Track`, `Genre`, `MediaType`
- `Customer`, `Invoice`, `InvoiceLine`
- `Employee`
- `Playlist`, `PlaylistTrack`
- > Relationships:  
> - One-to-many between Artist → Album → Track  
> - Track is linked with Genre, MediaType, Playlist  
> - Track sales are captured in InvoiceLine  
> - Invoices link to Customers and are supported by Employees
## 💡 Business Questions Answered with SQL

### 🎧 Track & Genre Analysis
**1. Which genres generated the highest revenue?**  

**2. What are the top 10 most purchased tracks by quantity?**

**3. What is the average track length by genre?**


### 💿 Artist & Album Insights

**4. Which artists have generated the most revenue across all their tracks?**


**5. Which albums contain the highest number of tracks?**


### 📦 Sales & Revenue Trends
**6. What is the total revenue generated per month?**


**7. What is the average invoice value?**

**8. What are the top 5 invoices by total amount?**


### 👥 Customer Insights

**9. Which customers have spent the most?**


**10. How does revenue vary by country?**


**11. How many invoices has each customer generated?**



### 👨‍💼 Employee Analysis

**12. How many customers does each employee manage?**


**13.Find how much amount spent by each customer on best selling artist?**


