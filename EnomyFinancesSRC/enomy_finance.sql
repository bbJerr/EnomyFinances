CREATE DATABASE enomy_finance;

USE enomy_finance;

CREATE TABLE user (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  user_email VARCHAR(50) NOT NULL,
  user_password VARCHAR(60) NOT NULL,
  user_number INT NOT NULL,
  PRIMARY KEY (user_id),
  UNIQUE (user_email)
);

CREATE TABLE role (
  role_id INT NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(50) NOT NULL,
  role_description VARCHAR(50) NOT NULL,
  PRIMARY KEY (role_id)
);

CREATE TABLE user_role (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE TABLE investment
(
  investment_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  investment_type VARCHAR(50) NOT NULL, 
  initial_lump_sum INT NOT NULL,
  monthly_investment INT NOT NULL, 
  one_year_return INT NOT NULL,
  five_year_return INT NOT NULL,
  ten_year_return INT NOT NULL,
  one_year_profit INT NOT NULL,
  five_year_profit INT NOT NULL,
  ten_year_profit INT NOT NULL,
  one_year_fees INT NOT NULL,
  five_year_fees INT NOT NULL,
  ten_year_fees INT NOT NULL,
  one_year_taxes INT NOT NULL,
  five_year_taxes INT NOT NULL,
  ten_year_taxes INT NOT NULL,  
  PRIMARY KEY (investment_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

INSERT INTO role (role_name, role_description)
VALUES ('Client', 'Client Role'),
	   ('Admin', 'Admin Role');
       
INSERT INTO user (user_name, user_email, user_password, user_number)
VALUES ("Admin1", "admin1@gmail.com", "$2a$10$LgDeOH3c.vvnbgy.VI/OOedQzT6Nw/1xiqegAk96Dgmps6EwnmuGi", "121212"),
	   ("Admin2", "admin2@gmail.com", "$2a$10$LgDeOH3c.vvnbgy.VI/OOedQzT6Nw/1xiqegAk96Dgmps6EwnmuGi", "343434");

INSERT INTO user_role
VALUES (1,2),
	   (2,2);

SELECT * FROM user;

SELECT u.user_email, r.role_name
FROM user u
JOIN user_role ur ON u.user_id = ur.user_id
JOIN role r ON ur.role_id = r.role_id
WHERE u.user_email = 'email@gmail.com';

ALTER TABLE user MODIFY user_password VARCHAR(60) NOT NULL;

