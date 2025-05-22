-- 1. Покупатели
CREATE TABLE d_customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    country VARCHAR(50),
    postal_code VARCHAR(20)
);

CREATE TABLE d_pet (
    pet_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES d_customer(customer_id),
    pet_type VARCHAR(50),
    pet_name VARCHAR(50),
    pet_breed VARCHAR(50)
);

CREATE TABLE d_seller (
    seller_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    postal_code VARCHAR(20)
);

CREATE TABLE d_product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price FLOAT,
    quantity INT,
    weight DECIMAL(10,2),
    color VARCHAR(30),
    size VARCHAR(30),
    brand VARCHAR(50),
    material VARCHAR(50),
    description TEXT,
    release_date DATE,
    expiry_date DATE
);

CREATE TABLE d_product_rating (
    rating_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES d_product(product_id),
    rating DECIMAL(3,2),
    reviews TEXT
);

CREATE TABLE f_sale (
    sale_id SERIAL PRIMARY KEY,
    sale_date DATE,
    customer_id INT REFERENCES d_customer(customer_id),
    seller_id INT REFERENCES d_seller(seller_id),
    product_id INT REFERENCES d_product(product_id),
    quantity INT,
    total_price DECIMAL(10,2),
    store_id INT
);

CREATE TABLE d_store (
    store_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);


ALTER TABLE f_sale
ADD CONSTRAINT fk_store
FOREIGN KEY (store_id) REFERENCES d_store(store_id);

CREATE TABLE d_supplier (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE product_to_supplier (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES d_product(product_id),
    supplier_id INT REFERENCES d_supplier(supplier_id),
    UNIQUE (product_id, supplier_id) -- защита от дублей
);
