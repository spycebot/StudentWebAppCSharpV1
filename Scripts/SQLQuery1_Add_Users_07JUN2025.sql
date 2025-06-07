UPDATE Users Set Role = 'admin' where username = 'admin';

SELECT * FROM Users where username = 'admin';

INSERT INTO Users (Username, Password, Role) 
VALUES ('user2', 'user123', 'user'),
('user3', 'user123', 'user');

SELECT * FROM Users;

UPDATE Users Set Role = 'user' where username = 'user1';

INSERT INTO Users (Username, Password, Role)
VALUES ('admin2', 'admin123', 'admin');