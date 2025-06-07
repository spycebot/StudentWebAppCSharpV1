ALTER TABLE Users ADD Role NVARCHAR(50);

UPDATE Users Set Role = 'admin' where username = 'admin';