-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 27, 2010 at 04:40 PM
-- Server version: 5.1.39
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spotus_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliations`
--

CREATE TABLE IF NOT EXISTS `affiliations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_id` int(11) DEFAULT NULL,
  `pitch_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_affiliations_on_tip_id` (`tip_id`),
  KEY `index_affiliations_on_pitch_id` (`pitch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `affiliations`
--


-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE IF NOT EXISTS `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pitch_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `media_embed` text,
  `status` varchar(255) DEFAULT 'open',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_factchecker_assignment` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_assignments_on_user_id` (`user_id`),
  KEY `index_assignments_on_pitch_id` (`pitch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `user_id`, `pitch_id`, `title`, `body`, `media_embed`, `status`, `created_at`, `updated_at`, `is_factchecker_assignment`) VALUES
(1, 1, 1, 'Apply to be Peer Review Editor', 'The Peer-Review editor has three main responsibilities â€“ to ensure fair and accurate reporting, to be a second pair of eyes before a story is published and to be a sounding board as the reporter develops a story. At any time the Peer-Review editor can also report suspicious activities to Spot.Us.', NULL, 'open', '2010-12-27 14:35:15', '2010-12-27 14:35:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `assignment_contributors`
--

CREATE TABLE IF NOT EXISTS `assignment_contributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `contributor_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `assignment_contributors`
--


-- --------------------------------------------------------

--
-- Table structure for table `async_posts`
--

CREATE TABLE IF NOT EXISTS `async_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `message` text,
  `description` text,
  `post_type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `async_posts`
--


-- --------------------------------------------------------

--
-- Table structure for table `blacklist_emails`
--

CREATE TABLE IF NOT EXISTS `blacklist_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `blacklist_emails`
--


-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `network_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `network_id`) VALUES
(1, 'San Francisco', '2010-12-27 13:47:27', '2010-12-27 13:47:27', NULL),
(2, 'North Bay', '2010-12-27 13:47:27', '2010-12-27 13:47:27', NULL),
(3, 'Peninsula', '2010-12-27 13:47:27', '2010-12-27 13:47:27', NULL),
(4, 'East Bay', '2010-12-27 13:47:27', '2010-12-27 13:47:27', NULL),
(5, 'South Bay', '2010-12-27 13:47:27', '2010-12-27 13:47:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ccas`
--

CREATE TABLE IF NOT EXISTS `ccas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sponsor_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1028) DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `max_credits_amount` decimal(15,2) DEFAULT '0.00',
  `credits_awarded` decimal(15,2) DEFAULT '0.00',
  `award_amount` decimal(15,2) DEFAULT '0.00',
  `banner_file_name` varchar(255) DEFAULT NULL,
  `banner_content_type` varchar(255) DEFAULT NULL,
  `banner_file_size` int(11) DEFAULT NULL,
  `banner_updated_at` datetime DEFAULT NULL,
  `embed_code` text,
  `length_of_video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ccas`
--


-- --------------------------------------------------------

--
-- Table structure for table `cca_answers`
--

CREATE TABLE IF NOT EXISTS `cca_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cca_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cca_question_id` int(11) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pitch_id` int(11) DEFAULT NULL,
  `default_answer` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cca_answers`
--


-- --------------------------------------------------------

--
-- Table structure for table `cca_questions`
--

CREATE TABLE IF NOT EXISTS `cca_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cca_id` int(11) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `question_data` varchar(1000) DEFAULT NULL,
  `question_type` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '1',
  `status` smallint(6) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cca_questions`
--


-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE IF NOT EXISTS `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `channel_image_file_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `channels`
--


-- --------------------------------------------------------

--
-- Table structure for table `channels_networks`
--

CREATE TABLE IF NOT EXISTS `channels_networks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `network_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `channels_networks`
--


-- --------------------------------------------------------

--
-- Table structure for table `channel_pitches`
--

CREATE TABLE IF NOT EXISTS `channel_pitches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `pitch_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `channel_pitches`
--


-- --------------------------------------------------------

--
-- Table structure for table `city_suggestions`
--

CREATE TABLE IF NOT EXISTS `city_suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `city_suggestions`
--


-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `commentable_type` varchar(255) DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `body` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `contributor_applications`
--

CREATE TABLE IF NOT EXISTS `contributor_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pitch_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `approved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `contributor_applications`
--


-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE IF NOT EXISTS `credentials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` text,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_credentials_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `credentials`
--


-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

CREATE TABLE IF NOT EXISTS `credits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `cca_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `credits`
--


-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE IF NOT EXISTS `donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pitch_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'unpaid',
  `amount` decimal(15,2) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `donation_type` varchar(255) DEFAULT 'payment',
  `credit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_donations_on_user_id` (`user_id`),
  KEY `index_donations_on_pitch_id` (`pitch_id`),
  KEY `index_donations_on_purchase_id` (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `donations`
--


-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE IF NOT EXISTS `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `feedback_type` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `feedbacks`
--


-- --------------------------------------------------------

--
-- Table structure for table `groupings`
--

CREATE TABLE IF NOT EXISTS `groupings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `seo_name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `groupings`
--


-- --------------------------------------------------------

--
-- Table structure for table `groupings_users`
--

CREATE TABLE IF NOT EXISTS `groupings_users` (
  `grouping_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupings_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `networks`
--

CREATE TABLE IF NOT EXISTS `networks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `networks`
--

INSERT INTO `networks` (`id`, `name`, `created_at`, `updated_at`, `display_name`) VALUES
(1, 'sfbay', '2010-12-27 13:47:28', '2010-12-27 13:47:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news_items`
--

CREATE TABLE IF NOT EXISTS `news_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headline` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `short_description` text,
  `delivery_description` text,
  `extended_description` text,
  `skills` text,
  `keywords` varchar(255) DEFAULT NULL,
  `deliver_text` tinyint(1) NOT NULL DEFAULT '0',
  `deliver_audio` tinyint(1) NOT NULL DEFAULT '0',
  `deliver_video` tinyint(1) NOT NULL DEFAULT '0',
  `deliver_photo` tinyint(1) NOT NULL DEFAULT '0',
  `contract_agreement` tinyint(1) NOT NULL DEFAULT '0',
  `expiration_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `featured_image_file_name` varchar(255) DEFAULT NULL,
  `featured_image_content_type` varchar(255) DEFAULT NULL,
  `featured_image_file_size` int(11) DEFAULT NULL,
  `featured_image_updated_at` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `video_embed` text,
  `featured_image_caption` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `feature` tinyint(1) DEFAULT NULL,
  `fact_checker_id` int(11) DEFAULT NULL,
  `news_item_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `widget_embed` text,
  `requested_amount` decimal(15,2) DEFAULT NULL,
  `current_funding` decimal(15,2) DEFAULT '0.00',
  `network_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `external_links` text,
  `license` text,
  `disclosure` text,
  PRIMARY KEY (`id`),
  KEY `index_pitches_on_state` (`state`),
  KEY `index_pitches_on_expiration_date` (`expiration_date`),
  KEY `index_news_items_on_type` (`type`),
  KEY `index_news_items_on_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `news_items`
--

INSERT INTO `news_items` (`id`, `headline`, `state`, `short_description`, `delivery_description`, `extended_description`, `skills`, `keywords`, `deliver_text`, `deliver_audio`, `deliver_video`, `deliver_photo`, `contract_agreement`, `expiration_date`, `created_at`, `updated_at`, `featured_image_file_name`, `featured_image_content_type`, `featured_image_file_size`, `featured_image_updated_at`, `type`, `video_embed`, `featured_image_caption`, `user_id`, `status`, `feature`, `fact_checker_id`, `news_item_id`, `deleted_at`, `widget_embed`, `requested_amount`, `current_funding`, `network_id`, `category_id`, `external_links`, `license`, `disclosure`) VALUES
(1, 'My test story', NULL, '<p>\r\n	The story here</p>\r\n', '<p>\r\n	ssss</p>\r\n', '', '<p>\r\n	dddddd</p>\r\n', '', 1, 0, 0, 0, 1, '2011-12-06 00:00:00', '2010-12-27 14:35:15', '2010-12-27 14:35:16', NULL, NULL, NULL, NULL, 'Pitch', '', '', 1, 'unapproved', NULL, NULL, NULL, NULL, NULL, 10.00, 0.00, 1, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `notification_emails`
--

CREATE TABLE IF NOT EXISTS `notification_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `status` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `list_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `notification_emails`
--


-- --------------------------------------------------------

--
-- Table structure for table `organization_pitches`
--

CREATE TABLE IF NOT EXISTS `organization_pitches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `pitch_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `organization_pitches`
--


-- --------------------------------------------------------

--
-- Table structure for table `paypal_transactions`
--

CREATE TABLE IF NOT EXISTS `paypal_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `paypal_response` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `paypal_transactions`
--


-- --------------------------------------------------------

--
-- Table structure for table `pledges`
--

CREATE TABLE IF NOT EXISTS `pledges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tip_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pledges_on_user_id` (`user_id`),
  KEY `index_pledges_on_tip_id` (`tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pledges`
--


-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `media_embed` text,
  `pitch_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `blog_image_file_name` varchar(255) DEFAULT NULL,
  `blog_image_content_type` varchar(255) DEFAULT NULL,
  `blog_image_file_size` int(11) DEFAULT NULL,
  `blog_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `posts`
--


-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `credit_card_number_ending` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `total_amount` decimal(15,2) DEFAULT NULL,
  `paypal_transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_purchases_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `purchases`
--


-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('1'),
('20080922190859'),
('20080922205520'),
('20080923140753'),
('20080923160810'),
('20080923162650'),
('20080923164119'),
('20080923165702'),
('20080923183520'),
('20080923190440'),
('20080923190915'),
('20080923194808'),
('20080923215234'),
('20080923225518'),
('20080923234949'),
('20080924135243'),
('20080924141846'),
('20080924143826'),
('20080924144009'),
('20080924190646'),
('20080924235055'),
('20080925002144'),
('20080925205725'),
('20080925210308'),
('20080930182515'),
('20081001211308'),
('20081002231853'),
('20081003001406'),
('20081003194131'),
('20081004142902'),
('20081004152621'),
('20081009124446'),
('20081009155559'),
('20081009194803'),
('20081009201502'),
('20081021181454'),
('20081021181608'),
('20081021181827'),
('20081022155729'),
('20081029192405'),
('20081104165818'),
('20081104173347'),
('20081104210705'),
('20081120144513'),
('20081210191320'),
('20090115162538'),
('20090115224416'),
('20090116144118'),
('20090116200734'),
('20090121155255'),
('20090121190447'),
('20090121194520'),
('20090121211422'),
('20090121214924'),
('20090122183715'),
('20090128213704'),
('20090129161231'),
('20090217143024'),
('20090217151235'),
('20090217172144'),
('20090218144012'),
('20090218162436'),
('20090218164113'),
('20090218185939'),
('20090218191051'),
('20090218205536'),
('20090219203016'),
('20090226213419'),
('20090303183847'),
('20090304162243'),
('20090306135940'),
('20090306183739'),
('20090306185523'),
('20090309152119'),
('20090309191706'),
('20090309200739'),
('20090310184653'),
('20090310191657'),
('20090414205424'),
('20090415193608'),
('20091007160903'),
('20091012191325'),
('20091019180125'),
('20091020213339'),
('20091022150926'),
('20091113205626'),
('20091116201405'),
('20091130181739'),
('20091130183022'),
('20091214195918'),
('20091223183147'),
('20091223183643'),
('20100202233553'),
('20100208182602'),
('20100209191339'),
('20100217204114'),
('20100305005129'),
('20100405202110'),
('20100405203800'),
('20100405210814'),
('20100409193516'),
('20100415181756'),
('20100428235753'),
('20100430190304'),
('20100430192511'),
('20100504210832'),
('20100505214815'),
('20100512205112'),
('20100513195050'),
('20100601221843'),
('20100615224829'),
('20100625014817'),
('20100707185418'),
('20100827163828'),
('20100902195005'),
('20101006180201'),
('20101006184838'),
('20101103173523'),
('20101105202907'),
('20101202190814'),
('20101202190828'),
('20101202201527'),
('20101202203914');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` text,
  `extended_description` text,
  `embed_code` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sections_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sections`
--


-- --------------------------------------------------------

--
-- Table structure for table `site_options`
--

CREATE TABLE IF NOT EXISTS `site_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `site_options`
--

INSERT INTO `site_options` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, '--- :video_content\n', '<object width="400" height="225"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=2041615&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=&amp;fullscreen=1" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=2041615&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="225"></embed></object>', '2010-12-27 13:47:26', '2010-12-27 13:47:26'),
(2, '--- :bottom_home_page_text\n', '<h5 style="margin: 0pt;">See our FAQ''s for <a href="/pages/about#faq"> Concerned Citizens, Reporters and News Organizations</a>. Spot.Us is a marketplace where all three come to collaborate.<p></p><p></p>Check out our <a href="http://blog.spot.us">blog</a> join our <a href="http://www.facebook.com/home.php#/group.php?sid=b04b3406bd9281f4fe4df6c39efef5d5&amp;refurl=http%3A%2F%2Fwww.facebook.com%2Fs.php%3Fref%3Dsearch%26init%3Dq%26q%3Dspot.us%26sid%3Db04b3406bd9281f4fe4df6c39efef5d5&amp;gid=29554944739">Facebook</a> or follow us on <a href="http://twitter.com/spotus">Twitter</a>.</h5>', '2010-12-27 13:47:26', '2010-12-27 13:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `spotus_donations`
--

CREATE TABLE IF NOT EXISTS `spotus_donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `credit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `spotus_donations`
--


-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pitch_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'requested',
  `invite_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_subscribers_on_pitch_id` (`pitch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `subscribers`
--


-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `seo_name` varchar(255) DEFAULT NULL,
  `featured_image_file_name` varchar(255) DEFAULT NULL,
  `featured_image_content_type` varchar(255) DEFAULT NULL,
  `featured_image_file_size` int(11) DEFAULT NULL,
  `featured_image_updated_at` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `created_at`, `updated_at`, `seo_name`, `featured_image_file_name`, `featured_image_content_type`, `featured_image_file_size`, `featured_image_updated_at`, `description`) VALUES
(1, 'Los Angeles', '2010-12-27 13:47:42', '2010-12-27 13:47:42', 'los-angeles', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `topic_memberships`
--

CREATE TABLE IF NOT EXISTS `topic_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `member_type` varchar(255) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_topic_memberships_on_member_id` (`member_id`),
  KEY `index_topic_memberships_on_topic_id` (`topic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `topic_memberships`
--

INSERT INTO `topic_memberships` (`id`, `member_id`, `member_type`, `topic_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'NewsItem', 1, '2010-12-27 14:35:15', '2010-12-27 14:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `twitter_credentials`
--

CREATE TABLE IF NOT EXISTS `twitter_credentials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `access_token` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `twitter_credentials`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `crypted_password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `about_you` text,
  `website` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `notify_blog_posts` tinyint(1) NOT NULL DEFAULT '0',
  `notify_comments` tinyint(1) DEFAULT '0',
  `notify_facebook_wall` tinyint(1) DEFAULT '1',
  `notify_twitter` tinyint(1) DEFAULT '1',
  `notify_tips` tinyint(1) NOT NULL DEFAULT '0',
  `notify_pitches` tinyint(1) NOT NULL DEFAULT '0',
  `notify_stories` tinyint(1) NOT NULL DEFAULT '0',
  `notify_spotus_news` tinyint(1) NOT NULL DEFAULT '0',
  `fact_check_interest` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(255),
  `organization_name` varchar(255) DEFAULT NULL,
  `established_year` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `network_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `fb_user_id` bigint(20) DEFAULT NULL,
  `email_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `crypted_password`, `salt`, `created_at`, `updated_at`, `remember_token`, `remember_token_expires_at`, `first_name`, `last_name`, `type`, `photo_file_name`, `photo_content_type`, `photo_file_size`, `about_you`, `website`, `address1`, `address2`, `city`, `state`, `zip`, `phone`, `country`, `notify_blog_posts`, `notify_comments`, `notify_facebook_wall`, `notify_twitter`, `notify_tips`, `notify_pitches`, `notify_stories`, `notify_spotus_news`, `fact_check_interest`, `status`, `organization_name`, `established_year`, `deleted_at`, `activation_code`, `network_id`, `category_id`, `fb_user_id`, `email_hash`) VALUES
(1, 'john1@test.com', 'c4ccda13185b9ae136c6847f57d1071cedb8810c', '56bd1c6548d7e043a0490ce9a606c393e033f1bd', '2010-12-27 14:23:04', '2010-12-27 14:23:04', NULL, NULL, 'John1', 'Dough', 'Citizen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'active', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);
