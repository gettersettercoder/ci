-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 14, 2018 at 12:20 AM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collegeerp`
--

-- --------------------------------------------------------

--
-- Table structure for table `background_subject`
--

CREATE TABLE `background_subject` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

-- --------------------------------------------------------

--
-- Table structure for table `common_utility`
--

CREATE TABLE `common_utility` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('course','university','book','exam') NOT NULL,
  `stands_for` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course` char(10) NOT NULL,
  `course_full_name` char(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contain list of courses or degree this is master table';

-- --------------------------------------------------------

--
-- Table structure for table `course_info`
--

CREATE TABLE `course_info` (
  `id` int(11) NOT NULL,
  `course_short_name` varchar(255) NOT NULL,
  `course_full_name` varchar(255) NOT NULL,
  `university_id` tinyint(2) NOT NULL,
  `duration` tinyint(1) NOT NULL,
  `is_sem` enum('N','Y') NOT NULL,
  `created_date` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_info`
--

INSERT INTO `course_info` (`id`, `course_short_name`, `course_full_name`, `university_id`, `duration`, `is_sem`, `created_date`, `deleted`) VALUES
(1, 'BCA', 'Bachelor Of Computer Application', 1, 3, 'Y', '2017-01-30 12:31:21', 0),
(2, 'DCA', 'diploma in computer application', 1, 1, 'Y', '2017-03-15 08:48:37', 0),
(3, 'B.COM', 'Bachelor of Commerce', 2, 1, 'N', '2017-04-18 08:51:21', 0),
(4, 'B.A', '	Bachelor of Arts', 2, 1, 'N', '2017-05-08 05:29:28', 0),
(5, 'pgdca', 'post greduation diploma in computer application', 1, 1, 'Y', '2017-07-27 06:46:48', 0),
(6, 'DC', 'DEMO COURSES', 3, 2, 'Y', '2017-11-17 07:49:31', 0),
(7, 'BBA', 'BBA', 2, 1, 'Y', '2018-06-19 09:05:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `course_structure`
--

CREATE TABLE `course_structure` (
  `id` int(11) NOT NULL,
  `course_id` int(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `year_sem` int(1) NOT NULL,
  `fees` int(11) NOT NULL,
  `discount` float NOT NULL,
  `seats` int(11) NOT NULL,
  `available_seats` int(11) NOT NULL,
  `room_no` varchar(3) NOT NULL,
  `created_date` datetime NOT NULL,
  `udpated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `digisims_contactus`
--

CREATE TABLE `digisims_contactus` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `digisims_contactus`
--

INSERT INTO `digisims_contactus` (`id`, `from_user_id`, `to_user_id`, `title`, `message`, `created_date`) VALUES
(1, 0, 0, 'Title is not you', 'this is try', '2018-06-14 01:31:54'),
(2, 50, 0, 'Title is not you', 'this is try', '2018-06-14 01:32:25'),
(3, 50, 0, 'Hello  Dear', ' I am trying My Best', '2018-06-14 11:46:00'),
(4, 0, 0, 'Hello  Dear', ' I am trying My Best', '2018-06-14 11:46:12'),
(5, 0, 0, 'Hello  Dear', ' I am trying My Best', '2018-06-14 11:46:26'),
(6, 50, 0, 'Title is not you', 'this is try', '2018-06-14 11:46:57'),
(7, 0, 0, 'Title is not you', 'this is try', '2018-06-14 11:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zipcode` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `next_follow_up_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`id`, `user_id`, `name`, `email`, `phone`, `address`, `city`, `state`, `country`, `zipcode`, `description`, `next_follow_up_date`, `created_at`) VALUES
(149, 49, 'shakti', 'shaktisnghsisodiya@gmail.com', '8460497648', 'Ahmedabad Railway Station, Sakar Bazzar, Kalupur, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'India', '380002', 'thsi is lumbt', '2018-07-23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_to`
--

CREATE TABLE `enquiry_to` (
  `id` int(11) NOT NULL,
  `enquiry_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry_to`
--

INSERT INTO `enquiry_to` (`id`, `enquiry_id`, `user_id`, `module`) VALUES
(20, 149, 49, '');

-- --------------------------------------------------------

--
-- Table structure for table `forget_password`
--

CREATE TABLE `forget_password` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forget_password`
--

INSERT INTO `forget_password` (`id`, `token`, `user_id`, `created_date`) VALUES
(1, '4fa97e49498239b27cb160e6867ad976d5edfaea41448634b6310611664872c1', 3, '2018-01-10 10:11:11'),
(2, '2c2005f20913ebed3d6f2b20d5106f8b0be970207ea82046586f344e013f0552', 3, '2018-01-10 11:01:04'),
(3, '6d4e399f725022ac02e81a75ff06025f247d0211023e76b615aa9e33458daf75', 3, '2018-01-10 11:42:59'),
(4, '53c13aa17b39ee8ac54e99e207df6583afe75f2bf184064d95671f90ef38624a', 3, '2018-01-11 12:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `hss_details`
--

CREATE TABLE `hss_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` int(100) NOT NULL,
  `father_name` int(100) NOT NULL,
  `address` int(255) NOT NULL,
  `school_id` int(255) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `background_subject_id` int(2) NOT NULL,
  `email` varchar(255) NOT NULL,
  `result` varchar(10) NOT NULL,
  `suggast_course_id` int(2) NOT NULL,
  `created_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `infrastructure`
--

CREATE TABLE `infrastructure` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `infrastructure_id` int(11) NOT NULL,
  `room_no` varchar(2) NOT NULL,
  `hieght` tinyint(4) NOT NULL,
  `width` tinyint(4) NOT NULL,
  `no_of_student` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `infrastructure`
--

INSERT INTO `infrastructure` (`id`, `user_id`, `infrastructure_id`, `room_no`, `hieght`, `width`, `no_of_student`, `created_date`, `update_date`) VALUES
(1, 3, 2, '1', 30, 30, 150, '2018-01-28 05:31:02', '2018-02-11 07:16:00'),
(3, 3, 2, '2', 30, 30, 150, '2018-02-11 07:15:28', '2018-02-11 07:15:28'),
(4, 3, 2, '2', 30, 30, 150, '2018-02-11 07:15:42', '2018-02-11 07:15:42'),
(5, 3, 2, '2', 30, 30, 150, '2018-02-11 07:16:00', '2018-02-11 07:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `infrastructure_master`
--

CREATE TABLE `infrastructure_master` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `infrastructure_master`
--

INSERT INTO `infrastructure_master` (`id`, `name`) VALUES
(1, 'Hall'),
(2, 'Room'),
(3, 'Kitcken'),
(4, 'Toilates'),
(5, 'Confrance room'),
(6, 'Metthing room'),
(7, 'Staff room'),
(8, 'confrance room'),
(9, 'cricket ground');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(110) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `menu_id`, `icon`, `status`, `created_date`, `update_date`) VALUES
(1, 'Infrastructure', 0, 'icon-home', '1', '2017-12-19 19:50:42', '2017-12-19 00:00:00'),
(2, 'Inquiery', 0, 'icon-home', '1', '2017-12-19 19:50:42', '2017-12-19 00:00:00'),
(3, 'Admission_enquiry', 2, 'icon-home', '1', '2017-12-19 19:51:56', '2017-12-19 00:00:00'),
(4, 'Visitor_enquiry', 2, 'icon-home', '1', '2017-12-19 19:51:58', '2017-12-19 00:00:00'),
(5, 'Other_enquiry', 2, 'icon-home', '1', '2017-12-19 19:52:00', '2017-12-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu_access`
--

CREATE TABLE `menu_access` (
  `id` int(11) NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `view` enum('0','1') NOT NULL DEFAULT '0',
  `add` enum('0','1') NOT NULL DEFAULT '0',
  `edit` enum('0','1') NOT NULL DEFAULT '0',
  `show` enum('0','1') NOT NULL DEFAULT '0',
  `delete` enum('0','1') NOT NULL DEFAULT '0',
  `extra_methods` enum('0','1') NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `org_university`
--

CREATE TABLE `org_university` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `org_university`
--

INSERT INTO `org_university` (`id`, `user_id`, `university_id`, `created_date`, `updated_date`) VALUES
(2, 12, 2, '2018-03-10 10:55:18', '2018-03-10 10:55:18'),
(3, 12, 2, '2018-03-10 10:55:47', '2018-03-10 10:55:47'),
(4, 12, 5, '2018-03-10 10:57:29', '2018-03-10 10:57:29'),
(5, 12, 5, '2018-03-10 10:58:01', '2018-03-10 10:58:01'),
(6, 12, 5, '2018-03-10 10:59:00', '2018-03-10 10:59:00'),
(7, 12, 3, '2018-03-14 01:13:54', '2018-03-14 01:13:54'),
(8, 12, 1, '2018-03-14 01:18:26', '2018-03-14 01:18:26'),
(9, 12, 3, '2018-03-14 01:18:53', '2018-03-14 01:18:53'),
(10, 1, 2, '2018-05-31 11:26:59', '2018-05-31 11:26:59'),
(11, 48, 1, '2018-06-05 12:32:42', '2018-06-05 12:32:42'),
(12, 51, 2, '2018-06-17 11:01:02', '2018-06-17 11:01:02'),
(13, 53, 3, '2018-07-04 12:26:25', '2018-07-04 12:26:25');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'duration in months',
  `modules` text NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `name`, `price`, `duration`, `modules`, `created_date`) VALUES
(1, 'GOLD', 1500, 1, '{"1":"24x7 Technical support","2":"Add multiple roles","3":"Accounting","4":"Library","5":"Staff management"}', '2018-02-24 00:00:00'),
(2, 'SILVER', 2000, 2, '{"1":"24x7 Technical support","2":"Add multiple roles","3":"Accounting","4":"Library","5":"Staff management","6":"daily attendance"}', '2018-02-24 00:00:00'),
(3, 'PLATINUM', 6000, 2, '{"1":"All features available in application"}', '2018-02-24 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(1) NOT NULL,
  `payment_id` varchar(25) NOT NULL,
  `is_verified` enum('0','1') NOT NULL,
  `amount` int(7) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `user_id`, `plan_id`, `payment_id`, `is_verified`, `amount`, `created_date`, `updated_date`) VALUES
(1, 12, 3, 'pay_9kBRmP6quHt8Qf', '1', 6000, '2018-03-08 01:19:02', '2018-03-08 01:19:02'),
(2, 12, 3, 'pay_9kBUNlyKBWzbdV', '1', 6000, '2018-03-08 01:21:30', '2018-03-08 01:21:30'),
(3, 12, 3, 'pay_9kBXF9ZQXDPTA3', '0', 6000, '2018-03-08 01:24:12', '2018-03-08 01:24:12'),
(4, 12, 2, 'pay_9kXJN7KYgFWhEf', '0', 2000, '2018-03-08 10:42:21', '2018-03-08 10:42:21'),
(5, 1, 1, 'pay_AHnZxj65oDWNMn', '0', 1500, '2018-06-01 12:04:13', '2018-06-01 12:04:13'),
(6, 1, 2, 'pay_AID3IYbTDrMwSk', '0', 2000, '2018-06-02 12:59:20', '2018-06-02 12:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `user_id` int(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` bigint(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `user_id`, `name`, `address`, `contact_number`, `email`, `created_date`, `updated_date`) VALUES
(1, 2, 'Padmawati', 'Vill post chakunda tahsil arnod dist paratapagarh rajasthan', 7987856256, 'padmawati@gmail.com', '2018-01-21 10:18:28', '2018-01-21 10:18:28'),
(2, 2, 'HSSS Chakunda', 'Vill post chakunda tahsil arnod dist paratapagarh rajasthan', 8462014788, 'hsss.chakunda@gmail.com', '2018-01-21 10:18:43', '2018-01-21 10:18:43'),
(3, 3, 'SSC school dhamotar rajsthan', 'wamandev scholl neemiuch', 8460497647, 'shaktisinghsisodiya@gmail.com', '2018-01-28 05:46:57', '2018-01-28 05:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `course_info_id` tinyint(2) NOT NULL,
  `year_sem` tinyint(1) NOT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `deleted` int(1) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--


-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `user__id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `status` enum('0','1','9') NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `topic_summary`
--

CREATE TABLE `topic_summary` (
  `id` int(11) NOT NULL,
  `university_id` int(2) NOT NULL,
  `course_id` int(2) NOT NULL,
  `year_sem` int(2) NOT NULL,
  `subject_id` int(3) NOT NULL,
  `unit_id` int(4) NOT NULL,
  `topic_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vedio_url` varchar(255) NOT NULL,
  `summary_hindi` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `summary_english` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_id` int(2) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic_summary`
--

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `subject_id` int(6) NOT NULL,
  `unit_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `subject_id`, `unit_name`, `created_at`, `deleted`) VALUES
(3, 2, 'Unit-2', '2017-02-08 05:37:24', 0),
(13, 2, 'Unit-3', '2017-02-13 04:38:01', 0),
(14, 2, 'Unit-4', '2017-02-15 03:09:25', 0),
(15, 2, 'Unit-5', '2017-02-18 01:24:30', 0),
(16, 2, 'Unit-1', '2017-02-18 05:55:57', 0),
(17, 3, 'Unit-1', '2017-02-20 04:56:24', 0),
(19, 3, 'Unit-3', '2017-02-23 05:30:46', 0),
(20, 3, 'Unit-2', '2017-02-23 08:07:28', 0),
(22, 3, 'Unit-4', '2017-02-23 06:44:33', 0),
(23, 3, 'Unit-5', '2017-02-25 05:23:47', 0),
(24, 5, 'Unit-1', '2017-02-25 01:35:00', 0),
(25, 5, 'Unit-3', '2017-02-27 01:52:35', 0),
(26, 5, 'Unit-4', '2017-02-27 02:54:24', 0),
(27, 5, 'Unit-5', '2017-02-27 04:56:17', 0),
(28, 1, 'Unit-1', '2017-02-27 06:22:31', 0),
(29, 1, 'Unit-2', '2017-02-28 12:19:22', 0),
(30, 1, 'Unit-3', '2017-02-28 04:31:51', 0),
(31, 1, 'Unit-4', '2017-02-28 06:05:56', 0),
(32, 1, 'Unit-5', '2017-03-01 03:53:24', 0),
(33, 4, 'Unit-1', '2017-03-01 06:11:43', 0),
(34, 4, 'Unit-3', '2017-03-02 06:38:17', 0),
(35, 4, 'Unit-2', '2017-03-02 06:45:50', 0),
(36, 4, 'Unit-4', '2017-03-02 08:36:55', 0),
(37, 4, 'Unit-5', '2017-03-02 04:43:54', 0),
(38, 5, 'Unit-2', '2017-03-02 07:06:24', 0),
(39, 6, 'Unit-1', '2017-03-03 08:01:38', 0),
(40, 6, 'Unit-2', '2017-03-03 04:16:00', 0),
(41, 6, 'Unit-3', '2017-03-04 06:52:41', 0),
(42, 6, 'Unit-4', '2017-03-04 09:16:36', 0),
(43, 6, 'Unit-5', '2017-03-04 05:13:28', 0),
(44, 7, 'Unit-1', '2017-03-05 07:16:05', 0),
(45, 7, 'Unit-2', '2017-03-06 06:36:22', 0),
(46, 7, 'Unit-4', '2017-03-06 12:36:11', 0),
(47, 7, 'Unit-3', '2017-03-06 12:36:27', 0),
(48, 7, 'Unit-5', '2017-03-06 03:50:08', 0),
(49, 8, 'Unit-1', '2017-03-06 05:57:13', 0),
(50, 8, 'Unit-2', '2017-03-07 04:20:34', 0),
(51, 8, 'Unit-3', '2017-03-08 08:20:36', 0),
(52, 8, 'Unit-4', '2017-03-08 04:52:11', 0),
(53, 8, 'Unit-5', '2017-03-09 07:26:37', 0),
(54, 9, 'Unit-1', '2017-03-09 12:28:10', 0),
(55, 9, 'Unit-2', '2017-03-09 04:33:48', 0),
(56, 9, 'Unit-3', '2017-03-10 08:57:19', 0),
(57, 9, 'Unit-4', '2017-03-10 10:01:59', 0),
(58, 9, 'Unit-5', '2017-03-10 01:00:40', 0),
(59, 11, 'Unit-1', '2017-03-10 05:47:41', 0),
(60, 11, 'Unit-2', '2017-03-11 01:34:06', 0),
(61, 11, 'Unit-3', '2017-03-11 04:19:03', 0),
(62, 11, 'Unit-4', '2017-03-11 06:14:01', 0),
(63, 11, 'Unit-5', '2017-03-12 09:21:47', 0),
(64, 12, 'Unit-1', '2017-03-12 05:09:07', 0),
(65, 12, 'Unit-2', '2017-03-14 05:43:04', 0),
(66, 12, 'Unit-3', '2017-03-14 04:56:17', 0),
(67, 12, 'Unit-4', '2017-03-15 06:05:28', 0),
(68, 12, 'Unit-5', '2017-03-15 08:19:42', 0),
(69, 30, 'Unit-1', '2017-03-15 08:52:36', 0),
(70, 30, 'Unit-2', '2017-03-15 08:54:57', 0),
(71, 13, 'Unit-1', '2017-03-15 09:51:36', 0),
(72, 13, 'Unit-2', '2017-03-17 07:01:52', 0),
(73, 13, 'Unit-3', '2017-03-17 03:29:20', 0),
(74, 13, 'Unit-4', '2017-03-18 08:53:54', 0),
(75, 13, 'Unit-5', '2017-03-18 01:39:26', 0),
(76, 14, 'Unit-1', '2017-03-18 04:43:43', 0),
(77, 14, 'Unit-2', '2017-03-19 03:41:17', 0),
(78, 14, 'Unit-3', '2017-03-20 01:07:12', 0),
(79, 14, 'Unit-4', '2017-03-20 03:48:35', 0),
(80, 14, 'Unit-5', '2017-04-09 08:39:47', 0),
(81, 15, 'Unit-1', '2017-04-09 01:23:23', 0),
(82, 15, 'Unit-2', '2017-04-09 04:47:38', 0),
(83, 15, 'Unit-3', '2017-04-10 06:32:34', 0),
(84, 15, 'Unit-4', '2017-04-10 07:51:29', 0),
(85, 15, 'Unit-5', '2017-04-10 08:59:53', 0),
(86, 16, 'Unit-1', '2017-04-10 04:57:40', 0),
(87, 16, 'Unit-2', '2017-04-11 06:53:22', 0),
(88, 16, 'Unit-3', '2017-04-11 04:46:42', 0),
(89, 16, 'Unit-4', '2017-04-12 06:51:43', 0),
(90, 16, 'Unit-5', '2017-04-12 08:19:45', 0),
(91, 17, 'Unit-1', '2017-04-12 09:34:07', 0),
(92, 17, 'Unit-2', '2017-04-14 07:01:27', 0),
(93, 17, 'Unit-3', '2017-04-14 02:46:53', 0),
(94, 17, 'Unit-4', '2017-04-15 05:11:17', 0),
(95, 17, 'Unit-5', '2017-04-16 08:00:05', 0),
(96, 18, 'Unit-1', '2017-04-16 12:43:12', 0),
(97, 18, 'Unit-2', '2017-04-17 05:59:36', 0),
(98, 18, 'Unit-3', '2017-04-17 06:23:31', 0),
(99, 18, 'Unit-4', '2017-04-19 05:47:59', 0),
(100, 18, 'Unit-5', '2017-04-19 09:52:41', 0),
(101, 19, 'Unit-1', '2017-04-20 07:00:47', 0),
(102, 19, 'Unit-1', '2017-04-20 07:01:01', 0),
(103, 19, 'Unit-2', '2017-04-22 05:43:11', 0),
(104, 19, 'Unit-3', '2017-04-22 06:49:27', 0),
(105, 19, 'Unit-4', '2017-04-23 05:26:43', 0),
(106, 19, 'Unit-5', '2017-04-23 08:44:23', 0),
(107, 20, 'Unit-1', '2017-04-23 03:32:53', 0),
(108, 20, 'Unit-2', '2017-04-24 01:21:17', 0),
(109, 21, 'Unit-1', '2017-04-26 05:33:29', 0),
(110, 31, 'Unit-1', '2017-05-02 10:01:21', 0),
(111, 26, 'unit 1', '2017-05-03 09:23:46', 0),
(117, 35, 'unit-1', '2017-05-03 09:49:20', 0),
(118, 35, 'unit-2', '2017-05-03 09:59:16', 0),
(119, 35, 'unit-3', '2017-05-03 09:59:27', 0),
(120, 35, 'unit-4', '2017-05-03 09:59:39', 0),
(121, 35, 'unit-5', '2017-05-03 09:59:47', 0),
(122, 39, 'स्वप्नवासवदत्ता', '2017-05-08 05:44:51', 0),
(123, 41, 'unit 1', '2017-05-09 09:45:26', 0),
(124, 41, 'unit 2', '2017-05-09 09:45:40', 0),
(125, 41, 'unit 3', '2017-05-09 09:45:51', 0),
(126, 41, 'unit 4', '2017-05-09 09:45:58', 0),
(127, 41, 'unit 1', '2017-05-09 09:46:06', 0),
(128, 42, 'unit 5', '2017-05-09 09:46:18', 0),
(129, 42, 'unit 4', '2017-05-09 09:46:25', 0),
(130, 42, 'unit 3', '2017-05-09 09:46:33', 0),
(131, 42, 'unit 2', '2017-05-09 09:46:41', 0),
(132, 42, 'unit 1', '2017-05-09 09:46:51', 0),
(133, 45, 'unit 1', '2017-05-10 05:30:35', 0),
(134, 45, 'unit 2', '2017-05-10 05:30:44', 0),
(135, 45, 'unit 3', '2017-05-10 05:30:54', 0),
(136, 45, 'unit 4', '2017-05-10 05:31:01', 0),
(137, 45, 'unit 5', '2017-05-10 05:31:09', 0),
(138, 46, 'unit 1', '2017-05-10 05:31:21', 0),
(139, 46, 'unit 2', '2017-05-10 05:31:29', 0),
(140, 46, 'unit 3', '2017-05-10 05:31:37', 0),
(141, 46, 'unit 4', '2017-05-10 05:31:45', 0),
(142, 46, 'unit 5', '2017-05-10 05:31:52', 0),
(143, 40, 'unit 1', '2017-05-10 06:34:43', 0),
(144, 21, 'Unit-2', '2017-05-11 04:36:25', 0),
(145, 21, 'Unit-3', '2017-05-11 06:27:22', 0),
(146, 21, 'Unit-4', '2017-05-12 03:41:53', 0),
(147, 21, 'Unit-5', '2017-05-12 08:07:29', 0),
(148, 22, 'Unit-1', '2017-05-12 03:58:17', 0),
(149, 32, 'unit 1', '2017-05-26 06:24:03', 0),
(150, 32, 'unit 2', '2017-05-26 06:28:46', 0),
(151, 39, 'नीतिशतकम', '2017-05-27 05:01:40', 0),
(152, 39, 'व्याकरण', '2017-05-30 07:21:35', 0),
(153, 22, 'Unit-2', '2017-06-20 01:21:37', 0),
(154, 22, 'Unit-3', '2017-06-21 01:06:59', 0),
(155, 22, 'Unit-4', '2017-06-22 01:54:43', 0),
(156, 22, 'Unit-5', '2017-06-23 01:54:53', 0),
(157, 23, 'Unit-1', '2017-06-24 01:46:15', 0),
(158, 23, 'Unit-2', '2017-06-27 01:32:25', 0),
(159, 23, 'Unit-3', '2017-06-28 01:51:07', 0),
(160, 23, 'Unit-4', '2017-06-30 02:12:17', 0),
(161, 24, 'Unit-5', '2017-07-01 02:19:05', 0),
(162, 23, 'Unit-5', '2017-07-01 02:19:21', 0),
(163, 24, 'Unit-1', '2017-07-06 01:25:18', 0),
(164, 50, 'UNIT 1 ', '2017-07-27 05:42:23', 0),
(165, 50, 'UNIT 2', '2017-07-27 05:42:33', 0),
(166, 50, 'UNIT 3', '2017-07-27 05:42:39', 0),
(167, 50, 'UNIT4', '2017-07-27 05:42:46', 0),
(168, 50, 'UNIT5', '2017-07-27 05:42:56', 0),
(169, 50, 'स्वप्नवासवदत्तम्', '2017-07-27 10:24:03', 0),
(170, 52, 'unit 1', '2017-08-08 06:55:46', 0),
(171, 40, 'unit 2', '2017-08-17 09:51:29', 0),
(172, 40, 'unit 3', '2017-08-21 10:04:13', 0),
(173, 40, 'unit 4 ', '2017-08-21 10:46:58', 0),
(174, 40, 'unit 5 ', '2017-08-21 11:04:42', 0),
(175, 58, 'ANIMAL FARM, BY GEORGE ORWELL', '2017-08-23 10:04:13', 0),
(176, 51, 'UNIT 1 ', '2017-08-28 10:31:09', 0),
(177, 51, 'UNIT 2', '2017-08-28 10:31:21', 0),
(178, 56, 'UNIT 1 ', '2017-09-07 10:56:03', 0),
(179, 53, 'unit 1 ', '2017-09-08 11:27:02', 0),
(180, 32, 'unit 3 ', '2017-09-09 10:45:51', 0),
(181, 32, 'unit 4', '2017-09-11 10:33:24', 0),
(182, 32, 'unit 5 ', '2017-09-11 11:03:40', 0),
(183, 60, 'selected poems ', '2017-09-12 10:59:30', 0),
(184, 31, 'UNIT 2 ', '2017-11-08 10:37:18', 0),
(185, 31, 'UNIT 3', '2017-11-08 10:37:37', 0),
(186, 31, 'UNIT 4', '2017-11-08 10:37:44', 0),
(187, 62, 'UNIT-1', '2017-11-17 07:51:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `id` int(11) NOT NULL,
  `university` char(25) NOT NULL,
  `university_full_name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`id`, `university`, `university_full_name`, `url`, `email`, `contact_no`, `address`, `created_at`, `deleted`, `image_url`) VALUES
(1, 'MCRPV', 'Makhanlal Chaturvedi National University of Journalism and Communication', 'http://www.mcu.ac.in', '', '', '', '2017-01-30 12:30:37', 0, 'mlsu.jpeg'),
(2, 'MLSU OR GGTU', 'mohanlal sukhadia university', 'https://www.mlsu.ac.in/', '', '', '', '2017-03-15 08:45:07', 0, 'mlsu.jpeg'),
(3, 'Ou', 'Oxford university', 'http://www.oxforduniversity.com', '', '', '', '2017-11-17 07:31:10', 0, 'mlsu.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_type` tinyint(2) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `package_id` tinyint(1) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `free_trail_expiration_date` datetime DEFAULT NULL,
  `mobile` bigint(10) NOT NULL,
  `another_mobile` bigint(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` enum('0','1','2','9','3') NOT NULL DEFAULT '1' COMMENT '0=inactive,1=active,2=forgetpassword,9=''user remove'',3=''pending''',
  `token` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `completed_step` enum('0','1','2','3','4','5','6','7') NOT NULL,
  `created_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_online` enum('0','1') NOT NULL,
  `created_by` int(11) NOT NULL,
  `otp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `username`, `password`, `package_id`, `expiration_date`, `free_trail_expiration_date`, `mobile`, `another_mobile`, `email`, `status`, `token`, `ip`, `image_url`, `completed_step`, `created_date`, `update_date`, `last_login`, `is_online`, `created_by`, `otp`) VALUES
(49, 2, 'sd', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, '2018-06-10 00:29:22', 8787878787, 8787878786, 'root@gmail.com', '1', '', '::1', 'college_profile/48_1528138905.png', '2', '2018-06-04 22:28:30', '2018-06-05 12:38:26', '2018-06-14 02:35:17', '1', 0, 0),
(50, 0, '', '', 0, NULL, NULL, 8460497647, 0, '', '1', 'f18ce0115c8b497005e64a3290477363', '', '', '0', '2018-06-14 12:05:01', '2018-06-14 01:51:30', NULL, '0', 0, 54356),
(51, 1, 'love', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, '2018-07-21 10:59:32', 9974944806, 9974944807, 'shaktisinghsisodiya+11@gmail.com', '1', '72507fb8095af017fd170258f762ac0a', '127.0.0.1', 'college_profile/51_1529213453.png', '4', '2018-06-14 00:37:46', '2018-06-17 11:30:00', '2018-06-19 09:14:18', '1', 0, 76937),
(52, 0, '', '', 0, NULL, NULL, 9976944806, 0, '', '1', '53fee91fb405544f939bcb87e86a29e2', '', '', '0', '2018-06-17 04:03:56', '2018-06-18 09:29:06', NULL, '0', 0, 70082),
(53, 1, 'shakti', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, '2018-07-09 00:21:53', 7987505526, 7697736357, 'shaktisinghsisodiya+25@gmail.com', '1', '', '127.0.0.1', 'college_profile/53_1530644076.png', '2', '2018-07-04 00:21:38', '2018-07-04 00:28:33', NULL, '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_info`
--

CREATE TABLE `users_info` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `country` varchar(40) NOT NULL,
  `state` varchar(70) NOT NULL,
  `city` varchar(70) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_info`
--

INSERT INTO `users_info` (`id`, `user_id`, `address`, `country`, `state`, `city`, `zipcode`, `created_date`, `update_date`) VALUES
(1, 51, 'Pratapgarh-Burja Tiraha Road, Nangal Bani, Rajasthan, India', 'India', 'Rajasthan', 'Nangal Bani', '312605', '2018-06-14 12:39:46', '2018-06-14 12:39:46'),
(2, 51, 'Pratapgarh-Burja Tiraha Road, Nangal Bani, Rajasthan, India', 'India', 'Rajasthan', 'Nangal Bani', '312605', '2018-06-14 12:40:08', '2018-06-14 12:40:08'),
(3, 51, 'Org Delumi Ltda - Avenida Cardeal Eugênio Pacelli - Cidade Industrial, Contagem - State of Minas Gerais, Brazil', 'Brazil', 'Minas Gerais', 'ahmedabad', '32210-002', '2018-06-17 11:00:41', '2018-06-17 11:00:41'),
(4, 51, 'Org Delumi Ltda - Avenida Cardeal Eugênio Pacelli - Cidade Industrial, Contagem - State of Minas Gerais, Brazil', 'Brazil', 'Minas Gerais', 'ahmedabad', '32210-002', '2018-06-17 11:00:52', '2018-06-17 11:00:52'),
(5, 53, 'Ahmedabad Airport (AMD), Hansol, Ahmedabad, Gujarat, India', 'India', 'Gujarat', 'Ahmedabad', '380003', '2018-07-04 12:23:21', '2018-07-04 12:23:21'),
(6, 53, 'Ahmedabad Airport (AMD), Hansol, Ahmedabad, Gujarat, India', 'India', 'Gujarat', 'Ahmedabad', '380003', '2018-07-04 12:23:36', '2018-07-04 12:23:36'),
(7, 53, 'Ahmedabad Airport (AMD), Hansol, Ahmedabad, Gujarat, India', 'India', 'Gujarat', 'Ahmedabad', '380003', '2018-07-04 12:24:36', '2018-07-04 12:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `user_device`
--

CREATE TABLE `user_device` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `device_type` enum('0','1') NOT NULL,
  `device_token` varchar(255) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_device`
--

INSERT INTO `user_device` (`id`, `user_id`, `device_type`, `device_token`, `device_id`, `created_date`, `updated_date`) VALUES
(1, 13, '1', 'jejeirue', '123465', '2018-03-29 01:26:08', '2018-03-29 01:26:08'),
(2, 13, '1', 'jejeirue', '123465', '2018-03-31 12:44:45', '2018-03-31 12:44:45'),
(3, 13, '1', 'jejeirue', '123465', '2018-03-31 12:44:54', '2018-03-31 12:44:54'),
(4, 13, '1', 'jejeirue', '123465', '2018-03-31 12:54:12', '2018-03-31 12:54:12'),
(5, 13, '1', 'jejeirue', '123465', '2018-04-01 02:34:54', '2018-04-01 02:34:54'),
(6, 14, '1', 'jejeirue', '123465', '2018-04-01 02:36:41', '2018-04-01 02:36:41'),
(7, 14, '1', 'jejeirue', '123465', '2018-04-01 02:37:32', '2018-04-01 02:37:32'),
(8, 14, '1', 'jejeirue', '123465', '2018-04-02 12:21:49', '2018-04-02 12:21:49'),
(9, 18, '1', 'jejeirue', '123465', '2018-04-02 12:24:09', '2018-04-02 12:24:09'),
(10, 21, '1', 'a2a9b8edc1763c5cf553e00fd47b1c1e9b0752415f0c6b52cae5ea3ff69c4794', '123465', '2018-04-02 11:44:01', '2018-04-02 11:44:01'),
(11, 21, '1', '3343ew', '123465', '2018-04-02 11:44:19', '2018-04-02 11:44:19'),
(12, 13, '1', 'jejeirue', '123465', '2018-04-02 11:46:23', '2018-04-02 11:46:23'),
(13, 22, '1', '3343ew', '123465', '2018-04-02 11:53:07', '2018-04-02 11:53:07'),
(14, 23, '1', '3343ew', '123465', '2018-04-02 11:55:29', '2018-04-02 11:55:29'),
(15, 23, '1', '3343ew', '123465', '2018-04-02 11:56:08', '2018-04-02 11:56:08'),
(16, 23, '1', '3343ew', '123465', '2018-04-02 11:57:45', '2018-04-02 11:57:45'),
(17, 23, '1', '3343ew', '123465', '2018-04-03 12:02:16', '2018-04-03 12:02:16'),
(18, 26, '1', 'jejeirue', '123465', '2018-04-03 12:23:21', '2018-04-03 12:23:21'),
(19, 26, '1', 'jejeirue', '123465', '2018-04-03 12:23:24', '2018-04-03 12:23:24'),
(20, 26, '1', 'jejeirue', '123465', '2018-04-03 12:23:42', '2018-04-03 12:23:42'),
(21, 26, '1', 'jejeirue', '123465', '2018-04-03 12:24:13', '2018-04-03 12:24:13'),
(22, 26, '1', 'jejeirue', '123465', '2018-04-03 12:25:13', '2018-04-03 12:25:13'),
(23, 27, '1', '3343ew', '123465', '2018-04-03 12:26:15', '2018-04-03 12:26:15'),
(24, 27, '1', '3343ew', '123465', '2018-04-03 12:27:12', '2018-04-03 12:27:12'),
(25, 28, '1', '123123', '51427ee93ec12c89', '2018-04-03 01:25:55', '2018-04-03 01:25:55'),
(26, 28, '1', '123123', '51427ee93ec12c89', '2018-04-03 01:29:16', '2018-04-03 01:29:16'),
(27, 30, '0', '123123', '51427ee93ec12c89', '2018-04-03 10:46:12', '2018-04-03 10:46:12'),
(28, 27, '1', '123123', '51427ee93ec12c89', '2018-04-03 11:02:11', '2018-04-03 11:02:11'),
(29, 28, '0', '123123', '51427ee93ec12c89', '2018-04-03 11:49:10', '2018-04-03 11:49:10'),
(30, 28, '0', '123123', '51427ee93ec12c89', '2018-04-03 11:57:30', '2018-04-03 11:57:30'),
(31, 28, '0', '123123', '51427ee93ec12c89', '2018-04-04 12:00:43', '2018-04-04 12:00:43'),
(32, 28, '0', '123123', '51427ee93ec12c89', '2018-04-04 12:05:01', '2018-04-04 12:05:01'),
(33, 28, '0', '123123', '51427ee93ec12c89', '2018-04-04 12:10:04', '2018-04-04 12:10:04'),
(34, 28, '0', '123123', '51427ee93ec12c89', '2018-04-04 12:26:42', '2018-04-04 12:26:42'),
(35, 31, '0', '123123', '51427ee93ec12c89', '2018-04-04 12:28:25', '2018-04-04 12:28:25'),
(36, 28, '0', '123123', '51427ee93ec12c89', '2018-04-04 12:44:28', '2018-04-04 12:44:28'),
(37, 28, '0', '123123', '51427ee93ec12c89', '2018-04-04 12:47:21', '2018-04-04 12:47:21'),
(38, 34, '0', '123123', '51427ee93ec12c89', '2018-04-04 12:49:20', '2018-04-04 12:49:20'),
(39, 35, '1', 'deviceToken', 'deviceToken', '2018-04-04 12:53:06', '2018-05-22 11:47:13'),
(40, 28, '0', '123123', '51427ee93ec12c89', '2018-04-04 11:44:55', '2018-04-04 11:44:55'),
(41, 41, '1', 'jejeirue', '123465', '2018-06-03 12:03:27', '2018-06-03 12:08:39'),
(42, 50, '1', 'jejeirue', '123465', '2018-06-14 01:24:08', '2018-06-14 01:24:08'),
(43, 51, '1', 'jejeirue', '123465', '2018-06-14 11:41:35', '2018-06-15 12:00:32'),
(44, 52, '1', 'jejeirue', '123465', '2018-06-17 04:06:08', '2018-06-17 04:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_files`
--

CREATE TABLE `user_files` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type_name`) VALUES
(1, 'Admin'),
(2, 'Teacher'),
(3, 'Principal'),
(4, 'Director');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `background_subject`
--
ALTER TABLE `background_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `common_utility`
--
ALTER TABLE `common_utility`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_info`
--
ALTER TABLE `course_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_structure`
--
ALTER TABLE `course_structure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `digisims_contactus`
--
ALTER TABLE `digisims_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_to`
--
ALTER TABLE `enquiry_to`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forget_password`
--
ALTER TABLE `forget_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hss_details`
--
ALTER TABLE `hss_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `infrastructure`
--
ALTER TABLE `infrastructure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `infrastructure_master`
--
ALTER TABLE `infrastructure_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_access`
--
ALTER TABLE `menu_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `org_university`
--
ALTER TABLE `org_university`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_summary`
--
ALTER TABLE `topic_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_type` (`user_type`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_info_user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `user_device`
--
ALTER TABLE `user_device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `background_subject`
--
ALTER TABLE `background_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `common_utility`
--
ALTER TABLE `common_utility`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `course_info`
--
ALTER TABLE `course_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `course_structure`
--
ALTER TABLE `course_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `digisims_contactus`
--
ALTER TABLE `digisims_contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT for table `enquiry_to`
--
ALTER TABLE `enquiry_to`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `forget_password`
--
ALTER TABLE `forget_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hss_details`
--
ALTER TABLE `hss_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `infrastructure`
--
ALTER TABLE `infrastructure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `infrastructure_master`
--
ALTER TABLE `infrastructure_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `menu_access`
--
ALTER TABLE `menu_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `org_university`
--
ALTER TABLE `org_university`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `topic_summary`
--
ALTER TABLE `topic_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1195;
--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;
--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `users_info`
--
ALTER TABLE `users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_device`
--
ALTER TABLE `user_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_info`
--
ALTER TABLE `users_info`
  ADD CONSTRAINT `users_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
