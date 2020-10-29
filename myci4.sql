-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: db-server
-- Generation Time: Oct 15, 2020 at 08:20 PM
-- Server version: 5.7.30
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myci4_tdc`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` smallint(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` smallint(6) DEFAULT NULL,
  `image` smallint(6) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `open` datetime DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` smallint(6) NOT NULL,
  `parent` smallint(6) DEFAULT NULL,
  `ref` varchar(127) NOT NULL DEFAULT '-',
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` smallint(6) DEFAULT NULL,
  `content` text,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:Article; 2:News; 3:Document',
  `style` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:Grid; 2:List',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` smallint(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo` smallint(6) DEFAULT NULL,
  `content` text,
  `link` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:Customer; 2:Partner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` smallint(6) NOT NULL,
  `category_id` smallint(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` smallint(6) DEFAULT NULL,
  `intro` varchar(1023) DEFAULT NULL,
  `content` text,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `example`
--

CREATE TABLE `example` (
  `id` smallint(6) NOT NULL,
  `parent` smallint(6) DEFAULT NULL,
  `ref` varchar(127) NOT NULL DEFAULT '-',
  `code` varchar(63) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` text,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `example`
--

INSERT INTO `example` (`id`, `parent`, `ref`, `code`, `name`, `slug`, `content`, `type`, `sort`, `date_create`, `date_update`) VALUES
(1, NULL, '-', NULL, 'Giới thiệu', 'gioi-thieu', NULL, 1, 0, '2020-10-07 14:57:30', NULL),
(2, 1, '-1-', NULL, 'Giới thiệu chung', 'gioi-thieu-chung', NULL, 1, 0, '2020-10-07 14:58:58', NULL),
(3, 1, '-1-', NULL, 'Lĩnh vực hoạt động', 'linh-vuc-hoat-dong', NULL, 1, 0, '2020-10-07 14:58:58', NULL),
(4, 1, '-1-', NULL, 'Chính sách chất lượng', 'chinh-sach-chat-luong', NULL, 1, 0, '2020-10-07 15:00:20', NULL),
(5, 1, '-1-', NULL, 'Sơ đồ tổ chức', 'so-do-to-chuc', NULL, 1, 0, '2020-10-07 15:00:20', NULL),
(6, NULL, '-', NULL, 'Dịch vụ', 'dich-vu', NULL, 1, 0, '2020-10-07 15:00:47', NULL),
(7, 6, '-6-', NULL, 'Thử nghiệm', 'thu-nghiem', NULL, 1, 0, '2020-10-07 15:01:50', NULL),
(8, 6, '-6-', NULL, 'Đo lường', 'do-luong', NULL, 1, 0, '2020-10-07 15:01:50', NULL),
(9, 7, '-6-7-', NULL, 'Thử nghiệm điện - Điện tử gia dụng', 'thu-nghiem-dien-dien-tu-gia-dung', NULL, 1, 0, '2020-10-07 15:05:12', NULL),
(10, 7, '-6-7-', NULL, 'Thử nghiệm và Xây dựng Tiêu Chuẩn Cơ Sở (TCCS) cho các sản phẩm tiêu dùng', 'thu-nghiem-va-xay-dung-tieu-chuan-co-so-cho-cac-san-pham-tieu-dung', NULL, 1, 0, '2020-10-07 15:05:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

CREATE TABLE `homepage` (
  `id` smallint(6) NOT NULL,
  `activities_id` smallint(6) DEFAULT NULL,
  `document_id` smallint(6) DEFAULT NULL,
  `news_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` smallint(6) NOT NULL,
  `category_id` smallint(6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `src` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `image_category`
--

CREATE TABLE `image_category` (
  `id` smallint(6) NOT NULL,
  `parent` smallint(6) DEFAULT NULL,
  `ref` varchar(127) NOT NULL DEFAULT '-',
  `name` varchar(255) NOT NULL,
  `code` varchar(127) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` text,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` smallint(6) NOT NULL,
  `category_id` smallint(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` smallint(6) DEFAULT NULL,
  `intro` varchar(1023) DEFAULT NULL,
  `content` text,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openletter`
--

CREATE TABLE `openletter` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image1` smallint(6) DEFAULT NULL,
  `image2` smallint(6) DEFAULT NULL,
  `background` smallint(6) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `content` varchar(2047) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:Hide; 2:Show'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` smallint(6) DEFAULT NULL,
  `image` smallint(6) DEFAULT NULL,
  `intro` varchar(1023) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` smallint(6) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` smallint(6) NOT NULL,
  `name` varchar(127) NOT NULL,
  `slug` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_document`
--

CREATE TABLE `tag_document` (
  `tag_id` smallint(6) NOT NULL,
  `document_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_news`
--

CREATE TABLE `tag_news` (
  `tag_id` smallint(6) NOT NULL,
  `news_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `icon` (`icon`),
  ADD KEY `image` (`image`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent` (`parent`),
  ADD KEY `image` (`image`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `logo` (`logo`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `image` (`image`);

--
-- Indexes for table `example`
--
ALTER TABLE `example`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_id` (`activities_id`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `image_category`
--
ALTER TABLE `image_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `image` (`image`);

--
-- Indexes for table `openletter`
--
ALTER TABLE `openletter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `image1` (`image1`),
  ADD KEY `image2` (`image2`),
  ADD KEY `background` (`background`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `icon` (`icon`),
  ADD KEY `image` (`image`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `image` (`image`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `tag_document`
--
ALTER TABLE `tag_document`
  ADD UNIQUE KEY `unique_ids` (`tag_id`,`document_id`) USING BTREE,
  ADD KEY `document_id` (`document_id`),
  ADD KEY `tag_id` (`tag_id`) USING BTREE;

--
-- Indexes for table `tag_news`
--
ALTER TABLE `tag_news`
  ADD UNIQUE KEY `unique_ids` (`tag_id`,`news_id`) USING BTREE,
  ADD KEY `news_id` (`news_id`),
  ADD KEY `tag_id` (`tag_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `example`
--
ALTER TABLE `example`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_category`
--
ALTER TABLE `image_category`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `openletter`
--
ALTER TABLE `openletter`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`icon`) REFERENCES `image` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `activities_ibfk_2` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`logo`) REFERENCES `image` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_ibfk_2` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `homepage`
--
ALTER TABLE `homepage`
  ADD CONSTRAINT `homepage_ibfk_1` FOREIGN KEY (`activities_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homepage_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homepage_ibfk_3` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `image_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `image_category`
--
ALTER TABLE `image_category`
  ADD CONSTRAINT `image_category_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `image_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `openletter`
--
ALTER TABLE `openletter`
  ADD CONSTRAINT `openletter_ibfk_1` FOREIGN KEY (`image1`) REFERENCES `image` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `openletter_ibfk_2` FOREIGN KEY (`image2`) REFERENCES `image` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `openletter_ibfk_3` FOREIGN KEY (`background`) REFERENCES `image` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`icon`) REFERENCES `image` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `program_ibfk_2` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `slide`
--
ALTER TABLE `slide`
  ADD CONSTRAINT `slide_ibfk_1` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tag_document`
--
ALTER TABLE `tag_document`
  ADD CONSTRAINT `tag_document_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tag_document_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tag_news`
--
ALTER TABLE `tag_news`
  ADD CONSTRAINT `tag_news_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tag_news_ibfk_2` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
