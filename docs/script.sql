Create Database RaceDay;

CREATE TABLE Organizers (
    OrganizerID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Venues (
    VenueID INT IDENTITY(1,1) PRIMARY KEY,
    VenueName VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Country VARCHAR(50) DEFAULT 'South Africa',
    Capacity INT
);

CREATE TABLE Events (
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    EventName VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    EventDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Upcoming',
    OrganizerID INT NOT NULL,
    VenueID INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (OrganizerID) REFERENCES Organizer(OrganizerID),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
);

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    CategoryName VARCHAR(50) NOT NULL,
    DistanceKm DECIMAL(5,2) NOT NULL,
    AgeGroup VARCHAR(20),
    GenderRestriction VARCHAR(10) CHECK (GenderRestriction IN ('Male', 'Female', 'Open')),
    EntryFee DECIMAL(10,2) DEFAULT 0.00,
    MaxParticipants INT,
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

CREATE TABLE Participants (
    ParticipantID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    DateOfBirth DATE,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Enrollments (
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantID INT NOT NULL,
    CategoryID INT NOT NULL,
    EnrollmentDate DATETIME DEFAULT GETDATE(),
    Status VARCHAR(20) DEFAULT 'Registered',
    PaymentStatus VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (ParticipantID) REFERENCES Participant(ParticipantID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Result (
    ResultsID INT IDENTITY(1,1) PRIMARY KEY,
    EnrollmentID INT NOT NULL,
    FinishTime TIME,
    Position INT,
    Pace VARCHAR(10),
    RaceStatus VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID)
);

INSERT INTO Organizers (Name, Email, Phone, PasswordHash) VALUES
('Comrades Marathon Association', 'info@comrades.com', '033 345 6789', 'hashed_password_1'),
('Two Oceans Marathon', 'info@twooceans.com', '021 123 4567', 'hashed_password_2');

INSERT INTO Venues (VenueName, Address, City, Country, Capacity) VALUES
('Moses Mabhida Stadium', '44 Isaiah Ntshangase Rd, Stamford Hill', 'Durban', 'South Africa', 56000),
('Newlands Stadium', '49 Boundary Rd, Newlands', 'Cape Town', 'South Africa', 50000),
('OR Tambo Stadium', '44 Eleazer St, Wattville', 'Johannesburg', 'South Africa', 35000);

INSERT INTO Events (EventName, Description, EventDate, Status, OrganizerID, VenueID) VALUES
('Comrades Marathon', 'The ultimate human race - 89km from Durban to Pietermaritzburg', '2026-06-16', 'Upcoming', 1, 1),
('Two Oceans Marathon', 'The world''s most beautiful marathon - 56km around Cape Town', '2026-04-18', 'Upcoming', 2, 2),
('Soweto Marathon', 'Iconic 42km race through the streets of Soweto', '2026-11-07', 'Upcoming', 1, 3);

INSERT INTO Categories (EventID, CategoryName, DistanceKm, AgeGroup, GenderRestriction, EntryFee, MaxParticipants) VALUES
(1, '42km Male', 42.20, '18-39', 'Male', 350.00, 5000),
(1, '42km Female', 42.20, '18-39', 'Female', 350.00, 3000),
(1, '21km Male', 21.10, '18-39', 'Male', 250.00, 3000),
(1, '21km Female', 21.10, '18-39', 'Female', 250.00, 2000),
(1, '10km Open', 10.00, 'Open', 'Open', 150.00, 2000);

INSERT INTO Categories (EventID, CategoryName, DistanceKm, AgeGroup, GenderRestriction, EntryFee, MaxParticipants) VALUES
(2, '56km Male', 56.00, '18-39', 'Male', 400.00, 3000),
(2, '56km Female', 56.00, '18-39', 'Female', 400.00, 2000),
(2, '21km Open', 21.10, 'Open', 'Open', 200.00, 4000);

INSERT INTO Categories (EventID, CategoryName, DistanceKm, AgeGroup, GenderRestriction, EntryFee, MaxParticipants) VALUES
(3, '42km Male', 42.20, '18-39', 'Male', 300.00, 4000),
(3, '42km Female', 42.20, '18-39', 'Female', 300.00, 3000),
(3, '10km Open', 10.00, 'Open', 'Open', 100.00, 3000);

INSERT INTO Participants (Name, Email, Phone, Gender, DateOfBirth, PasswordHash) VALUES
('Thabo Mokoena', 'thabo.m@email.com', '082 123 4567', 'Male', '1995-03-15', 'hashed_password_3'),
('Sarah van der Merwe', 'sarah.vdm@email.com', '083 987 6543', 'Female', '1992-07-22', 'hashed_password_4');

INSERT INTO Enrollment (ParticipantID, CategoryID, EnrollmentDate, Status, PaymentStatus) VALUES
(1, 1, GETDATE(), 'Registered', 'Paid'),
(2, 8, GETDATE(), 'Registered', 'Paid'),
(1, 10, GETDATE(), 'Registered', 'Pending');

INSERT INTO Results (EnrollmentID, FinishTime, Position, Pace, RaceStatus) VALUES
(1, '05:20:45', 245, '5:30/km', 'Finished'),
(2, '02:15:30', 89, '6:25/km', 'Finished');


SELECT * FROM Organizer;


SELECT * FROM Venue;


SELECT * FROM Event;


SELECT * FROM Category;


SELECT * FROM Participant;


SELECT * FROM Enrollment;



SELECT * FROM Results;


