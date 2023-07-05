create database pizza_ordering;

select * from `pizza_ordering`.`customers`;

CREATE TABLE `pizza_ordering`.`customers` (
  `cust_id` int not null auto_increment,
  `customer_name` VARCHAR(45) NOT NULL,
  `phone_num` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cust_id`));
  
insert into `pizza_ordering`.`customers` (`cust_id`, `customer_name`, `phone_num`)
values (1, 'Trevor Page', '226-555-4982');

insert into `pizza_ordering`.`customers` (`cust_id`, `customer_name`, `phone_num`)
values (2, 'John Doe', '555-555-9498');
  
  -- -----------------------------------------
  
  CREATE TABLE `pizza_ordering`.`menu` (
  `item_id` int not null auto_increment,
  `dish_title` VARCHAR(40),
  `dish_cost` DECIMAL(4,2) NULL,
  PRIMARY KEY (`item_id`));
  
insert into `pizza_ordering`.`menu` (`item_id`, `dish_title`, `dish_cost`)
values (1, 'Pepperoni & Cheese', 7.99);

insert into `pizza_ordering`.`menu` (`item_id`, `dish_title`, `dish_cost`)
values (2, 'Vegetarian', 9.99);

insert into `pizza_ordering`.`menu` (`item_id`, `dish_title`, `dish_cost`)
values (3, 'Meat Lovers', 14.99);

insert into `pizza_ordering`.`menu` (`item_id`, `dish_title`, `dish_cost`)
values (4, 'Hawaiian', 12.99);

select * from `pizza_ordering`.`menu`;
  
-- -----------------------------------------------------
  
  CREATE TABLE `pizza_ordering`.`customer_transaction` (
  `trans_id` int not null auto_increment,
  `order_date` DATETIME NULL,
  `pizza_order` VARCHAR(250) NULL,
  `cost_order` DECIMAL(5,2) NULL,
  `cust_id` int not null,
  `item_id` int not null,
  foreign key (`cust_id`) references `customers`(`cust_id`),
  foreign key(`item_id`) references `menu`(`item_id`),
  PRIMARY KEY (`trans_id`));
  
  -- seperate orders by date, to see which customers are ordering on which date
  select * from `pizza_ordering`.`customers`
  join `pizza_ordering`.`customer_transaction` on `pizza_ordering`.`customers`.cust_id = `pizza_ordering`.`customer_transaction`.cust_id;
  
  
-- This query shows which customer spent the most money 
  select sum(cost_order) as Most_Money_Spent_By_Customer, `cust_id` as Customer_id from `pizza_ordering`.`customer_transaction` 
  group by cust_id;
  
  select * from `pizza_ordering`.`customer_transaction`;
  
insert into `pizza_ordering`.`customer_transaction` (`trans_id`, `order_date`, `pizza_order`, `cost_order`, `cust_id`, `item_id`)
values ('1', '2014-09-10 09:47:00', 'Pepperoni & Cheese', 7.99, 1, 1), ('2', '2014-09-10 09:47:00', 'Meat Lovers', 14.99, 1, 3),
('3', '2014-09-10 09:47:00', 'Meat Lovers', 14.99, 1, 3), ('4', '2014-09-10 09:47:00', 'Hawaiian', 12.99, 1, 4);

insert into `pizza_ordering`.`customer_transaction` (`trans_id`, `order_date`, `pizza_order`, `cost_order`, `cust_id`, `item_id`)
values ('5', '2014-09-10 13:20:00', 'Vegetarian', 9.99, 2, 2), ('6', '2023-06-28 15:39:03', 'Meat Lovers', 14.99, 2, 3), 
('7', '2023-06-28 15:39:03', 'Meat Lovers', 14.99, 2, 3); 




  
  