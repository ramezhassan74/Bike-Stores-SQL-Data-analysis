#  BikeStore Data Analysis Project

##  Project Overview
This project focuses on a comprehensive data analysis of the BikeStore company database.  
It involves:
- Setting up a relational database  
- Populating it with realistic business data  
- Executing complex SQL queries  

The goal is to extract meaningful insights regarding:
- Sales performance  
- Customer behavior  
- Inventory management  

---

##  Database Schema & Structure
The database is structured into two main schemas:

###  Production
Manages:
- Products  
- Brands  
- Categories  
- Stock levels  

###  Sales
Handles:
- Customer information  
- Store locations  
- Staff details  
- Order transactions  

---

##  Entity Relationship Diagram (ERD)
The project includes a visual representation of the database structure, showing relationships between:
- Products  
- Orders  
- Customers  

This ensures data integrity across the system.

---

##  Technical Implementation
The implementation is divided into three core SQL scripts:

1. **Schema Creation**
   - Defines tables  
   - Primary keys  
   - Foreign key constraints  

2. **Data Loading**
   - Populates tables with the initial dataset  

3. **Analytical Queries**
   - 24 strategic queries  
   - Designed to answer critical business questions  

---

##  Key Business Insights

| Metric                  | Finding                                      |
|------------------------|----------------------------------------------|
| Total Actual Customers | 1,445 active customers                       |
| Operating Stores       | 3 stores across 3 states (CA, NY, TX)        |
| Top Selling Category   | Cruisers Bicycles                            |
| Most Expensive Product | Trek Domane SLR 9 Disc (2018)                |

---

##  How to Use

1. Run `create objects.sql` in **SQL Server Management Studio (SSMS)** to build the database  
2. Execute `load data.sql` to populate the tables  
3. Run `SQLQuerysolving.sql` to view analysis and results  

---

##  Conclusion
This project demonstrates advanced SQL proficiency, including:
- Data modeling  
- Joins across multiple tables  
- Aggregate functions  
- Date manipulation  

All of which support effective data-driven business decision-making.
