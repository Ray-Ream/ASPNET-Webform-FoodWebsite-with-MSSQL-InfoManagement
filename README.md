# ASPNET-Webform-FoodWebsite-with-MSSQL-InforManagement

This project demonstrates the development of a food management website using the ASP.NET WebForms framework and Microsoft SQL Server.  
It focuses on implementing content management features  
- including Create, Edit, Delete, and Update operations  
- along with database-driven user authentication and multi-level access control for secure administrative management.

---

## Table of contents  
- [Getting Started](#getting-started)  
- [Database Integration](#database-integration)  
- [System Overview](#system-overview)  

---

### Getting Started  
The system is built on the ASP.NET WebForms architecture and requires Microsoft SQL Server as the backend database.  

###### Development configuration requirements  
1. **IDE:** Visual Studio 2022 (Community / Professional / Enterprise)  
2. **.NET Framework:** 4.8 or higher (or .NET 6+ for modernized versions)  
3. **UI Framework:** ASP.NET Web Forms  
4. **Operating System:** Windows 10 or above  

###### Installation steps  
Clone the repository:  
```sh
https://github.com/Ray-Ream/ASPNET-Webform-FoodWebsite-with-MSSQL-InfoManagement.git
```

---

### Database Integration
The system is fully integrated with Microsoft SQL Server, which stores all food-related data, including item details, pricing, and browsing statistics.  
Each food item is represented as a row in the database table, with schema design ensuring flexibility and consistency across operations.  

- Database ERD:  
![image](https://github.com/Ray-Ream/ASPNET-Webform-FoodWebsite-with-MSSQL-InfoManagement/blob/master/images/erd-1.png)
![image](https://github.com/Ray-Ream/ASPNET-Webform-FoodWebsite-with-MSSQL-InfoManagement/blob/master/images/erd-2.png)

Category Table:  
| Column Name      | Data Type      | Allow Null | Description                                 |
| ---------------- | -------------- | ---------- | --------------------------------------------|
| **id**           | `int`          | No         | Unique identifier for each category item.   |
| **name**         | `nvarchar(50)` | Yes        | Category description name .                 |

Foods Table:  
| Column Name      | Data Type      | Allow Null | Description                                           |
| ---------------- | -------------- | ---------- | ----------------------------------------------------- |
| **id**           | `int`          | No         | Unique identifier for each food item.                 |
| **img**          | `nvarchar(50)` | Yes        | Image file path or filename associated with the dish. |
| **name**         | `nvarchar(50)` | Yes        | Name of the food displayed on the website.            |
| **ingredients**  | `nvarchar(50)` | Yes        | List of main ingredients.                             |
| **price**        | `nvarchar(50)` | Yes        | Price or price range.                                 |
| **fromCategory** | `int`          | Yes        | Category reference (foreign key).                     |
| **clickTimes**   | `int`          | Yes        | Number of user clicks or views.                       |
