-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2024 at 01:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Electronics', 'Devices and gadgets including phones, laptops, cameras, and accessories', '2024-09-01 10:37:03'),
(2, 'Fashion', 'Clothing, footwear, and accessories for men, women, and children', '2024-09-01 10:37:03'),
(3, 'Home & Kitchen', 'Appliances, furniture, cookware, and home decor items', '2024-09-01 10:37:03'),
(4, 'Beauty & Personal Care', 'Skincare, haircare, makeup, and personal hygiene products', '2024-09-01 10:37:03'),
(5, 'Sports & Outdoors', 'Sports equipment, outdoor gear, and fitness accessories', '2024-09-01 10:37:03'),
(6, 'Books', 'Fiction, non-fiction, educational books, and e-books', '2024-09-01 10:37:03'),
(8, 'test', 'test', '2024-09-01 10:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','canceled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(29, 'Smartphone XYZ', 'A high-quality smartphone with a 6.5-inch display and 128GB storage.', 299.99, 'images/smartphone_xyz.jpg', 1, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(30, '4K Ultra HD TV', 'A 55-inch 4K Ultra HD TV with excellent picture quality and smart features.', 499.99, 'images/4k_tv.jpg', 1, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(31, 'Leather Jacket', 'Stylish leather jacket for men, available in various sizes.', 129.99, 'images/leather_jacket.jpg', 2, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(32, 'Running Shoes', 'Comfortable and durable running shoes suitable for all terrains.', 89.99, 'images/running_shoes.jpg', 2, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(33, 'Blender Pro 5000', 'High-performance blender for making smoothies and soups.', 79.99, 'images/blender_pro_5000.jpg', 3, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(34, 'Coffee Maker', 'A programmable coffee maker with a 12-cup capacity and auto shut-off feature.', 59.99, 'images/coffee_maker.jpg', 3, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(35, 'Anti-Aging Serum', 'Effective anti-aging serum with vitamin C and hyaluronic acid.', 39.99, 'images/anti_aging_serum.jpg', 4, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(36, 'Moisturizing Lotion', 'Hydrating lotion with natural ingredients, suitable for all skin types.', 19.99, 'images/moisturizing_lotion.jpg', 4, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(37, 'Yoga Mat', 'Non-slip yoga mat with extra cushioning for comfort during exercises.', 25.99, 'images/yoga_mat.jpg', 5, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(38, 'Camping Tent', 'Durable and easy-to-setup camping tent for 4 people.', 149.99, 'images/camping_tent.jpg', 5, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(39, 'Best Fiction Novel', 'A gripping fiction novel by a bestselling author.', 14.99, 'images/best_fiction_novel.jpg', 6, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(40, 'Educational Workbook', 'Workbook for advanced math problems and solutions.', 24.99, 'images/educational_workbook.jpg', 6, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(41, 'Action Figure Set', 'Set of action figures from your favorite superhero series.', 34.99, 'images/action_figure_set.jpg', 8, '2024-09-01 11:06:05', '2024-09-01 11:06:05'),
(42, 'Puzzle Game', 'Challenging puzzle game with 1000 pieces for hours of fun.', 21.99, 'images/puzzle_game.jpg', 8, '2024-09-01 11:06:05', '2024-09-01 11:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(50) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password_hash` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`) VALUES
(1, 'amruta', 'a@b.c', '$2y$10$55C4HuGGHSwuXG5ylGkaKu21Ana5CNpRrM1s4LC/5rjbMGu4AqbxK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
