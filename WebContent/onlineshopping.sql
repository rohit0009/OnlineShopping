-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 11, 2018 at 12:43 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `b_id` int(11) NOT NULL,
  `bill_amount` double NOT NULL,
  `delivery_charges` double NOT NULL,
  `total_amount` double NOT NULL,
  `u_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `total_price` double NOT NULL,
  `u_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) NOT NULL,
  `cat_desc` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_desc`) VALUES
(1, 'Men T-shirt', 'This is a category for Men t-shirt'),
(2, 'Men Shirt', 'This is a category for Men Shirt'),
(3, 'Men Jacket', 'This is a category for Men Jacket'),
(4, 'Men Track Pant', 'This is a category for Men Track Pant'),
(5, 'Men Jeans', 'This is a category for Men Jeans'),
(6, 'Men Trouser', 'This is a category for Men Trouser'),
(7, 'Men Shorts', 'This is a category for Men Shorts'),
(8, 'Women Shirt', 'This is category for Women Shirts'),
(9, 'Women Top', 'This is category for Women Top'),
(10, 'Women Sweatshirt', 'This is category for Women Sweatshirts'),
(11, 'Women Jeans', 'This is category for Women Jeans'),
(12, 'Women Capris', 'This is category for Women Capris'),
(13, 'Women Saree', 'This is category for Women Sarees'),
(14, 'Women Kurtas', 'This is category for Women Kurtas');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_desc` varchar(80) NOT NULL,
  `discount` int(11) NOT NULL,
  `from_amount` double NOT NULL,
  `to_amount` double NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `i_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `total_items_ordered` int(11) NOT NULL,
  `items_left` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `p_id` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `ideal_for` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `fabric` varchar(30) NOT NULL,
  `color` varchar(20) NOT NULL,
  `description` varchar(30) NOT NULL,
  `image_path` varchar(150) NOT NULL,
  `image_path_2` varchar(150) NOT NULL,
  `image_path_3` varchar(150) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `s_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registered_user`
--

CREATE TABLE `registered_user` (
  `u_id` int(11) NOT NULL,
  `u_fname` varchar(50) NOT NULL,
  `u_lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(35) NOT NULL,
  `contact` bigint(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `r_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered_user`
--

INSERT INTO `registered_user` (`u_id`, `u_fname`, `u_lname`, `email`, `password`, `contact`, `gender`, `r_id`) VALUES
(300001, 'Rohit', 'Shewale', 'rohitpshewale@domain.com', 'Rohit0009', 8055228282, 'm', 1002),
(300002, 'Neha', 'Shende', 'nehamshende@gmail.com', 'asdqweasd', 8055228282, 'f', 1001),
(300003, 'Monica', 'Geller', 'monica@gmail.com', 'mon12345', 9909872314, 'f', 1001);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `r_id` int(11) NOT NULL,
  `r_name` varchar(80) NOT NULL,
  `r_desc` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`r_id`, `r_name`, `r_desc`) VALUES
(1001, 'Customer', 'Role for customer'),
(1002, 'Admin', 'Role for admin');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `s_id` int(11) NOT NULL,
  `s_fname` varchar(30) NOT NULL,
  `s_lname` varchar(30) NOT NULL,
  `s_email` varchar(50) NOT NULL,
  `s_contact` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`s_id`, `s_fname`, `s_lname`, `s_email`, `s_contact`) VALUES
(5001, 'Rachel', 'Greene', 'rachel@gmail.com', 9921098765),
(5002, 'Chandler', 'Bing', 'chandler@gmail.com', 8988231464),
(5003, 'Ross', 'Geller', 'dr_ross@gmail.com', 7856319764),
(5004, 'Joseph', 'Tribianni', 'joey@gmail.com', 7648932315),
(5005, 'Phoebe', 'Buffay', 'phoebe@gmail.com', 7845219846);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`b_id`),
  ADD KEY `registered_user_billing` (`u_id`),
  ADD KEY `coupon_billing` (`coupon_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `registered_user_cart` (`u_id`),
  ADD KEY `billing_cart` (`b_id`),
  ADD KEY `product_cart` (`p_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD KEY `category_coupon` (`cat_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`i_id`),
  ADD KEY `product_inventory` (`p_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `supplier_product` (`s_id`),
  ADD KEY `category_product` (`cat_id`);

--
-- Indexes for table `registered_user`
--
ALTER TABLE `registered_user`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `user_role` (`r_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`s_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `registered_user`
--
ALTER TABLE `registered_user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300004;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5006;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `coupon_billing` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registered_user_billing` FOREIGN KEY (`u_id`) REFERENCES `registered_user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `billing_cart` FOREIGN KEY (`b_id`) REFERENCES `billing` (`b_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_cart` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registered_user_cart` FOREIGN KEY (`u_id`) REFERENCES `registered_user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `category_coupon` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `product_inventory` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `category_product` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_product` FOREIGN KEY (`s_id`) REFERENCES `supplier` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registered_user`
--
ALTER TABLE `registered_user`
  ADD CONSTRAINT `registered_user_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
