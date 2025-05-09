create table Family (
  family_id integer primary key,
  common_name varchar(50) not null,
  latin_name varchar(50) not null
);

create table Bird (
  bird_id int primary key,
  common_name varchar(50) not null,
  latin_name varchar(50) not null,
  description varchar(250),
  family_id integer,
  iucn_status char(2) check(iucn_status in ('CR', 'EN', 'VU', 'NT', 'LC')) default 'LC',
  foreign key (family_id) references Family(family_id)
);

create table Region (
  region_id int primary key,
  name varchar(50) not null
);

create table Location (
  location_id int primary key,
  name varchar(50) not null,
  latitude decimal(7,4) not null,
  longitude decimal(7,4) not null,
  region_id int,
  foreign key (region_id) references Region(region_id)
);

create table User (
  user_id int primary key,
  username varchar(50) unique not null,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(50) not null,
  password varchar(50) not null,
  region_id int,
  foreign key (region_id) references Region(region_id)
);

create table Audio (
  audio_id int primary key,
  audio_url varchar(200) not null,
  length decimal(5,2),
  description varchar(20)
);

create table Photo (
  photo_id int primary key,
  photo_url varchar(200) not null,
  width int,
  height int,
  description varchar(20)
);

create table Observation (
  obs_id int primary key,
  user_id int not null,
  bird_id int not null,
  num_observed smallint default 1,
  location_id int not null,
  obs_date date not null,
  photo_id int,
  audio_id int,
  foreign key (user_id) references User(user_id),
  foreign key (bird_id) references Bird(bird_id),
  foreign key (location_id) references Location(location_id),
  foreign key (photo_id) references Photo(photo_id),
  foreign key (audio_id) references Audio(audio_id)
);