-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2024 at 03:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `charity_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$qHfAvePjGm.f2ARCOTLzC.vIdXyYNRRxP/vIWQOwy88YnnO5TiQ56', NULL, NULL, '2024-05-16 08:35:19', '2024-05-16 08:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `causes`
--

CREATE TABLE `causes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `featured_photo` varchar(255) NOT NULL,
  `goal` int(11) NOT NULL,
  `raised` int(11) DEFAULT NULL,
  `is_featured` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `causes`
--

INSERT INTO `causes` (`id`, `name`, `slug`, `short_description`, `description`, `featured_photo`, `goal`, `raised`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Sumbangan Untuk Warga yang Membutuhkan', 'sumbangan-untuk-warga-yang-membutuhkan', 'Bantu warga dengan sumbangan Anda untuk memberikan bantuan pangan, pendidikan, kesehatan, dan darurat yang sangat dibutuhkan.', '<p>Bergabunglah dalam gerakan kebaikan kami dengan menyumbang untuk membantu warga Desa Titang yang sedang mengalami kesulitan. Sumbangan Anda akan digunakan untuk memberikan bantuan yang sangat dibutuhkan dalam berbagai bidang seperti pangan, pendidikan, kesehatan, dan bantuan darurat. Kami komitmen untuk memastikan setiap sumbangan Anda memberikan dampak positif yang nyata bagi masyarakat Desa Titang.</p>', 'cause_featured_photo_1703771328.jpg', 10000000, 5250500, 'Yes', '2023-12-28 07:48:48', '2024-07-21 07:23:14'),
(2, 'Bantuan Kebersihan', 'bantuan-kebersihan', 'Sumbangkan untuk mendukung program kebersihan lingkungan dan bantu meningkatkan kesehatan masyarakat.', '<p>Gabunglah dalam upaya kami untuk meningkatkan kebersihan lingkungan dengan menyumbangkan untuk program Bantuan Kebersihan. Sumbangan Anda akan digunakan untuk mendukung inisiatif pembersihan dan pengelolaan lingkungan di berbagai lokasi yang membutuhkan. Kami berkomitmen untuk menjaga kebersihan lingkungan demi kesehatan dan kesejahteraan masyarakat secara keseluruhan.</p>', 'cause_featured_photo_1703771403.jpg', 500000, 401100, 'Yes', '2023-12-28 07:50:03', '2024-07-21 07:25:29'),
(6, 'Bantuan Pendidikan', 'bantuan-pendidikan', 'Bertujuan untuk memberikan akses pendidikan yang setara bagi anak-anak dari keluarga kurang mampu.', '<p>Program yang kami selenggarakan merupakan inisiatif untuk mengurangi kesenjangan pendidikan di desa. Kami fokus pada anak-anak dari keluarga yang kurang mampu untuk memastikan bahwa mereka memiliki akses yang setara terhadap pendidikan berkualitas. Donasi yang kami terima digunakan untuk menyediakan perlengkapan sekolah seperti buku pelajaran, alat tulis, dan seragam, serta untuk membantu menutup biaya sekolah mereka. Setiap donasi tidak hanya mendukung pendidikan formal mereka tetapi juga membangun fondasi yang kuat untuk pengembangan pribadi dan profesional mereka di masa depan.</p>\r\n<p>Kami bekerja sama erat dengan sekolah-sekolah lokal dan komunitas untuk memastikan bahwa bantuan yang diberikan benar-benar memenuhi kebutuhan yang ada dan memberikan dampak yang signifikan. Selain itu, kami juga menyelenggarakan program tambahan seperti pelatihan keterampilan hidup, seminar motivasi, dan kegiatan ekstrakurikuler untuk meningkatkan pengalaman belajar mereka dan memberikan perspektif yang lebih luas tentang potensi masa depan mereka. Melalui kolaborasi dengan pihak-pihak terkait dan dukungan dari para donatur, kami berharap dapat memberikan landasan yang kokoh bagi pertumbuhan intelektual dan sosial anak-anak di desa.</p>', 'cause_featured_photo_1721393558.jpg', 2500000, 0, 'Yes', '2024-07-19 12:52:38', '2024-07-19 12:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `cause_donations`
--

CREATE TABLE `cause_donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_donations`
--

INSERT INTO `cause_donations` (`id`, `cause_id`, `user_id`, `price`, `currency`, `payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(5, 1, 1, '12.00', 'IDR', 'cause-6645c70f77eac', 'qris', 'COMPLETED', '2024-05-16 08:44:58', '2024-05-16 08:44:58'),
(6, 1, 1, '163.00', 'IDR', 'cause-6645c7a807237', 'qris', 'COMPLETED', '2024-05-16 08:45:48', '2024-05-16 08:45:48'),
(7, 2, 1, '100.00', 'IDR', 'cause-666c7c5b3febd', 'qris', 'COMPLETED', '2024-06-14 17:23:03', '2024-06-14 17:23:03'),
(8, 2, 1, '100.00', 'IDR', 'cause-666c7ce2b8956', 'qris', 'COMPLETED', '2024-06-14 17:25:22', '2024-06-14 17:25:22'),
(9, 1, 4, '2000000.00', 'IDR', 'cause-667b292737203', 'qris', 'COMPLETED', '2024-06-25 20:33:08', '2024-06-25 20:33:08'),
(11, 1, 7, '50000.00', 'IDR', 'cause-6690ced37701e', 'qris', 'COMPLETED', '2024-07-12 06:38:20', '2024-07-12 06:38:20'),
(12, 1, 4, '100000.00', 'IDR', 'cause-6692d85d57ce6', 'qris', 'COMPLETED', '2024-07-13 19:41:34', '2024-07-13 19:41:34'),
(13, 1, 4, '50000.00', 'IDR', 'cause-6692d90997d50', 'qris', 'COMPLETED', '2024-07-13 19:44:29', '2024-07-13 19:44:29'),
(14, 1, 4, '1000000.00', 'IDR', 'cause-66952dd0cf693', 'qris', 'COMPLETED', '2024-07-15 14:10:49', '2024-07-15 14:10:49'),
(15, 1, 4, '50000.00', 'IDR', 'cause-66976db4ae06b', 'qris', 'COMPLETED', '2024-07-17 07:08:04', '2024-07-17 07:08:04'),
(16, 1, 4, '1000000.00', 'IDR', 'cause-66976df3e210a', 'qris', 'COMPLETED', '2024-07-17 07:08:55', '2024-07-17 07:08:55'),
(17, 2, 4, '50000.00', 'IDR', 'cause-669a4473793a0', 'qris', 'COMPLETED', '2024-07-19 10:48:48', '2024-07-19 10:48:48'),
(18, 2, 4, '50000.00', 'IDR', 'cause-669a453ae6bbc', 'qris', 'COMPLETED', '2024-07-19 10:52:00', '2024-07-19 10:52:00'),
(19, 1, 9, '1000000.00', 'IDR', 'cause-669cb7211777f', 'bank_transfer', 'COMPLETED', '2024-07-21 07:23:14', '2024-07-21 07:23:14'),
(20, 2, 9, '300000.00', 'IDR', 'cause-669cb7bfd0f3a', 'echannel', 'COMPLETED', '2024-07-21 07:25:29', '2024-07-21 07:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `cause_faqs`
--

CREATE TABLE `cause_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_faqs`
--

INSERT INTO `cause_faqs` (`id`, `cause_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'Apa itu Sumbangan Warga?', 'Omnis recusabo eu vim, et mandamus vulputate his. Detracto torquatos sit id, nec eu alienum disputando. Augue putant ex vis, case inermis comprehensam mei id. Eu percipit platonem vis, cum ea dolore utroque volumus.', '2023-12-31 19:34:27', '2024-07-19 16:34:16'),
(2, 1, 'Kemana perginya uang yang telah disumbangkan?', 'Minim gubergren moderatius et quo, augue quidam in sea. In duo movet sanctus omittam, fabulas forensibus no sed. Sed tation noluisse id, mei alii platonem ea, fuisset deseruisse an has. Nemore ancillae disputando at mei, ei his melius epicuri, vim democritum elaboraret concludaturque an. Ut quidam euismod molestiae usu. Eum commune mediocritatem at, ignota repudiare vituperatoribus et est.', '2023-12-31 19:34:54', '2024-07-19 16:34:24'),
(5, 2, 'Apa itu Bantuan Kebersihan?', 'Eros omnis recusabo eu vim, et mandamus vulputate his. Detracto torquatos sit id, nec eu alienum disputando. Augue putant ex vis, case inermis comprehensam mei id. Eu percipit platonem vis, cum ea dolore utroque volumus.', '2023-12-31 19:35:46', '2024-07-19 17:50:03'),
(7, 2, 'Kemana perginya uang yang disumbangkan ke Bantuan Kebersihan ini?', 'Ad quem maluisset cum, audiam tritani ne mei. Id has inani eloquentiam, his virtute eloquentiam ut, ad duo modus commune. Et eam consul pericula necessitatibus. Sit ei enim exerci blandit.', '2023-12-31 19:36:05', '2024-07-19 17:50:44'),
(8, 3, 'What is Child Support Charity?', 'Euripidis definitionem in pri, an pro fuisset tincidunt. Ius at aperiam fabulas, ocurreret voluptatibus ad pri. Homero iuvaret luptatum ius no. Ea eam enim laudem adversarium, dico errem sed ea.', '2023-12-31 19:36:26', '2023-12-31 19:36:26'),
(9, 3, 'How can I get involved with Child Support Charity?', 'Ad quem maluisset cum, audiam tritani ne mei. Id has inani eloquentiam, his virtute eloquentiam ut, ad duo modus commune. Et eam consul pericula necessitatibus. Sit ei enim exerci blandit.', '2023-12-31 19:36:32', '2023-12-31 19:36:32'),
(10, 3, 'Are my donations tax-deductible?', 'Ei altera quidam sapientem eum. Iriure timeam perpetua ut cum, quando melius ad ius. Qui populo elaboraret te, eam ei prima dolores, vis et semper minimum forensibus. Simul semper vivendo no eam, alienum iracundia constituam in quo. An eius dicta impetus his, atqui graeco vel eu.', '2023-12-31 19:36:48', '2023-12-31 19:55:55');

-- --------------------------------------------------------

--
-- Table structure for table `cause_photos`
--

CREATE TABLE `cause_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_photos`
--

INSERT INTO `cause_photos` (`id`, `cause_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'cause_photo_1704072103.jpg', '2023-12-31 19:21:43', '2023-12-31 19:21:43'),
(3, 1, 'cause_photo_1704072116.jpg', '2023-12-31 19:21:56', '2023-12-31 19:21:56'),
(4, 1, 'cause_photo_1704072157.jpg', '2023-12-31 19:22:37', '2023-12-31 19:22:37'),
(5, 2, 'cause_photo_1704072167.jpg', '2023-12-31 19:22:47', '2023-12-31 19:22:47'),
(6, 2, 'cause_photo_1704072171.jpg', '2023-12-31 19:22:51', '2023-12-31 19:22:51'),
(7, 2, 'cause_photo_1704072175.jpg', '2023-12-31 19:22:55', '2023-12-31 19:22:55'),
(8, 3, 'cause_photo_1704072182.jpg', '2023-12-31 19:23:02', '2023-12-31 19:23:02'),
(9, 3, 'cause_photo_1704072185.jpg', '2023-12-31 19:23:05', '2023-12-31 19:23:05'),
(10, 3, 'cause_photo_1704072191.jpg', '2023-12-31 19:23:11', '2023-12-31 19:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `cause_videos`
--

CREATE TABLE `cause_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` int(11) NOT NULL,
  `youtube_video_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_videos`
--

INSERT INTO `cause_videos` (`id`, `cause_id`, `youtube_video_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'rgZssMf18eM', '2023-12-31 19:23:54', '2023-12-31 19:23:54'),
(2, 1, 'fX2ZmeUjwfc', '2023-12-31 19:24:09', '2023-12-31 19:24:09'),
(4, 1, 'P1VH7JQzXDE', '2023-12-31 19:25:04', '2023-12-31 19:25:04'),
(5, 2, 'rgZssMf18eM', '2023-12-31 19:25:21', '2023-12-31 19:25:21'),
(6, 2, 'fX2ZmeUjwfc', '2023-12-31 19:25:26', '2023-12-31 19:25:26'),
(7, 2, 'P1VH7JQzXDE', '2023-12-31 19:25:31', '2023-12-31 19:25:31'),
(8, 3, 'P1VH7JQzXDE', '2023-12-31 19:25:44', '2023-12-31 19:25:44'),
(9, 3, 'fX2ZmeUjwfc', '2023-12-31 19:25:51', '2023-12-31 19:25:51'),
(10, 3, 'rgZssMf18eM', '2023-12-31 19:25:56', '2023-12-31 19:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `post_id`, `name`, `email`, `status`, `created_at`, `updated_at`) VALUES
(8, 'good', 1, 'bambang', 'asd@gmail.com', 'Active', '2024-06-04 16:37:20', '2024-06-04 16:40:36'),
(9, 'test komen', 1, 'Samsudin', 'lex@gmail.com', 'Pending', '2024-06-04 16:39:12', '2024-07-19 16:37:53'),
(11, 'Terharu bacanya padahal cuma lorem ipsum doang 😢😭', 6, 'Samsudin alala balbala', 'samsudin@gmail.com', 'Active', '2024-06-24 05:42:28', '2024-06-24 05:44:09'),
(18, 'Mantap, artikel ini dapat meningkatkan kesadaran masyarakat akan pentingnya wadjkbasjihdbsdas whehehehe', 1, 'Budi', 'budi@gmail.com', 'Active', '2024-07-19 10:38:05', '2024-07-19 10:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `counter1_number` varchar(255) NOT NULL,
  `counter1_name` varchar(255) NOT NULL,
  `counter2_number` varchar(255) NOT NULL,
  `counter2_name` varchar(255) NOT NULL,
  `counter3_number` varchar(255) NOT NULL,
  `counter3_name` varchar(255) NOT NULL,
  `counter4_number` varchar(255) NOT NULL,
  `counter4_name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `counter1_number`, `counter1_name`, `counter2_number`, `counter2_name`, `counter3_number`, `counter3_name`, `counter4_number`, `counter4_name`, `status`, `created_at`, `updated_at`) VALUES
(1, '101', 'Donasi', '4', 'Relawan', '10', 'Warga Terbantu', '9', 'Events', 'Show', NULL, '2024-06-20 05:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `featured_photo` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `map` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total_seat` int(11) DEFAULT NULL,
  `booked_seat` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `slug`, `short_description`, `description`, `featured_photo`, `date`, `time`, `location`, `map`, `price`, `total_seat`, `booked_seat`, `created_at`, `updated_at`) VALUES
(2, 'Donor Darah', 'donor-darah', 'Yuk, jadi pahlawan dengan datang ke lokasi dan donor darah untuk membantu mereka yang membutuhkan', '<div class=\"flex-shrink-0 flex flex-col relative items-end\">\r\n<div class=\"pt-0\">\r\n<div class=\"gizmo-bot-avatar flex h-8 w-8 items-center justify-center overflow-hidden rounded-full\">\r\n<div class=\"relative p-1 rounded-sm flex items-center justify-center bg-token-main-surface-primary text-token-text-primary h-8 w-8\">Yuk, mari kita bergerak bersama untuk membantu mereka yang membutuhkan darah! Hanya dengan satu tindakan kebaikan dari Anda, Anda bisa memberikan harapan baru bagi banyak orang yang sedang berjuang melawan penyakit. Proses donor darah sangat mudah dan tidak menyakitkan sama sekali. Anda hanya perlu datang ke lokasi, di mana tim medis akan siap menyambut sumbangan darah Anda dengan penuh rasa terima kasih. Dengan setiap kantong darah yang Anda sumbangkan, Anda berpotensi menjadi pahlawan bagi seseorang yang sangat mengandalkan bantuan tersebut untuk pemulihan mereka.</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"group/conversation-turn relative flex w-full min-w-0 flex-col agent-turn\">\r\n<div class=\"flex-col gap-1 md:gap-3\">\r\n<div class=\"flex flex-grow flex-col max-w-full\">\r\n<div class=\"min-h-[20px] text-message flex w-full flex-col items-end gap-2 whitespace-pre-wrap break-words [.text-message+&amp;]:mt-5 overflow-x-auto\" dir=\"auto\" data-message-author-role=\"assistant\" data-message-id=\"23269e7b-0132-4c17-86cd-df04733a92fb\">\r\n<div class=\"flex w-full flex-col gap-1 empty:hidden first:pt-[3px]\">\r\n<div class=\"markdown prose w-full break-words dark:prose-invert dark\">\r\n<p>Ayo, jangan tunda lagi! Datanglah sekarang ke lokasi untuk donor darah. Dengan bergabung dalam aksi ini, Anda memberikan kontribusi yang sangat berarti untuk kesehatan dan kehidupan orang lain. Jadilah bagian dari komunitas yang berempati dan peduli dengan berbagi darah Anda. Bersama-sama, kita bisa membuat perbedaan nyata dalam menyelamatkan nyawa dan membantu orang-orang yang membutuhkan untuk kembali pulih dengan cepat dan sempurna.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'event_featured_photo_1703295164.jpg', '2024-07-31', '09:00', 'Kantor Desa Titang', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7906.726802739489!2d110.53701309036764!3d-7.751225519070365!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a4523a2d1ef59%3A0x1c90c4706ec80a23!2sBalai%20Desa%20Titang!5e0!3m2!1sen!2sid!4v1720963169326!5m2!1sen!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 0, NULL, 0, '2023-12-22 19:32:44', '2024-07-19 12:41:04'),
(7, 'Workshop Cegah Stunting', 'workshop-cegah-stunting', 'Meningkatkan pemahaman tentang pentingnya gizi dan perawatan anak yang tepat sejak dini. Peserta akan belajar mengenali penyebab stunting, pentingnya gizi seimbang, peran orang tua dan pendidik dalam pencegahan stunting, serta dukungan terhadap kebijakan publik yang mendukung. Workshop ini merupakan langkah nyata dalam menjaga kesehatan anak untuk masa depan yang lebih baik.', '<p>Stunting merupakan masalah serius dalam pertumbuhan anak yang dapat memengaruhi kualitas hidup mereka di masa depan. Untuk mengatasi masalah ini, Workshop Cegah Stunting hadir sebagai upaya untuk memberikan pemahaman mendalam kepada orang tua dan pendidik tentang pentingnya gizi dan perawatan anak yang tepat sejak dini. Acara ini tidak hanya berfokus pada pengetahuan praktis, tetapi juga memberikan panduan konkret dalam penerapan pola makan sehat dan gaya hidup yang mendukung pertumbuhan optimal anak-anak.</p>\r\n<h2>Mengenali Stunting dan Dampaknya</h2>\r\n<p>Stunting terjadi ketika anak mengalami pertumbuhan tubuh yang terhambat akibat kekurangan gizi, terutama pada periode 1.000 hari pertama kehidupan. Workshop ini akan membahas penyebab stunting, dampak jangka panjangnya terhadap kesehatan fisik dan kognitif anak, serta pentingnya pencegahan sejak dini.</p>\r\n<h2>Gizi Seimbang untuk Pertumbuhan Optimal</h2>\r\n<p>Peserta akan diajak untuk memahami pentingnya gizi seimbang dalam menghindari stunting. Workshop ini akan memberikan pengetahuan tentang makanan-makanan yang kaya akan nutrisi penting bagi pertumbuhan anak, serta cara menyusun pola makan yang sesuai dengan kebutuhan mereka.</p>\r\n<h2>Peran Orang Tua dan Pendidik dalam Pencegahan Stunting</h2>\r\n<p>Orang tua dan pendidik memegang peran kunci dalam pencegahan stunting. Workshop ini akan memberikan strategi praktis bagi mereka untuk mendukung tumbuh kembang anak secara optimal melalui nutrisi yang tepat, perawatan yang baik, serta lingkungan yang mendukung.</p>\r\n<h2>Mendukung Kebijakan Publik yang Berkelanjutan</h2>\r\n<p>Selain itu, workshop ini juga akan membahas pentingnya dukungan terhadap kebijakan publik yang mendukung pencegahan stunting secara nasional. Peserta akan diberikan wawasan tentang upaya-upaya pemerintah dalam mengatasi masalah stunting dan bagaimana mereka dapat berkontribusi dalam mendukung implementasi kebijakan tersebut di level komunitas.</p>\r\n<h2>Kesimpulan</h2>\r\n<p>Workshop Cegah Stunting bukan hanya merupakan acara edukasi, tetapi juga langkah konkret untuk menciptakan masa depan yang lebih baik bagi anak-anak Indonesia. Dengan pengetahuan yang didapat dari workshop ini, peserta diharapkan dapat menjadi agen perubahan dalam upaya pencegahan stunting dan memberikan dampak positif yang signifikan bagi generasi mendatang.</p>', 'event_featured_photo_1720963798.jpg', '2024-07-31', '09:00', 'Kantor Desa Titang', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7906.726802739489!2d110.53701309036764!3d-7.751225519070365!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a4523a2d1ef59%3A0x1c90c4706ec80a23!2sBalai%20Desa%20Titang!5e0!3m2!1sen!2sid!4v1720963169326!5m2!1sen!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 0, NULL, NULL, '2024-07-14 13:29:58', '2024-07-19 10:25:44'),
(10, 'Workshop Ekonomi Pembuatan Sablon', 'workshop-ekonomi-pembuatan-sablon', 'Workshop ini mengajarkan teknik-teknik sablon dari dasar hingga lanjutan serta strategi bisnis yang efektif. Peserta akan meningkatkan kreativitas dalam desain sablon dan memahami pentingnya keberlanjutan dalam industri ini. Workshop ini juga menyediakan kesempatan untuk membangun jaringan dengan profesional sejawat, membuka peluang kolaborasi yang berharga.', '<div class=\"md:pt-0 dark:border-white/20 md:border-transparent md:dark:border-transparent w-full\">\r\n<div class=\"text-base px-3 md:px-4 m-auto md:px-5 lg:px-1 xl:px-5\">\r\n<div class=\"mx-auto flex flex-1 gap-4 text-base md:gap-5 lg:gap-6 md:max-w-3xl\"><form class=\"w-full\" aria-haspopup=\"dialog\" aria-expanded=\"false\" aria-controls=\"radix-:r1:\" data-state=\"closed\">\r\n<div class=\"relative flex h-full max-w-full flex-1 flex-col\">\r\n<div class=\"absolute bottom-full left-0 right-0 z-20\">Industri sablon tidak hanya menawarkan peluang ekonomi yang menjanjikan tetapi juga menjadi medium ekspresi kreatif yang unik. Workshop Ekonomi Pembuatan Sablon dirancang untuk memberikan peserta pemahaman mendalam tentang teknik sablon, strategi bisnis, dan pengembangan keterampilan desain yang kreatif. Dengan menggabungkan aspek teknis dan ekonomi, workshop ini mengajak peserta untuk menjelajahi potensi bisnis dalam industri yang terus berkembang ini.</div>\r\n</div>\r\n</form></div>\r\n</div>\r\n</div>\r\n<div class=\"flex-1 overflow-hidden\">\r\n<div class=\"h-full\">\r\n<div class=\"react-scroll-to-bottom--css-raohq-79elbk h-full\">\r\n<div class=\"react-scroll-to-bottom--css-raohq-1n7m0yu\">\r\n<div class=\"flex flex-col text-sm md:pb-9\">\r\n<div class=\"w-full text-token-text-primary\" dir=\"auto\" data-testid=\"conversation-turn-7\" data-scroll-anchor=\"true\">\r\n<div class=\"text-base py-[18px] px-3 md:px-4 m-auto md:px-5 lg:px-1 xl:px-5\">\r\n<div class=\"mx-auto flex flex-1 gap-4 text-base md:gap-5 lg:gap-6 md:max-w-3xl\">\r\n<div class=\"group/conversation-turn relative flex w-full min-w-0 flex-col agent-turn\">\r\n<div class=\"flex-col gap-1 md:gap-3\">\r\n<div class=\"flex flex-grow flex-col max-w-full\">\r\n<div class=\"min-h-[20px] text-message flex w-full flex-col items-end gap-2 whitespace-pre-wrap break-words [.text-message+&amp;]:mt-5 overflow-x-auto\" dir=\"auto\" data-message-author-role=\"assistant\" data-message-id=\"83a82362-3684-4c11-88a4-b356a2bf23f6\">\r\n<div class=\"flex w-full flex-col gap-1 empty:hidden first:pt-[3px]\">\r\n<div class=\"markdown prose w-full break-words dark:prose-invert dark\">\r\n<h4>Mengenal Teknik Sablon Secara Mendalam</h4>\r\n<p>Pertama-tama, workshop ini akan memperkenalkan peserta pada teknik sablon dengan detail yang komprehensif. Peserta akan mempelajari berbagai metode sablon, termasuk persiapan kain, pemilihan tinta yang tepat, dan peralatan yang dibutuhkan untuk memulai produksi. Ini adalah langkah krusial untuk memahami dasar-dasar sablon, memastikan bahwa peserta siap menghadapi tantangan teknis dalam produksi sablon mereka.</p>\r\n<h4>Strategi Ekonomi dan Bisnis</h4>\r\n<p>Selain aspek teknis, workshop ini juga memberikan fokus pada strategi ekonomi dan bisnis dalam industri sablon. Peserta akan diajak untuk memahami analisis biaya-produksi, penetapan harga yang kompetitif, dan strategi pemasaran yang efektif untuk meningkatkan visibilitas produk sablon mereka. Dengan memahami aspek ini, peserta dapat mengoptimalkan operasi mereka dan meningkatkan keuntungan dari bisnis sablon.</p>\r\n<h4>Memperluas Kreativitas dalam Desain Sablon</h4>\r\n<p>Sablon bukan hanya tentang reproduksi desain, tetapi juga medium untuk mengekspresikan kreativitas. Workshop ini akan mendorong peserta untuk mengembangkan keterampilan desain mereka, menggabungkan teknik sablon dengan inovasi desain yang unik dan menarik. Peserta akan diajak untuk menggali berbagai teknik dan gaya sablon, serta mengeksplorasi tren desain terkini untuk tetap relevan di pasar yang kompetitif.</p>\r\n<h4>Keberlanjutan dan Tren Pasar</h4>\r\n<p>Industri kreatif tidak hanya berkembang dalam hal inovasi desain tetapi juga dalam praktik keberlanjutan. Workshop ini akan menyoroti pentingnya penggunaan bahan-bahan ramah lingkungan dan praktik-praktik berkelanjutan dalam produksi sablon. Peserta akan diberikan wawasan tentang tren pasar terkini dalam industri sablon, membantu mereka untuk beradaptasi dengan perubahan pasar dan memanfaatkan peluang baru.</p>\r\n<h4>Membangun Jaringan dan Kolaborasi</h4>\r\n<p>Workshop ini juga merupakan platform yang ideal untuk membangun jaringan dengan profesional dan penggiat industri sablon lainnya. Kolaborasi antara peserta dan instruktur serta sesama peserta dapat menghasilkan ide-ide baru, membuka peluang bisnis baru, dan mendukung pertumbuhan karier dalam industri yang dinamis ini.</p>\r\n<h4>Kesimpulan</h4>\r\n<p>Dengan menghadiri Workshop Ekonomi Pembuatan Sablon, peserta tidak hanya mendapatkan pengetahuan mendalam tentang teknik sablon dan strategi bisnis, tetapi juga kesempatan untuk mengembangkan kreativitas mereka dalam industri yang penuh potensi ini. Ini adalah langkah pertama yang bagus bagi siapa pun yang ingin menjelajahi dunia sablon secara lebih mendalam, dari sisi teknis hingga ekonomi, serta untuk membangun jejaring dalam komunitas yang bersemangat dan inovatif.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'event_featured_photo_1721384336.jpg', '2024-07-31', '09:00', 'Kantor Desa Titang', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7906.727601483725!2d110.53699163269552!3d-7.751182995840913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a4523a2d1ef59%3A0x1c90c4706ec80a23!2sBalai%20Desa%20Titang!5e0!3m2!1sen!2sid!4v1721384203088!5m2!1sen!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 5000, 50, 6, '2024-07-19 10:18:56', '2024-07-21 07:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `event_photos`
--

CREATE TABLE `event_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_photos`
--

INSERT INTO `event_photos` (`id`, `event_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'event_photo_1703297335.jpg', '2023-12-22 20:08:55', '2023-12-22 20:08:55'),
(2, 1, 'event_photo_1703297349.jpg', '2023-12-22 20:09:09', '2023-12-22 20:09:09'),
(4, 2, 'event_photo_1703297387.jpg', '2023-12-22 20:09:47', '2023-12-22 20:09:47'),
(5, 2, 'event_photo_1703297391.jpg', '2023-12-22 20:09:51', '2023-12-22 20:09:51'),
(6, 2, 'event_photo_1703297399.jpg', '2023-12-22 20:09:59', '2023-12-22 20:09:59'),
(7, 4, 'event_photo_1703297406.jpg', '2023-12-22 20:10:06', '2023-12-22 20:10:06'),
(8, 4, 'event_photo_1703297409.jpg', '2023-12-22 20:10:09', '2023-12-22 20:10:09'),
(9, 4, 'event_photo_1703297414.jpg', '2023-12-22 20:10:14', '2023-12-22 20:10:14'),
(10, 5, 'event_photo_1703297423.jpg', '2023-12-22 20:10:23', '2023-12-22 20:10:23'),
(11, 5, 'event_photo_1703297427.jpg', '2023-12-22 20:10:27', '2023-12-22 20:10:27'),
(12, 5, 'event_photo_1703297429.jpg', '2023-12-22 20:10:29', '2023-12-22 20:10:29'),
(14, 7, 'event_photo_1720964087.jpg', '2024-07-14 13:34:47', '2024-07-14 13:34:47'),
(16, 7, 'event_photo_1720964097.jpg', '2024-07-14 13:34:57', '2024-07-14 13:34:57'),
(17, 7, 'event_photo_1720964104.jpg', '2024-07-14 13:35:04', '2024-07-14 13:35:04'),
(18, 10, 'event_photo_1721384483.jpg', '2024-07-19 10:21:23', '2024-07-19 10:21:23'),
(19, 10, 'event_photo_1721384488.jpg', '2024-07-19 10:21:28', '2024-07-19 10:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `event_tickets`
--

CREATE TABLE `event_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `number_of_tickets` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_tickets`
--

INSERT INTO `event_tickets` (`id`, `event_id`, `user_id`, `unit_price`, `number_of_tickets`, `total_price`, `currency`, `payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(22, 10, 4, '5000', 5, 25000, 'IDR', 'event-669a98eebd401', 'qris', 'COMPLETED', '2024-07-19 16:49:17', '2024-07-19 16:49:17'),
(23, 10, 9, '5000', 1, 5000, 'IDR', 'event-669cb829076cf', 'qris', 'COMPLETED', '2024-07-21 07:27:25', '2024-07-21 07:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `event_videos`
--

CREATE TABLE `event_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `youtube_video_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_videos`
--

INSERT INTO `event_videos` (`id`, `event_id`, `youtube_video_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'EGh1wY4CJl0', '2023-12-22 20:26:38', '2023-12-22 20:26:38'),
(2, 1, 'ruZ9HgozGUU', '2023-12-22 20:27:37', '2023-12-22 20:27:37'),
(4, 2, 'mPRXhNFPgwo', '2023-12-22 20:28:31', '2023-12-22 20:28:31'),
(5, 2, 'fxnd3O4YC6k', '2023-12-22 20:28:50', '2023-12-22 20:28:50'),
(6, 2, 'RQu7jpcNUWI', '2023-12-22 20:28:55', '2023-12-22 20:28:55'),
(7, 4, 'E1xkXZs0cAQ', '2023-12-22 20:29:25', '2023-12-22 20:29:25'),
(8, 4, 'eA_Xq7HGWos', '2023-12-22 20:29:36', '2023-12-22 20:29:36'),
(9, 4, 'nEFCxs7SZsM', '2023-12-22 20:29:42', '2023-12-22 20:29:42'),
(10, 5, 'bdBG5VO01e0', '2023-12-22 20:30:19', '2023-12-22 20:30:19'),
(11, 5, 'aYVsy1pv-mo', '2023-12-22 20:30:26', '2023-12-22 20:30:26'),
(12, 5, 'xHegpKx61eE', '2023-12-22 20:30:33', '2023-12-22 20:30:33'),
(14, 7, 'ZuHRHv-_KXw', '2024-07-14 13:49:56', '2024-07-14 13:49:56'),
(15, 7, 'YhviJ2EkZpA', '2024-07-14 13:51:08', '2024-07-14 13:51:08'),
(16, 7, 'AHzG3AHSFW4', '2024-07-14 13:51:13', '2024-07-14 13:51:13'),
(17, 10, '9gAE6Ebp0Is', '2024-07-19 10:21:53', '2024-07-19 10:21:53'),
(18, 10, 'EmU6MML4vC4', '2024-07-19 10:22:25', '2024-07-19 10:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'Apa tujuan dan fokus utama Laskar Amal?', 'Tujuan Laskar Amal adalah memberikan dampak positif pada kehidupan mereka yang membutuhkan di sekitar Desa Titang. Kami fokus memberikan dukungan di berbagai bidang seperti pendidikan, layanan kesehatan, bantuan bencana, mengatasi kelaparan, dan lain-lain. Kami juga meningkatkan kesadaran tentang isu-isu sosial dan lingkungan yang penting.', '2023-12-18 19:28:50', '2024-06-20 05:29:15'),
(2, 'Bagaimana cara melakukan donasi?', 'Donasi untuk mendukung amal kami sangat mudah dan dihargai. Anda bisa berdonasi secara online melalui situs web kami yang aman dengan mengklik tombol \"Donasi Sekarang\". Kami juga menerima donasi melalui transfer bank, QRIS, dan lainnya. Kunjungi halaman \"Donasi\" kami untuk informasi lebih lanjut tentang berbagai metode donasi.', '2023-12-18 19:29:17', '2024-06-20 05:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `icon`, `heading`, `text`, `created_at`, `updated_at`) VALUES
(1, 'fas fa-money-bill', 'Beragam Metode Pembayaran', 'Memberikan fleksibilitas dan kenyamanan dengan menyediakan berbagai opsi pembayaran yang sesuai dengan preferensi donatur.', '2023-12-17 19:36:20', '2024-07-18 16:40:58'),
(2, 'fas fa-search', 'Events', 'Menginformasikan pengunjung tentang acara mendatang dan mengundang untuk berpartisipasi.', '2023-12-17 19:37:35', '2024-07-18 16:41:24'),
(3, 'fas fa-share-alt', 'Berdonasi', 'Memfasilitasi proses donasi dengan cara yang mudah dan aman bagi para donatur.', '2023-12-17 19:37:59', '2024-07-18 16:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_items`
--

CREATE TABLE `home_page_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_heading` varchar(255) DEFAULT NULL,
  `cause_subheading` varchar(255) DEFAULT NULL,
  `cause_status` varchar(255) NOT NULL,
  `feature_background` varchar(255) NOT NULL,
  `feature_status` varchar(255) NOT NULL,
  `event_heading` varchar(255) DEFAULT NULL,
  `event_subheading` varchar(255) DEFAULT NULL,
  `event_status` varchar(255) NOT NULL,
  `testimonial_heading` varchar(255) DEFAULT NULL,
  `testimonial_background` varchar(255) NOT NULL,
  `testimonial_status` varchar(255) NOT NULL,
  `blog_heading` varchar(255) DEFAULT NULL,
  `blog_subheading` varchar(255) DEFAULT NULL,
  `blog_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_items`
--

INSERT INTO `home_page_items` (`id`, `cause_heading`, `cause_subheading`, `cause_status`, `feature_background`, `feature_status`, `event_heading`, `event_subheading`, `event_status`, `testimonial_heading`, `testimonial_background`, `testimonial_status`, `blog_heading`, `blog_subheading`, `blog_status`, `created_at`, `updated_at`) VALUES
(1, 'Donasi Unggulan', 'Bantulah mereka yang membutuhkan dengan Berdonasi.', 'Show', 'feature_background_1704118837.jpg', 'Show', 'Event Mendatang', 'Anda dapat mengatur acara dan membantu kami dalam menciptakan pengalaman yang tak terlupakan.', 'Show', 'Apa kata mereka?', 'testimonial_background_1704118881.jpg', 'Hide', 'Artikel Terbaru', 'Lihat artikel dan pembaruan terkini dari postingan blog kami.', 'Show', NULL, '2024-07-14 15:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_25_025642_create_admins_table', 1),
(7, '2023_10_30_082935_create_sliders_table', 2),
(8, '2023_10_30_143652_create_specials_table', 3),
(9, '2023_12_18_012545_create_features_table', 4),
(10, '2023_12_18_022815_create_feature_section_items_table', 5),
(11, '2023_12_18_092400_create_testimonials_table', 6),
(12, '2023_12_18_122923_create_testimonial_section_items_table', 7),
(13, '2023_12_18_174537_create_counters_table', 8),
(14, '2023_12_19_011946_create_faqs_table', 9),
(15, '2023_12_19_054702_create_volunteers_table', 10),
(16, '2023_12_19_085139_create_photo_categories_table', 11),
(17, '2023_12_19_094426_create_photos_table', 12),
(18, '2023_12_19_152009_create_video_categories_table', 13),
(19, '2023_12_19_173657_create_videos_table', 14),
(20, '2023_12_20_010842_create_post_categories_table', 15),
(21, '2023_12_20_024713_create_posts_table', 16),
(22, '2023_12_20_104933_create_comments_table', 17),
(23, '2023_12_20_105413_create_replies_table', 18),
(24, '2023_12_21_012747_create_events_table', 19),
(25, '2023_12_23_020127_create_event_photos_table', 20),
(26, '2023_12_23_022142_create_event_videos_table', 21),
(27, '2023_12_24_015803_create_event_tickets_table', 22),
(28, '2023_12_28_133200_create_causes_table', 23),
(29, '2024_01_01_011427_create_cause_photos_table', 24),
(30, '2024_01_01_011434_create_cause_videos_table', 24),
(31, '2024_01_01_012821_create_cause_faqs_table', 25),
(32, '2024_01_01_022624_create_cause_donations_table', 26),
(33, '2024_01_01_063218_create_home_page_items_table', 27),
(34, '2024_01_02_011608_create_settings_table', 28),
(35, '2024_01_03_015900_create_other_page_items_table', 29),
(36, '2024_01_03_022800_create_subscribers_table', 30);

-- --------------------------------------------------------

--
-- Table structure for table `other_page_items`
--

CREATE TABLE `other_page_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terms_content` text DEFAULT NULL,
  `privacy_content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `other_page_items`
--

INSERT INTO `other_page_items` (`id`, `terms_content`, `privacy_content`, `created_at`, `updated_at`) VALUES
(1, '<p>Lorem ipsum dolor sit amet, cum ei ponderum mandamus, ei altera quidam sapientem eum. Iriure timeam perpetua ut cum, quando melius ad ius. Qui populo elaboraret te, eam ei prima dolores, vis et semper minimum forensibus. Simul semper vivendo no eam, alienum iracundia constituam in quo. An eius dicta impetus his, atqui graeco vel eu.<br /><br />Eros omnis recusabo eu vim, et mandamus vulputate his. Detracto torquatos sit id, nec eu alienum disputando. Augue putant ex vis, case inermis comprehensam mei id. Eu percipit platonem vis, cum ea dolore utroque volumus.<br /><br />Minim gubergren moderatius et quo, augue quidam in sea. In duo movet sanctus omittam, fabulas forensibus no sed. Sed tation noluisse id, mei alii platonem ea, fuisset deseruisse an has. Nemore ancillae disputando at mei, ei his melius epicuri, vim democritum elaboraret concludaturque an. Ut quidam euismod molestiae usu. Eum commune mediocritatem at, ignota repudiare vituperatoribus et est.<br /><br />Ad quem maluisset cum, audiam tritani ne mei. Id has inani eloquentiam, his virtute eloquentiam ut, ad duo modus commune. Et eam consul pericula necessitatibus. Sit ei enim exerci blandit.<br /><br />Euripidis definitionem in pri, an pro fuisset tincidunt. Ius at aperiam fabulas, ocurreret voluptatibus ad pri. Homero iuvaret luptatum ius no. Ea eam enim laudem adversarium, dico errem sed ea.</p>', '<p>Mei te amet neglegentur. Pri in nulla molestiae, quo ut melius discere moderatius, ut mel falli delectus definiebas. Ius an mazim verear copiosae. Has eu omnes praesent consequuntur, pri ut sonet putant ancillae, perpetua facilisis in usu. Cu pro natum aliquip dissentiunt, no erant numquam suscipit mei.<br /><br />Mea ut dicunt eligendi accusamus, ex aliquando signiferumque duo. At pro unum timeam commodo, reque pertinacia incorrupte vix an, quis eligendi atomorum no ius. Vim tota commune ei, vis everti propriae eu. Eu etiam persius est, porro voluptaria mei et, vis at explicari sententiae disputando.<br /><br />Putent volutpat persecuti ad eam. Mea ridens timeam ei, cu usu posse deserunt. Vix ut aperiri corrumpit laboramus. Sit movet percipit an, qui magna volumus cu, mei errem voluptatum ea. At vim essent latine.<br /><br />Te maiorum philosophia vituperatoribus duo. Sea ad utroque deleniti adipiscing, sed porro fugit errem ex. Qui wisi reprimique honestatis in. Putent possim evertitur mei no, cu errem dolore interpretaris mea. Id graecis corpora duo, ad saperet percipit incorrupte eam, ea modus hendrerit posidonium sea.<br /><br />Ei cum autem ubique nostro, cu usu nostrud theophrastus. At velit aperiri honestatis qui, sit ei suas assentior interpretaris, mazim virtute voluptatum pro cu. Eu vis imperdiet reprimique, in mel utinam verear. Alterum vituperata has et.</p>', NULL, '2024-01-02 20:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('budi@gmail.com', '$2y$10$tCOQ2VZFv/jIpv4I.dn5ROHVqyhO7OldUFiff/eXoOAmDoLZwAPn6', '2024-07-03 15:59:26');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_category_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `photo_category_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'photo_1702980613.jpg', '2023-12-19 04:10:13', '2023-12-19 04:10:13'),
(2, 2, 'photo_1702981715.jpg', '2023-12-19 04:28:35', '2023-12-19 04:28:35'),
(3, 2, 'photo_1702996730.jpg', '2023-12-19 08:38:05', '2023-12-19 08:38:50'),
(4, 1, 'photo_1702996753.jpg', '2023-12-19 08:39:13', '2023-12-19 08:39:13'),
(5, 1, 'photo_1702996767.jpg', '2023-12-19 08:39:27', '2023-12-19 08:39:27'),
(6, 1, 'photo_1702996774.jpg', '2023-12-19 08:39:34', '2023-12-19 08:39:34'),
(7, 2, 'photo_1702996790.jpg', '2023-12-19 08:39:50', '2023-12-19 08:39:50'),
(8, 2, 'photo_1702996802.jpg', '2023-12-19 08:40:02', '2023-12-19 08:40:02'),
(12, 1, 'photo_1702998381.jpg', '2023-12-19 09:06:21', '2023-12-19 09:06:21'),
(13, 1, 'photo_1702998409.jpg', '2023-12-19 09:06:49', '2023-12-19 09:06:49'),
(14, 1, 'photo_1702998422.jpg', '2023-12-19 09:07:02', '2023-12-19 09:07:02'),
(15, 1, 'photo_1702998441.jpg', '2023-12-19 09:07:21', '2023-12-19 09:07:21');

-- --------------------------------------------------------

--
-- Table structure for table `photo_categories`
--

CREATE TABLE `photo_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photo_categories`
--

INSERT INTO `photo_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pendidikan dan Pelatihan', '2023-12-19 03:02:29', '2024-06-22 03:21:45'),
(2, 'Kesehatan dan Kebersihan', '2023-12-19 03:02:49', '2024-06-22 03:21:59');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_category_id`, `title`, `slug`, `short_description`, `description`, `photo`, `tags`, `created_at`, `updated_at`) VALUES
(1, 3, 'Materi pendidikan tentang kemanusiaan untuk anak usia dini', 'materi-pendidikan-tentang-kemanusiaan-untuk-anak-usia-dini', 'Materi pendidikan tentang kemanusiaan untuk anak usia dini mengajarkan nilai-nilai empati, kerjasama, toleransi, dan rasa hormat melalui kegiatan cerita, permainan kelompok, pengenalan budaya, dan alat bantu visual serta praktis, untuk membentuk karakter yang peduli dan bertanggung jawab.', '<p>Pendidikan kemanusiaan adalah elemen penting yang sebaiknya diajarkan sejak dini kepada anak-anak. Memahami nilai-nilai kemanusiaan seperti empati, kerjasama, toleransi, dan rasa hormat terhadap orang lain dapat membentuk karakter anak menjadi pribadi yang peduli dan bertanggung jawab. Materi pendidikan tentang kemanusiaan untuk anak usia dini harus dirancang dengan cara yang menarik dan sesuai dengan tahapan perkembangan mereka.</p>\r\n<h2>Mengajarkan Empati</h2>\r\n<p>Empati adalah kemampuan untuk merasakan dan memahami perasaan orang lain. Mengajarkan empati kepada anak-anak bisa dimulai dengan kegiatan sederhana seperti mendengarkan cerita dan meminta mereka menggambarkan perasaan tokoh dalam cerita tersebut. Melalui diskusi ini, anak-anak diajak untuk memikirkan bagaimana perasaan orang lain dalam situasi tertentu dan bagaimana mereka bisa membantu.</p>\r\n<h2>Pentingnya Kerjasama</h2>\r\n<p>Kerjasama adalah keterampilan sosial yang sangat penting. Anak-anak usia dini dapat belajar kerjasama melalui permainan kelompok yang membutuhkan kerjasama untuk mencapai tujuan. Kegiatan seperti membangun sesuatu bersama atau bermain permainan tim dapat mengajarkan pentingnya bekerja sama, saling mendengarkan, dan berbagi tugas.</p>\r\n<h2>Menanamkan Nilai Toleransi</h2>\r\n<p>Toleransi adalah penerimaan dan penghargaan terhadap perbedaan. Anak-anak perlu diajarkan bahwa setiap orang unik dan perbedaan tersebut adalah sesuatu yang harus dihormati. Kegiatan seperti memperkenalkan berbagai budaya, bahasa, dan tradisi melalui cerita, lagu, dan seni dapat membantu anak-anak memahami dan menghargai keberagaman.</p>\r\n<h2>Rasa Hormat Terhadap Orang Lain</h2>\r\n<p>Menghormati orang lain adalah fondasi dari hubungan yang baik. Anak-anak dapat belajar tentang rasa hormat dengan cara diajarkan untuk menggunakan kata-kata yang sopan, mendengarkan saat orang lain berbicara, dan menghargai hak-hak orang lain. Guru dan orang tua dapat menjadi teladan dengan menunjukkan sikap hormat dalam interaksi sehari-hari.</p>\r\n<h2>Menggunakan Alat Bantu Visual dan Praktis</h2>\r\n<p>Materi pendidikan tentang kemanusiaan untuk anak usia dini sebaiknya dilengkapi dengan alat bantu visual dan praktis. Buku cerita bergambar, video edukatif, dan permainan interaktif dapat membuat pembelajaran lebih menarik dan mudah dipahami oleh anak-anak. Kegiatan seni seperti menggambar dan membuat kerajinan tangan juga dapat digunakan untuk memperkuat konsep-konsep kemanusiaan yang diajarkan.</p>\r\n<h2>Kesimpulan</h2>\r\n<p>Mengajarkan nilai-nilai kemanusiaan kepada anak usia dini adalah investasi penting untuk masa depan mereka. Dengan mempelajari empati, kerjasama, toleransi, dan rasa hormat, anak-anak dapat tumbuh menjadi individu yang peduli dan bertanggung jawab. Materi pendidikan yang menarik dan sesuai dengan perkembangan mereka akan membuat pembelajaran ini lebih efektif dan menyenangkan. Melalui pendidikan kemanusiaan, kita dapat membentuk generasi yang lebih baik, yang siap untuk hidup harmonis dalam masyarakat yang beragam.</p>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -15px; top: 774.325px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', 'post_1721361551.jpg', 'pendidikan,anak-anak,edukasi', '2024-05-19 21:12:51', '2024-07-19 03:59:11'),
(6, 8, 'Bantu Warga yang Membutuhkan', 'bantu-warga-yang-membutuhkan', 'Semangat solidaritas desa melalui berbagai inisiatif amal dan program pemberdayaan masyarakat untuk membangun masa depan yang lebih baik bersama.', '<p>Di tengah kehidupan sehari-hari di Desa Titang, solidaritas sosial memainkan peran krusial dalam membangun sebuah komunitas yang kuat dan berdaya. Setiap individu dan keluarga memiliki cerita dan tantangan mereka sendiri, namun kekuatan bersama untuk saling mendukung dapat membawa perubahan yang luar biasa.</p>\r\n<p>Desa Titang, seperti banyak komunitas lainnya, tidak terlepas dari berbagai tantangan ekonomi dan sosial. Namun, di tengah tantangan itu, ada cahaya harapan yang terpancar dari upaya-upaya nyata untuk membantu sesama. Inisiatif-amal lokal telah tumbuh dan berkembang, membawa inspirasi dan harapan bagi warga yang membutuhkan.</p>\r\n<p>Salah satu bentuk dukungan yang nyata adalah melalui upaya penggalangan dana. Organisasi Desa Titang telah merespons dengan antusiasme, menyelenggarakan acara-acara amal dan kampanye online untuk mengumpulkan dana bagi keluarga-keluarga yang sedang berjuang. Setiap sumbangan, baik besar maupun kecil, memiliki dampak yang signifikan dalam membantu memenuhi kebutuhan sehari-hari dan mendukung perkembangan ekonomi di tingkat lokal.</p>\r\n<p>Namun, bantuan tidak hanya datang dalam bentuk uang. Banyak warga Desa Titang juga terlibat dalam kegiatan atau events sukarela yang beragam, mulai dari memberikan waktu mereka untuk mengajar anak-anak di sekolah setempat hingga menyumbangkan barang-barang pribadi untuk mereka yang membutuhkan. Semangat gotong-royong dan kepedulian ini tidak hanya memperkuat jaringan sosial dalam komunitas, tetapi juga membangun rasa persatuan yang kuat di antara tetangga-tetangga.</p>\r\n<p>Selain itu, proyek-proyek pemberdayaan masyarakat juga menjadi bagian penting dari perubahan yang sedang terjadi. Program pelatihan keterampilan, seperti pertanian urban dan kerajinan tangan tradisional, tidak hanya meningkatkan pendapatan keluarga tetapi juga menghidupkan kembali warisan budaya lokal yang berharga. Inisiatif-inisiatif ini tidak hanya memberi warga Desa Titang sumber penghasilan tambahan, tetapi juga membangkitkan kebanggaan akan identitas lokal mereka sendiri.</p>\r\n<p>Dalam konteks yang lebih luas, semangat dan dedikasi ini bukan hanya memperkuat ketahanan komunitas terhadap tantangan eksternal, tetapi juga membawa harapan baru bagi masa depan yang lebih cerah. Desa Titang menunjukkan bahwa ketika kita bersatu sebagai satu, kita dapat menciptakan perubahan yang positif dan berkelanjutan.</p>\r\n<p>Mari kita terus menginspirasi satu sama lain untuk berbuat lebih banyak lagi. Dengan menjaga semangat gotong-royong dan menguatkan jaringan sosial, kita tidak hanya membangun sebuah desa yang kuat, tetapi juga mendorong perubahan positif yang berdampak luas bagi kita semua.</p>\r\n<p>Dalam spirit kebersamaan, mari kita lanjutkan upaya untuk membantu warga yang membutuhkan di Desa Titang dan di seluruh dunia.</p>', 'post_1721305680.jpg', 'organisasi,gotong-royong,sosial', '2024-05-20 02:12:48', '2024-07-18 12:28:00'),
(12, 2, 'Mengapa Amal Penting dalam Kehidupan Kita?', 'mengapa-amal-penting-dalam-kehidupan-kita', 'Menggali pentingnya amal dalam kehidupan sehari-hari, menyuarakan nilai-nilai kemanusiaan, dan mengilhami pembaca untuk bertindak dengan kebaikan dan empati dalam interaksi mereka dengan sesama.', '<p>Amal merupakan inti dari banyak nilai-nilai kemanusiaan yang dijunjung tinggi di seluruh dunia. Banyak orang berpikir bahwa amal hanya sebatas memberikan bantuan finansial atau materi kepada yang membutuhkan, tetapi sebenarnya, konsep amal mencakup lebih dari itu. Amal mencerminkan kedermawanan, empati, dan kepedulian kita terhadap sesama manusia dan lingkungan sekitar. Saat kita melakukan amal, kita tidak hanya memberikan manfaat langsung kepada penerima, tetapi juga memberi inspirasi kepada orang lain untuk melakukan hal baik yang sama. Setiap tindakan amal, sekecil apapun, memiliki potensi untuk merubah dunia menjadi tempat yang lebih baik.</p>\r\n<p>Dalam kehidupan sehari-hari, kita sering kali terjebak dalam rutinitas yang padat, tetapi menemukan waktu untuk melakukan amal dapat membuka mata kita terhadap kebutuhan orang lain di sekitar kita. Amal tidak selalu harus berupa sumbangan besar; menghabiskan waktu dengan orang yang kesepian, memberikan senyuman kepada orang asing, atau berbagi pengetahuan kepada mereka yang membutuhkan juga merupakan bentuk amal yang bernilai. Dengan melibatkan diri dalam tindakan-tindakan ini, kita tidak hanya memperkuat ikatan sosial dalam masyarakat tetapi juga membangun fondasi empati yang kuat di antara sesama manusia.</p>\r\n<p>Amal juga memiliki dampak positif yang signifikan terhadap kesehatan mental dan emosional kita. Ketika kita membantu orang lain, kita merasakan perasaan kepuasan dan kebahagiaan yang mendalam. Ini bukan hanya karena kita merasa berkontribusi pada kebaikan umum, tetapi juga karena tindakan amal mengubah perspektif kita terhadap kehidupan. Melalui pengalaman ini, kita belajar menghargai apa yang kita miliki dan merasa terhubung dengan komunitas yang lebih besar.</p>\r\n<p>Dalam dunia yang sering kali dipenuhi dengan ketegangan dan perbedaan, amal memainkan peran penting dalam membangun jembatan antarindividu dan masyarakat. Ini adalah panggilan universal untuk bertindak dengan belas kasihan dan kebaikan, tidak peduli seberapa kecil pun dampaknya terlihat. Dengan melakukan amal, kita berinvestasi dalam masa depan yang lebih baik, di mana nilai-nilai ini diteruskan dari generasi ke generasi, menjadikan dunia ini tempat yang lebih berempati dan inklusif bagi semua.</p>', 'post_1721392812.jpg', 'amal,sosial,kemanusiaan', '2024-07-19 12:40:12', '2024-07-19 12:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Donasi', 'donation', '2023-12-19 19:16:54', '2024-06-23 09:34:10'),
(2, 'Amal', 'charity', '2023-12-19 19:17:03', '2024-06-23 09:34:26'),
(3, 'Pendidikan', 'education', '2023-12-19 19:17:07', '2024-06-23 09:34:59'),
(4, 'Kesehatan', 'health', '2023-12-19 19:17:15', '2024-06-23 09:35:08'),
(5, 'Penggalangan Dana', 'fundraising', '2023-12-19 19:17:23', '2024-06-23 09:36:00'),
(8, 'Sosial', 'social', '2024-07-18 12:24:43', '2024-07-18 12:45:36');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reply` text NOT NULL,
  `comment_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `reply`, `comment_id`, `name`, `email`, `user_type`, `status`, `created_at`, `updated_at`) VALUES
(8, 'nice, mantap bang', 8, NULL, NULL, 'Admin', 'Active', '2024-06-24 00:35:45', '2024-06-24 00:35:45'),
(9, 'test reply', 9, NULL, NULL, 'Admin', 'Active', '2024-06-24 00:35:54', '2024-07-19 17:34:10'),
(14, 'Udah di edit kak 🤭', 11, NULL, NULL, 'Admin', 'Active', '2024-07-19 10:35:41', '2024-07-19 10:35:41'),
(15, 'Ahh, yang bener kamu samsudin', 11, 'Smithy Werben', 'smith@gmail.com', 'Visitor', 'Active', '2024-07-19 17:32:11', '2024-07-19 17:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `top_phone` varchar(255) DEFAULT NULL,
  `top_email` varchar(255) DEFAULT NULL,
  `cta_heading` varchar(255) DEFAULT NULL,
  `cta_text` text DEFAULT NULL,
  `cta_button_text` varchar(255) DEFAULT NULL,
  `cta_button_url` varchar(255) DEFAULT NULL,
  `cta_status` varchar(255) NOT NULL,
  `footer_address` varchar(255) DEFAULT NULL,
  `footer_phone` varchar(255) DEFAULT NULL,
  `footer_email` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) NOT NULL,
  `map` text DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `favicon`, `banner`, `top_phone`, `top_email`, `cta_heading`, `cta_text`, `cta_button_text`, `cta_button_url`, `cta_status`, `footer_address`, `footer_phone`, `footer_email`, `copyright`, `map`, `facebook`, `twitter`, `youtube`, `tiktok`, `instagram`, `created_at`, `updated_at`) VALUES
(1, 'logo_1721049809.png', 'favicon_1704244725.png', 'banner_1721361942.jpg', '+6281-2345-6789', 'contact@example.com', 'Menjadi Mitra Donasi', 'Bergabunglah sebagai mitra donasi dan jadilah bagian dari perubahan yang berarti.', 'Kontak Kami', '#', 'Show', 'Titang, Jogonalan, Klaten', '+6281-2345-6789', 'contact@example.com', 'Copyright © 2024, LaskarAmal. All Rights Reserved.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7906.726802739489!2d110.53701309036764!3d-7.751225519070365!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a4523a2d1ef59%3A0x1c90c4706ec80a23!2sBalai%20Desa%20Titang!5e0!3m2!1sen!2sid!4v1720963169326!5m2!1sen!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '#', '#', '#', '#', '#', NULL, '2024-07-19 12:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `heading`, `text`, `photo`, `button_text`, `button_link`, `created_at`, `updated_at`) VALUES
(1, 'Bantu warga yang membutuhkan', '<p>Mengilustrasikan semangat solidaritas di desa melalui berbagai inisiatif amal dan program pemberdayaan masyarakat untuk membangun masa depan yang lebih baik bersama.</p>', '1698671272.jpg', 'Selengkapnya', '#', '2023-10-30 02:56:01', '2024-07-18 11:02:44'),
(2, 'Berjuang untuk satu tujuan', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis.</p>', '1698671262.jpg', 'Selengkapnya', '#', '2023-10-30 02:57:39', '2024-06-17 08:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

CREATE TABLE `specials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) NOT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specials`
--

INSERT INTO `specials` (`id`, `heading`, `sub_heading`, `text`, `button_text`, `button_link`, `photo`, `video_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Apa yang kami lakukan?', 'Misi Kami', '<p>Misi kami adalah meningkatkan kesejahteraan dan kualitas hidup masyarakat desa melalui berbagai program dan inisiatif. Kami fokus pada pemberdayaan komunitas, pendidikan, kesehatan, dan lingkungan. Dengan kolaborasi bersama warga, kami berusaha menciptakan perubahan positif dan berkelanjutan yang dapat dirasakan oleh seluruh desa.</p>\r\n<p>Selain itu, kami juga berkomitmen untuk berkontribusi pada solusi isu-isu sosial di luar desa. Melalui upaya mandiri dan dedikasi penuh, kami bertujuan untuk menghadapi tantangan sosial di tingkat regional dan memberikan dampak yang lebih luas. Kami percaya bahwa upaya kolektif internal dapat membawa perubahan signifikan bagi masyarakat secara keseluruhan.</p>', 'Selengkapnya', '#', '1698728077.jpg', NULL, 'Show', NULL, '2024-07-19 08:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `token`, `status`, `created_at`, `updated_at`) VALUES
(3, 'subs1@gmail.com', '', 1, '2024-01-02 20:52:40', '2024-01-02 20:52:54'),
(4, 'subs2@gmail.com', '', 1, '2024-01-02 20:53:20', '2024-01-02 20:53:59'),
(5, 'subs3@gmail.com', '2e2252979c17c8dfbfea77d1c07c1218', 0, '2024-01-02 20:53:31', '2024-01-02 20:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `photo`, `name`, `designation`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'testimonial_1702892153.jpg', 'Budiono Siregar', 'Warga', 'Kapal Lawd', '2023-12-18 03:35:53', '2024-06-20 04:22:01'),
(2, 'testimonial_1702901976.jpg', 'Samsudin', 'Warga', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2023-12-18 03:36:58', '2024-06-20 04:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Smithy Werben', 'smith@gmail.com', '2023-10-30 00:41:37', '$2y$10$bFObENCXsB.lXF/e5davw.AJJ670kDl/jtMDxMHsg.iuSUZMu.Zg2', '1698648372.jpg', NULL, '2023-10-30 00:38:16', '2024-07-19 12:23:42'),
(2, 'Milton E. Fessler', 'milton@gmail.com', '2023-12-31 20:59:01', '$2y$10$6jlHeeKOKFEqmO14R35KBuVL/zTANQxPKVLQEnPFed5b8K6Ntp5si', NULL, NULL, '2023-12-31 20:58:50', '2023-12-31 20:59:01'),
(3, 'Smithy Werben', 'smith2@gmail.com', '2024-06-05 03:13:34', '$2y$10$0E4/UuAKImzP7tzalrvkzOXMVYKhjSJwkQKhUfufi1xSAkfjPMwmi', NULL, 'UsW2B3I9OZ9H7TeeXcaxgxwWQfuVzyBdSmRj274fBojAeApJ3ZDH5gevyJ4O', '2024-06-05 03:02:10', '2024-06-13 19:09:41'),
(4, 'Budi', 'budi@gmail.com', '2024-06-05 05:24:56', '$2y$10$7XODFbvN/cOpGZl/LwMC9e4XTO5VCmYQewybjv8G5JLxWtvQkqRtG', NULL, NULL, '2024-06-05 05:24:27', '2024-06-05 05:24:56'),
(5, 'samsudin alala', 'samsudin@gmail.com', '2024-06-24 05:28:20', '$2y$10$xiz5MD20r4X.ogzOO0b77OHEIgccd.mO6P5O3abOSi1YzOg9LZMqO', NULL, NULL, '2024-06-24 05:27:12', '2024-06-24 05:28:20'),
(6, 'asd', 'asd@gmail.com', NULL, '$2y$10$nqKUYY5.vmLMXtZ2da3EGOk6JIJsYnAUnisHKKmZ31ZJtiedIHdO6', NULL, NULL, '2024-06-24 05:36:51', '2024-06-24 05:36:51'),
(7, 'Johan Reza', 'johan@gmail.com', '2024-07-12 06:34:05', '$2y$10$j8JQ0RHdZm.m.9ygHIr8IeejhoBHhzEEaapgN5bqrGGBNpDn8ve5K', NULL, NULL, '2024-07-12 06:33:15', '2024-07-12 06:34:05'),
(8, 'ilham bagus s', 'ilhambgs45@gmail.com', NULL, '$2y$10$3fWOBBAyNXwpJpDHrTrueOLLqWv3f7Aqab0U.5z7MapxCGVWve4Gq', NULL, NULL, '2024-07-21 07:18:32', '2024-07-21 07:18:32'),
(9, 'bagus p', 'bagus@gmail.com', '2024-07-21 07:20:18', '$2y$10$UObtCbxzEEzkgD80pk3CSe0SdJbIHEm2we6mwB3S/fNsZ3PvHQzee', NULL, NULL, '2024-07-21 07:19:44', '2024-07-21 07:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_category_id` int(11) NOT NULL,
  `youtube_video_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_category_id`, `youtube_video_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'FIIWfOjJ3Ig', '2023-12-19 11:48:23', '2023-12-19 11:48:23'),
(2, 1, 'uemObN8_dcw', '2023-12-19 11:50:49', '2023-12-19 11:50:49'),
(3, 1, 'bfAzi6D5FpM', '2023-12-19 11:50:58', '2023-12-19 11:50:58'),
(4, 1, 'CE3LLDKXkz4', '2023-12-19 11:51:08', '2023-12-19 11:51:08'),
(5, 2, 'voF1plqqZJA', '2023-12-19 11:51:23', '2023-12-19 11:51:23'),
(6, 2, 'ky5vlOgfnQ8', '2023-12-19 11:51:35', '2023-12-19 11:51:35'),
(7, 2, 'BOJWRINtueQ', '2023-12-19 11:51:47', '2023-12-19 11:51:47'),
(8, 2, '9sPAkS7cHHw', '2023-12-19 11:51:56', '2023-12-19 11:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `video_categories`
--

CREATE TABLE `video_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_categories`
--

INSERT INTO `video_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pendidikan dan Pelatihan', '2023-12-19 09:27:35', '2024-06-22 18:11:20'),
(2, 'Kesehatan dan Kebersihan', '2023-12-19 09:27:47', '2024-06-22 18:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`id`, `name`, `profession`, `photo`, `facebook`, `twitter`, `tiktok`, `instagram`, `address`, `email`, `phone`, `website`, `detail`, `created_at`, `updated_at`) VALUES
(1, 'Orang 1', 'Relawan', 'volunteer_1702965964.jpg', '#', '#', '#', '#', 'Dk. Cabean RT 01/01', 'jokoforever@gmail.com', '08123456789', '#', 'Lorem ipsum dolor sit amet, virtute assueverit sadipscing nec ut, pro te bonorum eligendi platonem, ad est quodsi mollis tincidunt. Vix veniam accusata in. Recusabo maiestatis nam ea. Facer legimus epicurei vis in, quidam iudicabit quaerendum vim et, duo aliquid deseruisse cu.\r\n\r\nVide accumsan omnesque vel an. Lucilius sapientem ut eam, cum malis omittantur no. Vix ad duis viris, erroribus definitionem usu et. Partem atomorum platonem ei est, et sea reque dolorem. Quem tempor libris in mea. Essent dolores nam te.\r\n\r\nMel accusam vituperata cotidieque ut, vix esse utinam nusquam in. Ea eam euismod propriae partiendo, ei has perfecto maluisset. Unum euismod mnesarchum an sit. Ne sea vituperata definitiones, his quas facer fastidii eu. Tritani propriae at has, et his altera offendit mediocrem, in erant dolorum nam.', '2023-12-19 00:06:04', '2024-07-19 12:53:20'),
(2, 'Orang 2', 'Relawan', 'volunteer_1702966730.jpg', '#', '#', NULL, '#', 'Dk. Sungkuran RT 01/01', 'jaliteng@gmail.com', '08123456789', NULL, 'Lorem ipsum dolor sit amet, ad vim ludus sapientem hendrerit, reque minimum ex eam. Vix dolorem vocibus adversarium eu, pro no fabulas nusquam. Has nisl paulo ea, sed propriae repudiare ad, eam postea placerat eu. Sit apeirian invenire adolescens no. Dictas aliquip viderer ut ius, ex magna eligendi expetenda mea.\r\n\r\nQuas prompta eruditi in mea, an his omnes suavitate efficiantur. Esse nonumes adversarium vim ex, facete patrioque at mel. In dicit eripuit est, natum invidunt ut est. Mea ea diceret appareat temporibus. Ad nam affert laudem vulputate. Eu decore suscipit qui.\r\n\r\nPersecuti efficiendi mel cu, nonumes maiestatis sit ad. Ne nam soleat fuisset. Pri et odio verterem eloquentiam. Altera consulatu percipitur per cu, et debet oporteat nec. Tantas laboramus est ei, mea aliquid ornatus ne.', '2023-12-19 00:18:50', '2024-07-19 12:53:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `causes`
--
ALTER TABLE `causes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cause_donations`
--
ALTER TABLE `cause_donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cause_faqs`
--
ALTER TABLE `cause_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cause_photos`
--
ALTER TABLE `cause_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cause_videos`
--
ALTER TABLE `cause_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_photos`
--
ALTER TABLE `event_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_tickets`
--
ALTER TABLE `event_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_videos`
--
ALTER TABLE `event_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_items`
--
ALTER TABLE `home_page_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_page_items`
--
ALTER TABLE `other_page_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo_categories`
--
ALTER TABLE `photo_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_category_id_foreign` (`post_category_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specials`
--
ALTER TABLE `specials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_categories`
--
ALTER TABLE `video_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `causes`
--
ALTER TABLE `causes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cause_donations`
--
ALTER TABLE `cause_donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cause_faqs`
--
ALTER TABLE `cause_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cause_photos`
--
ALTER TABLE `cause_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cause_videos`
--
ALTER TABLE `cause_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `event_photos`
--
ALTER TABLE `event_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `event_tickets`
--
ALTER TABLE `event_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `event_videos`
--
ALTER TABLE `event_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `home_page_items`
--
ALTER TABLE `home_page_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `other_page_items`
--
ALTER TABLE `other_page_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `photo_categories`
--
ALTER TABLE `photo_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specials`
--
ALTER TABLE `specials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `video_categories`
--
ALTER TABLE `video_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_post_category_id_foreign` FOREIGN KEY (`post_category_id`) REFERENCES `post_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
