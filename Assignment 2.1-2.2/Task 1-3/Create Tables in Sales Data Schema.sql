CREATE SCHEMA IF NOT EXISTS SalesData;

SET search_path TO SalesData;

CREATE OR REPLACE FUNCTION calculate_total(product_id_arg integer, quantity_arg integer)
RETURNS float AS $$
    SELECT current_price * quantity_arg FROM Products WHERE product_id = product_id_arg;
$$ LANGUAGE SQL IMMUTABLE;

CREATE OR REPLACE FUNCTION calculate_total_after_discount(product_id_arg integer, quantity_arg integer)
RETURNS float AS $$
    SELECT (1 - discount_percentage) * current_price * quantity_arg FROM Products WHERE product_id = product_id_arg;
$$ LANGUAGE SQL IMMUTABLE;

CREATE OR REPLACE FUNCTION update_order_details_total()
RETURNS TRIGGER AS $$
BEGIN
    NEW.total := calculate_total(NEW.product_id, NEW.quantity);
    NEW.total_after_discount := calculate_total_after_discount(NEW.product_id, NEW.quantity);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Creating the tables
CREATE TABLE IF NOT EXISTS Products (
  product_id SERIAL PRIMARY KEY,
  product_name varchar,
  manufacturer varchar,
  current_price float,
  quantity integer,
  category varchar,
  subcategory varchar,
  discount_percentage decimal(5, 2)
);

CREATE TABLE IF NOT EXISTS Supplier (
  supplier_id SERIAL PRIMARY KEY,
  supplier_name varchar,
  supplier_address varchar,
  product_id integer REFERENCES Products(product_id)
);

CREATE TABLE IF NOT EXISTS ProductPrices (
  product_id integer PRIMARY KEY REFERENCES Products(product_id),
  price float,
  valid_from timestamp,
  valid_to timestamp,
  created_at timestamp
);

CREATE TABLE IF NOT EXISTS OrderDetails (
  order_id SERIAL PRIMARY KEY,
  product_id integer REFERENCES Products(product_id),
  quantity integer,
  total float,
  discount_percentage decimal(5, 2),
  total_after_discount float,
  trx_date timestamp,
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


CREATE TRIGGER update_order_details_total_trigger
BEFORE INSERT OR UPDATE ON OrderDetails
FOR EACH ROW EXECUTE FUNCTION update_order_details_total();
