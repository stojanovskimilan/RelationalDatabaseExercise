CREATE SCHEMA IF NOT EXISTS UserManagement;

SET search_path TO UserManagement;

CREATE TABLE IF NOT EXISTS users (
    user_name VARCHAR(100) NOT NULL UNIQUE,
	user_active VARCHAR(1) NOT NULL,
	employee_id INT NOT NULL,
    CONSTRAINT fk_employee_user FOREIGN KEY (employee_id) REFERENCES SalesData.Employee(employee_id),
    PRIMARY KEY(user_name)
);
CREATE TABLE IF NOT EXISTS roles(
	role_id VARCHAR(100) NOT NULL UNIQUE,
	role_name VARCHAR(100) NOT NULL,
	role_active VARCHAR(1) NOT NULL,
    PRIMARY KEY(role_id)

);
CREATE TABLE IF NOT EXISTS user_roles(
	user_name VARCHAR(100) NOT NULL,
	role_id VARCHAR(100) NOT NULL,
	FOREIGN KEY (user_name) REFERENCES users(user_name),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    PRIMARY KEY (user_name, role_id)

);
CREATE TABLE IF NOT EXISTS permissions(
	permission_id VARCHAR(10) NOT NULL,
	permission_name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (permission_id)

);
CREATE TABLE IF NOT EXISTS role_permissions(
	role_id VARCHAR(100) NOT NULL,
	permission_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (role_id, permission_id),
	FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)

);



RESET search_path;