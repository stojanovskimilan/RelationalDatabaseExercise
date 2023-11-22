CREATE TABLE "Products" (
  "product_id" integer,
  "product_name" varchar,
  "manufacturer" varchar,
  "current_price" float,
  "quantity" integer,
  "category" varchar,
  "subcategory" varchar
);

CREATE TABLE "Supplier" (
  "supplier_id" integer,
  "supplier_name" varchar,
  "supplier_address" varchar,
  "product_id" integer
);

CREATE TABLE "ProductPrices" (
  "product_id" integer,
  "price" float,
  "valid_from" timestamp,
  "valid_to" timestamp,
  "created_at" timestamp
);

CREATE TABLE "OrderDetails" (
  "order_id" integer,
  "product_id" integer,
  "quantity" integer,
  "total" float,
  "trx_date" timestamp
);

CREATE TABLE "Orders" (
  "order_id" integer,
  "customer_id" integer,
  "order_created" timestamp,
  "order_sent" timestamp,
  "deliver_date" timestamp,
  "delivered" bit
);

CREATE TABLE "Customers" (
  "customer_id" integer,
  "customer_name" varchar,
  "customer_address" varchar,
  "sales_representative_employee_id" integer
);

CREATE TABLE "Employees" (
  "employee_id" integer,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "reports_to" varchar,
  "title" varchar
);
