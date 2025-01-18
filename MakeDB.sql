# 1. Database 만들기
# db명 :  test

CREATE DATABASE test;
use test;
# 직원 그룹관리
CREATE TABLE groupp(
    group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name ENUM('manager', 'full_time', 'part_time') NOT NULL
    );
    
# 직원관리
use db;
CREATE TABLE employee (
        emp_id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        time DATETIME,
        pay INT NOT NULL CHECK (pay > 1000),
        group_id INT NOT NULL,
        store_id INT NOT NULL,
        FOREIGN KEY (group_id) REFERENCES emp_group(group_id)
        );
 
 CREATE TABLE `emp_group` (
  `group_id` int NOT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
);
 
CREATE TABLE `store` (
  `store_id` int NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `store_time` datetime DEFAULT NULL,
  `seat` int NOT NULL DEFAULT '2',
  PRIMARY KEY (`store_id`)
);
 
# 메뉴관리
CREATE TABLE menu (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    beverage VARCHAR(100) NOT NULL,
    season ENUM('spring', 'summer', 'fall', 'winter') NOT NULL,
    store_id INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
    );  
    
# 매출관리
CREATE TABLE sales (
    store_id INT PRIMARY KEY,
    total INT NOT NULL,
    profit INT NOT NULL,
    price INT NOT NULL
);
