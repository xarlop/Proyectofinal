-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2024 a las 06:33:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taskapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(2, '2024-10-09-015312', 'App\\Database\\Migrations\\CreateTasksTable', 'default', 'App', 1728439845, 1),
(3, '2024-10-08-114500', 'App\\Database\\Migrations\\AddTimestampsToTask', 'default', 'App', 1728441283, 2),
(4, '2024-10-10-000728', 'App\\Database\\Migrations\\CreateUsersTable', 'default', 'App', 1728519537, 3),
(5, '2024-10-10-212902', 'App\\Database\\Migrations\\AddUserIdToTask', 'default', 'App', 1728596098, 4),
(6, '2024-10-11-000848', 'App\\Database\\Migrations\\AddIndexToTaskCreatedAt', 'default', 'App', 1728605578, 5),
(7, '2024-10-11-053044', 'App\\Database\\Migrations\\AddIsAdminToUser', 'default', 'App', 1728625004, 6),
(8, '2024-10-14-043006', 'App\\Database\\Migrations\\AddAccountActivationToUser', 'default', 'App', 1728880669, 7),
(9, '2024-10-15-065320', 'App\\Database\\Migrations\\AddPasswordResetToUser', 'default', 'App', 1728975416, 8),
(10, '2024-10-15-212709', 'App\\Database\\Migrations\\AddProfileImageToUser', 'default', 'App', 1729027848, 9),
(11, '2024-10-16-032923', 'App\\Database\\Migrations\\CreateRememberdLogin', 'default', 'App', 1729051756, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remembered_login`
--

CREATE TABLE `remembered_login` (
  `token_hash` varchar(64) NOT NULL,
  `user_id` int(5) UNSIGNED NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task`
--

CREATE TABLE `task` (
  `id` int(5) UNSIGNED NOT NULL,
  `description` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `task`
--

INSERT INTO `task` (`id`, `description`, `created_at`, `updated_at`, `user_id`) VALUES
(21, 'silla', '2024-10-10 23:26:37', '2024-10-10 23:26:37', 62),
(24, 'trabjofinal', '2024-10-16 22:53:44', '2024-10-16 22:53:44', 62),
(27, 'tarea', '2024-10-17 00:02:43', '2024-10-17 08:08:50', 62),
(28, 'tarea', '2024-10-17 00:02:53', '2024-10-17 08:04:41', 62),
(29, 'Another task', '2024-10-17 03:10:04', '2024-10-17 03:10:04', 62),
(30, 'Here is Another task', '2024-10-17 03:41:36', '2024-10-17 03:41:36', 62);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `activation_hash` varchar(64) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `reset_hash` varchar(64) DEFAULT NULL,
  `reset_expires_at` datetime DEFAULT NULL,
  `profile_image` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password_hash`, `created_at`, `updated_at`, `is_admin`, `activation_hash`, `is_active`, `reset_hash`, `reset_expires_at`, `profile_image`) VALUES
(27, 'Admin', 'admin@gmail.com', '$2y$10$XGMuG6gzdxGvkubO54pshelLBPFxS4Igj36cXdnXyBvkJdymjypgK', '2024-10-11 07:41:39', '2024-10-15 02:23:35', 1, NULL, 1, NULL, NULL, NULL),
(30, 'juana', 'jua@gmail.com', '$2y$10$/aVemFZZbuBCsTNzoFjGtOs0cyUf3x40Ek5rVhHgkKS/yziOVS8/C', '2024-10-14 05:28:55', '2024-10-19 02:37:30', 1, '0c2ee1d7eebfdf94c9867b31eb3017ab5389f9673b73ec5d829bccc3a9c76bf3', 1, NULL, NULL, NULL),
(62, 'Leopoldo', 'leopoldoxarxar@gmail.com', '$2y$10$ZLfGAoxtryBCRZPNCzTp8OmDBCiaS3sptZns3SivMqf8dkkvKggKS', '2024-10-15 05:16:28', '2024-10-19 03:21:05', 1, NULL, 1, NULL, NULL, '1729308065_b1dac7df11ca64ab8a6c.jpg'),
(63, 'alanxar', 'dia@gmail.com', '$2y$10$CYLvV0r2xfbvsRccfRcYEurF1RC9Fgn98ZhDwf6XihPwcwKcJ.Dna', '2024-10-17 06:20:08', '2024-10-17 06:20:08', 0, '1d0119216cf81178f3058de5e3ace5ae6c0bbf58b1281b02ae6a8e794ae780c8', 0, NULL, NULL, NULL),
(70, 'asd', 'dsd@gmail.com', '$2y$10$9ZPnNoc7xfzlFrzcwRXAm.3uW7WC/N1lx5FW2ukh7kY9eVs5Itp2u', '2024-10-18 00:57:43', '2024-10-18 00:57:43', 0, '00fc77330cdd373ef2364fc2ec46a4db9e0c8c92b834ac3ae707f0f2668809b0', 0, NULL, NULL, NULL),
(86, 'alan', 'xarprueba@gmail.com', '$2y$10$TGbYjjZjLDMByccI6irWJuf916hza9zsBwcLeEIpE5zQI8aDtH0p2', '2024-10-19 02:17:03', '2024-10-19 03:44:24', 0, 'ad74fa1d1192207b2b5ed0a9bb54bd7747e89b4b89e0e8f2683185ec1a87387c', 1, '6539d513fe4127d2117f880724f26657a93e7868ea34e015d34ae5908f3e4a02', '2024-10-19 05:44:24', NULL),
(88, 'alan', 'xarxaralanleopoldo@gmail.com', '$2y$10$H7eX1bvjxEP0ryzdlGSbbe2qhIFYeA6EcaOKV1b4S5Lid5F1RqR/W', '2024-10-19 03:18:27', '2024-10-19 03:32:01', 0, NULL, 1, NULL, NULL, '1729308720_4369aad66b3d3f9616fc.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD PRIMARY KEY (`token_hash`),
  ADD KEY `remembered_login_user_id_foreign` (`user_id`),
  ADD KEY `expires_at` (`expires_at`);

--
-- Indices de la tabla `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_user_id_fk` (`user_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `activation_hash` (`activation_hash`),
  ADD UNIQUE KEY `reset_hash` (`reset_hash`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `task`
--
ALTER TABLE `task`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD CONSTRAINT `remembered_login_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
