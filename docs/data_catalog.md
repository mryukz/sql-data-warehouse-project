# Data Dictionary for Gold Layer

# Overview

The Gold Layer is the business-level date representation, structured to be used for analytical and reporting use cases.
It consists of **Dimensions** and **Facts** tables for specific business metrics.

----

# 1. gold.dim_customers
  * **Purpose**: Stores customer details enriched with demographic and geopgraphic data.
  * **Columns**:

| **Column Name** | **Data Type** | **Description** |
|      :---:      |     :---:     |      :---       |
|  customer_key   |      INT      | Surrogate key uniquely identifying each customer record in the dimension table. |
|  customer_id    |      INT      | Unique numerical identifier assigned to each customer. |
|  customer_number|  VARCHAR(50)  | Alphanumeric identifier representing the customer, used for tracking and referencing. |
|  first_name     |  VARCHAR(50)  | The customer's first name, as recorded in the system. |
|  last_name      |  VARCHAR(50)  | The customer's last name, as recorded in the system. |
|  country        |  VARCHAR(50)  | The country of residence of the customer. (i.e. Japan) |
|  marital_status |  VARCHAR(50)  | The marital status of the customer. (i.e. 'Single' or 'Married') |
|  gender         |  VARCHAR(50)  | The gender of the customer. (i.e. 'Male' or 'Female') |
|  birthdate      |     DATE      | The birthdate of the customer, fomratted as YYYY-MM-DD. (i.e. 1995-04-08) |
|  create_date    |     DATE      | The creation date of the data in the system records. |

# 2. gold.dim_products
  * **Purpose**: Provide information regarding the products.
  * **Columns**:

| **Column Name** | **Data Type** | **Description** |
|      :---:      |     :---:     |      :---       |
|  product_key    |      INT      | Surrogate key uniquely identifying each product record in the dimension table. |
|  product_id     |      INT      | Unique numerical identifier assigned to each product. |
|  product_number |  VARCHAR(50)  | A structured alphanumeric code representing the products, often used for inventory and categorization. |
|  product_name   |  VARCHAR(50)  | Descriptive name of the product, including details such as colory, type, and size. |
|  category_id    |  VARCHAR(50)  | A unique identifier for the products category. |
|  category       |  VARCHAR(50)  | The broader classification of the products, (i.e. components, bikes) to group related items. |
|  subcategory    |  VARCHAR(50)  | A more detailed classification of the products, such as product type. |
|  maintenance    |  VARCHAR(50)  | Indicates whether the products need a maintenance. (i.e. 'Yes' or 'No') |
|  cost           |      INT      | The cost or base price for the product. In monetary units. |
|  product_line   |  VARCHAR(50)  | The specific product line to which the product belongs to. (i.e. Road, Mountain) |
|  start_date     |     DATE      | The date when the product is available for sale in the record system. |

# 3. gold.fact_sales
  * **Purpose**: Stores transactional sales for analytical purpose.
  * **Columns**:

| **Column Name** | **Data Type** | **Description** |
|      :---:      |     :---:     |      :---       |
|  order_number   |  VARCHAR(50)  | A unique alphanumeric identifier for each sales record. (i.e. 'S054996') |
|  product_key    |      INT      | Surrogate key linking the order to the product dimension table. |
|  customer_key   |      INT      | Surrogate key linking the order to the customer dimension table. |
|  order_date     |     DATE      | The date the order was placed. |
|  shipping_date  |     DATE      | The date the order was shipped. |
|  due_date       |     DATE      | The date when the order payment was due. |
|  sales_amount   |      INT      | The total amount of value of the sale for the line item. (i.e. 40) |
|  quantity       |      INT      | The total quantity of the product sold or ordered for the line item |
|  price          |      INT      | The price per unit of the product for the line item. (i.e. 5) |


