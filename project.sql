CREATE DATABASE hotel;
USE hotel;

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
						eventName varchar(40),
						eventDate date NOT NULL,
                        location varchar(20)
                        );
                        
CREATE TABLE location(locationId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
					  locationName varchar(40) NOT NULL
                      );
                      
