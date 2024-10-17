### DATABASE AND TABLE DETAILS ###
Database Name -> CaseStudy.mdf
Total 4 tables are created.

### First Table ###
CREATE TABLE [dbo].[Attendance] (
    [AttendanceID] INT          IDENTITY (1, 1) NOT NULL,
    [EmployeeID]   INT          NOT NULL,
    [Date]         DATE         NOT NULL,
    [CheckInTime]  DATETIME     NULL,
    [CheckOutTime] DATETIME     NULL,
    [Status]       VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([AttendanceID] ASC),
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([EmployeeId])
);

### Second Table ###
CREATE TABLE [dbo].[Employees] (
    [EmployeeId] INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]  VARCHAR (50)  NOT NULL,
    [LastName]   VARCHAR (50)  NOT NULL,
    [Email]      VARCHAR (100) NOT NULL,
    [Phone]      VARCHAR (15)  NULL,
    [Department] VARCHAR (50)  NULL,
    [HireDate]   DATE          NOT NULL,
    [Position]   VARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC),
    CONSTRAINT [AK_Employees_Column] UNIQUE NONCLUSTERED ([Email] ASC)
);

### Third Table ###
CREATE TABLE [dbo].[Payroll] (
    [PayrollID]        INT             IDENTITY (1, 1) NOT NULL,
    [EmployeeID]       INT             NOT NULL,
    [PayPeriodStart]   DATE            NOT NULL,
    [PayPeriodEnd]     DATE            NOT NULL,
    [BasicSalary]      DECIMAL (10, 2) NOT NULL,
    [TotalHoursWorked] DECIMAL (10, 2) NULL,
    [Deductions]       DECIMAL (10, 2) NULL,
    [NetPay]           DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([PayrollID] ASC),
    FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([EmployeeId])
);

### Fourth Table ###
CREATE TABLE [dbo].[Users] (
    [UserID]       INT           IDENTITY (1, 1) NOT NULL,
    [Username]     VARCHAR (50)  NOT NULL,
    [PasswordHash] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC),
    UNIQUE NONCLUSTERED ([Username] ASC)
);
