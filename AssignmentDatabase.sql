-- CREATING DATABASE
CREATE DATABASE IF NOT EXISTS ShoppingDB;
USE ShoppingDB;

-- drop tables
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS payment_methods;
DROP TABLE IF EXISTS billing_addresses;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;



-- PRODUCT TABLE
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories table
CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id INT NULL,
    FOREIGN KEY (parent_id) REFERENCES categories(category_id)
);
ALTER TABLE products ADD COLUMN category_id INT;
ALTER TABLE products ADD FOREIGN KEY (category_id) REFERENCES categories(category_id);

-- Main category for Electronics
INSERT INTO categories (name) VALUES ('Electronics');

-- Subcategories
INSERT INTO categories (name, parent_id) VALUES 
('Laptops', LAST_INSERT_ID()),
('Mobiles', LAST_INSERT_ID()),
('Headphones', LAST_INSERT_ID()),
('Television', LAST_INSERT_ID()),
('Gaming Consoles', LAST_INSERT_ID()),
('Cameras', LAST_INSERT_ID()),
('Drones', LAST_INSERT_ID()),
('Watches', LAST_INSERT_ID());

-- Insert 10 Laptops
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES 
('Alienware', 'High-performance gaming laptop.', 1500.00, 20, 2),
('Dell', 'Lightweight business laptop.', 1200.00, 15, 2),
('HP', 'Budget-friendly laptop for students.', 500.00, 25, 2),
('Lenovo yoga', '2-in-1 laptop and tablet.', 800.00, 10, 2),
('Macbook pro', 'Laptop with the best battery life.', 950.00, 18, 2),
('Asus zenbook', 'Gaming laptop with high refresh rate screen.', 1600.00, 12, 2),
('macbook air', 'Ultra-slim and light laptop.', 1400.00, 20, 2),
('Sony viom', 'Laptop with 4K display.', 1800.00, 8, 2),
('lenovo thinkpad', 'Rugged laptop for outdoor use.', 1200.00, 5, 2),
('Hp pavillion', 'Laptop with the best sound quality.', 1100.00, 10, 2);

-- Insert 10 Mobiles
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES 
('Samsung galaxy s24 ultra', 'Flagship smartphone with the best camera.', 1000.00, 30, 3),
('Google pixel', 'Budget-friendly smartphone with long battery life.', 300.00, 40, 3),
('one plus fold', 'Smartphone with the largest screen.', 900.00, 25, 3),
('Nokia', 'Rugged smartphone for outdoor use.', 450.00, 15, 3),
('iphone 15 pro', 'Smartphone with the fastest processor.', 1100.00, 20, 3),
('iphone SE', 'Compact smartphone for one-hand use.', 650.00, 30, 3),
('Sony Xperia', 'Smartphone with the best audio experience.', 550.00, 20, 3),
('LG', 'Eco-friendly smartphone.', 500.00, 25, 3),
('Samsung FOLD', 'Smartphone with innovative foldable design.', 1500.00, 10, 3),
('Asus', 'Gaming smartphone with cooling system.', 800.00, 18, 3);

-- Insert 10 Headphones
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES 
('Sony WH-1000XM4', 'Industry-leading noise cancellation headphones.', 350.00, 20, 4),
('Bose QuietComfort 35 II', 'Comfortable, top-rated noise-cancelling headphones.', 300.00, 15, 4),
('Sennheiser HD 560S', 'Open-back headphones for natural sound.', 200.00, 25, 4),
('Audio-Technica ATH-M50x', 'Professional studio monitor headphones.', 150.00, 30, 4),
('Beats Studio3 Wireless', 'High-performance wireless noise cancelling headphones.', 350.00, 18, 4),
('Jabra Elite 85h', 'Smart active noise cancellation and long battery life.', 250.00, 20, 4),
('Bowers & Wilkins PX7', 'Over-ear headphones with adaptive noise cancelling.', 400.00, 10, 4),
('Anker Soundcore Life Q20', 'Budget-friendly headphones with hybrid active noise cancellation.', 60.00, 40, 4),
('Logitech G Pro X', 'Gaming headset with surround sound and detachable mic.', 130.00, 22, 4),
('Marshall Monitor II A.N.C.', 'Iconic design with active noise cancellation.', 320.00, 15, 4);

-- Television
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES 
('Samsung QLED', '4K Smart QLED TV.', 1200.00, 20, 5),
('LG OLED', '55 inch 4K Ultra HD Smart OLED TV.', 1400.00, 15, 5),
('Sony Bravia', '65 inch 4K UHD Android LED TV.', 1600.00, 10, 5),
('TCL', '75 inch 4K UHD HDR Roku Smart LED TV.', 800.00, 5, 5),
('Hisense', '50 inch 4K UHD Android Smart LED TV.', 500.00, 25, 5),
('Vizio', '40 inch Full-Array LED Smart TV.', 300.00, 30, 5),
('Panasonic', '58 inch 4K UHD Smart LED TV.', 900.00, 20, 5),
('Philips', '65 inch 4K UHD Smart LED TV with Ambilight.', 1000.00, 18, 5),
('Sharp', '70 inch 4K UHD Android Smart LED TV.', 1100.00, 12, 5),
('JVC', '55 inch 4K UHD HDR Smart LED TV.', 600.00, 20, 5);

