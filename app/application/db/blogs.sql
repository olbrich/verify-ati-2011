CREATE TABLE IF NOT EXISTS blogs (
id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(80) NOT NULL,
body TEXT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
updated_at TIMESTAMP);