    /* 4.19 update 10:00 */
    
drop sequence freeboard_seq; 
drop sequence cart_seq;
drop sequence product_seq;
drop sequence qnaboard_seq;
drop sequence orders_seq;
drop sequence order_detail_seq;
drop sequence auction_seq;

create sequence freeboard_seq start with 1 increment by 1;
create sequence cart_seq start with 1 increment by 1;
create sequence product_seq start with 1 increment by 1;
create sequence qnaboard_seq start with 1 increment by 1;
create sequence orders_seq start with 1 increment by 1;
create sequence order_detail_seq start with 1 increment by 1;
create sequence auction_seq start with 1 increment by 1;

drop table freeboard;
drop table purchased;
drop table cart;
drop table auction;
drop table hotdeal;
drop table qnaboard;
drop table order_detail;
drop table orders;
drop table shopuser;
drop table product;
drop table brand;


/*shopuser*/
CREATE TABLE shopuser (
  userid VARCHAR2(20) PRIMARY KEY,
  pass VARCHAR2(200), /*0419 1000*/
  name VARCHAR2(30),
  email VARCHAR2(200), /*0419 1000*/
  zipcode VARCHAR2(10),
  address1 VARCHAR2(100),
  address2 VARCHAR2(100),
  phone VARCHAR2(20),
  gender NUMBER(1),
  grade NUMBER(10) default 0,
  point NUMBER(10) default 0,
  enter DATE DEFAULT SYSDATE
);

/*freeboard*/
CREATE TABLE freeboard (
num NUMBER(5) PRIMARY KEY, /*sequence*/
userid VARCHAR2(20),/*fk - shopuser userid*/
title VARCHAR2(100),
content VARCHAR2(4000),
writedate DATE DEFAULT SYSDATE,
imgurl VARCHAR2(300),
readcount NUMBER(5) DEFAULT 0
);

/*purchased*/
CREATE TABLE purchased(
orderNum varchar2(10), /*squence*/
userid VARCHAR2(20) not null,/*fk - shopuser userid*/			     	    
bName VARCHAR2(20),
pName VARCHAR2(20),
pSize VARCHAR2(10),
price NUMBER(10) not null,
purchasedPrice NUMBER(10),
imgUrl varchar2(300),
orderdate DATE DEFAULT SYSDATE,
quantity NUMBER(10),
pNum number(4), /*fk - product num, 0414 UPDATE*/
recipName varchar2(20),  /*       */
recipPhone varchar2(20),  /*          ?*/
recipZipcode varchar2(10),   /*      ?*/
recipAddr1 varchar2(100),   /* ? */
recipAddr2 varchar2(100),   /*  */
memo varchar2(500),   /*  ? */
discountRate number(10),   /*   �� */
deliveryFee number(10),   /*   ? */
payMethod varchar(50),   /*      */
status varchar2(10)  /*   ?      */
);

/*cart*/
CREATE TABLE cart( /*update 0414 */
cartNum number(5) primary key, /*sequence*/
userid VARCHAR2(20) not null,/*fk - shopuser userid*/	     	    
num NUMBER(5) not null,/*fk - product num*/
pSize VARCHAR2(10),
quantity NUMBER(10) default 0,
balance NUMBER(10) default 0,
orderDate DATE default sysdate,
result char(1) default 1 /*0418 update*/ /*1 �ֹ� Ȯ�� �� 2 �ֹ� ó�� ��*/
);

/*auction*/
CREATE TABLE auction(
num number(5), /* sequence */  /*0419 1000*/
userid VARCHAR2(20) not null,/*fk - shopuser userid*/
bName VARCHAR2(20) not null,
pName VARCHAR2(200) not null,
pSize VARCHAR2(10),
price NUMBER(10) not null,
startPrice NUMBER(10),
imgUrl VARCHAR2(300),
endPrice NUMBER(10),
endTime DATE,
onoff number(1)
);

/*hotdeal* 0418 DROP */

/*product*/
CREATE TABLE PRODUCT(  /*update 0413 */
num NUMBER(4) primary key, /*sequence*/ 
pGender NUMBER(1), 
bName VARCHAR2(20),
kind NUMBER(1), 
pName VARCHAR2(200) not null,
imgUrl VARCHAR2(300), 
pSize VARCHAR2(10),
balance NUMBER(10) DEFAULT 0,
price NUMBER(10) not null,
purchasedNum NUMBER(10) DEFAULT 0,
explain VARCHAR2(4000),
writedate date default sysdate,
readcount NUMBER(4) default 0
);

