INSERT INTO `omfg`.`roles` (`id`, `name`) VALUES ('1', 'ROLE_USER');
INSERT INTO `omfg`.`roles` (`id`, `name`) VALUES ('2', 'ROLE_ADMIN');


INSERT INTO `omfg`.`tags` (`id`, `name`) VALUES ('4', 'Big');
INSERT INTO `omfg`.`tags` (`id`, `name`) VALUES ('5', 'Small');
INSERT INTO `omfg`.`tags` (`id`, `name`) VALUES ('6', 'Tag3');
INSERT INTO `omfg`.`tags` (`id`, `name`) VALUES ('7', 'Amazing');
INSERT INTO `omfg`.`tags` (`id`, `name`) VALUES ('8', 'Red');
INSERT INTO `omfg`.`tags` (`id`, `name`) VALUES ('9', 'wow');
INSERT INTO `omfg`.`tags` (`id`, `name`) VALUES ('10', 'Tag10');
INSERT INTO `omfg`.`tags` (`id`, `name`) VALUES ('11', 'Black');
INSERT INTO `omfg`.`tags` (`id`, `name`) VALUES ('12', 'Beautyful');


INSERT INTO `omfg`.`users` (`id`, `username`, `password`) VALUES ('1', '123123123', '$2a$11$uTIN6rNBIZdQlczP3tE.Ze1pLWYcz776X9yqdrp.yCenZeG1ggqeW');


INSERT INTO `omfg`.`video` (`id`, `file`, `description`, `src`) VALUES ('1', 'http://bipbap.ru/wp-content/uploads/2017/04/72fqw2qq3kxh.jpg', 'The best hd video The best hd video The best hd video The best hd video', '/resources/content/vol.1/DlyaSani.mp4');
INSERT INTO `omfg`.`video` (`id`, `file`, `description`, `src`) VALUES ('2', 'https://cdn.fishki.net/upload/post/2017/03/19/2245758/tn/02-funny-cat-wallpapercat-wallpaper.jpg', 'The best hd video The best hd video The best hd video The best hd video', '/resources/content/vol.1/DlyaSani.mp4');
INSERT INTO `omfg`.`video` (`id`, `file`, `description`, `src`) VALUES ('3', 'http://bipbap.ru/wp-content/uploads/2017/09/Cool-High-Resolution-Wallpaper-1920x1080.jpg', 'The best hd video The best hd video The best hd video The best hd video', '/resources/content/vol.1/DlyaSani.mp4');
INSERT INTO `omfg`.`video` (`id`, `file`, `description`, `src`) VALUES ('4', 'http://bipbap.ru/wp-content/uploads/2017/10/3-6.png', 'The best hd video The best hd video The best hd video The best hd video', '/resources/content/vol.1/DlyaSani.mp4');
INSERT INTO `omfg`.`video` (`id`, `file`, `description`, `src`) VALUES ('5', 'http://komotoz.ru/kartinki/zhivotnye/images/kartinki_volka_na_avu/kartinki_volka_na_avu_01.jpg', 'The best hd video The best hd video The best hd video The best hd video', '/resources/content/vol.1/DlyaSani.mp4');
INSERT INTO `omfg`.`video` (`id`, `file`, `description`, `src`) VALUES ('6', 'https://millionstatusov.ru/pic/statpic/all/58e25bbba584a.jpg', 'The best hd video The best hd video The best hd video The best hd video', '/resources/content/vol.1/DlyaSani.mp4');


INSERT INTO `omfg`.`user_roles` (`user_id`, `role_id`) VALUES ('1', '1');

INSERT INTO `omfg`.`user_video` (`user_id`, `video_id`) VALUES ('1', '2');
INSERT INTO `omfg`.`user_video` (`user_id`, `video_id`) VALUES ('1', '4');
INSERT INTO `omfg`.`user_video` (`user_id`, `video_id`) VALUES ('1', '5');

INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('1', '4');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('1', '7');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('1', '9');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('2', '5');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('2', '10');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('2', '12');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('3', '9');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('3', '12');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('4', '5');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('4', '7');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('4', '9');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('5', '5');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('5', '10');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('5', '11');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('6', '4');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('6', '8');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('6', '9');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('6', '10');
INSERT INTO `omfg`.`video_tag` (`video_id`, `tag_id`) VALUES ('6', '11');

