insert into users (user_id, username, password, email, address, phone) values (11111, 'Saif', 'password1', 'saif@gmail.com', 'Khulna', '01790523450');
insert into users (user_id, username, password, email, address, phone) values (22222, 'Saif1', 'password2', 'saif1@gmail.com', 'Khulna', '01790523451');
insert into users (user_id, username, password, email, address, phone) values (33333, 'Saif2', 'password3', 'saif2@gmail.com', 'Khulna', '01790523452');
insert into users (user_id, username, password, email, address, phone) values (44444, 'Saif3', 'password4', 'saif3@gmail.com', 'Khulna', '01790523453');
insert into users (user_id, username, password, email, address, phone) values (55555, 'Saif4', 'password5', 'saif4@gmail.com', 'Khulna', '01790523454');
insert into users (user_id, username, password, email, address, phone) values (66666, 'Saif5', 'password6', 'saif5@gmail.com', 'Khulna', '01790523455');
insert into users (user_id, username, password, email, address, phone) values (77777, 'Saif6', 'password7', 'saif6@gmail.com', 'Khulna', '01790523456');
insert into users (user_id, username, password, email, address, phone) values (88888, 'Saif7', 'password8', 'saif7@gmail.com', 'Khulna', '01790523457');
insert into users (user_id, username, password, email, address, phone) values (99999, 'Saif8', 'password9', 'saif8@gmail.com', 'Khulna', '01790523458');
insert into users (user_id, username, password, email, address, phone) values (12334, 'Saif9', 'password0', 'saif9@gmail.com', 'Khulna', '01790523459');



insert into product (pro_id, pro_name, pro_model,price) values (10001, 'mobile', 111,20000);
insert into product (pro_id, pro_name, pro_model,price) values (10002, 'pixel', 112,30000);
insert into product (pro_id, pro_name, pro_model,price) values (10003, 'camera', 113,40000);
insert into product (pro_id, pro_name, pro_model,price) values (10004, 'console', 114,50000);
insert into product (pro_id, pro_name, pro_model,price) values (10005, 'tv', 115,60000);
insert into product (pro_id, pro_name, pro_model,price) values (10006, 'fridge', 116,70000);
insert into product (pro_id, pro_name, pro_model,price) values (10007, 'led monitor', 117,80000);
insert into product (pro_id, pro_name, pro_model,price) values (10008, 'iphone', 118,90000);
insert into product (pro_id, pro_name, pro_model,price) values (10009, 'gaming laptop', 119,100000);
insert into product (pro_id, pro_name, pro_model,price) values (10010, 'hand mobile', 120,10000);
																									


insert into cart (cart_id, user_id, pro_id, quantity) values (1001, 11111, 10001, 2);
insert into cart (cart_id, user_id, pro_id, quantity) values (1002, 22222, 10005, 1);
insert into cart (cart_id, user_id, pro_id, quantity) values (1003, 77777, 10001, 2);
insert into cart (cart_id, user_id, pro_id, quantity) values (1004, 33333, 10002, 3);
insert into cart (cart_id, user_id, pro_id, quantity) values (1005, 11111, 10006, 1);
insert into cart (cart_id, user_id, pro_id, quantity) values (1006, 11111, 10007, 1);
insert into cart (cart_id, user_id, pro_id, quantity) values (1007, 88888, 10009, 1);
insert into cart (cart_id, user_id, pro_id, quantity) values (1008, 88888, 10002, 1);
insert into cart (cart_id, user_id, pro_id, quantity) values (1009, 44444, 10001, 2);
insert into cart (cart_id, user_id, pro_id, quantity) values (1010, 33333, 10003, 1);


insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1011, 11111, 1001, 40000, date '2023-05-01');
insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1022, 22222, 1002, 14450, date '2023-05-04');
insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1033, 77777, 1003, 40000, date '2023-04-02');
insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1044, 33333, 1004, 54000, date '2023-05-09');
insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1055, 11111, 1005, 20000, date '2023-04-08');
insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1066, 11111, 1006, 11999, date '2023-05-09');
insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1077, 88888, 1007, 18999, date '2023-05-08');
insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1088, 88888, 1008, 18000, date '2023-05-04');
insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1099, 44444, 1009, 40000, date '2023-05-20');
insert into transaction (transaction_id, user_id, cart_id, payment_amount, payment_date) values (1012, 33333, 1010, 20000, date '2023-05-06');





                                         --QUERY--

                                  ---Select command--
select * from users;
select * from product;
select * from cart;
select * from transaction;
select * from users where user_id=22222;
select pro_model,price/20 as price2 from product;



                              --Select Distinct/all---
select distinct user_id from transaction;
select all user_id from transaction;
select distinct(price),pro_name from product;



                                   --With clause---
with max_price(val) as (select max(price) from product) select pro_name,price from product,max_price where product.price=max_price.val;





                             --Nested subquery---
select pro_name from product where pro_id=(select pro_id from cart where cart_id=(select cart_id from transaction where payment_date=date '2023-05-01'));





                             --Updating data--
update users set username='Saifx' where user_id=11111;
select * from users;



                           --Deleting a row--
delete from users where user_id=99999;




                              --Where clause
select users.username,product.pro_name from users,product where price>40000;




                              --Rename Operation
select u.username,p.pro_name from users u,product p where price>30000;





                                --String Operation
select username from users where username like 'S%';
select username,email from users where username like '_A_' or username like '____';




                                  --Order by Clause--
select username,email from users order by username;



                              --Where clause predicates
select pro_name,price from product where price between 50000 and 20000;




                                   --Set operations
select username from users where username like 's___' union select username from users where username like '___';
select username from users where username like 's___' intersect select username from users where username like '___';





                                    ---Agregate Functions
select count(cart_id) as no_of_cart from transaction;
select avg(payment_amount) from transaction group by cart_id;
select sum(price) from product;
select max(price) from product;
select min(price) from product;





                                        --Group by and Having
select pro_id,avg(quantity) from cart group by pro_id having avg(quantity)>=2;





                                            --Set Membership
select user_id from cart where pro_id = 10001 and user_id in (select user_id from cart where pro_id=10007);
select user_id from cart where pro_id = 10001 and user_id not in (select user_id from cart where pro_id=10002);





                                            --Some/All/Exists
select * from cart where quantity> some(select quantity from cart where quantity>=2);
select * from cart where quantity> all(select quantity from cart where quantity>=1);
select * from cart where quantity>=2 and exists(select * from users where username like 's%');




                                           --Join--
select username,quantity from users join cart using(user_id);
select username,quantity from users join cart on users.user_id=cart.user_id;
select username,quantity from users left outer join cart using(user_id);
select username,quantity from users right outer join cart using(user_id);
select username,quantity from users full outer join cart using(user_id);






                                            --View--
create view view1 as select username,address from users;
create view view2 as select pro_name from product where pro_id=(select pro_id from cart where quantity>2);
create view view3 as select * from view1 where username like 'S___';