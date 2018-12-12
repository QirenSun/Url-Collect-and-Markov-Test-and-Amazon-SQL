CREATE TABLE product_listing (
PL_Id DECIMAL(12) NOT NULL PRIMARY KEY,
C_Id	DECIMAL(12) NOT NULL,
PL_Name VARCHAR(255) NOT NULL,
PL_Description VARCHAR(255) NOT NULL);

CREATE TABLE inventory (
inv_Id	DECIMAL(12) NOT NULL PRIMARY KEY,
S_Id	DECIMAL(12) NOT NULL,
PL_Id	DECIMAL(12) NOT NULL,
inv_number DECIMAL(12) NOT NULL,
inv_Condition VARCHAR(255) NOT NULL,
inv_Price DECIMAL(12,2) NOT NULL );

CREATE TABLE category (
C_Id	DECIMAL(12) NOT NULL PRIMARY KEY,
C_Name	VARCHAR(255) NOT NULL);

CREATE TABLE supplier  (
S_Id	DECIMAL(12) NOT NULL PRIMARY KEY,
S_Name	VARCHAR(255) NOT NULL,
S_Phone DECIMAL(12) NOT NULL,
S_Email VARCHAR(255));

CREATE TABLE supplier_address  (
SA_Id	DECIMAL(12) NOT NULL PRIMARY KEY,
S_Id	DECIMAL(12) NOT NULL,	
SA_State	VARCHAR(255) NOT NULL,
SA_Zipcode	DECIMAL(12) NOT NULL,
SA_City VARCHAR(255) NOT NULL,
SA_Street VARCHAR(255),
SA_Apt VARCHAR(255));

CREATE TABLE delivery (
Dly_Id DECIMAL(12) PRIMARY KEY,
inv_Id DECIMAL(12) NOT NULL,
W_Id DECIMAL(12) NOT NULL,
Dly_Date DATE NOT NULL);

CREATE TABLE warehouse (
W_Id DECIMAL(12) PRIMARY KEY,
W_Zipcode DECIMAL(12) NOT NULL,
W_State VARCHAR(255) NOT NULL,
W_City VARCHAR(255) NOT NULL,
W_Street VARCHAR(255)); 


CREATE TABLE single_product(
sp_Id DECIMAL(12) PRIMARY KEY,
O_Id DECIMAL(12) NOT NULL,
inv_Id DECIMAL(12) NOT NULL,
W_Id DECIMAL(12) NOT NULL );

CREATE TABLE order_list(
O_Id DECIMAL(12) NOT NULL PRIMARY KEY,
M_Id DECIMAL(12) NOT NULL,
O_Date DATE NOT NULL,
O_Ship_speed VARCHAR(255) NOT NULL);

CREATE TABLE billing_address(
ba_Id DECIMAL(12) PRIMARY KEY,
M_Id DECIMAL(12) NOT NULL,
ba_Zipcode DECIMAL(12) NOT NULL,
ba_State VARCHAR(255) NOT NULL,
ba_City VARCHAR(255) NOT NULL,
ba_Street VARCHAR(255) NOT NULL,
ba_Apt VARCHAR(255));

CREATE TABLE member(
M_Id DECIMAL(12) PRIMARY KEY,
M_Name VARCHAR(255) NOT NULL,
M_Password VARCHAR(255) NOT NULL,
M_Phone DECIMAL(12) NOT NULL,
M_Email VARCHAR(255));

CREATE TABLE member_address(
MA_Id DECIMAL(12) PRIMARY KEY,
M_Id DECIMAL(12) NOT NULL,
MA_Zipcode DECIMAL(12) NOT NULL,
MA_State VARCHAR(255) NOT NULL,
MA_City VARCHAR(255) NOT NULL,
MA_Street VARCHAR(255) NOT NULL,
MA_Apt VARCHAR(255));

CREATE TABLE packages(
Pac_Id DECIMAL(12) PRIMARY KEY,
O_Id DECIMAL(12) NOT NULL,
Pac_Name VARCHAR(255) NOT NULL,
Pac_Ship_Location VARCHAR(255) NOT NULL,
Pac_Ship_Status VARCHAR(255) NOT NULL,
Pac_Ship_Date_Time DATE NOT NULL);




ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_to_product_listing FOREIGN KEY(PL_Id)
REFERENCES product_listing(PL_Id);

