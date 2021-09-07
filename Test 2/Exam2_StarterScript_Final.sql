create table Marina(
	MarinaNum int not null primary key,
    MarinaName varchar(30),
    Address varchar(30),
    City varchar(18),
    State char(2),
    Zip char(5)
);

create table Owner(
	OwnerNum char(4) not null primary key,
    LastName varchar(18),
    FirstName varchar(25),
    Address varchar(25),
    City varchar(18),
    State char(2),
    Zip char(5)
);

create table MarinaSlip(
	SlipID int not null primary key,
    MarinaNum int not null,
    SlipNum char(2),
    Length int,
    RentalFee decimal(6,2),
    BoatName varchar(20),
    BoatType varchar(20),
    OwnerNum char(4) not null,
    constraint MarinaSlip_Marina_FK foreign key(MarinaNum)
    references Marina(MarinaNum)
    on update cascade,
    constraint MarinaSlip_Owner_FK foreign key(OwnerNum)
    references Owner(OwnerNum)
    on update cascade
);

Insert into Marina values(1, 'Alexamara East', '108 2nd Ave', 'Brinman', 'FL', '32273');
Insert into Marina values(2, 'Alexamara Central', '283 Branston', 'W Brinman', 'FL', '32274');

Insert into Owner values('AD57', 'Adney', 'Bruce and Jean', '208 Citrus', 'Bowton', 'FL', '31313');
Insert into Owner values('AN75', 'Anderson', 'Bill', '18 Wilcox', 'Glander Bay', 'FL', '31044');
Insert into Owner values('BL72', 'Blake', 'Mary', '2672 Commodore', 'Bowton', 'FL', '31313');
Insert into Owner values('EL25', 'Elend', 'Sandy and Bill', '462 Riverside', 'Rivard', 'FL', '31062');
Insert into Owner values('FE82', 'Feenstra', 'Daniel', '7822 Coventry', 'Kaleva', 'FL', '32521');
Insert into Owner values('JU92', 'Juarez', 'Maria', '8922 Oak', 'Rivard', 'FL', '31062');
Insert into Owner values('KE22', 'Kelly', 'Alyssa', '5271 Waters', 'Bowton', 'FL', '31313');
Insert into Owner values('NO27', 'Norton', 'Peter', '2811 Lakewood', 'Lewiston', 'FL', '32765');
Insert into Owner values('SM72', 'Smeltz', 'Becky and Dave', '922 Garland', 'Glander Bay', 'FL', '31044');
Insert into Owner values('TR72', 'Trent', 'Ashton', '922 Crest', 'Bay Shores', 'FL', '30992');

insert into MarinaSlip values(1, 1, 'A1', 40, 3800.00, 'Anderson II', 'Sprite 4000', 'AN75');
insert into MarinaSlip values(2, 1, 'A2', 40, 3800.00, 'Our Toy', 'Ray 4025', 'EL25');
insert into MarinaSlip values(3, 1, 'A3', 40, 3600.00, 'Escape', 'Sprite 4000', 'KE22');
insert into MarinaSlip values(4, 1, 'B1', 30, 2400.00, 'Gypsy', 'Dolphin 28', 'JU92');
insert into MarinaSlip values(5, 1, 'B2', 30, 2600.00, 'Anderson III', 'Sprite 3000', 'AN75');
insert into MarinaSlip values(6, 2, '1', 25, 1800.00, 'Bravo', 'Dolphin 25', 'AD57');
insert into MarinaSlip values(7, 2, '2', 25, 1800.00, 'Chinook', 'Dolphin 22', 'FE82');
insert into MarinaSlip values(8, 2, '3', 25, 2000.00, 'Listy', 'Dolphin 25', 'SM72');
insert into MarinaSlip values(9, 2, '4', 30, 2500.00, 'Mermaid', 'Dolphin 28', 'BL72');
insert into MarinaSlip values(10, 2, '5', 40, 4200.00, 'Axxon II', 'Dolphin 40', 'NO27');
insert into MarinaSlip values(11, 2, '6', 40, 4200.00, 'Karvel', 'Ray 4025', 'TR72');

