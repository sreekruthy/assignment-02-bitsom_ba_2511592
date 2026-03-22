/* customers table */
create table customers(
    customer_id varchar(10) primary key, 
    customer_name varchar(100) not null, 
    customer_email varchar(100) not null, 
    customer_city varchar(50) not null 
);

insert into customers values
('C001', 'Arya', 'arya@mail.com', 'Delhi'),
('C002', 'Dilip', 'dilip@mail.com', 'Mumbai'),
('C003', 'Chaitra', 'chaitra@mail.com', 'Chennai'),
('C004', 'Deepthi', 'deepthi@mail.com', 'Hyderabad'),
('C005', 'Arjun', 'arjun@mail.com', 'Bangalore');


/* products table */
create table products (
    product_id varchar(10) primary key,
    product_name varchar(100) not null,
    category varchar(50) not null,
    unit_price decimal(10,2) not null
);

insert into products values
('P001', 'Laptop', 'Electronics', 75000),
('P002', 'Notebook', 'Stationery', 300),
('P003', 'Headphones', 'Accessories', 2000),
('P004', 'Desk Chair', 'Furniture', 6000),
('P005', 'Monitor', 'Electronics', 12000);


/* offices table */
create table offices (
    office_id varchar(10) primary key,
    office_address text not null
);

insert into offices values
('O001', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('O002', 'South Zone, MG Road, Bangalore - 560001'),
('O003', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('O004', 'Chennai Branch, Anna Salai, Chennai - 600002'),
('O005', 'Hyderabad Office, Banjara Hills, Hyderabad - 500034');


/* sales reps table */
create table sales_reps (
    sales_rep_id varchar(10) primary key,
    sales_rep_name varchar(100) not null,
    sales_rep_email varchar(100) not null unique,
    office_id varchar(10) not null,
    foreign key (office_id) references offices(office_id)
);

insert into sales_reps values
('S001', 'Rahul', 'rahul@gmail.com', 'O001'),
('S002', 'Priya', 'priya@gmail.com', 'O002'),
('S003', 'Amit', 'amit@gmail.com', 'O003'),
('S004', 'Neha', 'neha@gmail.com', 'O004'),
('S005', 'Kiran', 'kiran@gmail.com', 'O005');


/* orders table */
create table orders (
    order_id varchar(10) primary key,
    customer_id varchar(10) not null,
    sales_rep_id varchar(10) not null,
    order_date date not null,
    foreign key (customer_id) references customers(customer_id),
    foreign key (sales_rep_id) references sales_reps(sales_rep_id)
);

insert into orders values
('ORD001', 'C001', 'S001', '2026-01-01'),
('ORD002', 'C002', 'S002', '2026-01-07'),
('ORD003', 'C003', 'S003', '2026-02-03'),
('ORD004', 'C004', 'S004', '2026-02-12'),
('ORD005', 'C005', 'S005', '2026-03-05');


/* order_items table */
create table order_items (
    order_id varchar(10) not null,
    product_id varchar(10) not null,
    quantity int not null,
    primary key (order_id, product_id),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

insert into order_items values
('ORD001', 'P001', 1),
('ORD002', 'P002', 7),
('ORD003', 'P003', 3),
('ORD004', 'P004', 2),
('ORD005', 'P005', 4);