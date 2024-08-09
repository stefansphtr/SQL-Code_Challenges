# Question List

## 1. CTE & Subquery

### 1.1 Identify the Top-Selling Artist

As the lead data analyst for a prominent music event management company, you have been entrusted with a dataset containing concert revenue and detailed information about various artists.

Your mission is to unlock valuable insights by analyzing the concert revenue data and identifying the top revenue-generating artists within each music genre.

Write a query to rank the artists within each genre based on their revenue per member and extract the top revenue-generating artists from each genre. Display the output of the artist name, genre, concert revenue, number of members, and revenue per band member, sorted by the highest revenue per member within each genre.

`concerts` Schema:

| Column Name         | Type          | Description                                                  |
|---------------------|---------------|--------------------------------------------------------------|
| artist_id           | integer       | A unique identifier for each artist or band performing in the concert. |
| artist_name         | varchar(100)  | The name of the artist or band performing in the concert.     |
| genre               | varchar(50)   | The music genre associated with the concert.                 |
| concert_revenue     | integer       | The total revenue generated from the concert.                |
| year_of_formation   | integer       | The year that the artist or band was formed.                 |
| country             | varchar(50)   | The country of origin or residence of the artist or band.    |
| number_of_members   | integer       | The number of members in the band.                           |
| album_released      | integer       | The total number of albums released by the artist or band.   |
| label               | varchar(100)  | The record label or music company associated with the artist or band. |

`concerts` Example Input:

| artist_id | artist_name  | genre | concert_revenue | year_of_formation | country       | number_of_members | album_released | label             |
|-----------|--------------|-------|-----------------|-------------------|---------------|-------------------|----------------|-------------------|
| 103       | Taylor Swift | Pop   | 700000          | 2004              | United States | 1                 | 9              | Republic Records  |
| 104       | BTS          | K-Pop | 800000          | 2013              | South Korea   | 7                 | 7              | Big Hit Music     |
| 105       | Adele        | Pop   | 600000          | 2006              | United Kingdom| 1                 | 3              | Columbia Records  |
| 109       | Blackpink    | K-Pop | 450000          | 2016              | South Korea   | 4                 | 5              | YG Entertainment  |
| 110       | Maroon 5     | Pop   | 550000          | 1994              | United States | 5                 | 7              | Interscope Records|

### 1.2 Supercloud Customer

A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category listed in the `products` table.

Write a query that identifies the customer IDs of these Supercloud customers.

`customer_contracts` Table

| Column Name | Type    |
|-------------|---------|
| customer_id | integer |
| product_id  | integer |
| amount      | integer |

`customer_contracts` Example Input

| customer_id | product_id | amount |
|-------------|------------|--------|
| 1           | 1          | 1000   |
| 1           | 3          | 2000   |
| 1           | 5          | 1500   |
| 2           | 2          | 3000   |
| 2           | 6          | 2000   |

`products` Table

| Column Name      | Type   |
|------------------|--------|
| product_id       | integer|
| product_category | string |
| product_name     | string |

`products` Example Input

| product_id | product_category | product_name               |
|------------|------------------|----------------------------|
| 1          | Analytics        | Azure Databricks           |
| 2          | Analytics        | Azure Stream Analytics     |
| 4          | Containers       | Azure Kubernetes Service   |
| 5          | Containers       | Azure Service Fabric       |
| 6          | Compute          | Virtual Machines           |
| 7          | Compute          | Azure Functions            |

Example Output:

|customer_id|
|-----------|
|1|

Explanation:
Customer 1 bought from Analytics, Containers, and Compute categories of Azure, and thus is a Supercloud customer. Customer 2 isn't a Supercloud customer, since they don't buy any container services from Azure.

### 1.3 Swapped Food Delivery

Zomato is a leading online food delivery service that connects users with various restaurants and cuisines, allowing them to browse menus, place orders, and get meals delivered to their doorsteps.

Recently, Zomato encountered an issue with its delivery system. Due to an error in the delivery driver's instructions, each item's order was swapped with the item in the subsequent row. As a data analyst, you're asked to correct this swapping error and return the proper pairing of order ID and item.

If the last item has an odd order ID, it should remain as the last item in the corrected data. For example, if the last item is Order ID 7 Tandoori Chicken, then it should remain as Order ID 7 in the corrected data.

In the results, return the correct pairs of order IDs and items.

`orders` Schema:
| column_name | type    | description                        |
|-------------|---------|------------------------------------|
| order_id    | integer | The ID of each Zomato order.       |
| item        | string  | The name of the food item in each order. |

`orders` Example Input:
Here's a sample of the initial incorrect data:

| order_id | item            |
|----------|-----------------|
| 1        | Chow Mein       |
| 2        | Pizza           |
| 3        | Pad Thai        |
| 4        | Butter Chicken  |
| 5        | Eggrolls        |
| 6        | Burger          |
| 7        | Tandoori Chicken|

orders Example Output:

The corrected data should look like this:

| corrected_order_id | item            |
|--------------------|-----------------|
| 1                  | Pizza           |
| 2                  | Chow Mein       |
| 3                  | Butter Chicken  |
| 4                  | Pad Thai        |
| 5                  | Burger          |
| 6                  | Eggrolls        |
| 7                  | Tandoori Chicken|

Order ID 1 is now associated with Pizza and Order ID 2 is paired with Chow Mein. This adjustment ensures that each order is correctly aligned with its respective item, addressing the initial swapping error.

Order ID 7 remains unchanged and is still associated with Tandoori Chicken. This preserves the order sequence ensuring that the last odd order ID remains unaltered.
