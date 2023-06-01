drop table transaction;
drop table cart;
drop table product;
drop table users;




create table users(
	user_id number(5) check(length(user_id)=5) not null primary key,
	username varchar(50) not null,
    password varchar(20)  not null,
    email varchar(50) unique not null,
    address varchar(50),
    phone varchar(11) check(length(phone)=11) not null
    );



create table product(
	pro_id number(5) check(length(pro_id)=5) not null primary key,
	pro_name varchar(50) not null,
	pro_model number not null,
	price number not null);



create table cart(
	cart_id number(4) check(length(cart_id)=4) not null primary key,
	user_id number(5) check(length(user_id)=5) not null,
	pro_id number(5) check(length(pro_id)=5) not null,
	quantity number not null,
	foreign key(user_id) references users(user_id) on delete cascade,
	foreign key(pro_id) references product(pro_id) on delete cascade);


create table transaction(
	transaction_id number(4) check(length(transaction_id)=4) not null primary key,
	user_id number(5) check(length(user_id)=5) not null,
	cart_id number(4) check(length(cart_id)=4) not null,
	payment_amount number(20) not null,
	payment_date DATE not null,
	foreign key(user_id) references users(user_id) on delete cascade,
	foreign key(cart_id) references cart(cart_id) on delete cascade);


           --add column--
alter table users add name char(20);

         --modify column--
alter table users modify name varchar(50);

        --rename column--

alter table users rename column name to fullname;

         --delete column--
alter table users drop column fullname;


