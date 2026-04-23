-- 1. Создание базы данных
CREATE DATABASE WebPracticeDB;
GO

USE WebPracticeDB;
GO

-- 2. Создание таблицы Clients
CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(255),
    Email NVARCHAR(255),
    Phone NVARCHAR(50)
);
GO

-- 3. Заполнение тестовыми данными
INSERT INTO Clients (FullName, Email, Phone) VALUES
(N'Иван Иванов', 'ivanov@example.com', '+79001112233'),
(N'Мария Петрова', 'petrova@example.com', '+79002223344'),
(N'Алексей Смирнов', 'smirnov@example.com', '+79003334455');
GO

-- 4. Создание SQL-пользователя для доступа приложения
USE master;
GO

CREATE LOGIN webuser WITH PASSWORD = 'WebUser123!';
GO

USE WebPracticeDB;
GO

CREATE USER webuser FOR LOGIN webuser;
GO

ALTER ROLE db_owner ADD MEMBER webuser;
GO