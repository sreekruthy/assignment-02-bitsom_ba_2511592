## Anomaly Analysis

Insert Anomaly:
Columns: product_id, product_name
A new product (product_id = P009) cannot be inserted without filling order_id, customer_id.
Product cannot be added independently. This forces insertion of unnecessary order data.

Update Anomaly:
Columns: customer_id = C008, customer_email
C008 appears in multiple rows (eg- rows 0,5,9,..) 
Updating email requires modifying multiple records, leading to inconsistency if missed.

Delete Anomaly:
Row: 11 (order_id = ORD1185, product_id = P008)
Deleting this row removes all data about product P008 from the database.


## Normalization Justification

Keeping everything in a single table might seem simpler and easy to access, but in this dataset it actually creates several problems. The orders_flat.csv file contains a lot of repeated data. For example, the same customer(C008) appears in many rows with same details like name, email and city and this happens whenever a customer places multiple orders. If the customer changes their email, it has to be updated in every row where that customer appears. If even one row is missed, the data becomes inconsistent and leads to update anomaly. This repetition of the same data leads to high data redundancy which increases storage usage and makes the system inefficient.
The same issue occurs with product information. Product details such as name, category and unit_price are repeated across multiple orders. If the price of a product is changed, multiple rows must be updated which is inefficient. There are also insert and delete problems. It is not possible to add a new product or customer unless an order is created for them, which is not always practical. Similarly, if an order is deleted and that product appears only once (like P008), all information about that product is lost. By normalizing the data into separate tables such as customers, products, orders and order_items, these issues are avoided. Each type of data is stored only once, making updates easier and reducing redundancy. The database becomes more scalable, as new customers, products or orders can be added without affecting existing data. This ensures data consistency, prevents data loss and makes the database organized and easier to maintain in the long run.

