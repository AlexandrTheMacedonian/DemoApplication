CREATE TABLE `omfg`.`roles` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `omfg`.`tags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `omfg`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL DEFAULT 'null',
  `password` VARCHAR(45) NULL DEFAULT 'null',
  PRIMARY KEY (`id`));

CREATE TABLE `omfg`.`video` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file` VARCHAR(100) NULL DEFAULT 'null',
  `description` VARCHAR(445) NULL DEFAULT 'null',
  `src` VARCHAR(145) NULL DEFAULT 'null',
  PRIMARY KEY (`id`));

CREATE TABLE `omfg`.`user_roles` (
  `user_id` INT NULL,
  `role_id` INT NULL);

CREATE TABLE `omfg`.`user_video` (
  `user_id` INT NULL,
  `video_id` INT NULL);

CREATE TABLE `omfg`.`video_tag` (
  `video_id` INT NULL,
  `tag_id` INT NULL);
