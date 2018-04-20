ALTER TABLE `omfg`.`user_roles` 
ADD INDEX `FK_UR_US_idx` (`user_id` ASC),
ADD INDEX `FK_UR_RO_idx` (`role_id` ASC);
ALTER TABLE `omfg`.`user_roles` 
ADD CONSTRAINT `FK_UR_US`
  FOREIGN KEY (`user_id`)
  REFERENCES `omfg`.`users` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT,
ADD CONSTRAINT `FK_UR_RO`
  FOREIGN KEY (`role_id`)
  REFERENCES `omfg`.`roles` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `omfg`.`user_video` 
ADD INDEX `FK_UV_US_idx` (`user_id` ASC),
ADD INDEX `FK_UV_VI_idx` (`video_id` ASC);
ALTER TABLE `omfg`.`user_video` 
ADD CONSTRAINT `FK_UV_US`
  FOREIGN KEY (`user_id`)
  REFERENCES `omfg`.`users` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT,
ADD CONSTRAINT `FK_UV_VI`
  FOREIGN KEY (`video_id`)
  REFERENCES `omfg`.`video` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;
  
  ALTER TABLE `omfg`.`video_tag` 
ADD INDEX `FK_VT_VI_idx` (`video_id` ASC),
ADD INDEX `FK_VT_TA_idx` (`tag_id` ASC);
ALTER TABLE `omfg`.`video_tag` 
ADD CONSTRAINT `FK_VT_VI`
  FOREIGN KEY (`video_id`)
  REFERENCES `omfg`.`video` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT,
ADD CONSTRAINT `FK_VT_TA`
  FOREIGN KEY (`tag_id`)
  REFERENCES `omfg`.`tag` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;