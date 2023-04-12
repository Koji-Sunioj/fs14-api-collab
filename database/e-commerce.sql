-- Table Definitions
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    categories VARCHAR(255) NOT NULL,
    size VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- unsafe, change to hashed password
    role VARCHAR(50) NOT NULL,
    banned BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Indexes
CREATE INDEX products_categories_idx ON products(categories);
CREATE INDEX users_email_idx ON users(email);
CREATE INDEX orders_created_at_idx ON orders(created_at);

-- Example Queries

-- Generate sample data
INSERT INTO products (product_name, description, categories, size, price)
VALUES ('THE COOL HAT', 'The coolest hat in the world', 'accessories', 'one size', 10.00),
       ('THE COOL SHIRT', 'The coolest shirt in the world', 'clothing', 'small', 20.00),
       ('THE COOL PANTS', 'The coolest pants in the world', 'clothing', 'medium', 30.00),
       ('THE COOL SHOES', 'The coolest shoes in the world', 'shoes', 'large', 40.00),
       ('THE COOL BAG', 'The coolest bag in the world', 'accessories', 'one size', 50.00);

INSERT INTO users (first_name, last_name, email, password, role)
VALUES ('John', 'Doe', 'johndoe@example.com', 'password', 'user'),
       ('Jane', 'Doe', 'janedoe@example.com', 'password', 'user'),
       ('Admin', 'User', 'adminuser@example.com', 'password', 'admin');

INSERT INTO orders (product_id, user_id, quantity, email, created_at)
VALUES (1, 1, 1, 'johndoe@example.com', '2021-01-01 00:00:00'),
       (2, 1, 1, 'johndoe@example.com', '2022-01-01 00:00:00'),
       (4, 2, 2, 'janedoe@example.com', '2023-01-01 00:00:00');


-- Get all products
SELECT * FROM products;

-- Get all products with a price less than 30
SELECT * FROM products WHERE price < 30;

-- Get all products that have been ordered
SELECT * FROM products
INNER JOIN orders ON products.product_id = orders.product_id;

-- 5. Fetch all orders for a user
SELECT * FROM orders WHERE user_id = 1;

-- 6. Fetch all orders within a specific date range
SELECT * FROM orders WHERE created_at BETWEEN '2023-01-01' AND '2023-04-10';

-- 7. Fetch all orders for a specific product
SELECT * FROM orders WHERE product_id = 1;


-- Codes for self destruct all data
-- DROP TABLE orders;
-- DROP TABLE users;
-- DROP TABLE products;