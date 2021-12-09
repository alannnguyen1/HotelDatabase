CREATE DATABASE hotel2;
USE hotel2;

CREATE TABLE orders(orderId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
					orderType varchar(20)
                    );

CREATE TABLE paymenttype(typeId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
						 payType varchar(4) NOT NULL
                         );

CREATE TABLE payment(paymentId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
					 typeId int NOT NULL,
                     totalDue double(8,2) NOT NULL,
                     FOREIGN KEY (typeId) REFERENCES paymenttype(typeId)
                     );
                    
CREATE TABLE room(roomId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
				  roomNumber int NOT NULL,
				  roomType varchar(40) NOT NULL,
                  roomStatus VARCHAR(20) NOT NULL
                  );
                  
CREATE TABLE guest(guestId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
				   guestNumber int NOT NULL,
                   roomId int NOT NULL,
                   checkin date NOT NULL,
                   checkout date NOT NULL,
                   orderId int,
                   paymentId int NOT NULL,
                   billingAddress varchar(100) NOT NULL,
                   creditCardInfo varchar(40),
                   FOREIGN KEY (roomId) REFERENCES room(roomId),
                   FOREIGN KEY (orderId) REFERENCES orders(orderId),
                   FOREIGN KEY (paymentId) REFERENCES payment(paymentId)
                   );

CREATE TABLE positions(positionId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
					   positionName varchar(20) NOT NULL,
                       positionDescript varchar(40) NOT NULL,
                       pay double(10,2) NOT NULL
                       );
                       
CREATE TABLE staff(staffId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
				   staffName varchar(40) NOT NULL,
                   positionId int NOT NULL,
                   FOREIGN KEY (positionId) REFERENCES positions(positionId)
                   );
                                          
CREATE TABLE hotelevent(eventId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
						eventName varchar(40) NOT NULL,
						eventDate date NOT NULL,
                        location varchar(20) NOT NULL
                        );
                        
CREATE TABLE location(locationId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
					  locationName varchar(40) NOT NULL
                      );

set sql_safe_updates = 0;

insert into orders(orderType) values ("No orders");
insert into orders(orderType) values ("Amentities");
insert into orders(orderType) values ("room service");
insert into orders(orderType) values ("food");
insert into orders(orderType) values ("drink");
insert into orders(orderType) values ("all order types");
select * from orders;

insert into paymenttype(payType) values ("cash");
insert into paymenttype(payType) values ("card");
select * from paymenttype;

insert into payment(typeId, totalDue) values ((select typeId from paymenttype where payType = "card"), 349.99);
insert into payment(typeId, totalDue) values ((select typeId from paymenttype where payType = "card"), 1549.99);
insert into payment(typeId, totalDue) values ((select typeId from paymenttype where payType = "cash"), 99.99);
insert into payment(typeId, totalDue) values ((select typeId from paymenttype where payType = "card"), 599.99);
select * from payment;

insert into room(roomNumber, roomType, roomStatus) values (365, "Single Bed", "Available");
insert into room(roomNumber, roomType, roomStatus) values (412, "Double Bed", "Not Available");
insert into room(roomNumber, roomType, roomStatus) values (10, "Staff Room", "Not Available");
insert into room(roomNumber, roomType, roomStatus) values (123, "Single Bed", "Available");
insert into room(roomNumber, roomType, roomStatus) values (456, "Double Bed", "Available");
insert into room(roomNumber, roomType, roomStatus) values (141, "Single Bed", "Not Available");
insert into room(roomNumber, roomType, roomStatus) values (169, "Double Bed", "Not Available");
insert into room(roomNumber, roomType, roomStatus) values (269, "Single Bed", "Not Available");
select * from room;

insert into guest(guestNumber, roomId, checkin, checkout, orderId, paymentId, billingAddress, creditCardInfo) values (4, (select roomId from room where roomNumber = 412), '2021-10-09', '2021-10-14', 
(select orderId from orders where orderType = "room service"), (select paymentId from payment where totalDue = 1549.99), "123 HappyStreet SJ CA 95102", "1234 4321 5678 8765" );
insert into guest(guestNumber, roomId, checkin, checkout, orderId, paymentId, billingAddress, creditCardInfo) values (2, (select roomId from room where roomNumber = 141), '2021-10-05', '2021-10-07', 
(select orderId from orders where orderType = "room service"), (select paymentId from payment where totalDue = 349.99), "123 SadStreet SJ CA 95121", "1234 4321 5678 8765" );
insert into guest(guestNumber, roomId, checkin, checkout, orderId, paymentId, billingAddress, creditCardInfo) values (5, (select roomId from room where roomNumber = 169), '2021-10-10', '2021-10-14', 
(select orderId from orders where orderType = "room service"), (select paymentId from payment where totalDue = 599.99), "123 MadStreet SJ CA 95111", "1234 4321 5678 8765" );
insert into guest(guestNumber, roomId, checkin, checkout, orderId, paymentId, billingAddress, creditCardInfo) values (1, (select roomId from room where roomNumber = 269), '2021-11-01', '2021-11-02', 
(select orderId from orders where orderType = "No orders"), (select paymentId from payment where totalDue = 99.99), "123 HappyRoad SJ CA 95102", "1234 4321 5678 8765" );
select * from guest;

insert into positions(positionName, positionDescript, pay) values ("Manager", "Manage everything in the hotle", 150000.00);
insert into positions(positionName, positionDescript, pay) values ("Chef", "Cook foods", 78000.00);
insert into positions(positionName, positionDescript, pay) values ("Cashier", "Working with guest", 40000.00);
select * from positions;

insert into staff(staffName, positionId) values ("Serena Williams", (select positionId from positions where positionName = "Manager"));
insert into staff(staffName, positionId) values ("Gordon Ramsey", (select positionId from positions where positionName = "Chef"));
select * from staff;

insert into hotelevent(eventName, eventDate, location) values ("Bingo", '20-11-01', "2nd floor room 254");
insert into hotelevent(eventName, eventDate, location) values ("Birthday party", '20-11-01', "Main Lobby");
insert into hotelevent(eventName, eventDate, location) values ("Shuffle Board", '20-11-01', "Main Lobby");
select * from hotelevent;

select eventName, location, eventDate from hotelevent where eventDate = '20-11-01';
select guestId, guestNumber, roomId, checkin, checkout from guest where checkin = '2021-10-05';
select guestId, guestNumber, roomId, checkin, checkout from guest where checkin = '2021-10-09';
select guestId, guestNumber, roomId, checkin, checkout from guest where checkin = '2021-10-10';
select guestId, guestNumber, roomId, checkin, checkout from guest where checkin = '2021-11-01'; 
select guestId, roomId from guest where guestNumber >= 4;











