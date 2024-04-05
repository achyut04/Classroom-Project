-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 08:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `educonnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add classroom', 1, 'add_classroom'),
(2, 'Can change classroom', 1, 'change_classroom'),
(3, 'Can delete classroom', 1, 'delete_classroom'),
(4, 'Can view classroom', 1, 'view_classroom'),
(5, 'Can add enrollment', 2, 'add_enrollment'),
(6, 'Can change enrollment', 2, 'change_enrollment'),
(7, 'Can delete enrollment', 2, 'delete_enrollment'),
(8, 'Can view enrollment', 2, 'view_enrollment'),
(9, 'Can add log entry', 3, 'add_logentry'),
(10, 'Can change log entry', 3, 'change_logentry'),
(11, 'Can delete log entry', 3, 'delete_logentry'),
(12, 'Can view log entry', 3, 'view_logentry'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add group', 5, 'add_group'),
(18, 'Can change group', 5, 'change_group'),
(19, 'Can delete group', 5, 'delete_group'),
(20, 'Can view group', 5, 'view_group'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session'),
(33, 'Can add post', 9, 'add_post'),
(34, 'Can change post', 9, 'change_post'),
(35, 'Can delete post', 9, 'delete_post'),
(36, 'Can view post', 9, 'view_post'),
(37, 'Can add comment', 10, 'add_comment'),
(38, 'Can change comment', 10, 'change_comment'),
(39, 'Can delete comment', 10, 'delete_comment'),
(40, 'Can view comment', 10, 'view_comment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$WpN0v4f8uqx9$nSHJ2KPr9N8lIOZ9QdEERLUyhnxZV4A6lb4lYWyIHEE=', '2024-04-04 17:20:23.146807', 1, 'smit', '', '', '', 1, 1, '2024-04-04 11:44:17.262813');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_classroom`
--

