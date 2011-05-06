DROP TABLE badges;
DROP TABLE relationType;
DROP TABLE reviews;
DROP TABLE sharings;
DROP TABLE shop_checkin;
DROP TABLE shops;
DROP TABLE users;
DROP TABLE user_badges;
DROP TABLE user_locations;
DROP TABLE user_relations;
DROP TABLE user_tokens;

CREATE TABLE badges (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  description VARCHAR(255),
  isActive boolean DEFAULT 1,
  created_at DATETIME,
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE relationType (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  description VARCHAR(255),
  isActive boolean DEFAULT 1,
  created_at DATETIME,
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE reviews (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  shop_id INT NOT NULL,
  user_id INT NOT NULL,
  score FLOAT,
  CappuccinoScore FLOAT,
  EspressoScore FLOAT,
  DripScore FLOAT,
  PersonalityScore FLOAT,
  AtmosphereScore FLOAT,
  description VARCHAR(255),
  isActive boolean DEFAULT 1,
  created_at DATETIME,
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE sharings (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  content VARCHAR(255),
  isActive boolean DEFAULT 1,
  created_at DATETIME,
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE shop_checkin (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  shop_id INT NOT NULL,
  user_id INT NOT NULL,
  isActive boolean DEFAULT 1,
  created_at DATETIME,
  updated_at TIMESTAMP DEFAULT NOW()
);

create table shops (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100),
	address VARCHAR(255),
	city VARCHAR(100),
	state VARCHAR(100),
	zipcode VARCHAR(20),
	latitude FLOAT,
	longitude FLOAT,
	description VARCHAR(255),
	gmaps boolean,
	isActive boolean DEFAULT 0,
	created_at DATETIME,
	updated_at TIMESTAMP DEFAULT NOW()
);

  create table user_badges (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	badge_id INT,
	isActive boolean DEFAULT 1,
	created_at DATETIME,
	updated_at TIMESTAMP DEFAULT NOW()
);

create table user_locations (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	name VARCHAR(100),
	address VARCHAR(100),
	latitude FLOAT,
	longitude FLOAT,
	gmaps boolean,
	isDefaultLocation boolean DEFAULT 1,
	isActive boolean DEFAULT 1,
	created_at DATETIME,
	updated_at TIMESTAMP DEFAULT NOW()
);

  create table  user_relations(
  	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	RelatingUserID INT,
	RelatedUserID INT,
	RelationTypeID INT,
	RelationAcknowledge DATETIME,
	isActive boolean DEFAULT 1,
	created_at DATETIME,
	updated_at TIMESTAMP DEFAULT NOW()
);

  create table  user_tokens(
  	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	provider VARCHAR(255),
	uid VARCHAR(255),
	token VARCHAR(255),
	secret VARCHAR(255),
	nickname VARCHAR(255),
	isActive boolean DEFAULT 1,
	created_at DATETIME,
	updated_at TIMESTAMP DEFAULT NOW()
);

  create table  users (
  	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(255) NOT NULL DEFAULT '',
	encrypted_password VARCHAR(128) NOT NULL DEFAULT '',
	reset_password_token VARCHAR(255),
	remember_token VARCHAR(255),
	remember_created_at DATETIME,
	sign_in_count INT DEFAULT 0,
	current_sign_in_at DATETIME,
	last_sign_in_at DATETIME,
	current_sign_in_ip VARCHAR(255),
	last_sign_in_ip VARCHAR(255),
	confirmation_token VARCHAR(255),
	confirmed_at DATETIME,
	confirmation_sent_at DATETIME,
	created_at DATETIME,
	updated_at TIMESTAMP DEFAULT NOW(),
	name  VARCHAR(255),
	photo_file_name VARCHAR(255),
	photo_content_type VARCHAR(255),
	photo_file_size INT,
	slug VARCHAR(255),
	admin boolean DEFAULT 0,
	reviewer boolean DEFAULT 0,
	isActive boolean DEFAULT 1
);