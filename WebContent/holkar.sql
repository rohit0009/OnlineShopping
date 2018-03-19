-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2018 at 09:51 AM
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
(7, '8000 - 11999', 20, 8000, 11999),
(8, 'Free shopping', 20, 12000, 18000),
(9, 'Free shopping2', 20, 7000, 7999);

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
(61, 1500.5, 100, 100, 67),
(62, 899, 6, 6, 68),
(63, 999, 8, 8, 69),
(64, 500, 50, 50, 70),
(65, 1500, 20, 20, 71),
(66, 1600, 25, 25, 72),
(67, 1200, 22, 22, 73),
(68, 1200, 15, 15, 74),
(69, 1300, 25, 25, 75),
(70, 1400, 20, 20, 76),
(71, 2000, 20, 20, 77),
(72, 1800, 15, 15, 78),
(73, 1900, 20, 20, 79),
(74, 650, 25, 25, 80),
(75, 800, 20, 20, 81),
(76, 900, 20, 20, 82);

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
(51, 'Casual Blue Shirt', 'men', 'l', 'silk', 'Navy Blue', 'RODID stylish blue slim fit shirt is perfect for the casual / semi-formal outing.', 'D:/FashionWorld/WebContent/images/men/Men Shirt/Navy Blue/img3434365727689848189.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shirt/Navy Blue/img8396294378776092422.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shirt/Navy Blue/img8357204756679135242.jpg', 'Levis', 5001, 2),
(52, 'Casual White Shirt', 'men', 'l', 'cotton', 'White', 'RODID stylish white slim fit shirt is perfect for the casual / semi-formal outing.', 'D:/FashionWorld/WebContent/images/men/Men Shirt/White/img6676072405147533428.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shirt/White/img55068731751715802.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shirt/White/img7331615711812502059.jpg', 'Allen Solly', 5003, 2),
(53, 'Checks Shirt', 'men', 'l', 'cotton', 'Gray', 'Highlander Checkered 100% Cotton Woven Slim Fit Black::Grey Shirt', 'D:/FashionWorld/WebContent/images/men/Men Shirt/Gray/img1828632380712878241.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shirt/Gray/img2259016586826841756.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shirt/Gray/img5258324480708244028.jpg', 'Highlander', 5003, 2),
(54, 'Jacket', 'men', 'm', 'wool', 'Blue', 'Tinted takes cares of all its customers no matter to which genre they belong.', 'D:/FashionWorld/WebContent/images/men/Men Jacket/Blue/img1389733190404487236.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jacket/Blue/img9101553964894259763.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jacket/Blue/img2947784638683399945.jpg', 'Highlander', 5002, 3),
(55, 'White TShirt', 'men', 'm', 'cotton', 'White', 'White Tshirt, comfortable', 'D:/FashionWorld/WebContent/images/men/Men Tshirt/White/img5264539608085930170.jpg', 'D:/FashionWorld/WebContent/images/men/Men Tshirt/White/img8166376054031282706.jpg', 'D:/FashionWorld/WebContent/images/men/Men Tshirt/White/img1222431581169305232.jpg', 'Lotto', 5001, 1),
(56, 'Tshirt Stripes', 'men', 'l', 'cotton', 'Blue', 'Gentle Machine Wash', 'D:/FashionWorld/WebContent/images/men/Men Tshirt/Blue/img1242763195496242301.jpg', 'D:/FashionWorld/WebContent/images/men/Men Tshirt/Blue/img4366959823120414369.jpg', 'D:/FashionWorld/WebContent/images/men/Men Tshirt/Blue/img8846316074812116929.jpg', 'Highlander', 5002, 1),
(57, 'Rider Jacket', 'men', 'l', 'wool', 'Black', 'Riders Jackets', 'D:/FashionWorld/WebContent/images/men/Men Jacket/Black/img8023448465750891330.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jacket/Black/img7163735742156874380.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jacket/Black/img4740520793548465972.jpg', 'Harley Davidson', 5004, 3),
(58, 'Red Jacket', 'men', 'm', 'cotton', 'Red', 'High quality Designer Hooded Jacket Full sleeves direct from the manufacturers.', 'D:/FashionWorld/WebContent/images/men/Men Jacket/Red/img5226129311830969198.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jacket/Red/img4165532896595671694.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jacket/Red/img4621765246352142066.jpg', 'Lotto', 5003, 3),
(59, 'Regular Trouser', 'men', 'm', 'cotton', 'Blue', 'This model has a height of 6 feet 2 inch and is wearing a of Size', 'D:/FashionWorld/WebContent/images/men/Men Trouser/Blue/img2016785881402793417.jpg', 'D:/FashionWorld/WebContent/images/men/Men Trouser/Blue/img1177974039187555503.jpg', 'D:/FashionWorld/WebContent/images/men/Men Trouser/Blue/img3754085083689042069.jpg', 'U S Polo Assn', 5003, 6),
(60, 'Skinny Trouser', 'men', 'm', 'cotton', 'Black', 'This model has a height of 6 feet 2 inch and is wearing a of Size', 'D:/FashionWorld/WebContent/images/men/Men Trouser/Black/img959745900863293592.jpg', 'D:/FashionWorld/WebContent/images/men/Men Trouser/Black/img5707948504291386853.jpg', 'D:/FashionWorld/WebContent/images/men/Men Trouser/Black/img3647578812643297143.jpg', 'U S Polo Assn', 5002, 6),
(61, 'Trouser', 'men', 'l', 'cotton', 'Gray', 'This model has a height of 6 feet 2 inch and is wearing a of Size', 'D:/FashionWorld/WebContent/images/men/Men Trouser/Gray/img2483151096490337506.jpg', 'D:/FashionWorld/WebContent/images/men/Men Trouser/Gray/img177870448324441075.jpg', 'D:/FashionWorld/WebContent/images/men/Men Trouser/Gray/img45719259821557134.jpg', 'Levis', 5001, 6),
(62, 'Regular Jeans White Wash', 'men', 'm', 'cotton', 'Blue', 'L,Zard Regular Fit Men\'S Jeans - Crafted From Cotton To Cater To Your Comfort Demands', 'D:/FashionWorld/WebContent/images/men/Men Jeans/Blue/img4786804310293654030.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jeans/Blue/img927257055676945644.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jeans/Blue/img6211779342782919151.jpg', 'Levis', 5001, 5),
(63, 'Jeans', 'men', 'l', 'cotton', 'Black', 'L,Zard Regular Fit Men\'S Jeans', 'D:/FashionWorld/WebContent/images/men/Men Jeans/Black/img6970270456630627516.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jeans/Black/img8797525860721034061.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jeans/Black/img6279688101978782060.jpg', 'Levis', 5004, 5),
(64, 'Gray Jeans', 'men', 'm', 'cotton', 'Gray', 'L,Zard Regular Fit Men\'S Jeans', 'D:/FashionWorld/WebContent/images/men/Men Jeans/Gray/img6291240363212818946.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jeans/Gray/img1092063205003624023.jpg', 'D:/FashionWorld/WebContent/images/men/Men Jeans/Gray/img4087967941204867583.jpg', 'Levis', 5005, 5),
(65, 'Shorts Red', 'men', 'l', 'cotton', 'Red', 'High quality Men\'s Shorts direct from the manufacturers', 'D:/FashionWorld/WebContent/images/men/Men Shorts/Red/img3608054830376961169.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shorts/Red/img5325121903397079573.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shorts/Red/img9132817956475667391.jpg', 'Jordan', 5002, 7),
(66, 'Shorts', 'men', 'l', 'cotton', 'Gray', 'High quality Men\'s Shorts direct from the manufacturers', 'D:/FashionWorld/WebContent/images/men/Men Shorts/Gray/img3527310851277178069.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shorts/Gray/img2937785863978947261.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shorts/Gray/img7477857772274885168.jpg', 'Nike', 5002, 7),
(67, 'Shorts', 'men', 'm', 'cotton', 'Black', 'High quality Men\'s Shorts direct from the manufacturers', 'D:/FashionWorld/WebContent/images/men/Men Shorts/Black/img2354967654969739527.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shorts/Black/img6572992847048988587.jpg', 'D:/FashionWorld/WebContent/images/men/Men Shorts/Black/img6621284093552218873.jpg', 'Highlander', 5001, 7),
(68, 'Cold Shoulder Womens Black Top', 'women', 's', 'linen', 'Black', 'This casual sexy creation goes with just about any pair of jeans. As for heels or flats, again itâ??s up to you.', 'D:/FashionWorld/WebContent/images/women/Women Top/Black/img3731915374955909526.jpg', 'D:/FashionWorld/WebContent/images/women/Women Top/Black/img7019745535552898991.jpg', 'D:/FashionWorld/WebContent/images/women/Women Top/Black/img6586376504605601672.jpg', 'Gucci', 5001, 9),
(69, 'Rare Casual Sleeveless Womens White Top', 'women', 'm', 'linen', 'White', 'White top in a patterned weave and floral detailing, has a round neck', 'D:/FashionWorld/WebContent/images/women/Women Top/White/img7133632018636538423.jpg', 'D:/FashionWorld/WebContent/images/women/Women Top/White/img5454532067058575172.jpg', 'D:/FashionWorld/WebContent/images/women/Women Top/White/img1810215809913677179.jpg', 'Mango', 5003, 9),
(70, 'Causual Blue Top', 'women', 's', 'cotton', 'Blue', 'The Dry State brings you this limited edition 100% Cotton Tshirt having a quality which none can match.', 'D:/FashionWorld/WebContent/images/women/Women Top/Blue/img5493963862281664488.jpg', 'D:/FashionWorld/WebContent/images/women/Women Top/Blue/img4167550329707747635.jpg', 'D:/FashionWorld/WebContent/images/women/Women Top/Blue/img7142723943871210370.jpg', 'Libas', 5002, 9),
(71, 'Full Sleeves Sweatshirt', 'women', 's', 'wool', 'Red', 'Winter is naughty in many layers , so keep it out of your system with this colourful Hooded sweatshirts for Women from the house of High Hill.', 'D:/FashionWorld/WebContent/images/women/Women Sweatshirt/Red/img1087850567679976838.jpg', 'D:/FashionWorld/WebContent/images/women/Women Sweatshirt/Red/img4235244117703487867.jpg', 'D:/FashionWorld/WebContent/images/women/Women Sweatshirt/Red/img8920538177045277859.jpg', 'Campus', 5003, 10),
(72, 'Full Sleeves Black sweatshirt', 'women', 'm', 'wool', 'Black', 'These Hoodies are for those who prefer wearing something comfy and relaxed on a regular basis.', 'D:/FashionWorld/WebContent/images/women/Women Sweatshirt/Black/img4625143471942924794.jpg', 'D:/FashionWorld/WebContent/images/women/Women Sweatshirt/Black/img6194283936905797915.jpg', 'D:/FashionWorld/WebContent/images/women/Women Sweatshirt/Black/img3425798354357025650.jpg', 'Campus', 5003, 10),
(73, 'Full Sleeves Brown Sweatshirt', 'women', 'l', 'wool', 'Brown', 'These Hoodies are for those who prefer wearing something comfy and relaxed on a regular basis.', 'D:/FashionWorld/WebContent/images/women/Women Sweatshirt/Brown/img949444797776747525.jpg', 'D:/FashionWorld/WebContent/images/women/Women Sweatshirt/Brown/img5504662318444909468.jpg', 'D:/FashionWorld/WebContent/images/women/Women Sweatshirt/Brown/img8269639008375232060.jpg', 'Campus', 5001, 10),
(74, 'Nifty Slim Women Jeans', 'women', 's', 'cotton', 'Blue', 'We take pride in our commitment to maintain quality standards in each piece that is marketed by us.', 'D:/FashionWorld/WebContent/images/women/Women Jeans/Blue/img6322838250442946478.jpg', 'D:/FashionWorld/WebContent/images/women/Women Jeans/Blue/img2888654870346219030.jpg', 'D:/FashionWorld/WebContent/images/women/Women Jeans/Blue/img7572459491852989673.jpg', 'Nifty', 5002, 11),
(75, 'Nifty Slim Women BlackJeans', 'women', 'm', 'linen', 'Black', 'We take pride in our commitment to maintain quality standards in each piece that is marketed by us.', 'D:/FashionWorld/WebContent/images/women/Women Jeans/Black/img4068757026224494049.jpg', 'D:/FashionWorld/WebContent/images/women/Women Jeans/Black/img7785979475316850374.jpg', 'D:/FashionWorld/WebContent/images/women/Women Jeans/Black/img2505541099716505133.jpg', 'Nifty', 5002, 11),
(76, 'Nifty Slim Women Blue Jeans', 'women', 'l', 'cotton', 'Blue', 'We take pride in our commitment to maintain quality standards in each piece that is marketed by us.', 'D:/FashionWorld/WebContent/images/women/Women Jeans/Blue/img8591464015757726738.jpg', 'D:/FashionWorld/WebContent/images/women/Women Jeans/Blue/img2095040099974764713.jpg', 'D:/FashionWorld/WebContent/images/women/Women Jeans/Blue/img678879573335844473.jpg', 'Nifty', 5002, 11),
(77, 'Casual Embroidered Women kurti', 'women', 's', 'cotton', 'Black', 'A Stunning Floral Embroidery Work And Will Be Extremely Comfortable To Wear, Courtesy Its Pure Georgette Fabric.', 'D:/FashionWorld/WebContent/images/women/Women Kurtas/Black/img2989018883689692431.jpg', 'D:/FashionWorld/WebContent/images/women/Women Kurtas/Black/img1784094858313014072.jpg', 'D:/FashionWorld/WebContent/images/women/Women Kurtas/Black/img1382389112485808267.jpg', 'Ziya', 5003, 14),
(78, 'Casual Green Kurti', 'women', 'm', 'cotton', 'Green', 'You have this solid print kurti thatÃ¢Â?Â?s stylish enough to transition from being classy casual wear to a smart semi-formal outfit', 'D:/FashionWorld/WebContent/images/women/Women Kurtas/Green/img7086301261971473045.jpg', 'D:/FashionWorld/WebContent/images/women/Women Kurtas/Green/img7344700212621401932.jpg', 'D:/FashionWorld/WebContent/images/women/Women Kurtas/Green/img6908627349555521698.jpg', 'Ziya', 5002, 14),
(79, 'Casual Embroidered Kurti black', 'women', 'l', 'cotton', 'Black', 'You have this solid print kurti thatÃ¢Â?Â?s stylish enough to transition from being classy casual wear to a smart semi-formal outfit', 'D:/FashionWorld/WebContent/images/women/Women Kurtas/Black/img3867768935888905470.jpg', 'D:/FashionWorld/WebContent/images/women/Women Kurtas/Black/img2600351889103159877.jpg', 'D:/FashionWorld/WebContent/images/women/Women Kurtas/Black/img7969249699950573460.jpg', 'Aashavi', 5005, 14),
(80, 'Solid Formal black shirt', 'women', 's', 'cotton', 'Black', 'These Shirts are designed as per the latest trends and fashioned using Georgette Fabric.', 'D:/FashionWorld/WebContent/images/women/Women Shirt/Black/img4682862028996612502.jpg', 'D:/FashionWorld/WebContent/images/women/Women Shirt/Black/img6335955115134311244.jpg', 'D:/FashionWorld/WebContent/images/women/Women Shirt/Black/img2118097624947113956.jpg', 'Comix', 5005, 8),
(81, 'Solid Formal blue shirt', 'women', 'm', 'linen', 'Blue', 'This Shirts are designed as per the latest trends and fashioned using Georgette Fabric.', 'D:/FashionWorld/WebContent/images/women/Women Shirt/Blue/img900930715211092681.jpg', 'D:/FashionWorld/WebContent/images/women/Women Shirt/Blue/img7995258445062129088.jpg', 'D:/FashionWorld/WebContent/images/women/Women Shirt/Blue/img1886094042982195491.jpg', 'Comix', 5002, 8),
(82, 'Navy Blue Women Shirt', 'women', 'l', 'cotton', 'Blue', 'Navy Blue colored printed top, featuring regular fit, short sleeves and collar neck.', 'D:/FashionWorld/WebContent/images/women/Women Shirt/Blue/img478753454409877576.jpg', 'D:/FashionWorld/WebContent/images/women/Women Shirt/Blue/img3513572003040347445.jpg', 'D:/FashionWorld/WebContent/images/women/Women Shirt/Blue/img3315967230306266611.jpg', 'Comix', 5002, 8);

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
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
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
