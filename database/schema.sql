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
CREATE TABLE Orders(
        O_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
        O_status INT NOT NULL,
        O_start_time datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
        O_end_time datetime,
        O_distance FLOAT NOT NULL,
        O_amount INT NOT NULL,
        O_type INT NOT NULL,
        O_details BLOB NOT NULL,
        S_ID INT NOT NULL,
        FOREIGN key (S_ID) REFERENCES Stores(S_ID),
        CONSTRAINT O_amount_gt_zero CHECK (O_amount > 0)
    );
CREATE TABLE Process_Order(
        UID INT NOT NULL,
        O_ID INT NOT NULL,
        PO_type INT NOT NULL,
        PRIMARY key (UID, O_ID),
        FOREIGN key (UID) REFERENCES Users(UID),
        FOREIGN key (O_ID) REFERENCES Orders(O_ID)
    );
 CREATE TABLE Transaction_Record(
        T_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
        T_action INT NOT NULL,
        T_amount INT NOT NULL,
        is_refund INT DEFAULT 0 NOT NULL,
        T_time datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
        T_Subject INT,
        T_Object INT,
        FOREIGN key (T_Subject) REFERENCES Users(UID),
        FOREIGN key (T_Object) REFERENCES Users(UID)
    );
 CREATE TABLE Products(
        P_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
        P_name VARCHAR(256) NOT NULL,
        P_price INT unsigned NOT NULL,
        P_quantity INT unsigned NOT NULL,
        P_image BLOB NOT NULL,
        P_imagetype VARCHAR(25) NOT NULL,
        P_owner INT NOT NULL,
        P_store INT NOT NULL,
        FOREIGN key (P_owner) REFERENCES Users(UID),
        FOREIGN key (P_store) REFERENCES Stores(S_ID),
        CONSTRAINT P_quantity_non_negative CHECK (P_quantity >= 0)
    );