ALTER TABLE product_listing
ADD CONSTRAINT fk_product_listing_to_category	FOREIGN KEY(C_Id)
REFERENCES category(C_Id)

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_to_supplier	FOREIGN KEY(S_Id)
REFERENCES supplier(S_Id)

ALTER TABLE supplier_address
ADD CONSTRAINT fk_supplier_address_to_supplier	FOREIGN KEY(S_Id)
REFERENCES supplier(S_Id)

ALTER TABLE delivery
ADD CONSTRAINT fk_delivery_to_inventory	FOREIGN KEY(inv_Id)
REFERENCES inventory(inv_Id)

ALTER TABLE delivery
ADD CONSTRAINT fk_delivery_to_warehouse	FOREIGN KEY(W_Id)
REFERENCES warehouse(W_Id)


ALTER TABLE single_product
ADD CONSTRAINT fk_single_product_to_warehouse	 FOREIGN KEY(W_Id) 
REFERENCES warehouse(W_Id)


ALTER TABLE order_list
ADD CONSTRAINT	fk_order_list_to_member	 FOREIGN KEY(M_Id) 
REFERENCES member(M_Id)

ALTER TABLE member_address
ADD CONSTRAINT fk_member_address_to_member	 FOREIGN KEY(M_Id) 
REFERENCES member(M_Id)

ALTER TABLE Packages
ADD CONSTRAINT fk_packages_to_order_list	 FOREIGN KEY(O_Id) 
REFERENCES order_list(O_Id)

ALTER TABLE billing_address
ADD CONSTRAINT fk_billing_address_to_member	 FOREIGN KEY(M_Id) 
REFERENCES member(M_Id)

ALTER TABLE single_product
ADD CONSTRAINT	fk_single_product_to_order_list	 FOREIGN KEY(O_Id) 
REFERENCES order_list(O_Id)

ALTER TABLE single_product
ADD CONSTRAINT	fk_single_product_to_inventory	 FOREIGN KEY(inv_Id) 
REFERENCES inventory(inv_Id)





INSERT INTO category(C_Id,C_Name)
VALUES(1,'Electronics')
INSERT INTO category(C_Id,C_Name)
VALUES(2,'Computers')
INSERT INTO category(C_Id,C_Name)
VALUES(3,'Cloth&Shoes')
INSERT INTO category(C_Id,C_Name)
VALUES(4,'Makeup')

INSERT INTO product_listing(PL_Id,C_Id,PL_Name,PL_Description)
VALUES(1,1,'ipad pro 10.5 64GB','10.5-inch Retina display with ProMotion, True Tone, and wide color');
INSERT INTO product_listing(PL_Id,C_Id,PL_Name,PL_Description)
VALUES(2,2,'Alienware 17.6','8th Generation Intel Core i7-8750H (6-Core, 9MB Cache,3.9GHz w/Turbo Boost)');
INSERT INTO product_listing(PL_Id,C_Id,PL_Name,PL_Description)
VALUES(3,1,'Desktop Laptop PC Gaming Mouse',' PICTEK T7 Programmable Gaming Mice, Default five DPI levels available from 1200/2400/3500/5500/7200 DPI. With two DPI button');
INSERT INTO product_listing(PL_Id,C_Id,PL_Name,PL_Description)
VALUES(4,1,'Bose QuietComfort 35 (Series II)','Wireless Headphones, Noise Cancelling, with Alexa voice control - Black');
INSERT INTO product_listing(PL_Id,C_Id,PL_Name,PL_Description)
VALUES(5,3,'Femizee Girls Boys Warm Winter Flat Shoes Bailey Button Snow Boots','Classic Solid Color, Comfortable and Stylish, the Most Popular Kids Boots in this Winter!');
INSERT INTO product_listing(PL_Id,C_Id,PL_Name,PL_Description)
VALUES(6,1,'BestGot Headphones with Microphone for Girls Adult with Microphone in-line Volume','These are wired headphones for Kids Boys Adult .');
INSERT INTO product_listing(PL_Id,C_Id,PL_Name,PL_Description)
VALUES(7,4,'Body Merry Breakthrough Night Cream','HYDRATE & REJUVENATE with our SILKY & TIGHTENING overnight cream ');
INSERT INTO product_listing(PL_Id,C_Id,PL_Name,PL_Description)
VALUES(8,2,'Acer Aspire E 15, 15.6" Full HD, 8th Gen Intel Core i3-8130U, 6GB RAM Memory, 1TB HDD, 8X DVD, E5-576-392H','8th Generation Intel Core i3-8130U Processor (Up to 3.4GHz)');

