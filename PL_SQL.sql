                               ---PL/SQL variable declaration and print value---
set serveroutput on
declare 
user_id users.user_id%type;
username users.username%type;
begin
select user_id,username into user_id,username from users where user_id=11111;
dbms_output.put_line('User_id: '||user_id|| ' Username: '||username);
end;
/




                                    --Insert and set default value--
set serveroutput on
declare 
user_id users.user_id%type:=13321;
username users.username%type:='aaa';
password users.password%type:='1234456';
email users.email%type:='aaa@gmail.com';
address users.address%type:='Rajshahi';
phone users.phone%type:='01899355555';
begin
insert into users values(user_id, username, password, email, address, phone);
end;
/




                                               --Row type--
set serveroutput on
declare 
user_row users%rowtype;
begin
select user_id,username,email into user_row.user_id,user_row.username,user_row.email from users where user_id=11111;
end;
/




                                        --Cursor and Row count--
set serveroutput on
declare 
cursor cur is select * from users;
user_row users%rowtype;
begin
open cur;
fetch cur into user_row.user_id,user_row.username,user_row.password,user_row.email,user_row.address,user_row.phone;
while cur%found loop
dbms_output.put_line('User_id: '||user_row.user_id|| ' Username: '||user_row.username || ' Email: '||user_row.email);
dbms_output.put_line('Row count: '|| cur%rowcount);
fetch cur into user_row.user_id,user_row.username,user_row.password,user_row.email,user_row.address,user_row.phone;
end loop;
close cur;
end;
/



                                      --Extent() function--
set serveroutput on
declare 
  counter number;
  pro product.pro_name%type;
  TYPE NAMEARRAY IS VARRAY(5) OF product.pro_name%type; 
  A_NAME NAMEARRAY:=NAMEARRAY();
begin
  counter:=1;
  for x in 10001..10004 
  loop
    select pro_name into pro from product where pro_id=x;
    A_NAME.EXTEND();
    A_NAME(counter):=pro;
    counter:=counter+1;
  end loop;
  counter:=1;
  WHILE counter<=A_NAME.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/



                               ---Without extend() function--
set serveroutput on
declare 
  counter number;
  pro_name2 product.pro_name%type;
  TYPE NAMEARRAY IS VARRAY(3) OF product.pro_name%type; 
  A_NAME NAMEARRAY:=NAMEARRAY('1', '2', '3'); 
begin
  counter:=1;
  for x in 10001..10003 
  loop
    select pro_name into pro_name2 from product where pro_id=x;
    A_NAME(counter):=pro_name2;
    counter:=counter+1;
  end loop;
  counter:=1;
  WHILE counter<=A_NAME.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/




                                  ---if-else---
set serveroutput on
declare 
  counter number;
  price2 product.price%type;
  TYPE NAMEARRAY IS VARRAY(3) OF product.price%type; 
  A_NAME NAMEARRAY:=NAMEARRAY(1, 2, 3); 
begin
  counter:=1;
  for x in 10001..10003 
  loop
    select price into price2 from product where pro_id=x;
    if price2>30000 
        then
        dbms_output.put_line('Expensive');
      else 
        dbms_output.put_line('Cheap');
        end if;
  END LOOP;
end;
/

                                   ---Procedure---
CREATE OR REPLACE PROCEDURE proc2(
  var1 IN NUMBER,
  var2 OUT VARCHAR2,
  var3 IN OUT NUMBER
)
AS
  t_show CHAR(30);
BEGIN
  t_show := 'From procedure: ';
  SELECT pro_name INTO var2 FROM product WHERE price=var1;
  var3 := var1 + 1; 
  DBMS_OUTPUT.PUT_LINE(t_show || var2 || ' price is ' || var1 || ' In out parameter: ' || var3);
END;
/



set serveroutput on
declare 
price product.price%type:=30000;
pro_name product.pro_name%type;
extra number;
begin
proc2(price,pro_name,extra);
end;
/





                                ---Function---
set serveroutput on
create or replace function fun(var1 in varchar) return varchar AS
value users.username%type;
begin
  select username into value from users where user_id=var1; 
   return value;
end;
/
set serveroutput on
declare 
value varchar(20);
begin
value:=fun(11111);
dbms_output.put_line(value);
end;
/