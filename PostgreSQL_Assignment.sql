CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0) NOT NULL,
    stock INT CHECK (stock >= 0) NOT NULL,
    published_year INT NOT NULL
);

INSERT INTO books (title, author, price, stock, published_year) VALUES
('To Kill a Mockingbird', 'Harper Lee', 12.99, 15, 1960),
('1984', 'George Orwell', 9.99, 20, 1949),
('The Great Gatsby', 'F. Scott Fitzgerald', 10.49, 18, 1925),
('Pride and Prejudice', 'Jane Austen', 11.99, 25, 1813),
('Moby-Dick', 'Herman Melville', 14.99, 10, 1851),
('War and Peace', 'Leo Tolstoy', 19.99, 5, 1869),
('The Catcher in the Rye', 'J.D. Salinger', 8.99, 22, 1951),
('Brave New World', 'Aldous Huxley', 9.49, 17, 1932),
('Crime and Punishment', 'Fyodor Dostoevsky', 13.99, 8, 1866),
('Wuthering Heights', 'Emily Brontë', 10.99, 12, 1847),
('The Odyssey', 'Homer', 15.99, 6, 1900),
('One Hundred Years of Solitude', 'Gabriel García Márquez', 12.49, 14, 1967),
('The Brothers Karamazov', 'Fyodor Dostoevsky', 16.99, 7, 1880),
('The Hobbit', 'J.R.R. Tolkien', 9.79, 30, 1937),
('Fahrenheit 451', 'Ray Bradbury', 8.79, 19, 1953),
('The Lord of the Rings', 'J.R.R. Tolkien', 22.99, 9, 1954),
('Dune', 'Frank Herbert', 18.99, 11, 1965),
('The Picture of Dorian Gray', 'Oscar Wilde', 10.29, 21, 1890),
('Dracula', 'Bram Stoker', 11.49, 16, 1897),
('Frankenstein', 'Mary Shelley', 9.99, 13, 1818),
('The Road', 'Cormac McCarthy', 14.99, 25, 2006),
('The Kite Runner', 'Khaled Hosseini', 13.49, 18, 2003),
('The Hunger Games', 'Suzanne Collins', 12.99, 30, 2008),
('A Game of Thrones', 'George R.R. Martin', 19.99, 22, 2003),
('The Night Circus', 'Erin Morgenstern', 15.49, 17, 2011),
('The Fault in Our Stars', 'John Green', 11.99, 20, 2012),
('The Girl on the Train', 'Paula Hawkins', 14.49, 12, 2015),
('Where the Crawdads Sing', 'Delia Owens', 16.99, 15, 2018),
('Educated', 'Tara Westover', 13.99, 14, 2018),
('Normal People', 'Sally Rooney', 12.49, 23, 2018),
('The Great Gatsby', 'F. Scott Fitzgerald', 10.49, 0, 1925),
('Pride and Prejudice', 'Jane Austen', 11.99, 0, 1813),
('War and Peace', 'Leo Tolstoy', 19.99, 0, 1869),
('Crime and Punishment', 'Fyodor Dostoevsky', 13.99, 0, 1866),
('The Odyssey', 'Homer', 15.99, 0, 800);

SELECT * FROM books;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    -- joined_date TIMESTAMP DEFAULT NOW()
    joined_date DATE DEFAULT CURRENT_DATE
);
INSERT INTO customers (name, email) VALUES
('Rakib Hasan', 'rakib@example.com'),
('Mehedi Hasan', 'mehedi@example.com'),
('Sadia Islam', 'sadia@example.com'),
('Tanvir Ahmed', 'tanvir@example.com'),
('Nusrat Jahan', 'nusrat@example.com'),
('Alif Rahman', 'alif@example.com'),
('Tanzila Akter', 'tanzila@example.com'),
('Shakil Hossain', 'shakil@example.com'),
('Mim Akter', 'mim@example.com'),
('Sabbir Khan', 'sabbir@example.com'),
('Arif Mahmud', 'arif@example.com'),
('Farhana Nila', 'farhana@example.com'),
('Hasibul Islam', 'hasibul@example.com'),
('Jannatul Ferdous', 'jannatul@example.com'),
('Zahid Hossain', 'zahid@example.com');
SELECT * FROM customers;

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0) NOT NULL,
    order_date TIMESTAMP DEFAULT NOW()
);
INSERT INTO orders (customer_id, book_id, quantity) VALUES
(1, 3, 2),
(2, 5, 1),
(3, 10, 3),
(4, 7, 1),
(5, 2, 5),
(6, 8, 2),
(7, 4, 1),
(8, 9, 3),
(9, 1, 4),
(10, 6, 2);

SELECT * FROM orders;

-- *1. Find books that are out of stock
SELECT * FROM books
    WHERE stock = 0;

-- *2. Retrieve the most expensive book in the store.
SELECT * FROM books
    WHERE price = (SELECT MAX(price) FROM books)

-- *3. Find the total number of orders placed by each customer.
SELECT customers.name, COUNT(orders.id) AS total_orders
    FROM orders 
    JOIN customers  ON orders.customer_id = customers.id
    GROUP BY customers.name;

-- *4. Calculate the total revenue generated from book sales.
SELECT SUM(books.price * orders.quantity) AS total_revenue
     FROM orders
    JOIN books ON orders.book_id = books.id;

-- *5. List all customers who have placed more than one order.
SELECT customers.name, COUNT(orders.id) AS  orders_count
    FROM customers
    JOIN orders ON customers.id = orders.customer_id
    GROUP BY customers.name
    HAVING COUNT(orders.id) > 1;

-- *6. Find the average price of books in the store.
SELECT ROUND(AVG(price), 2) AS avg_book_price
    FROM books;


-- *7. Increase the price of all books published before 2000 by 10%.
UPDATE books
 SET price = price * 1.10
 WHERE published_year < 2000

--  *8. Delete customers who haven't placed any orders.
DELETE FROM customers
    WHERE id NOT IN ( SELECT DISTINCT customer_id FROM orders);