-- tạo bảng database 
create database pawnder_database
use pawnder_database

CREATE TABLE Role (
    RoleId INT IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE UserStatus (
    UserStatusId INT IDENTITY(1,1) PRIMARY KEY,
    UserStatusName VARCHAR(50) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE UserProfiles (
    ProfileId INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100),
    Gender VARCHAR(10),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Locations (
    LocationId INT IDENTITY(1,1) PRIMARY KEY,
    Country NVARCHAR(100),
    Province NVARCHAR(100),
    District NVARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    RoleId INT FOREIGN KEY REFERENCES Role(RoleId),
    ProfileId INT FOREIGN KEY REFERENCES UserProfiles(ProfileId),
    UserStatusId INT FOREIGN KEY REFERENCES UserStatus(UserStatusId),
    PetId INT NULL, -- sẽ liên kết tới Pet
    LocationId INT FOREIGN KEY REFERENCES Locations(LocationId),
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    TokenJWT VARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE AttributePreferences (
    AttributePreferencesId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    TypeValue VARCHAR(50),
    Unit VARCHAR(20),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE UserPreferences (
    UserPreferencesId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT FOREIGN KEY REFERENCES Users(UserId),
    AttributePreferencesId INT FOREIGN KEY REFERENCES AttributePreferences(AttributePreferencesId),
    Value NVARCHAR(200),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE PetAttributes (
    AttributePetId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    TypeValue VARCHAR(50),
    Unit VARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Pet (
    PetId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    Breed NVARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Description NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE PetCharacteristics (
    PetCharacteristicsId INT IDENTITY(1,1) PRIMARY KEY,
    PetId INT FOREIGN KEY REFERENCES Pet(PetId),
    AttributePetId INT FOREIGN KEY REFERENCES PetAttributes(AttributePetId),
    Value NVARCHAR(200),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE PetPhoto (
    PhotoId INT IDENTITY(1,1) PRIMARY KEY,
    PetId INT FOREIGN KEY REFERENCES Pet(PetId),
    ImagePetURL NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE RequestMatches (
    MatchId INT IDENTITY(1,1) PRIMARY KEY,
    FromUserId INT FOREIGN KEY REFERENCES Users(UserId),
    ToUserId INT FOREIGN KEY REFERENCES Users(UserId),
    StatusRequest VARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Messages (
    MessagesId INT IDENTITY(1,1) PRIMARY KEY,
    MatchId INT FOREIGN KEY REFERENCES RequestMatches(MatchId),
    UserId INT FOREIGN KEY REFERENCES Users(UserId),
    Content NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE PaymentHistory (
    HistoryId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT FOREIGN KEY REFERENCES Users(UserId),
    StatusService VARCHAR(50),
    StartDate DATETIME,
    EndDate DATETIME,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Block (
    BlockId INT IDENTITY(1,1) PRIMARY KEY,
    FromUserId INT FOREIGN KEY REFERENCES Users(UserId),
    ToUserId INT FOREIGN KEY REFERENCES Users(UserId),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Reports (
    ReportId INT IDENTITY(1,1) PRIMARY KEY,
    FromUserId INT FOREIGN KEY REFERENCES Users(UserId),
    ToUserId INT FOREIGN KEY REFERENCES Users(UserId),
    Reason NVARCHAR(200),
    Status VARCHAR(50),
    Resolution NVARCHAR(200),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Notifications (
    NotificationId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT FOREIGN KEY REFERENCES Users(UserId),
    Title NVARCHAR(200),
    Message NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

-- thêm data cho các bảng
INSERT INTO Role (RoleName) VALUES
('Admin'),
('User');

INSERT INTO UserStatus (UserStatusName) VALUES
(N'Hoạt động'),
(N'Không hoạt động'),
(N'Bị khóa');

INSERT INTO UserProfiles (FullName, Gender) VALUES
(N'Nguyễn Văn An', 'Nam'),
(N'Trần Thị Bình', 'Nữ');

INSERT INTO Locations (Country, Province, District) VALUES
(N'Việt Nam', N'Hà Nội', N'Ba Đình'),
(N'Việt Nam', N'Hồ Chí Minh', N'Quận 1');

INSERT INTO Users (RoleId, ProfileId, UserStatusId, LocationId, Email, PasswordHash, TokenJWT)
VALUES
(1, 1, 1, 1, 'admin@pawnder.vn', 'matkhau_admin', 'token_admin'),
(2, 2, 1, 2, 'user@pawnder.vn', 'matkhau_user', 'token_user');

INSERT INTO AttributePreferences (Name, TypeValue, Unit, IsActive)
VALUES
(N'Khoảng cách', 'Number', 'km', 1),
(N'Kích cỡ', 'String', NULL, 1);

INSERT INTO UserPreferences (UserId, AttributePreferencesId, Value)
VALUES
(2, 1, N'10'),
(2, 2, N'Small');

INSERT INTO PetAttributes (Name, TypeValue, Unit)
VALUES
(N'màu lông', 'String', NULL),
(N'chiều cao', 'Number', 'kg'),
(N'cân nặng', 'Number', 'cm');

INSERT INTO Pet (Name, Breed, Gender, Age, Description)
VALUES
(N'Lucky', N'Poodle', 'Male', 2, N'Dễ thương, thông minh'),
(N'Miu', N'Mèo Anh Lông Ngắn', 'Female', 1, N'Rất ngoan, thích chơi đồ');

INSERT INTO PetCharacteristics (PetId, AttributePetId, Value)
VALUES
(1, 1, N'Nâu'),
(1, 2, N'5'),
(1, 3, N'30'),
(2, 1, N'Xám'),
(2, 2, N'3'),
(2, 3, N'25');


