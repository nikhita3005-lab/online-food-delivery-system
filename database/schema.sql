-- Online Food Delivery Management System Database

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT
);
CREATE TABLE Users(
        UID INTEGER PRIMARY KEY AUTO_INCREMENT,
        U_account VARCHAR(256) UNIQUE NOT NULL,
        U_password VARCHAR(64) NOT NULL,
        U_name VARCHAR(256) NOT NULL,
        U_type INT NOT NULL,
        U_latitude FLOAT NOT NULL,
        U_longitude FLOAT NOT NULL,
        U_phone VARCHAR(10) NOT NULL,
        U_balance INT NOT NULL,
        CONSTRAINT U_balance_non_negative CHECK (U_balance >= 0)
    );
CREATE TABLE Stores(
        S_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
        S_name VARCHAR(256) UNIQUE NOT NULL,
        S_latitude FLOAT NOT NULL,
        S_longitude FLOAT NOT NULL,
        S_phone VARCHAR(10) NOT NULL,
        S_foodtype VARCHAR(256) NOT NULL,
        S_owner INT NOT NULL,
        FOREIGN key (S_owner) REFERENCES Users(UID)
    );
