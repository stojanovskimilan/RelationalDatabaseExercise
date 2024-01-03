COPY Products(product_name, manufacturer, current_price, quantity, category, subcategory, discount_percentage)
FROM 'RDBMS_Exercise\Assignment 2.1-2.2\mock_data\product_data.csv' WITH DELIMITER ',' CSV HEADER;

COPY Supplier(product_name, manufacturer, current_price, quantity, category, subcategory, discount_percentage)
FROM 'RDBMS_Exercise\Assignment 2.1-2.2\mock_data\supplier_data.csv' WITH DELIMITER ',' CSV HEADER;

COPY ProductPrices(product_name, manufacturer, current_price, quantity, category, subcategory, discount_percentage)
FROM 'RDBMS_Exercise\Assignment 2.1-2.2\mock_data\product_prices_data.csv' WITH DELIMITER ',' CSV HEADER;

COPY OrderDetails(product_name, manufacturer, current_price, quantity, category, subcategory, discount_percentage)
FROM 'RDBMS_Exercise\Assignment 2.1-2.2\mock_data\order_details_data.csv' WITH DELIMITER ',' CSV HEADER;