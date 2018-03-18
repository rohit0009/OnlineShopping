-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2018 at 11:49 AM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

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
(1, 'Men Tshirt', 'This is a category for Men t-shirt'),
(2, 'Men Shirt', 'This is a category for Men Shirt'),
(3, 'Men Jacket', 'This is a category for Men Jacket'),
(5, 'Men Jeans', 'This is a category for Men Jeans'),
(6, 'Men Trouser', 'This is a category for Men Trouser'),
(7, 'Men Shorts', 'This is a category for Men Shorts'),
(8, 'Women Shirt', 'This is category for Women Shirts'),
(9, 'Women Top', 'This is category for Women Top'),
(10, 'Women Sweatshirt', 'This is category for Women Sweatshirts'),
(11, 'Women Jeans', 'This is category for Women Jeans'),
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
  `to_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_desc`, `discount`, `from_amount`, `to_amount`) VALUES
(1, '2000 - 3999', 10, 2000, 3999),
(2, '4000 - 6999', 20, 4000, 6999),
(7, '8000 - 11999', 20, 8000, 11999);

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

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`i_id`, `price`, `total_items_ordered`, `items_left`, `p_id`) VALUES
(45, 1500, 10, 10, 51),
(46, 1500.5, 150, 150, 52),
(47, 800, 40, 40, 53),
(48, 1500, 150, 150, 54),
(49, 500, 10, 10, 55),
(50, 500, 10, 10, 56),
(51, 1500, 10, 10, 57),
(52, 1500, 20, 20, 58),
(53, 800, 40, 40, 59),
(54, 500, 40, 40, 60),
(55, 1500, 10, 10, 61),
(56, 500, 150, 150, 62),
(57, 500, 200, 200, 63),
(58, 1500, 10, 10, 64),
(59, 3000, 10, 10, 65),
(60, 1500, 40, 40, 66),
(61, 1500.5, 100, 100, 67);

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
  `description` varchar(150) NOT NULL,
  `image_path` varchar(150) NOT NULL,
  `image_path_2` varchar(150) NOT NULL,
  `image_path_3` varchar(150) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `s_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`p_id`, `pname`, `ideal_for`, `size`, `fabric`, `color`, `description`, `image_path`, `image_path_2`, `image_path_3`, `brand`, `s_id`, `cat_id`) VALUES
(51, 'Casual Blue Shirt', 'men', 'l', 'silk', 'Navy Blue', 'RODID stylish blue slim fit shirt is perfect for the casual / semi-formal outing.', 'D:/workspacemca/WebContent/images/men/Men Shirt/Navy Blue/img3434365727689848189.jpg', 'D:/workspacemca/WebContent/images/men/Men Shirt/Navy Blue/img8396294378776092422.jpg', 'D:/workspacemca/WebContent/images/men/Men Shirt/Navy Blue/img8357204756679135242.jpg', 'Levis', 5001, 2),
(52, 'Casual White Shirt', 'men', 'l', 'cotton', 'White', 'RODID stylish white slim fit shirt is perfect for the casual / semi-formal outing.', 'D:/workspacemca/WebContent/images/men/Men Shirt/White/img6676072405147533428.jpg', 'D:/workspacemca/FashionWorld/WebContent/images/men/Men Shirt/White/img55068731751715802.jpg', 'D:/workspacemca/WebContent/images/men/Men Shirt/White/img7331615711812502059.jpg', 'Allen Solly', 5003, 2),
(53, 'Checks Shirt', 'men', 'l', 'cotton', 'Gray', 'Highlander Checkered 100% Cotton Woven Slim Fit Black::Grey Shirt', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shirt/Gray/img1828632380712878241.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shirt/Gray/img2259016586826841756.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shirt/Gray/img5258324480708244028.jpg', 'Highlander', 5003, 2),
(54, 'Jacket', 'men', 'm', 'wool', 'Blue', 'Tinted takes cares of all its customers no matter to which genre they belong.', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jacket/Blue/img1389733190404487236.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jacket/Blue/img9101553964894259763.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jacket/Blue/img2947784638683399945.jpg', 'Highlander', 5002, 3),
(55, 'White TShirt', 'men', 'm', 'cotton', 'White', 'White Tshirt, comfortable', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Tshirt/White/img5264539608085930170.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Tshirt/White/img8166376054031282706.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Tshirt/White/img1222431581169305232.jpg', 'Lotto', 5001, 1),
(56, 'Tshirt Stripes', 'men', 'l', 'cotton', 'Blue', 'Gentle Machine Wash', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Tshirt/Blue/img1242763195496242301.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Tshirt/Blue/img4366959823120414369.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Tshirt/Blue/img8846316074812116929.jpg', 'Highlander', 5002, 1),
(57, 'Rider Jacket', 'men', 'l', 'wool', 'Black', 'Riders Jackets', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jacket/Black/img8023448465750891330.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jacket/Black/img7163735742156874380.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jacket/Black/img4740520793548465972.jpg', 'Harley Davidson', 5004, 3),
(58, 'Red Jacket', 'men', 'm', 'cotton', 'Red', 'High quality Designer Hooded Jacket Full sleeves direct from the manufacturers.', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jacket/Red/img5226129311830969198.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jacket/Red/img4165532896595671694.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jacket/Red/img4621765246352142066.jpg', 'Lotto', 5003, 3),
(59, 'Regular Trouser', 'men', 'm', 'cotton', 'Blue', 'This model has a height of 6 feet 2 inch and is wearing a of Size', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Trouser/Blue/img2016785881402793417.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Trouser/Blue/img1177974039187555503.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Trouser/Blue/img3754085083689042069.jpg', 'U S Polo Assn', 5003, 6),
(60, 'Skinny Trouser', 'men', 'm', 'cotton', 'Black', 'This model has a height of 6 feet 2 inch and is wearing a of Size', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Trouser/Black/img959745900863293592.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Trouser/Black/img5707948504291386853.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Trouser/Black/img3647578812643297143.jpg', 'U S Polo Assn', 5002, 6),
(61, 'Trouser', 'men', 'l', 'cotton', 'Gray', 'This model has a height of 6 feet 2 inch and is wearing a of Size', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Trouser/Gray/img2483151096490337506.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Trouser/Gray/img177870448324441075.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Trouser/Gray/img45719259821557134.jpg', 'Levis', 5001, 6),
(62, 'Regular Jeans White Wash', 'men', 'm', 'cotton', 'Blue', 'L,Zard Regular Fit Men\'S Jeans - Crafted From Cotton To Cater To Your Comfort Demands', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jeans/Blue/img4786804310293654030.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jeans/Blue/img927257055676945644.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jeans/Blue/img6211779342782919151.jpg', 'Levis', 5001, 5),
(63, 'Jeans', 'men', 'l', 'cotton', 'Black', 'L,Zard Regular Fit Men\'S Jeans', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jeans/Black/img6970270456630627516.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jeans/Black/img8797525860721034061.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jeans/Black/img6279688101978782060.jpg', 'Levis', 5004, 5),
(64, 'Gray Jeans', 'men', 'm', 'cotton', 'Gray', 'L,Zard Regular Fit Men\'S Jeans', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jeans/Gray/img6291240363212818946.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jeans/Gray/img1092063205003624023.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Jeans/Gray/img4087967941204867583.jpg', 'Levis', 5005, 5),
(65, 'Shorts Red', 'men', 'l', 'cotton', 'Red', 'High quality Men\'s Shorts direct from the manufacturers', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shorts/Red/img3608054830376961169.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shorts/Red/img5325121903397079573.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shorts/Red/img9132817956475667391.jpg', 'Jordan', 5002, 7),
(66, 'Shorts', 'men', 'l', 'cotton', 'Gray', 'High quality Men\'s Shorts direct from the manufacturers', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shorts/Gray/img3527310851277178069.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shorts/Gray/img2937785863978947261.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shorts/Gray/img7477857772274885168.jpg', 'Nike', 5002, 7),
(67, 'Shorts', 'men', 'm', 'cotton', 'Black', 'High quality Men\'s Shorts direct from the manufacturers', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shorts/Black/img2354967654969739527.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shorts/Black/img6572992847048988587.jpg', 'D:/workspacemca/OnlineShopping/WebContent/images/men/Men Shorts/Black/img6621284093552218873.jpg', 'Highlander', 5001, 7);

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
  ADD PRIMARY KEY (`coupon_id`);

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
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
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
