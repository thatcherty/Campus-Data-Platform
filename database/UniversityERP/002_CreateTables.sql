use Campus


create table Users (
	CustomerID int identity(10000,1)
		constraint PK_CustomerID Primary Key,

	-- keep values stored in row
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Email nvarchar(255) not null,
	DateCreated DateTime2 not null
		constraint DF_Users_DateCreated Default sysdatetime()
)

create table Students (
	-- Auto increment PK from 1000
	StudentUID int identity(1000,1)
		constraint PK_Students Primary Key,

	-- FK to Users table
	CustomerID int not null
		constraint FK_Student_CustomerID
		References Users(CustomerID),
	Active bit not null
		constraint DF_Student_Active Default 1
)

-- may replace with ASP.NET Identity
create table Logins (
	LoginID int identity(1,1),

	-- will be FK
	CustomerID int not null
		constraint FK_Login_CustomerID
		References Users(CustomerID),
	Username nvarchar(100) not null,

	-- save space with varchar
	PasswordHash varchar(255),
	Active bit not null
		constraint DF_Login_Active Default 1,

	LastLoginAt DateTime2
)


create table CourseOfferings (
	-- Auto increment PK from 1
	CourseID int identity(1,1)
		constraint PK_Course Primary Key,

	-- keep values stored in row
	CourseName nvarchar(255) not null,
	Active bit not null
		constraint DF_Course_Active Default 1,
	DateCreated DateTime2 not null
		constraint DF_Course_DateCreated Default sysdatetime()
)

create table Enrollments (
	CourseID int not null
		constraint FK_Reg_CourseID
		references CourseOfferings(CourseID),
	StudentUID int not null
		constraint FK_Reg_StudentUID
		references Students(StudentUID),
	DateRegistered DateTime2 not null
		constraint DF_DateRegistered Default sysdatetime(),

	CONSTRAINT PK_Enrollments
        PRIMARY KEY (StudentUID, CourseID)
)