insert into ServiceCategory values(1, 'Routine engine maintenance');
insert into ServiceCategory values(2, 'Engine repair');
insert into ServiceCategory values(3, 'Air conditioning');
insert into ServiceCategory values(4, 'Electrical systems');
insert into ServiceCategory values(5, 'Fiber glass repair');
insert into ServiceCategory values(6, 'Canvas installation');
insert into ServiceCategory values(7, 'Canvas repair');
insert into ServiceCategory values(8, 'Electronic systems (Radar, GPS, autopilot, etc.)');

insert into ServiceRequest values(1, 1, 3, 'Air conditioner periodically stops with code indicating low coolant level. Diagnose and repair.', 'Technician has verified the problem. Air conditioning specialist has been called.', 4, 2, '2013-07-12');
insert into ServiceRequest values(2, 5, 4, 'Fuse on port motor blown on two occasions. Diagnose and repair.', 'Open', 2, 0, '2013-07-12');
insert into ServiceRequest values(3, 4, 1, 'Oil change and general routine maintenance (check fluid levels, clean sea strainers, etc.).', 'Service call has been scheduled.', 1, 0, '2013-07-16');
insert into ServiceRequest values(4, 1, 2, 'Engine oil level has been dropping drastically. Diagnose and repair.', 'Open', 2, 0, '2013-07-13');
insert into ServiceRequest values(5, 3, 5, 'Open pockets at base of two stantions.', 'Technician has completed the initial filling of the open pockets. Will complete the job after the initial fill has had sufficient time to dry.', 4, 2, '2013-07-13');
insert into ServiceRequest values(6, 11, 4, 'Electric-flush system periodically stops functioning. Diagnose and repair.', 'Open', 3, 0, '2013-07-13');
insert into ServiceRequest values(7, 6, 2, 'Engine overheating. Loss of coolant. Diagnose and repair.', 'Open', 2, 0, '2013-07-13');
insert into ServiceRequest values(8, 6, 2, 'Heat exchanger not operating correctly.', 'Technician has determined that the exchanger is faulty. New exchanger has been ordered.', 4, 1, '2013-07-17');
insert into ServiceRequest values(9, 7, 6, 'Canvas severely damaged in windstorm. Order and install new canvas.', 'Open', 8, 0, '2013-07-16');
insert into ServiceRequest values(10, 2, 8, 'Install new GPS and chart plotter.', 'Scheduled', 7, 0, '2013-07-17');
insert into ServiceRequest(ServiceID, SlipID, CategoryNum, Description, Status, EstHours, SpentHrs) values(11, 2, 3, 'Air conditioning unit shuts down with "HHH" showing on the control panel.', 'Technician not able to replicate the problem. Air conditioning unit ran fine through multiple tests. Owner to notify technician if the problem recurs.', 1, 1);
insert into ServiceRequest values(12, 4, 8, 'Both speed and depth readings on data unit are significantly less than the owner thinks they should be.', 'Technician has scheduled appointment with owner to attempt to verify the problem.', 2, 0, '2013-07-16');
insert into ServiceRequest values(13, 8, 2, 'Customer describes engine as making a "clattering" sound.', 'Technician suspects problem with either propeller or shaft and has scheduled the boat to be pulled from the water for further investigation.', 5, 2, '2013-07-12');
insert into ServiceRequest values(14, 7, 5, 'Owner accident caused damage to forward portion of port side.', 'Technician has scheduled repair.', 6, 0, '2013-07-13');
insert into ServiceRequest values(15, 11, 7, 'Canvas leaks around zippers in heavy rain. Install overlap around zippers to prevent leaks.', 'Overlap has been created. Installation has been scheudled.', 8, 3, '2013-07-17');