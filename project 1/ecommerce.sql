#1
show databases;
create database ecommerce;
use ecommerce;
create table customer(cust_id int primary key, cust_type varchar(50) not null, cust_name varchar(100), cust_password varchar(20) not null, gender char(1), dob date, city varchar(50), email varchar(100), mobile_number int(10), address varchar(200));
desc customer;
create table seller(seller_id int primary key, seller_name varchar(100), seller_password varchar(20) not null, city varchar(50), email varchar(100), mobile_number int(10));
desc seller;
create table admin(admin_id int primary key, admin_name varchar(100), admin_password varchar(20) not null, email varchar(100), mobile_number varchar(10));
desc admin;
create table orders(status varchar(100) primary key, delivery_date date, order_date date);
desc orders;
create table cart(checkout varchar(50) primary key, make_payment int(10) not null, track_the_order varchar(100), foreign key(track_the_order) references orders(status));
desc cart;
create table view_products(cust_id int primary key, category varchar(100), subcategory varchar(100), multiple_tags varchar(100), segments varchar(100), brands varchar(100), add_to_cart varchar(100), foreign key(cust_id) references customer(cust_id), foreign key(add_to_cart) references cart(checkout));
desc view_products;
create table coupon(coupon_code int primary key, rule varchar(100), percentage float);
desc coupon;
create table product(product_id int primary key, product_name varchar(100), product_desc varchar(100), cost int, size int, quantity int, discount int, foreign key(discount) references coupon(coupon_code));
desc product;
create table review(product_id int, rev_id int primary key, rev_name varchar(100), rev_stars int, foreign key(product_id) references product(product_id));
desc review;
create table admin_or_seller(add_a_product int primary key, categories varchar(100), segments varchar(100), tags varchar(100), foreign key(add_a_product) references seller(seller_id), foreign key(add_a_product) references admin(admin_id));
desc admin_or_seller;

#2
insert into customer (cust_id, cust_type, cust_name, cust_password, gender, dob, city, email, mobile_number, address) values (101, 'premium', 'aman', 'aman@123', 'M', '2001-10-22', 'agra', 'amanmahour22@gmail.com', 821833762, 'chitra talkies agra');
select * from customer;
insert into seller (seller_id, seller_name, seller_password, city, email, mobile_number) values (201, 'adesh', 'adesh@123', 'agra', 'adesh@gmail.com', 874541123);
select * from seller;
insert into admin (admin_id, admin_name, admin_password, email, mobile_number) values (301, 'piyush', 'piyush@123', 'piyush@gmail.com', 987454612);
select * from admin;
insert into coupon (coupon_code, rule, percentage) values (200, 'one product', 20);
select * from coupon;
insert into product(product_id, product_name, product_desc, cost, size, quantity, discount) values (112, 'Denim Jeans', 'Awesome jeans', 3000, 32, 10, 200);
select * from product;
insert into review(product_id, rev_id, rev_name, rev_stars) values (112, 501, 'aman', 5);
select * from review;

#3
select * from customer order by city asc;
alter table product rename to prod_;
select * from customer where cust_name like "A%A";