CREATE TABLE `core_classroom` (
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL,
  `class_url` varchar(10) NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_classroom`
--

INSERT INTO `core_classroom` (`code`, `name`, `capacity`, `class_url`, `created_by_id`) VALUES
('0b17b6', 'bijo class', 50, '1c35311202', 1),
('2c25af', 'kai pan', 50, 'be13d7d830', 1),
('40ed67', 'class 5mo', 50, '709e3aa870', 1),
('a8e290', 'class 4', 34, '2ab6e550ed', 1),
('bba50f', 'haji ek class', 2, '39a2960b16', 1),
('f4a5a8', 'physics', 12, 'c4bb0674e2', 1),
('f5d0e6', 'class 7', 59, '7792b5309e', 1),
('fcbcf4', 'class 6', 50, '6107d04d3e', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_comment`
--

CREATE TABLE `core_comment` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_comment`
--

INSERT INTO `core_comment` (`id`, `content`, `time`, `author_id`, `post_id`) VALUES
(2, 'dvasf', '2024-04-04 17:43:42.185667', 1, 1),
(3, 'dbfsfsad', '2024-04-04 18:11:55.824491', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `core_enrollment`
--

CREATE TABLE `core_enrollment` (
  `id` int(11) NOT NULL,
  `enrolled_id` varchar(10) NOT NULL,
  `students_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_post`
--

CREATE TABLE `core_post` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `posted_time` time(6) NOT NULL,
  `posted_date` date NOT NULL,
  `is_assignment` tinyint(1) NOT NULL,
  `due_date` date NOT NULL,
  `due_time` time(6) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `classroom_id_id` varchar(10) NOT NULL,
  `matirial` varchar(256)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_post`
--

INSERT INTO `core_post` (`id`, `title`, `description`, `posted_time`, `posted_date`, `is_assignment`, `due_date`, `due_time`, `total_marks`, `classroom_id_id`, `matirial`) VALUES
(1, 'first post', 'loll', '18:48:38.197073', '2024-04-04', 0, '2024-04-10', '23:59:00.000000', 100, '0b17b6', 'False'),
(2, 'second post', 'blaahhh', '19:04:51.442667', '2024-04-04', 0, '2024-04-17', '23:59:00.000000', 100, '0b17b6', 'False'),
(3, 'third post', 'bla blas', '19:05:24.041846', '2024-04-04', 0, '2024-04-30', '23:59:00.000000', 100, '0b17b6', 'False'),
(4, 'with matiraial', '4th post', '20:23:55.665144', '2024-04-04', 0, '2024-04-17', '23:59:00.000000', 100, '0b17b6', 'posts/WhatsApp_Image_2024-01-31_at_07.28.12_e6953f78.jpg'),
(5, 'with maririal 2', 'asfwd', '20:55:55.374618', '2024-04-04', 0, '2024-04-01', '23:59:00.000000', 100, '0b17b6', 'posts/WhatsApp_Image_2024-01-31_at_07.28.12_e6953f78_Xrll9RP.jpg'),
(6, 'dsavbdf', 'dsbv', '21:01:37.424628', '2024-04-04', 0, '2024-04-08', '23:59:00.000000', 100, '0b17b6', 'False'),
(7, 'svdvsvdw', 'wv', '21:02:03.776975', '2024-04-04', 0, '2024-04-01', '23:59:00.000000', 100, '0b17b6', 'False'),
(8, 'sfwigdc', 'skqu`', '22:13:26.443257', '2024-04-04', 0, '2024-04-04', '23:59:00.000000', 100, '0b17b6', 'False'),
(9, 'sfwigdc', 'skqu`', '22:15:16.442099', '2024-04-04', 0, '2024-04-04', '23:59:00.000000', 100, '0b17b6', 'False'),
(10, 'ndwo', 'pivjwop', '22:15:51.151378', '2024-04-04', 0, '2024-04-04', '23:59:00.000000', 100, '0b17b6', 'False'),
(11, 'via form final', 'dmlfn', '22:17:36.295485', '2024-04-04', 0, '2024-04-04', '23:59:00.000000', 100, '0b17b6', 'False'),
(12, 'svf s', 'dsvf', '22:23:26.345706', '2024-04-04', 0, '2024-04-04', '23:59:00.000000', 100, '0b17b6', 'False'),
(13, 'smit', 'dwvf', '22:25:39.526933', '2024-04-04', 0, '2024-04-04', '23:59:00.000000', 100, '0b17b6', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-04 13:18:38.197073', '1', 'first post', 1, '[{\"added\": {}}]', 9, 1),
(2, '2024-04-04 13:34:51.442667', '2', 'second post', 1, '[{\"added\": {}}]', 9, 1),
(3, '2024-04-04 13:35:24.058052', '3', 'third post', 1, '[{\"added\": {}}]', 9, 1),
(4, '2024-04-04 14:53:55.665144', '4', 'with matiraial', 1, '[{\"added\": {}}]', 9, 1),
(5, '2024-04-04 15:25:55.374618', '5', 'with maririal 2', 1, '[{\"added\": {}}]', 9, 1),
(6, '2024-04-04 15:31:37.440254', '6', 'dsavbdf', 1, '[{\"added\": {}}]', 9, 1),
(7, '2024-04-04 15:32:03.776975', '7', 'svdvsvdw', 1, '[{\"added\": {}}]', 9, 1),
(8, '2024-04-04 17:05:57.468831', '1', 'comment object (1)', 1, '[{\"added\": {}}]', 10, 1),
(9, '2024-04-04 17:42:39.663960', '1', 'Comment by: firts ;;adnvolsdn', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 10, 1),
(10, '2024-04-04 17:43:32.115063', '1', 'Comment by: firts ;;adnvolsdn', 3, '', 10, 1),
(11, '2024-04-04 17:43:42.185667', '2', 'Comment by: dvasf', 1, '[{\"added\": {}}]', 10, 1),
(12, '2024-04-04 18:11:55.824491', '3', 'Comment by: dbfsfsad', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(7, 'contenttypes', 'contenttype'),
(1, 'core', 'classroom'),
(10, 'core', 'comment'),
(2, 'core', 'enrollment'),
(9, 'core', 'post'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-04 11:42:16.920841'),
(2, 'auth', '0001_initial', '2024-04-04 11:42:17.121074'),
(3, 'admin', '0001_initial', '2024-04-04 11:42:17.580740'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-04 11:42:17.681007'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-04 11:42:17.704721'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-04 11:42:17.791681'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-04 11:42:17.836715'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-04 11:42:17.860786'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-04 11:42:17.874025'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-04 11:42:17.940800'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-04 11:42:17.940800'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-04 11:42:17.964671'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-04 11:42:17.988632'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-04 11:42:18.007226'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-04 11:42:18.027598'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-04 11:42:18.042019'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-04 11:42:18.072553'),
(18, 'core', '0001_initial', '2024-04-04 11:42:18.130866'),
(19, 'sessions', '0001_initial', '2024-04-04 11:42:18.281030'),
(20, 'core', '0002_auto_20240404_1719', '2024-04-04 11:49:55.097522'),
(21, 'core', '0002_post', '2024-04-04 13:16:32.766509'),
(22, 'core', '0003_post_matirial', '2024-04-04 14:52:51.251908'),
(23, 'core', '0004_auto_20240404_2039', '2024-04-04 15:10:08.758610'),
(24, 'core', '0005_auto_20240404_2043', '2024-04-04 15:13:42.561541'),
(25, 'core', '0006_auto_20240404_2055', '2024-04-04 15:25:05.431934'),
(26, 'core', '0007_auto_20240404_2101', '2024-04-04 15:31:27.840255'),
(27, 'core', '0008_comment', '2024-04-04 17:04:41.320027');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('k539m6mjpqrctzou7qhjxyo0tjhhb76j', '.eJxVjEEOwiAQRe_C2hDAoYBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERWpx-t4T04LaDfMd2myXNbV2mJHdFHrTLcc78vB7u30HFXr-1BySdrdYOtc_kwbABg2iKUmWwCAPYMwXyNiRPhV0GcF4FIE6OMIj3B9egN9g:1rsMwy:wZ9QaRRBwZlSfcVnA_tt7vEtRpmwyVMrvh4y02gIBn8', '2024-04-18 13:16:16.971484'),
('rnyfad3dklpstcpaiqluwt5qah3iguf1', '.eJxVjEEOwiAQRe_C2hDAoYBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERWpx-t4T04LaDfMd2myXNbV2mJHdFHrTLcc78vB7u30HFXr-1BySdrdYOtc_kwbABg2iKUmWwCAPYMwXyNiRPhV0GcF4FIE6OMIj3B9egN9g:1rsQlD:uyUcfHgFTVxLPnRW6ZWW29G7ykzkqRga6h69dULS_1c', '2024-04-18 17:20:23.162427');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `core_classroom`
--
ALTER TABLE `core_classroom`
  ADD PRIMARY KEY (`code`),
  ADD KEY `core_classroom_created_by_id_8292a672_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `core_comment`
--
ALTER TABLE `core_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_comment_author_id_f7066c5e_fk_auth_user_id` (`author_id`),
  ADD KEY `core_comment_post_id_a75a789c_fk_core_post_id` (`post_id`);

--
-- Indexes for table `core_enrollment`
--
ALTER TABLE `core_enrollment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_enrollment_enrolled_id_17321e62_fk_core_classroom_code` (`enrolled_id`),
  ADD KEY `core_enrollment_students_id_ba225c1d_fk_auth_user_id` (`students_id`);

--
-- Indexes for table `core_post`
--
ALTER TABLE `core_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_post_classroom_id_id_4440f8ff_fk_core_classroom_code` (`classroom_id_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_comment`
--
ALTER TABLE `core_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `core_enrollment`
--
ALTER TABLE `core_enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_post`
--
ALTER TABLE `core_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_classroom`
--
ALTER TABLE `core_classroom`
  ADD CONSTRAINT `core_classroom_created_by_id_8292a672_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_comment`
--
ALTER TABLE `core_comment`
  ADD CONSTRAINT `core_comment_author_id_f7066c5e_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `core_comment_post_id_a75a789c_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`);

--
-- Constraints for table `core_enrollment`
--
ALTER TABLE `core_enrollment`
  ADD CONSTRAINT `core_enrollment_enrolled_id_17321e62_fk_core_classroom_code` FOREIGN KEY (`enrolled_id`) REFERENCES `core_classroom` (`code`),
  ADD CONSTRAINT `core_enrollment_students_id_ba225c1d_fk_auth_user_id` FOREIGN KEY (`students_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_post`
--
ALTER TABLE `core_post`
  ADD CONSTRAINT `core_post_classroom_id_id_4440f8ff_fk_core_classroom_code` FOREIGN KEY (`classroom_id_id`) REFERENCES `core_classroom` (`code`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
