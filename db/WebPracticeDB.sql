-- 1. Создание базы данных
CREATE DATABASE WebPracticeDB;
GO

USE WebPracticeDB;
GO

-- 2. Создание таблицы Clients
CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(150) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(30)
);
GO

-- 3. Создание таблицы Statuses
CREATE TABLE Statuses (
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName NVARCHAR(50) NOT NULL
);
GO

-- 4. Создание таблицы Requests
CREATE TABLE Requests (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    StatusID INT NOT NULL,
    RequestTitle NVARCHAR(200) NOT NULL,
    RequestText NVARCHAR(1000),
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Requests_Clients
        FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),

    CONSTRAINT FK_Requests_Statuses
        FOREIGN KEY (StatusID) REFERENCES Statuses(StatusID)
);
GO

-- 5. Заполнение таблицы Clients тестовыми данными
INSERT INTO Clients (FullName, Email, Phone) VALUES
(N'Иван Иванов', N'ivanov@example.com', N'+79001112233'),
(N'Мария Петрова', N'petrova@example.com', N'+79002223344'),
(N'Алексей Смирнов', N'smirnov@example.com', N'+79003334455');
GO

-- 6. Заполнение таблицы Statuses тестовыми данными
INSERT INTO Statuses (StatusName) VALUES
(N'Новая'),
(N'В работе'),
(N'Закрыта');
GO

-- 7. Заполнение таблицы Requests тестовыми данными
INSERT INTO Requests (ClientID, StatusID, RequestTitle, RequestText) VALUES
(1, 1, N'Проблема с доступом', N'Не могу войти в систему'),
(2, 2, N'Запрос на услугу', N'Нужна консультация по продукту'),
(3, 3, N'Ошибка в системе', N'Появляется ошибка при сохранении');
GO

-- 8. Создание SQL-пользователя для доступа приложения
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