-- Gaming Consoles
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES 
('PlayStation 5', 'Latest generation console providing immersive gaming experiences.', 500.00, 30, 6),
('Xbox Series X', 'The fastest, most powerful Xbox ever.', 500.00, 25, 6),
('Nintendo Switch', 'Play at home on the TV or on-the-go with a vibrant 7-inch OLED screen.', 300.00, 40, 6),
('PlayStation 4 Slim', 'Incredible games and endless entertainment.', 250.00, 15, 6),
('Xbox One S', 'Enjoy disc-free gaming with the Xbox One S All-Digital Edition.', 200.00, 20, 6),
('Nintendo Switch Lite', 'Dedicated to handheld play.', 200.00, 35, 6),
('PlayStation 5 Digital Edition', 'Experience lightning-fast loading with an ultra-high-speed SSD.', 400.00, 30, 6),
('Xbox Series S', 'Smaller and sleek Xbox console.', 300.00, 25, 6),
('Sega Genesis Mini', 'A mini replica of the classic console.', 80.00, 50, 6),
('Atari Flashback 8', 'Classic game console with 120 built-in games.', 60.00, 40, 6);

-- Cameras
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES 
('Canon EOS R5', 'High-resolution mirrorless camera.', 3900.00, 10, 7),
('Nikon Z7 II', 'High-resolution, full-frame mirrorless camera.', 3000.00, 8, 7),
('Sony Alpha A7R IV', 'High-resolution full-frame mirrorless camera.', 3500.00, 12, 7),
('Fujifilm X-T4', 'Mirrorless camera with APS-C sensor.', 1700.00, 15, 7),
('Panasonic Lumix GH5', '4K video recording mirrorless camera.', 1500.00, 20, 7),
('Olympus OM-D E-M1 Mark III', 'Compact mirrorless with high-speed performance.', 1800.00, 10, 7),
('Pentax K-1 Mark II', 'Full-frame DSLR with high ISO capabilities.', 2000.00, 5, 7),
('Leica Q2', 'Full-frame compact camera with fixed lens.', 5000.00, 3, 7),
('Hasselblad X1D II 50C', 'Medium format mirrorless camera.', 6000.00, 2, 7);

-- Drones
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES 
('DJI Mavic Air 2', '4K drone with 34-min max flight time.', 800.00, 20, 8),
('DJI Phantom 4 Pro V2.0', 'Professional-grade drone with 4K camera.', 1500.00, 10, 8),
('Parrot Anafi', 'Portable drone that shoots 4K HDR video.', 700.00, 15, 8),
('DJI Mavic Mini', 'Compact and portable drone under 250g.', 400.00, 30, 8),
('Autel Robotics EVO II', '8K drone with 40-min flight time.', 1800.00, 8, 8),
('Skydio 2', 'AI-powered autonomous drone.', 1000.00, 12, 8),
('Yuneec Typhoon H3', 'Hexacopter drone with 4K camera.', 2000.00, 5, 8),
('PowerVision PowerEgg X', 'Waterproof drone that can land on water.', 900.00, 10, 8),
('DJI Inspire 2', 'Professional drone for cinematography.', 3000.00, 4, 8),
('FreeFly Alta X', 'Drone with 35lbs payload capacity.', 6000.00, 2, 8);


-- Watches
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES 
('Apple Watch Series 6', 'Smartwatch with ECG app and oxygen sensor.', 400.00, 25, 9),
('Samsung Galaxy Watch 3', 'Smartwatch with advanced health monitoring.', 350.00, 30, 9),
('Garmin Fenix 6', 'Multisport GPS watch.', 600.00, 20, 9),
('Fitbit Versa 3', 'Health & fitness smartwatch.', 230.00, 40, 9),
('Suunto 9 Baro', 'Durable multisport GPS watch.', 500.00, 15, 9),
('TAG Heuer Connected', 'Luxury smartwatch.', 1800.00, 10, 9),
('Casio G-Shock', 'Durable digital watch.', 100.00, 50, 9),
('Polar Vantage V2', 'Advanced multisport watch.', 500.00, 12, 9),
('Fossil Gen 5', 'Smartwatch with Wear OS by Google.', 295.00, 25, 9),
('Huawei Watch GT 2', 'Smartwatch with long battery life.', 200.00, 30, 9);



-- TABLE USER
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
INSERT INTO users (username, password) VALUES
('deepu@gmail.com', 'deepu'),
('prajakta@gmail.com', 'prajakta'),
('rahul@gmail.com', 'rahul'),
('manthan@gmail.com', 'manthan'),
('rucha@gmail.com', 'rucha'),
('deeps@gmail.com', 'deeps'),
('yash@gmail.com', 'yash'),
('linson@gmail.com', 'linson'),
('susan@gmail.com', 'susan'),
('hrithika@gmail.com', 'hrithika');

-- TABLE CART
CREATE TABLE IF NOT EXISTS carts (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO carts (user_id, product_id, quantity) VALUES (1, 3, 2);
INSERT INTO carts (user_id, product_id, quantity) VALUES (2, 2, 3);

-- Billing address table
CREATE TABLE IF NOT EXISTS billing_addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    address TEXT NOT NULL,
    cardholder_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);



INSERT INTO billing_addresses (user_id, address, cardholder_name) VALUES
(1, '1234 Main St, Anytown, USA', 'deepu'),
(2, '4321 Second St, Othertown, USA', 'Prajakta');





-- Payment table
CREATE TABLE IF NOT EXISTS payment_methods (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    card_number VARCHAR(16) NOT NULL,
    expiry_date DATE NOT NULL,
    cvv VARCHAR(3) NOT NULL,
    card_type ENUM('DEBIT', 'CREDIT') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

    
ALTER TABLE payment_methods ADD COLUMN billing_address VARCHAR(255);




INSERT INTO payment_methods (user_id, card_number, expiry_date, cvv, card_type) VALUES
(1, '1111222233334444', '2025-12-31', '123', 'CREDIT'),
(2, '5555666677778888', '2024-11-30', '321', 'CREDIT');

-- Transactions
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    payment_method_id INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id)
);

-- Orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);












