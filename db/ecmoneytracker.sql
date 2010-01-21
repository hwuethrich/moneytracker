-- phpMyAdmin SQL Dump
-- version 2.8.2.4
-- http://www.phpmyadmin.net
-- 
-- Host: localhost:3306
-- Generation Time: Jan 22, 2010 at 12:00 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.3
-- 
-- Database: `ecmoneytracker`
-- 

-- 
-- Dumping data for table `expenses`
-- 

INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (93, 2515, 'Miete', '2009-07-01', 1, '2009-06-30 23:00:28', '2009-06-30 23:00:28', 1);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (94, 75, 'Cablecom Internet', '2009-07-01', 1, '2009-06-30 23:00:28', '2009-06-30 23:00:28', 3);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (95, 43, 'Telefon Grundgebühr', '2009-07-01', 3, '2009-06-30 23:00:28', '2009-06-30 23:00:28', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (96, 75, 'Putzfrau', '2009-07-16', 1, '2009-07-29 14:03:16', '2009-07-29 14:03:54', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (97, 83, 'Putzfrau (+ Putzzeug)', '2009-07-30', 1, '2009-07-29 14:03:40', '2009-07-30 07:46:53', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (98, 45, 'Gas', '2009-07-15', 1, '2009-07-29 14:04:19', '2009-07-29 14:05:17', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (99, 2515, 'Miete', '2009-08-01', 1, '2009-07-31 23:00:29', '2009-07-31 23:00:29', 1);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (100, 75, 'Cablecom Internet', '2009-08-01', 1, '2009-07-31 23:00:29', '2009-07-31 23:00:29', 3);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (101, 43, 'Telefon Grundgebühr', '2009-08-01', 3, '2009-07-31 23:00:29', '2009-07-31 23:00:29', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (102, 198, 'EWB (Strom)', '2009-08-12', 1, '2009-08-12 16:20:31', '2009-08-12 16:20:31', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (103, 75, 'Putzfrau', '2009-08-13', 1, '2009-08-28 07:00:36', '2009-08-28 07:01:22', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (104, 75, 'Putzfrau', '2009-08-27', 1, '2009-08-28 07:00:55', '2009-08-28 07:00:55', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (105, 17, 'Kehrichtsäcke', '2009-08-29', 1, '2009-08-29 10:29:37', '2009-08-29 10:29:51', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (106, 2515, 'Miete', '2009-09-01', 1, '2009-08-31 23:00:36', '2009-08-31 23:00:36', 1);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (107, 115.5, 'Billag Gebühren', '2009-09-01', 1, '2009-08-31 23:00:36', '2009-08-31 23:00:36', 2);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (108, 75, 'Cablecom Internet', '2009-09-01', 1, '2009-08-31 23:00:36', '2009-08-31 23:00:36', 3);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (109, 43, 'Telefon Grundgebühr', '2009-09-01', 3, '2009-08-31 23:00:36', '2009-08-31 23:00:36', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (110, 102, 'Putzfrau + Putzmittel', '2009-09-10', 3, '2009-09-10 09:46:30', '2009-09-10 11:09:45', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (111, 2515, 'Miete', '2009-10-01', 1, '2009-09-30 23:00:45', '2009-09-30 23:00:45', 1);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (112, 75, 'Cablecom Internet', '2009-10-01', 1, '2009-09-30 23:00:46', '2009-09-30 23:00:46', 3);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (113, 43, 'Telefon Grundgebühr', '2009-10-01', 3, '2009-09-30 23:00:46', '2009-09-30 23:00:46', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (114, 100, 'Putzfrau', '2009-10-01', 1, '2009-10-02 10:15:58', '2009-10-02 10:15:58', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (115, 75, 'Putzfrau', '2009-10-15', 1, '2009-10-26 08:06:04', '2009-10-26 08:06:04', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (116, 2515, 'Miete', '2009-11-01', 1, '2009-11-01 00:00:29', '2009-11-01 00:00:29', 1);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (117, 75, 'Cablecom Internet', '2009-11-01', 1, '2009-11-01 00:00:29', '2009-11-01 00:00:29', 3);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (118, 43, 'Telefon Grundgebühr', '2009-11-01', 3, '2009-11-01 00:00:29', '2009-11-01 00:00:29', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (119, 158, 'EWB (Strom)', '2009-11-07', 1, '2009-11-07 13:00:02', '2009-11-07 13:00:02', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (120, 75, 'Putzfrau', '2009-11-19', 1, '2009-11-23 13:19:31', '2009-11-23 13:19:31', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (121, 2515, 'Miete Dezember', '2009-12-01', 1, '2009-12-01 00:00:22', '2009-12-30 17:52:30', 1);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (122, 115.5, 'Billag Gebühren', '2009-12-01', 1, '2009-12-01 00:00:22', '2009-12-01 00:00:22', 2);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (123, 75, 'Cablecom Internet', '2009-12-01', 1, '2009-12-01 00:00:22', '2009-12-01 00:00:22', 3);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (125, 120, 'Putzfrau + Weihnachtsgeld', '2009-12-17', 3, '2009-12-17 14:01:34', '2009-12-17 14:01:34', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (127, 158, 'EWB (Okt-Nov)', '2009-12-30', 1, '2009-12-30 17:49:19', '2009-12-30 17:49:19', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (128, 2577, 'Miete', '2010-01-01', 1, '2010-01-01 00:00:15', '2010-01-01 00:00:15', 1);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (129, 75, 'Cablecom Internet', '2010-01-01', 1, '2010-01-01 00:00:16', '2010-01-01 00:00:16', 3);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (130, 115, 'Putzfrau + Wischmob', '2010-01-21', 1, '2010-01-21 09:11:18', '2010-01-21 09:11:18', NULL);
INSERT INTO `expenses` (`id`, `amount`, `description`, `date`, `user_id`, `created_at`, `updated_at`, `recurrent_expense_id`) VALUES (131, 84.5, 'Putzfrau + Putzmittel', '2010-01-07', 1, '2010-01-21 09:12:08', '2010-01-21 09:12:08', NULL);

-- 
-- Dumping data for table `payments`
-- 

INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (26, 3, 1, 860, '2009-07-01', 'Anteil Miete', '2009-06-30 23:00:29', '2009-06-30 23:00:29', 1);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (27, 2, 1, 835, '2009-07-01', 'Anteil Miete', '2009-06-30 23:00:29', '2009-06-30 23:00:29', 2);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (28, 3, 1, 860, '2009-08-01', 'Anteil Miete', '2009-07-31 23:00:29', '2009-07-31 23:00:29', 1);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (29, 2, 1, 860, '2009-08-03', 'Anteil Miete', '2009-07-31 23:00:29', '2009-08-02 20:40:14', 2);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (30, 2, 1, 860, '2009-08-25', 'Anteil Miete', '2009-08-24 23:00:24', '2009-08-24 23:00:24', 2);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (31, 3, 1, 860, '2009-09-01', 'Anteil Miete', '2009-08-31 23:00:37', '2009-08-31 23:00:37', 1);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (32, 2, 1, 860, '2009-09-25', 'Anteil Miete', '2009-09-24 23:00:25', '2009-09-24 23:00:25', 2);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (33, 3, 1, 860, '2009-10-27', 'Anteil Miete', '2009-09-30 23:00:46', '2009-12-30 17:43:44', 1);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (34, 2, 1, 860, '2009-10-25', 'Anteil Miete', '2009-10-24 23:00:15', '2009-10-24 23:00:15', 2);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (35, 3, 1, 950, '2009-11-01', 'Anteil Miete', '2009-11-01 00:00:29', '2009-11-01 00:00:29', 1);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (36, 2, 1, 860, '2009-11-25', 'Anteil Miete', '2009-11-25 00:00:14', '2009-11-25 00:00:14', 2);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (37, 2, 1, 511, '2009-11-30', 'Anteil Miete', '2009-11-29 14:03:18', '2009-11-29 14:03:18', NULL);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (38, 3, 1, 950, '2009-12-01', 'Anteil Miete', '2009-12-01 00:00:22', '2009-12-01 00:00:22', 1);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (39, 2, 1, 950, '2009-12-25', 'Anteil Miete', '2009-12-25 00:00:23', '2009-12-25 00:00:23', 2);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (40, 3, 1, 950, '2010-01-01', 'Anteil Miete', '2010-01-01 00:00:16', '2010-01-01 00:00:16', 1);
INSERT INTO `payments` (`id`, `sender_id`, `recipient_id`, `amount`, `date`, `comment`, `created_at`, `updated_at`, `recurrent_payment_id`) VALUES (41, 2, 1, 950, '2010-01-01', 'Anteil Miete', '2010-01-01 00:00:16', '2010-01-01 00:00:16', 2);

-- 
-- Dumping data for table `recurrent_expenses`
-- 

INSERT INTO `recurrent_expenses` (`id`, `amount`, `description`, `months`, `day`, `user_id`, `created_at`, `updated_at`) VALUES (1, 2577, 'Miete', '--- \n- 1\n- 2\n- 3\n- 4\n- 5\n- 6\n- 7\n- 8\n- 9\n- 10\n- 11\n- 12\n', 1, 1, '2009-02-17 15:07:20', '2009-12-30 17:51:54');
INSERT INTO `recurrent_expenses` (`id`, `amount`, `description`, `months`, `day`, `user_id`, `created_at`, `updated_at`) VALUES (2, 115.5, 'Billag Gebühren', '--- \n- 3\n- 6\n- 9\n- 12\n', 1, 1, '2009-02-17 15:10:31', '2009-02-17 15:10:31');
INSERT INTO `recurrent_expenses` (`id`, `amount`, `description`, `months`, `day`, `user_id`, `created_at`, `updated_at`) VALUES (3, 75, 'Cablecom Internet', '--- \n- 1\n- 2\n- 3\n- 4\n- 5\n- 6\n- 7\n- 8\n- 9\n- 10\n- 11\n- 12\n', 1, 1, '2009-02-17 15:10:45', '2009-02-17 15:10:45');

-- 
-- Dumping data for table `recurrent_payments`
-- 

INSERT INTO `recurrent_payments` (`id`, `amount`, `comment`, `months`, `day`, `sender_id`, `recipient_id`, `created_at`, `updated_at`) VALUES (1, 950, 'Anteil Miete', '--- \n- 1\n- 2\n- 3\n- 4\n- 5\n- 6\n- 7\n- 8\n- 9\n- 10\n- 11\n- 12\n', 1, 3, 1, '2009-02-18 13:26:12', '2009-10-02 10:15:20');
INSERT INTO `recurrent_payments` (`id`, `amount`, `comment`, `months`, `day`, `sender_id`, `recipient_id`, `created_at`, `updated_at`) VALUES (2, 950, 'Anteil Miete', '--- \n- 1\n- 2\n- 3\n- 4\n- 5\n- 6\n- 7\n- 8\n- 9\n- 10\n- 11\n- 12\n', 1, 2, 1, '2009-04-09 11:29:56', '2009-12-30 17:30:48');

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` (`id`, `login`, `firstname`, `lastname`, `email`, `crypted_password`, `salt`, `created_at`, `updated_at`, `remember_token`, `remember_token_expires_at`, `admin`, `bank_account_no`) VALUES (1, 'hannes', 'Hannes', 'Wüthrich', 'hannes@eyecraft.ch', 'e2ef44653155a5d4b5b6109aa8d3169572f4b2cf', '5b608d4e60c647c8aa54f36bc727262079d0a017', '2009-02-13 16:03:07', '2009-03-03 06:55:23', NULL, NULL, 1, 'Postfinance 30-244690-4');
INSERT INTO `users` (`id`, `login`, `firstname`, `lastname`, `email`, `crypted_password`, `salt`, `created_at`, `updated_at`, `remember_token`, `remember_token_expires_at`, `admin`, `bank_account_no`) VALUES (2, 'playschool', 'Pascal', 'Martin', 'playschool@eyecraft.ch', 'a4e31fcc4f4521aa04a84932a2cc5914aecf955f', '790b3e7c60564879ae00109dfaec0e4409b1d162', '2009-02-13 17:09:02', '2009-07-29 13:54:13', NULL, NULL, 0, '');
INSERT INTO `users` (`id`, `login`, `firstname`, `lastname`, `email`, `crypted_password`, `salt`, `created_at`, `updated_at`, `remember_token`, `remember_token_expires_at`, `admin`, `bank_account_no`) VALUES (3, 'jini', 'Janine', 'Weix', 'jini@gmx.org', 'f411e4121200dad48a4f25544c641489f41d81f9', 'fdadc983ffb4fe2516b0ba93db891684f4961f1a', '2009-02-13 17:09:24', '2009-02-17 14:16:54', NULL, NULL, 0, '');
