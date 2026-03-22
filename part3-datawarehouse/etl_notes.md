## ETL Decisions


### Decision 1 - Standardizing date formats

Problem: The dataset had dates in different formats like DD-MM-YYYY, MM/DD/YYYY and some were already in YYYY-MM-DD. This made it difficult to group data by month or year.

Resolution: I standardized all dates into a ISO standard format. I also created a numeric date_id (YYYYMMDD). Then I extracted year, month and month name to create a proper date dimension. The date_id acts as a smart key for the dim_date table, making the joins in my analytical queries much faster than joining on string based dates.  


### Decision 2 — Fixing inconsistent category values

Problem: Product categories were written in different ways such as electronics vs Electronics, Grocery vs Groceries. This would cause incorrect aggregation because SQL treats them as different values.

Resolution: I did normalization to force all category strings to Title Case(using str.lower().str.capitalize()) and mapped plural terms (Groceries) to their singular form (Grocery) before inserting into the dimension table. This ensures correct grouping and avoids duplicate categories.


### Decision 3 — Handling invalid and missing references

Problem: I found missing store_city values and some transaction rows that didn't have a matching product in the dimension table. This would have caused foreign key violations and crashed the database load.

Resolution: I handled the missing cities by mapping them based on the store name (eg- filling "Chennai" for "Chennai Anna"). I also made sure every product_id in the fact_sales table actually existed in dim_product first. This ensured referential integrity so that every sale is correctly linked to a valid product and location. 

