-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2020 at 07:24 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_masyarakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add pengaduan', 7, 'add_pengaduan'),
(26, 'Can change pengaduan', 7, 'change_pengaduan'),
(27, 'Can delete pengaduan', 7, 'delete_pengaduan'),
(28, 'Can view pengaduan', 7, 'view_pengaduan'),
(29, 'Can add tanggapan', 8, 'add_tanggapan'),
(30, 'Can change tanggapan', 8, 'change_tanggapan'),
(31, 'Can delete tanggapan', 8, 'delete_tanggapan'),
(32, 'Can view tanggapan', 8, 'view_tanggapan');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-03-12 01:29:23.360759', '2', 'Saya SIapa/MonzzNs', 1, '[{\"added\": {}}]', 7, 1),
(2, '2020-03-12 01:41:55.704167', '3', 'Anda Siapa/Keisya', 1, '[{\"added\": {}}]', 7, 1),
(3, '2020-03-14 07:38:26.251089', '1', 'Anda Siapa/Keisya/MonzzNs', 1, '[{\"added\": {}}]', 8, 1),
(4, '2020-03-16 14:01:15.404079', '4', 'Fmf', 1, '[{\"added\": {}}]', 6, 1),
(5, '2020-03-16 14:01:45.454947', '4', 'Fmf', 3, '', 6, 1),
(6, '2020-04-05 02:52:32.883178', '1', 'MonzzNs', 2, '[{\"changed\": {\"fields\": [\"Nama\"]}}]', 6, 1),
(7, '2020-04-09 04:26:42.211505', '7', 'FmFKolder', 3, '', 6, 1),
(8, '2020-04-09 04:26:42.215400', '6', 'GaroXx', 3, '', 6, 1),
(9, '2020-04-10 10:01:59.854522', '3', 'Anda Siapa/Keisya', 3, '', 7, 1),
(10, '2020-04-10 12:18:09.637006', '4', 'Lah...Anda Siapa/Keisya', 1, '[{\"added\": {}}]', 7, 1),
(11, '2020-04-10 12:24:16.523846', '4', 'Lah...Anda Siapa/Keisya', 3, '', 7, 1),
(12, '2020-04-10 12:29:06.462979', '5', 'Lah...anda siapa/Komed', 1, '[{\"added\": {}}]', 7, 1),
(13, '2020-04-10 12:30:44.866176', '6', 'Nama Saya .../SsIcarusS', 1, '[{\"added\": {}}]', 7, 1),
(14, '2020-04-10 12:31:36.877837', '5', 'Lah...anda siapa/Komed', 3, '', 7, 1),
(15, '2020-04-10 12:32:10.569367', '7', 'Bapak siapa/GaroXx', 1, '[{\"added\": {}}]', 7, 1),
(16, '2020-04-10 12:47:07.655090', '6', 'Nama Saya .../SsIcarusS', 3, '', 7, 1),
(17, '2020-04-10 12:53:13.598294', '2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium, ea? Ullam numquam quia, eum odit ad laudantium eaque laborum consequatur dolore, omnis id, explicabo nostrum saepe minus beatae at', 2, '[{\"changed\": {\"fields\": [\"Laporan\"]}}]', 7, 1),
(18, '2020-04-10 12:53:23.575298', '7', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium, ea? Ullam numquam quia, eum odit ad laudantium eaque laborum consequatur dolore, omnis id, explicabo nostrum saepe minus beatae at', 2, '[{\"changed\": {\"fields\": [\"Laporan\"]}}]', 7, 1),
(19, '2020-04-11 09:02:49.526732', '8', 'GaroXx', 3, '', 6, 1),
(20, '2020-04-11 09:02:49.536267', '2', 'Keisya', 3, '', 6, 1),
(21, '2020-04-11 09:02:49.539314', '5', 'Komed', 3, '', 6, 1),
(22, '2020-04-11 09:02:49.542310', '3', 'SsIcarusS', 3, '', 6, 1),
(23, '2020-04-11 09:30:12.345234', '9', 'Komed', 3, '', 6, 1),
(24, '2020-04-11 09:30:12.348226', '10', 'Komed2', 3, '', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'main', 'pengaduan'),
(8, 'main', 'tanggapan'),
(6, 'main', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'main', '0001_initial', '2020-03-11 06:26:43.855762'),
(2, 'contenttypes', '0001_initial', '2020-03-11 06:26:44.439529'),
(3, 'admin', '0001_initial', '2020-03-11 06:26:44.561542'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-03-11 06:26:44.858099'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-11 06:26:44.868815'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-03-11 06:26:44.991156'),
(7, 'auth', '0001_initial', '2020-03-11 06:26:45.360591'),
(8, 'auth', '0002_alter_permission_name_max_length', '2020-03-11 06:26:45.756591'),
(9, 'auth', '0003_alter_user_email_max_length', '2020-03-11 06:26:45.757899'),
(10, 'auth', '0004_alter_user_username_opts', '2020-03-11 06:26:45.775936'),
(11, 'auth', '0005_alter_user_last_login_null', '2020-03-11 06:26:45.785466'),
(12, 'auth', '0006_require_contenttypes_0002', '2020-03-11 06:26:45.789456'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2020-03-11 06:26:45.799428'),
(14, 'auth', '0008_alter_user_username_max_length', '2020-03-11 06:26:45.812395'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2020-03-11 06:26:45.820764'),
(16, 'auth', '0010_alter_group_name_max_length', '2020-03-11 06:26:45.846925'),
(17, 'auth', '0011_update_proxy_permissions', '2020-03-11 06:26:45.865875'),
(18, 'sessions', '0001_initial', '2020-03-11 06:26:45.949563'),
(19, 'main', '0002_auto_20200311_1951', '2020-03-11 12:51:54.410461'),
(20, 'main', '0003_auto_20200312_1038', '2020-03-12 03:38:29.437688'),
(21, 'main', '0004_auto_20200315_2005', '2020-03-15 13:05:40.849006');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('14bcmlp27ht0gy3k3vdmx0ofeolypikd', 'Zjg0MzkwYzViYjYzZGNhMzY0YjE3ODMzNWFlMTdiNDBmNjJjZjFkODp7fQ==', '2020-04-25 14:33:07.117795'),
('1fjojg8wupcgcv650xoke03h351jjcc0', 'Zjg0MzkwYzViYjYzZGNhMzY0YjE3ODMzNWFlMTdiNDBmNjJjZjFkODp7fQ==', '2020-04-26 02:35:28.074057'),
('8qqyfr3ehku5802d9h9tbi6rp728tkb0', 'Zjg0MzkwYzViYjYzZGNhMzY0YjE3ODMzNWFlMTdiNDBmNjJjZjFkODp7fQ==', '2020-04-25 14:27:49.362284'),
('ggvh9jbl9rgm6kefmc5ul9k2kt43k6ef', 'Zjg0MzkwYzViYjYzZGNhMzY0YjE3ODMzNWFlMTdiNDBmNjJjZjFkODp7fQ==', '2020-04-26 02:27:45.197032'),
('l0fjaz96o4ybdwlovhiqhlis4dz5eqli', 'MjRkNjVkMWYxNjJhYWZjOWIzNTFlMWJkY2QwZWQyMzMyODRiMjJhYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTYyNWNkNWQ3MzZhZjA0NzFlMTMzNjk0NTMzZWM2NWM4ZDc3NzliIn0=', '2020-03-25 06:38:21.766013'),
('uzupmbev5pr82q452iveou5cke2zmewb', 'Zjg0MzkwYzViYjYzZGNhMzY0YjE3ODMzNWFlMTdiNDBmNjJjZjFkODp7fQ==', '2020-04-25 09:43:29.479383');

-- --------------------------------------------------------

--
-- Table structure for table `main_pengaduan`
--

CREATE TABLE `main_pengaduan` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `laporan` longtext NOT NULL,
  `foto` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `pelapor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_pengaduan`
--

INSERT INTO `main_pengaduan` (`id`, `tanggal`, `laporan`, `foto`, `status`, `pelapor_id`) VALUES
(2, '2020-03-12', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium, ea? Ullam numquam quia, eum odit ad laudantium eaque laborum consequatur dolore, omnis id, explicabo nostrum saepe minus beatae at vitae!', 'media/IMG_20200220_132057_pI8Fmij.jpg', 'Proses', 1);

-- --------------------------------------------------------

--
-- Table structure for table `main_tanggapan`
--

CREATE TABLE `main_tanggapan` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `tanggapan` longtext NOT NULL,
  `pengaduan_id` int(11) NOT NULL,
  `petugas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `main_user`
--

CREATE TABLE `main_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `username` varchar(25) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `last_login` date NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_user`
--

INSERT INTO `main_user` (`id`, `password`, `username`, `nik`, `nama`, `telp`, `last_login`, `is_staff`, `is_active`, `is_admin`, `is_superuser`) VALUES
(1, 'pbkdf2_sha256$180000$EPZ7OzlVvQqg$JlcYhJjH53axnDlszPBDb/UBaVAt+xbGDWRSHDXtDIs=', 'MonzzNs', '0979775275735', 'Aiman Nursubkhi', '081321816876', '2020-04-12', 1, 1, 1, 1),
(11, 'pbkdf2_sha256$180000$NnQEjffKNqRw$Tt+6ytjOEGE/aocxfG+mjUYiRvpDFP0h3dicArvGPXQ=', 'Komed', '0912817938923928', 'Achmad Js', '0817789273917', '2020-04-13', 0, 1, 0, 0);

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
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_main_user_id` (`user_id`);

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
-- Indexes for table `main_pengaduan`
--
ALTER TABLE `main_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_pengaduan_pelapor_id_396bfadf_fk_main_user_id` (`pelapor_id`);

--
-- Indexes for table `main_tanggapan`
--
ALTER TABLE `main_tanggapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_tanggapan_pengaduan_id_722407af_fk_main_pengaduan_id` (`pengaduan_id`),
  ADD KEY `main_tanggapan_petugas_id_a6a341ab_fk_main_user_id` (`petugas_id`);

--
-- Indexes for table `main_user`
--
ALTER TABLE `main_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `main_pengaduan`
--
ALTER TABLE `main_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `main_tanggapan`
--
ALTER TABLE `main_tanggapan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `main_user`
--
ALTER TABLE `main_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`);

--
-- Constraints for table `main_pengaduan`
--
ALTER TABLE `main_pengaduan`
  ADD CONSTRAINT `main_pengaduan_pelapor_id_396bfadf_fk_main_user_id` FOREIGN KEY (`pelapor_id`) REFERENCES `main_user` (`id`);

--
-- Constraints for table `main_tanggapan`
--
ALTER TABLE `main_tanggapan`
  ADD CONSTRAINT `main_tanggapan_pengaduan_id_722407af_fk_main_pengaduan_id` FOREIGN KEY (`pengaduan_id`) REFERENCES `main_pengaduan` (`id`),
  ADD CONSTRAINT `main_tanggapan_petugas_id_a6a341ab_fk_main_user_id` FOREIGN KEY (`petugas_id`) REFERENCES `main_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
