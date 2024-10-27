CREATE TABLE `mms_battlepass` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(50) NOT NULL COLLATE 'armscii8_general_ci',
	`charidentifier` VARCHAR(50) NOT NULL COLLATE 'armscii8_general_ci',
	`firstname` VARCHAR(50) NOT NULL COLLATE 'armscii8_general_ci',
	`lastname` VARCHAR(50) NOT NULL COLLATE 'armscii8_general_ci',
	`exp` FLOAT NOT NULL DEFAULT '0',
	`level` INT(11) NULL DEFAULT NULL,
	`expneeded` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='armscii8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=7
;

CREATE TABLE `mms_battlepassrewards` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(50) NULL DEFAULT NULL COLLATE 'armscii8_general_ci',
	`charidentifier` VARCHAR(50) NULL DEFAULT NULL COLLATE 'armscii8_general_ci',
	`firstname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'armscii8_general_ci',
	`lastname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'armscii8_general_ci',
	`money` INT(11) NULL DEFAULT NULL,
	`moneyamount` INT(11) NULL DEFAULT NULL,
	`item` INT(11) NULL DEFAULT NULL,
	`itemname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'armscii8_general_ci',
	`itemlabel` VARCHAR(50) NULL DEFAULT NULL COLLATE 'armscii8_general_ci',
	`itemamount` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='armscii8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=10
;
