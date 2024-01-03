CREATE SCHEMA IF NOT EXISTS SalesData;

SET search_path TO SalesData;

CREATE TABLE IF NOT EXISTS Employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    egn VARCHAR(10) NOT NULL UNIQUE
);
