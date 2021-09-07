CREATE SCHEMA `reznicek_cooley_final project` ;

CREATE TABLE LOCATION(
	LocationID int(24) NOT NULL AUTO_INCREMENT,
    City varchar(20) NOT NULL,
    State char(2) NOT NULL,
    CONSTRAINT LOCATION_PK PRIMARY KEY(LocationID)
    );

CREATE TABLE PROFILE(
	ProfileID int(12) NOT NULL AUTO_INCREMENT,
    FirstName varchar(20) NOT NULL,
    LastName varchar(30) NOT NULL,
    Age int(2) NOT NULL,
    Gender int(1) NOT NULL,
	Email varchar(35) NOT NULL,
    Pass varchar(20) NOT NULL,
    LookingFor int(1) NOT NULL,
    IsSmoker bit NULL,
    IsDrinker bit NULL,
    HasKids bit NULL,
    RelationshipStatus int(1) NULL,
    LocationID int(24) NOT NULL,
    CONSTRAINT PROFILE_PK PRIMARY KEY(ProfileID),
    CONSTRAINT PROF_LOC_FK FOREIGN KEY(LocationID)
		REFERENCES LOCATION(LocationID)
        ON UPDATE CASCADE
    );
    
CREATE TABLE PICTURE(
	PictureID int(24) NOT NULL AUTO_INCREMENT,
    Description varchar(50) NULL,
    Filename varchar(15) NOT NULL,
    UploadDate date NOT NULL,
    ProfileID int(12) NOT NULL,
    CONSTRAINT PICTURE_PK PRIMARY KEY(PictureID),
    CONSTRAINT PIC_PROF_FK FOREIGN KEY(ProfileID)
		REFERENCES Profile(ProfileID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
    );
    
CREATE TABLE EDUCATION(
	EducationID int(24) NOT NULL AUTO_INCREMENT,
    SchoolName varchar(20) NOT NULL,
    Field char(20) NULL,
    GradDate date NULL,
    LocationID int(20) NOT NULL,
    ProfileID int(12) NOT NULL,
    CONSTRAINT EDUCATION_PK PRIMARY KEY(EducationID),
    CONSTRAINT EDU_LOCATION_FK FOREIGN KEY(LocationID)
		REFERENCES LOCATION(LocationID)
		ON UPDATE CASCADE,
	CONSTRAINT EDU_PROFILE_FK FOREIGN KEY(ProfileID)
		REFERENCES PROFILE(ProfileID)
        ON UPDATE CASCADE
    );
    
CREATE TABLE MESSAGE(
	MessageID int(24) NOT NULL AUTO_INCREMENT,
	Subject char(20) NULL,
    MessageBody varchar(255) NOT NULL,
    DateSent date NOT NULL,
    CONSTRAINT MESSAGE_PK PRIMARY KEY(MessageID)
    );
    
CREATE TABLE MESSAGE_PROFILE(
	MessageID int(24) NOT NULL,
    ProfileID int(12) NOT NULL,
    CONSTRAINT MESSAGE_PROFILE_PK PRIMARY KEY(MessageID, ProfileID),
    CONSTRAINT MP_MESSAGE_FK FOREIGN KEY(MessageID)
		REFERENCES MESSAGE(MessageID)
        ON UPDATE CASCADE,
	CONSTRAINT MP_PROFILE_FK FOREIGN KEY(ProfileID)
		REFERENCES PROFILE(ProfileID)
        ON UPDATE CASCADE
    );
    
CREATE TABLE PRIVACY(
	PrivacyLevel int(1) NOT NULL AUTO_INCREMENT,
    ProfileID int(12) NOT NULL,
    LastUpdated date NOT NULL,
    CONSTRAINT PRIV_PROF_FK FOREIGN KEY(ProfileID)
		REFERENCES PROFILE(ProfileID)
		ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT PRIVACY_PK PRIMARY KEY(PrivacyLevel, ProfileID)
    );    
    
CREATE TABLE OCCUPATION(
	OccupationID int(20) NOT NULL AUTO_INCREMENT,
    CompanyName varchar(30) NULL,
    LocationID int(20) NULL,
    JobTitle varchar(20) NOT NULL,
    StartDate date NULL,
    EndDate date NULL,
    ProfileID int(12) NOT NULL,
    CONSTRAINT OCCUPATION_PK PRIMARY KEY(OccupationID),
    CONSTRAINT OCC_LOCATION_FK FOREIGN KEY(LocationID)
		REFERENCES LOCATION(LocationID)
        ON UPDATE CASCADE,
	CONSTRAINT OCC_PROFILE_FK FOREIGN KEY(ProfileID)
		REFERENCES PROFILE(ProfileID)
		ON UPDATE CASCADE
    );
    
INSERT INTO LOCATION(City, State) VALUES('Saint Louis', 'MO');
INSERT INTO LOCATION(City, State) VALUES('Atlanta', 'GA');
INSERT INTO LOCATION(City, State) VALUES('San Diego', 'CA');
INSERT INTO LOCATION(City, State) VALUES('Miami', 'FL');
INSERT INTO LOCATION(City, State) VALUES('Jacksonville', 'FL');
INSERT INTO LOCATION(City, State) VALUES('Roswell', 'GA');
INSERT INTO LOCATION(City, State) VALUES('Duluth', 'GA');
INSERT INTO LOCATION(City, State) VALUES('Lawrenceville', 'GA');
INSERT INTO LOCATION(City, State) VALUES('Nashville', 'TN');
INSERT INTO LOCATION(City, State) VALUES('Memphis', 'TN');
    
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(1, 'John', 'Smith', 28, 1, 'john.smith@website.org', 'Password1234', 0, 0, 0, 1, 1, 2); #1
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(2, 'Jerry', 'Seinfeld', 47, 1, 'J.Seinfeld@nbc.com', '238ZSDknjf', 0, 0, 0, 0, 0, 5); #2
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(3, 'Elaine', 'Bennis', 45, 0, 'E.Bennis@nbc.com', 'sefnSDC234', 1, 0, 1, 1, 0, 6);#3
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(4, 'George', 'Costanza', 48, 1, 'Festivus4Restuvus@gmail.com', 'SEFsvnd9322', 0, 1, 1, 0, 0, 8);#4
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(5, 'Cosmo', 'Kramer', 39, 1, 'AnywhereUSA@nbc.com', 'ASCnksdflf', 0, 0, 1, 1, 0, 1);#5
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(6, 'Terry', 'Crews', 21, 1, 'WastedMilk@somewhere.com', 'ERf20ds9mvd', 0, 1, 0, 1, 1, 7);#6
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(7, 'Etta', 'James', 28, 0, 'oldsoul@gmail.com', 'ASD3w@#3f', 1, 0, 0, 0, 0, 4);#7
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(8, 'Gabrielle', 'Union', 23, 0, 'GabUnion@gmail.com', 'AEF@$vmsdvs', 1, 1, 1, 0, 0, 8);#8
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(9, 'George', 'Benson', 33, 1, 'jazzytracks@record.com', '%sdmgfdr!', 0, 0, 0, 0, 1, 4);#9
INSERT INTO PROFILE(ProfileID, FirstName, LastName, Age, Gender, Email, Pass, LookingFor, IsSmoker, IsDrinker, HasKids, RelationshipStatus, LocationID)
	VALUES(10, 'Anita', 'James', 35, 0, 'IGotThatSoul@gmail.com', '@43fmxldwep', 1, 1, 1, 0, 0, 2);#10
    
INSERT INTO PICTURE VALUES(1, 'Funny cat', 'funnycat.jpg', 20170710, 2);
INSERT INTO PICTURE VALUES(2, 'hithere', 'hithere.jpg', 20170402, 3);
INSERT INTO PICTURE VALUES(3, 'groupphoto', 'group_photo.jpg', 20160302, 3);
INSERT INTO PICTURE VALUES(4, 'school', 'school.jpg', 20150102, 3);
INSERT INTO PICTURE VALUES(5, 'car', 'car.jpg', 20170102, 3);
INSERT INTO PICTURE VALUES(6, 'sunset', 'sunset.jpg', 20180502, 3);
INSERT INTO PICTURE VALUES(7, 'selfie', 'selfie.jpg', 20180502, 3);
INSERT INTO PICTURE VALUES(8, 'test3', 'test3.png', 20180327, 5);
INSERT INTO PICTURE VALUES(9, 'obama meme', 'obamameme.gif', 20180514, 3);
INSERT INTO PICTURE VALUES(10, 'Funny dog', 'funnydog.jpg', 20180705, 7);
    
INSERT INTO PRIVACY VALUES(1, 1, 20170111);
INSERT INTO PRIVACY VALUES(0, 2, 20180206);
INSERT INTO PRIVACY VALUES(3, 3, 20180302);
INSERT INTO PRIVACY VALUES(3, 4, 20170506);
INSERT INTO PRIVACY VALUES(3, 5, 20180916);
INSERT INTO PRIVACY VALUES(2, 6, 20171206);
INSERT INTO PRIVACY VALUES(2, 7, 20180506);
INSERT INTO PRIVACY VALUES(2, 8, 20170501);
INSERT INTO PRIVACY VALUES(1, 9, 20150908);
INSERT INTO PRIVACY VALUES(1, 10, 20140518);
    
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(1, 'Google', 1, 'Project Manager', 1);
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(2, 'Google', 3, 'Project Manager', 2);
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(3, 'HP', 6, 'Regional Manager', 3);
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(4, 'Self-Employed', 7, 'Project Manager', 4);
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(5, 'Dell', 10, 'Department Manager', 5);
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(6, 'Alibaba', 4, 'Project Manager', 6);
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(7, 'Amazon', 7, 'Database Manager', 7);
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(8, 'Comcast', 7, 'Shift Manager', 8);
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(9, 'GGC', 1, 'Office Assistant', 9);
INSERT INTO OCCUPATION(OccupationID, CompanyName, LocationID, JobTitle, ProfileID)
VALUES(10, 'GGC', 1, 'Professor', 10);

INSERT INTO EDUCATION VALUES(1, 'UKC', 'Law', NULL, 5, 8);
INSERT INTO EDUCATION VALUES(2, 'GGC', 'Info Systems', NULL, 3, 2);
INSERT INTO EDUCATION VALUES(3, 'Mizzou', 'Journalism', 20150530, 6, 1);
INSERT INTO EDUCATION VALUES(4, 'UNC', NULL, NULL, 8, 3);
INSERT INTO EDUCATION VALUES(5, 'FSU', 'Music Production', NULL, 4, 8);
INSERT INTO EDUCATION VALUES(6, 'GSU', NULL, 20180704, 7, 5);
INSERT INTO EDUCATION VALUES(7, 'UCLA', NULL, 20170504, 8, 7);

INSERT INTO Message VALUES( 1, 'Hey there cutie!', 'Hi, I thought your eyes were simply gorgeous and had to say hello!' , 20180715);
INSERT INTO Message VALUES( 2, 'Your Smile Tho', 'Hey man, your smile is so fun and cute!', 20180710);
INSERT INTO Message VALUES( 3, 'Coffee?', 'Thanks! I’d love to get coffee with you sometime!', 20180716);
INSERT INTO Message VALUES( 4, 'Mad Respect', 'I see you’re a Harvard graduate AND you can play guitar!? Marry me, please!!!! ROFL', 20180710);
INSERT INTO Message VALUES( 5, 'Can I pet your dog?', 'Your corgi is SO CUTE I’M DYING. What’s his name? ', 20180712);

INSERT INTO Message_Profile Values (1,1);  
INSERT INTO Message_Profile Values (1,2);
INSERT INTO Message_Profile Values (2,3);
INSERT INTO Message_Profile Values (2,7);
INSERT INTO Message_Profile Values (3,1);
INSERT INTO Message_Profile Values (3,2);
INSERT INTO Message_Profile Values (4,4);
INSERT INTO Message_Profile Values (4,6);
INSERT INTO Message_Profile Values (5,8);
INSERT INTO Message_Profile Values (5,9);

#QUERY 1    
SELECT * FROM PROFILE WHERE RelationshipStatus = 1 AND HasKids = 0;

#QUERY 2
SELECT * FROM LOCATION 
	ORDER BY State, City;
    
#QUERY 3
SELECT Avg(Age) AS AverageUserAge FROM Profile;

#QUERY 4
SELECT * FROM Education
	WHERE ProfileID IN
    (SELECT ProfileID FROM Education
			WHERE LocationID IN
            (SELECT LocationID FROM Location
				WHERE State = 'GA'));
                
#QUERY 5
SELECT M.MessageID, Subject, MessageBody, P.ProfileID
	FROM Message AS M, Profile AS P, Message_Profile AS M_P, Privacy AS PR
	WHERE M.MessageID = M_P.MessageID AND P.ProfileID = M_P.ProfileID = PR.ProfileID
    AND P.ProfileID IN (SELECT P.ProfileID FROM Privacy WHERE PrivacyLevel < 3);
    
#QUERY 6
SELECT COUNT(*) AS NonDrinkingSmokers FROM PROFILE WHERE IsDrinker = 0 AND IsSmoker = 1;

#QUERY 7
SELECT * FROM PROFILE WHERE HasKids GROUP BY Age;



From Owner
join Pet_3 on Owner. OwnerId = Pet_3.OwnerID
join Breed on Pet_3.PetBreed = Breed.BreedName;


