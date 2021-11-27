CREATE DATABASE Cars;

USE Cars;             
   
CREATE TABLE autos
(
	 id INT AUTO_INCREMENT NOT NULL,
     mark VARCHAR(30),
     model VARCHAR(30),
     engine_volume float,
     price float,
     max_speed INT,
     PRIMARY KEY (id)
)