INSERT INTO supplier(S_Id,S_Name,S_Phone,S_Email)
VALUES(1,'John Smith','61742349182','kwi17046@ebbob.com') 
INSERT INTO supplier(S_Id,S_Name,S_Phone,S_Email)
VALUES(2,'Chris Pratt','61742329182','hjv91672@ebbob.com') 
INSERT INTO supplier(S_Id,S_Name,S_Phone,S_Email)
VALUES(3,'Zoe Saldana','61742349120','nns03786@ebbob.com') 
INSERT INTO supplier(S_Id,S_Name,S_Phone,S_Email)
VALUES(4,'Dave Bautista ','82742349182','cgx61251@ebbob.com') 
INSERT INTO supplier(S_Id,S_Name,S_Phone,S_Email)
VALUES(5,'Vin Diesel','85746349182','pck37913@ebbob.com') 
INSERT INTO supplier(S_Id,S_Name,S_Phone,S_Email)
VALUES(6,'Bradley Cooper','6123349182','spt83296@ebbob.com') 
INSERT INTO supplier(S_Id,S_Name,S_Phone,S_Email)
VALUES(7,'Lee Pace','6123346782','iey63317@iencm.com') 
INSERT INTO supplier(S_Id,S_Name,S_Phone,S_Email)
VALUES(8,'Michael Rooker','6125349182','obi29846@iencm.com') 

INSERT INTO supplier_address(SA_Id,S_Id,SA_State,SA_Zipcode,SA_City,SA_Street,SA_Apt)
VALUES(1,2,'ID',92174,'Pocatello','9525 Montes, Av.',2)
INSERT INTO supplier_address(SA_Id,S_Id,SA_State,SA_Zipcode,SA_City,SA_Street)
VALUES(2,4,'Indiana',52083,'Indianapolis','P.O. Box 208, 2113 Imperdiet Av.')
INSERT INTO supplier_address(SA_Id,S_Id,SA_State,SA_Zipcode,SA_City,SA_Street)
VALUES(3,3,'Colorado',96690,'Fort Collins','Ap #204-9972 Magna St.')
INSERT INTO supplier_address(SA_Id,S_Id,SA_State,SA_Zipcode,SA_City,SA_Street)
VALUES(4,6,'DE',53048,'Pike Creek','8317 Scelerisque Ave')
INSERT INTO supplier_address(SA_Id,S_Id,SA_State,SA_Zipcode,SA_City,SA_Street)
VALUES(5,3,'MN',64192,'Minneapolis','991-8297 Dolor Ave')
INSERT INTO supplier_address(SA_Id,S_Id,SA_State,SA_Zipcode,SA_City,SA_Street)
VALUES(6,4,'Georgia',57955,'Augusta','7969 Eleifend St.')
INSERT INTO supplier_address(SA_Id,S_Id,SA_State,SA_Zipcode,SA_City,SA_Street)
VALUES(7,1,'Tennessee',33153,'Knoxville','P.O. Box 796, 5645 Eget Rd.')
INSERT INTO supplier_address(SA_Id,S_Id,SA_State,SA_Zipcode,SA_City,SA_Street)
VALUES(8,7,'Virginia',70526,'Norfolk','Ap #741-8714 Felis Street')

INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(1,2,1,43,'New',629.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(2,4,2,25,'used',1799.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(3,6,3,47,'new',14.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(4,6,3,0,'new',14.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(5,3,7,99,'new',12.91)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(6,4,4,8,'used',249.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(7,4,1,13,'used',429.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(8,5,8,10,'new',364.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(9,7,2,4,'new',2499.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(10,5,5,80,'new',12.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(11,5,1,6,'used',469.99)
INSERT INTO inventory(inv_Id,S_Id,PL_Id,inv_number,inv_Condition,inv_Price)
VALUES(12,1,2,7,'used',1899.99)


INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(1,'Katell Wall',163004179,'1-721-894-2578','ligula@In.co.uk')
INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(2,'Virginia Norris',166108599,'1-145-920-0756','Quisque.varius.Nam@risusDonecegestas.net')
INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(3,'MacKenzie Shaw',163043099,'1-132-938-1521','ornare.elit@nunc.ca')
INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(4,'Garrett Morse',161754899,'1-836-845-2906','amet@eratneque.ca')
INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(5,'Cadman Henson',161002999,'1-312-950-4736','Nulla.tempor.augue@anunc.co.uk')
INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(6,'Kareem Callahan',103258699,'1-123-622-9006','luctus.felis@Praesent.net')
INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(7,'Lana Anderson',163193899,'1-180-192-5089','metus.In@Maecenasmifelis.edu')
INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(8,'Nolan Pratt',16767399,'1-922-266-9665','neque.non.quam@Donec.com')
INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(9,'Chaim Blackburn',120509499,'1-662-881-4267','ligula.eu.enim@enimNuncut.ca')
INSERT INTO member(M_Id,M_Name,M_Phone,M_Password,M_Email)
VALUES(10,'Ignacia Mercer',171396599,'1-899-398-3186','Mauris@scelerisqueneque.co.uk')


INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(1,1,'one-day-shipping','2018-01-12')
INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(2,1,'one-day-shipping','2018-02-13')
INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(3,2,'two-day-shipping','2018-02-11')
INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(4,3,'one-day-shipping','2018-04-15')
INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(5,4,'two-day-shipping','2018-05-19')
INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(6,5,'one-week-shipping','2018-05-25')
INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(7,6,'estimate 20d','2018-08-30')
INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(8,4,'two-day-shipping','2018-09-26')
INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(9,5,'one-day-shipping','2018-11-11')
INSERT INTO order_list(O_Id,M_Id,O_Ship_speed,O_Date)
VALUES(10,3,'one-week-shipping','2018-12-07')


select*from product_listing
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(1,1,1,1)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(2,1,2,2)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(3,2,2,3)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(4,3,4,4)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(5,4,5,1)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(6,2,4,2)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(7,1,3,3)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(8,5,7,4)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(9,3,5,1)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(10,7,5,2)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(11,8,5,3)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(12,1,4,4)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(13,4,8,1)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(14,9,8,2)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(15,9,8,3)
INSERT INTO single_product(SP_Id,O_Id,inv_Id,W_Id)
VALUES(16,10,8,4)

INSERT INTO member_address(MA_Id,M_Id,MA_State,MA_Zipcode,MA_City,MA_Street,MA_Apt)
VALUES(8,2,'ID',92174,'Pocatello','9525 Montes, Av.',2)
INSERT INTO member_address(MA_Id,M_Id,MA_State,MA_Zipcode,MA_City,MA_Street)
VALUES(7,4,'Indiana',52083,'Indianapolis','P.O. Box 208, 2113 Imperdiet Av.')
INSERT INTO member_address(MA_Id,M_Id,MA_State,MA_Zipcode,MA_City,MA_Street)
VALUES(6,3,'Colorado',96690,'Fort Collins','Ap #204-9972 Magna St.')
INSERT INTO member_address(MA_Id,M_Id,MA_State,MA_Zipcode,MA_City,MA_Street)
VALUES(3,6,'DE',53048,'Pike Creek','8317 Scelerisque Ave')
INSERT INTO member_address(MA_Id,M_Id,MA_State,MA_Zipcode,MA_City,MA_Street)
VALUES(4,3,'MN',64192,'Minneapolis','991-8297 Dolor Ave')
INSERT INTO member_address(MA_Id,M_Id,MA_State,MA_Zipcode,MA_City,MA_Street)
VALUES(5,4,'Georgia',57955,'Augusta','7969 Eleifend St.')
INSERT INTO member_address(MA_Id,M_Id,MA_State,MA_Zipcode,MA_City,MA_Street)
VALUES(2,1,'Tennessee',33153,'Knoxville','P.O. Box 796, 5645 Eget Rd.')
INSERT INTO member_address(MA_Id,M_Id,MA_State,MA_Zipcode,MA_City,MA_Street)
VALUES(1,7,'Virginia',70526,'Norfolk','Ap #741-8714 Felis Street')

INSERT INTO billing_address(ba_Id,M_Id,ba_State,ba_Zipcode,ba_City,ba_Street,ba_apt)
VALUES(8,2,'ID',92174,'Pocatello','9525 Montes, Av.',2)
INSERT INTO billing_address(ba_Id,M_Id,ba_State,ba_Zipcode,ba_City,ba_Street)
VALUES(7,4,'Indiana',52083,'Indianapolis','P.O. Box 208, 2113 Imperdiet Av.')
INSERT INTO billing_address(ba_Id,M_Id,ba_State,ba_Zipcode,ba_City,ba_Street)
VALUES(6,3,'Colorado',96690,'Fort Collins','Ap #204-9972 Magna St.')
INSERT INTO billing_address(ba_Id,M_Id,ba_State,ba_Zipcode,ba_City,ba_Street)
VALUES(3,6,'DE',53048,'Pike Creek','8317 Scelerisque Ave')
INSERT INTO billing_address(ba_Id,M_Id,ba_State,ba_Zipcode,ba_City,ba_Street)
VALUES(4,3,'MN',64192,'Minneapolis','991-8297 Dolor Ave')
INSERT INTO billing_address(ba_Id,M_Id,ba_State,ba_Zipcode,ba_City,ba_Street)
VALUES(5,4,'Georgia',57955,'Augusta','7969 Eleifend St.')
INSERT INTO billing_address(ba_Id,M_Id,ba_State,ba_Zipcode,ba_City,ba_Street)
VALUES(2,1,'Tennessee',33153,'Knoxville','P.O. Box 796, 5645 Eget Rd.')
INSERT INTO billing_address(ba_Id,M_Id,ba_State,ba_Zipcode,ba_City,ba_Street)
VALUES(1,7,'Virginia',70526,'Norfolk','Ap #741-8714 Felis Street')



INSERT INTO warehouse(W_Id,W_Zipcode,W_State,W_City,W_Street)
VALUES (1,78744,'Wyoming','Cheyenne','Ap #487-1998 Euismod Rd.')
INSERT INTO warehouse(W_Id,W_Zipcode,W_State,W_City,W_Street)
VALUES (2,67271,'UT','Salt Lake City','P.O. Box 660, 2101 Porttitor Rd.')
INSERT INTO warehouse(W_Id,W_Zipcode,W_State,W_City,W_Street)
VALUES (3,99591,'Alaska','College','422 Mi Road')
INSERT INTO warehouse(W_Id,W_Zipcode,W_State,W_City,W_Street)
VALUES (4,53360,'Nevada','Paradise','222-9112 Eu Avenue')

INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (1,1,'qwer','Shipped','Boston','2018-1-13')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (2,1,'awcd','Shipped','Boston','2018-1-13')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (3,2,'qwtrt','Shipped','NY City','2018-2-13')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (4,3,'fdgd','Delivered','88 Commonwalth','2018-2-13')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (5,4,'awcasa','Shipped','Boston','2018-4-16')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (6,5,'afgfcasa','Shipped','LA','2018-6-06')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (7,6,'jkjlwca','Shipped','Boston','2018-6-16')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (8,7,'ouiwcasa','Shipped','Boston','2018-9-06')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (9,8,'yytasa','Shipped','Boston','2018-9-27')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (10,9,'ghghcasa','Shipped','Boston','2018-11-12')
INSERT INTO packages(pac_id,O_Id,Pac_Name,Pac_Ship_Status,Pac_Ship_Location,Pac_Ship_Date_Time)
VALUES (11,10,'gtertcasa','Shipped','Boston','2018-12-12')

select DISTINCT pl.PL_Name,pl.PL_Description,inventory.inv_price,c.C_Name 
from product_listing pl
join category c on c.C_Id= pl.C_Id 
join inventory on inventory.PL_Id=pl.PL_Id
where c.C_Name IN('Electronics','Computers') and inventory.inv_Price <= 30


select distinct product_listing.PL_Name,category.C_Name,inventory.inv_number,inventory.inv_Condition,inventory.inv_Price,supplier.S_Name
from inventory
join supplier on supplier.S_Id=inventory.S_Id
join product_listing on product_listing.PL_Id=inventory.PL_Id
join category on product_listing.C_Id=category.C_Id
join single_product on single_product.inv_Id=inventory.inv_Id
join order_list on single_product.O_Id=order_list.O_Id
where inventory.inv_number <=11 and supplier.S_Name='Vin Diesel' and order_list.O_Date between '2018-10-11' and '2018-12-11' 


select member.M_Name,member_address.MA_Zipcode,member_address.MA_State,member_address.MA_City,member_address.MA_Street from inventory
join product_listing on product_listing.PL_Id=inventory.PL_Id
join single_product on single_product.inv_Id=inventory.inv_Id
join order_list on order_list.O_Id=single_product.O_Id
join member on member.M_Id=order_list.M_Id
join member_address on member.M_Id=member_address.M_Id
where product_listing.PL_Name in
(select productsss.PL_Name from(
select products.PL_Name,count(products.PL_name) as bought_people
from (select distinct member.M_Name,product_listing.PL_Name  from inventory
join product_listing on product_listing.PL_Id=inventory.PL_Id
join single_product on single_product.inv_Id=inventory.inv_Id
join order_list on order_list.O_Id=single_product.O_Id
join member on member.M_Id=order_list.M_Id) products
group by products.PL_Name
having count(products.PL_name) >= 3) productsss)

select distinct top 3  products.C_Name, products.PL_Name,count(products.PL_Name) as Top_Single_Product_Bought_Times
from (select member.M_Name,product_listing.PL_Name,category.C_Name,inventory.inv_Condition,inventory.inv_Price,order_list.O_Date,order_list.O_Ship_speed 
from inventory
join product_listing on product_listing.PL_Id=inventory.PL_Id
join single_product on single_product.inv_Id=inventory.inv_Id
join order_list on order_list.O_Id=single_product.O_Id
join member on member.M_Id=order_list.M_Id
join category on category.C_Id=product_listing.C_Id
where category.C_Name in ('Electronics','Computers','Makeup')) products
group by products.PL_Name,products.C_Name
order by count(products.PL_Name) DESC


CREATE PROCEDURE selectallcategory 
	@PL_Id int,
	@C_Id int,
	@PL_Name varchar(255),
	@PL_Description varchar(255),
	@inv_Id int,
	@S_Id int,
	@PLid int,
	@inv_number int,
	@inv_Condition varchar(255),
	@inv_price DECIMAL(12,2)
as 
declare
	@temC_Name varchar(20)	
	insert into product_listing values(@PL_Id,@C_Id,@PL_Name,@PL_Description)
	insert into inventory values(@inv_Id,@S_Id,@PLid,@inv_number,@inv_Condition,@inv_price)

exec selectallcategory 9,1,'Dell Monitor','Soild,Durable',13,2,9,4,'used',29.99
exec selectallcategory 10,1,'Dell Monitor 2 series','Soild,Durable',14,2,10,4,'used',79.99

select product_listing.PL_Name,product_listing.PL_Description,inventory.inv_number,inventory.inv_price,inventory.inv_Condition,category.C_Name
from inventory
join product_listing on product_listing.PL_Id=inventory.PL_Id
join category on product_listing.C_Id= category.C_Id 
where product_listing.PL_Name in ('Dell Monitor','Dell Monitor 2 series')

CREATE PROCEDURE updateproduct 	
	@C_Id int,	
	@PL_Name varchar(255),
	@PL_Description varchar(255),
	@PL_Id int,
	@inv_number int,
	@inv_Condition varchar(255),
	@inv_price DECIMAL(12,2),
	@inv_Id int
as 
declare
	@temC_Name varchar(20)	
	update product_listing set C_Id=@C_Id,PL_Name=@PL_Name, PL_Description=@PL_Description
	where (PL_id=@PL_Id)
	update inventory set inv_number=@inv_number,inv_condition=@inv_Condition,inv_price=@inv_price
	where (inv_Id=@inv_Id)

exec updateproduct 1,'Dell Monitor','Soild,Durable,explict',9,8,'used',28.99,13
exec updateproduct 1,'Dell Monitor 2 series','Soild,Durable,explict',10,15,'used',78.99,14

select product_listing.PL_Name,product_listing.PL_Description,inventory.inv_number,inventory.inv_price,inventory.inv_Condition,category.C_Name
from inventory
join product_listing on product_listing.PL_Id=inventory.PL_Id
join category on product_listing.C_Id= category.C_Id 
where product_listing.PL_Name in ('Dell Monitor','Dell Monitor 2 series')



create index idx_inv_Price
ON  inventory (inv_Price)
drop index idx_inv_Price on inventory


select packages.Pac_Name,packages.Pac_Ship_Status,packages.Pac_Ship_Location,packages.Pac_Ship_Date_Time
from packages
join order_list on order_list.O_Id=packages.O_Id
where exists( select M_Name from member 
where member.M_Id=order_list.M_Id and member.M_Name= 'Garrett Morse')

