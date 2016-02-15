CREATE TABLE attributetype
(
    att_type_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    att_name VARCHAR(255) NOT NULL
);
CREATE TABLE bean
(
    bean_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    bean_name VARCHAR(255) NOT NULL,
    proj_id INT(11) DEFAULT '0' NOT NULL,
    friendly_name VARCHAR(255) NOT NULL
);
CREATE TABLE beanattribute
(
    bean_att_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    bean_att_name VARCHAR(255) NOT NULL,
    bean_id INT(11) DEFAULT '0' NOT NULL,
    att_type_id INT(11) DEFAULT '0' NOT NULL,
    form_hidden TINYINT(4) DEFAULT '0' NOT NULL,
    primary_key TINYINT(4) DEFAULT '0' NOT NULL,
    compolsory_field TINYINT(4) DEFAULT '0' NOT NULL,
    friendly_name VARCHAR(255) NOT NULL,
    `order` INT(11) DEFAULT '0' NOT NULL
);
CREATE TABLE beanload
(
    bl_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    bl_name VARCHAR(255) NOT NULL,
    bean_id INT(11) DEFAULT '0' NOT NULL,
    blt_id INT(11) DEFAULT '0' NOT NULL
);
CREATE TABLE beanloadattribute
(
    blatt_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    bean_att_id INT(11) DEFAULT '0' NOT NULL,
    bl_id INT(11) DEFAULT '0' NOT NULL
);
CREATE TABLE beanloadtype
(
    blt_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    blt_name VARCHAR(255) NOT NULL
);
CREATE TABLE project
(
    proj_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    proj_name VARCHAR(255) NOT NULL
);