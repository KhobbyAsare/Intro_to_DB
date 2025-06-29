-- ALX Book Store Database Setup
-- This script creates the database and all tables

-- 1. First create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- 2. Switch to using this database
USE alx_book_store;

-- 3. Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 4. Create Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 5. Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT NOT NULL
);

-- 6. Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 7. Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- 8. Add indexes for better performance
CREATE INDEX idx_books_author ON Books(author_id);
CREATE INDEX idx_orders_customer ON Orders(customer_id);
CREATE INDEX idx_orderdetails_order ON Order_Details(order_id);
CREATE INDEX idx_orderdetails_book ON Order_Details(book_id);