/*brand*/
CREATE TABLE brand(
bName VARCHAR2(20) primary key,
imgUrl VARCHAR2(300)
);

/*qna 2023/04/14*/
CREATE TABLE qnaboard (
num NUMBER(5) PRIMARY KEY,
userid VARCHAR2(20),
title VARCHAR2(100),
content VARCHAR2(4000),
writedate DATE DEFAULT SYSDATE,
imgurl VARCHAR2(300),
readcount NUMBER(5) DEFAULT 0
);

/* orders */
create table orders(
orderNumber number(10) not null primary key, /*seq*/
userid VARCHAR2(20), /*fk*/
indate date default sysdate
);

/*order_detail*/
create table order_detail(
orderDetailNumber number(10) not null primary key, /*seq*/
orderNumber number(10),
num number(5), /* FK product */
quantity number(5),
totalPrice number(10),
result char(1) default 1 /*1 �ֹ� Ȯ�� �� 2 �ֹ� ó�� ��*/
);

/* join table(order, order_detail) */  /*0419 1000*/
CREATE VIEW order_view AS
SELECT orders.orderNumber, orders.userid, orders.indate, order_detail.orderDetailNumber, order_detail.num, order_detail.quantity, order_detail.result
FROM orders
JOIN order_detail
ON orders.orderNumber = order_detail.orderNumber;


/*FK*/

ALTER TABLE orders
ADD CONSTRAINT orders_fk_user
FOREIGN KEY (userid) REFERENCES shopuser(userid) ON DELETE CASCADE;

ALTER TABLE order_detail
ADD CONSTRAINT order_detail_fk_order
FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber) ON DELETE CASCADE;

ALTER TABLE order_detail
ADD CONSTRAINT order_detail_fk_product
FOREIGN KEY (num) REFERENCES product(num) ON DELETE CASCADE;


ALTER TABLE product
ADD CONSTRAINT product_fk_brand
FOREIGN KEY (bName) REFERENCES brand (bName) ON DELETE CASCADE;

ALTER TABLE qnaboard 
ADD CONSTRAINT qnaboard_fk_user
FOREIGN KEY (userid) REFERENCES shopuser (userid) ON DELETE CASCADE;

ALTER TABLE cart 
ADD CONSTRAINT cart_fk_user
FOREIGN KEY (userid) REFERENCES shopuser (userid) ON DELETE CASCADE;

ALTER TABLE cart 
ADD CONSTRAINT cart_fk_product
FOREIGN KEY (num) REFERENCES product (num) ON DELETE CASCADE;

ALTER TABLE freeboard
ADD CONSTRAINT freeboard_fk_user
FOREIGN KEY (userid) REFERENCES shopuser (userid) ON DELETE CASCADE;

ALTER TABLE purchased
ADD CONSTRAINT purchased_fk_user
FOREIGN KEY (userid) REFERENCES shopuser (userid) ON DELETE CASCADE;

ALTER TABLE purchased 
ADD CONSTRAINT purchased_fk_product
FOREIGN KEY (pNum) REFERENCES product (num) ON DELETE CASCADE;

ALTER TABLE auction 
ADD CONSTRAINT auction_fk_user
FOREIGN KEY (userid) REFERENCES shopuser (userid) ON DELETE CASCADE;

/* update */

/*select*/
select * from shopuser;
select * from qnaboard;
select * from brand;
select * from cart;
select * from product;
select * from auction;
select * from orders;
select * from order_detail;
desc order_detail;


/*insert*/  /*0419 1000*/
insert into shopuser values('admin','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','������', '12345@gamil.com', '12345', '����Ư���� �λ絿 12�� ', '���Ϻ��� , ���̵̹�� 15��, 16ȣ ', '01012344321', '1', '1', '9999990','2023/04/13');
insert into shopuser values('user','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','����', '12345@gamil.com', '12345', '����Ư���� �λ絿 12�� ', '���Ϻ��� , ���̵̹�� 15��, 16ȣ ', '01012344321', '1', '0', '9999990','2023/04/13');


insert into brand(bName) values('louisvuitton');
insert into brand(bName) values('Saint Laurent');
insert into brand(bName) values('prada');
insert into brand(bName) values('balenciaga');
insert into brand(bName) values('hermes');

commit;
