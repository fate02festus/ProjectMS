-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2023 at 01:03 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `project_list`
--

CREATE TABLE `project_list` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `manager_id` int(30) NOT NULL,
  `user_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_list`
--

INSERT INTO `project_list` (`id`, `name`, `description`, `status`, `start_date`, `end_date`, `manager_id`, `user_ids`, `date_created`, `location`) VALUES
(1, 'PROJECT MANAGEMENT APPLICATION', '						Development of a project management application					', 0, '2023-02-03', '2023-02-28', 2, '5,3,4', '2023-02-15 18:53:41', ''),
(2, 'Tree planting project', 'Tree planting along langata road', 0, '2023-02-24', '2023-03-03', 6, '7,4', '2023-02-24 20:52:41', ''),
(3, 'GARBAGE COLLECTION', 'Collection of gabbage along nairobi river', 0, '2023-03-18', '2023-03-20', 6, '4', '2023-03-18 15:58:04', 'Nairobi'),
(4, 'TEST STATUS', '						wesfxc 608wesf8y					', 0, '2023-03-19', '2023-03-22', 2, '3,7', '2023-03-18 16:35:31', 'Nairobi');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Project Task Management', 'info@itcode.com', '+25470000000', 'MOI EVENUE NAIROBI KENYA', '');

-- --------------------------------------------------------

--
-- Table structure for table `task_list`
--

CREATE TABLE `task_list` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task_list`
--

INSERT INTO `task_list` (`id`, `project_id`, `task`, `description`, `status`, `date_created`) VALUES
(1, 1, 'UI', '				user interface			', 3, '2023-02-15 18:54:18'),
(2, 1, 'dabase', '				database			', 2, '2023-02-15 18:54:40'),
(3, 1, 'software development', 'Development', 1, '2023-02-15 19:02:54'),
(4, 2, 'Get appropriate seedlings', '				Get appropriate seedlings on the tree nursery&amp;nbsp;										', 3, '2023-02-24 20:54:12'),
(5, 2, 'Preparing planting ground', 'Preparing planting ground							', 1, '2023-02-24 20:54:53'),
(6, 3, 'Team building', '				Meet at kencom			', 3, '2023-03-18 16:00:53'),
(7, 3, 'Actual Word', 'Assemble at the river', 2, '2023-03-18 16:32:02'),
(8, 4, 'Test 1', 'wefsd', 1, '2023-03-18 16:35:57'),
(9, 4, 'test 2', 'sdfc', 1, '2023-03-18 16:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1 = admin, 2 = staff',
  `avatar` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Administrator', 'Kathure', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', 1, 'no-image-available.png', '2022-12-30 10:57:04'),
(2, 'John', 'Chalo', 'john@yahoo.com', '21232f297a57a5a743894a0e4a801fc3', 2, '1606978560_avatar.jpg', '2023-02-01 09:26:03'),
(3, 'Adrian', 'Kaunde', 'adrian@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 3, '1606958760_47446233-clean-noir-et-gradient-sombre-image-de-fond-abstrait-.jpg', '2020-12-03 09:26:42'),
(4, 'Sharon', 'Chep', 'sharon@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 3, '1606963560_avatar.jpg', '2020-12-03 10:46:41'),
(5, 'Adones', 'Owino', 'adones@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 3, '1606963620_47446233-clean-noir-et-gradient-sombre-image-de-fond-abstrait-.jpg', '2020-12-03 10:47:06'),
(6, 'John', 'Baraka', 'john@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 2, NULL, '2023-02-24 20:50:13'),
(7, 'Jane', 'Kyle', 'jane@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 3, NULL, '2023-02-24 20:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `user_productivity`
--

CREATE TABLE `user_productivity` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `subject` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id` int(30) NOT NULL,
  `time_rendered` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_productivity`
--

INSERT INTO `user_productivity` (`id`, `project_id`, `task_id`, `comment`, `subject`, `date`, `start_time`, `end_time`, `user_id`, `time_rendered`, `date_created`, `image`, `img`) VALUES
(1, 3, 6, 'gjful jfyul', 'started', '2023-03-20', '11:07:00', '16:09:00', 1, 5.03333, '2023-03-20 23:07:33', '', ''),
(2, 3, 6, 'test way ttt', 'midway', '2023-03-20', '11:09:00', '17:15:00', 1, 6.1, '2023-03-20 23:10:23', 'uploads/', 'uploads/'),
(3, 3, 6, '&amp;nbsp;bmhk', 'finished', '2023-03-19', '11:32:00', '16:33:00', 1, 5.01667, '2023-03-20 23:33:21', 'uploads/hou.jpg', 'uploads/apartment.jpg'),
(4, 3, 7, 'fdnshxgi khgesdp8zxi&amp;nbsp;', 'started', '2023-03-31', '00:00:00', '00:00:00', 1, 0, '2023-03-31 21:25:27', '1680287100_rtyu.jpg', '1680287100_WIN_20220917_23_46_18_Pro.jpg'),
(5, 3, 6, 'new video', 'midway', '2023-03-31', '00:00:00', '00:00:00', 1, 0, '2023-03-31 22:24:15', '1680290640_imag.jpg', '1680290640_img.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `project_list`
--
ALTER TABLE `project_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_list`
--
ALTER TABLE `task_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_productivity`
--
ALTER TABLE `user_productivity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project_list`
--
ALTER TABLE `project_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_list`
--
ALTER TABLE `task_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_productivity`
--
ALTER TABLE `user_productivity`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
