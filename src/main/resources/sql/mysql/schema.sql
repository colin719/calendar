drop table if exists sosocal_task;
drop table if exists sosocal_user;

create table sosocal_task (
	id bigint auto_increment,
	title varchar(128) not null,
	description varchar(255),
	user_id bigint not null,
    primary key (id)
) engine=InnoDB;

create table sosocal_user (
	id bigint auto_increment,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	salt varchar(64) not null,
	roles varchar(255) not null,
	register_date timestamp not null default 0,
	primary key (id)
) engine=InnoDB;


DROP TABLE IF EXISTS `sosocal_event`;
CREATE TABLE `sosocal_event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `project_id` TINYINT NOT NULL,
  `priority` TINYINT NOT NULL,
  `comment_floor` TINYINT NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `detail` MEDIUMTEXT NULL,
  PRIMARY KEY (`id`)
) engine=InnoDB;


DROP TABLE IF EXISTS `sosocal_team_user`;
CREATE TABLE `sosocal_team_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`user_id`, `team_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `sosocal_comment`;
CREATE TABLE `sosocal_comment` (
  `id` TINYINT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `floor` TINYINT NOT NULL,
  `score` TINYINT NOT NULL,
  `detail` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`)
) engine=InnoDB;


DROP TABLE IF EXISTS `sosocal_team`;
CREATE TABLE `sosocal_team` (
  `id` INT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `create_day` DATE NOT NULL,
  PRIMARY KEY (`id`)
) engine=InnoDB;


DROP TABLE IF EXISTS `sosocal_project`;
CREATE TABLE `sosocal_project` (
  `id` TINYINT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `active` TINYINT NOT NULL,
  `create_day` DATE NOT NULL,
  PRIMARY KEY (`id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `sosocal_review`;
CREATE TABLE `sosocal_review` (
  `id` TINYINT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `score` TINYINT NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_day` DATE NOT NULL,
  `end_day` DATE NULL,
  `detail` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`)
) engine=InnoDB;

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `sosocal_event` ADD FOREIGN KEY (user_id) REFERENCES `sosocal_user` (`id`);
ALTER TABLE `sosocal_event` ADD FOREIGN KEY (project_id) REFERENCES `sosocal_project` (`id`);
ALTER TABLE `sosocal_team_user` ADD FOREIGN KEY (user_id) REFERENCES `sosocal_user` (`id`);
ALTER TABLE `sosocal_team_user` ADD FOREIGN KEY (team_id) REFERENCES `sosocal_team` (`id`);
ALTER TABLE `sosocal_comment` ADD FOREIGN KEY (user_id) REFERENCES `sosocal_user` (`id`);
ALTER TABLE `sosocal_comment` ADD FOREIGN KEY (event_id) REFERENCES `sosocal_event` (`id`);
ALTER TABLE `sosocal_review` ADD FOREIGN KEY (user_id) REFERENCES `sosocal_user` (`id`);

-- ---
-- Table Properties
-- ---
ALTER TABLE `sosocal_user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sosocal_event` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sosocal_team_user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sosocal_comment` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sosocal_team` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sosocal_project` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sosocal_review` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
