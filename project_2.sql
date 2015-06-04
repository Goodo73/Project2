-- create database project_2;
-- \c project_2 <-- connects the database

CREATE TABLE books (
	id SERIAL4 PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author VARCHAR(100),
	genre_id INT,
	category_id INT,
	format_id INT,
	loaned_to VARCHAR(30)
);

CREATE TABLE genres (
	id SERIAL4 PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
	id SERIAL4 PRIMARY KEY,
	name VARCHAR(11) NOT NULL
);

CREATE TABLE formats (
	id SERIAL4 PRIMARY KEY,
	name VARCHAR(15) NOT NULL
);

INSERT INTO genres (name) VALUES ('Art and Photography');
INSERT INTO genres (name) VALUES ('Autobiography');
INSERT INTO genres (name) VALUES ('Biography');
INSERT INTO genres (name) VALUES ('Business and Law');
INSERT INTO genres (name) VALUES ('Children');
INSERT INTO genres (name) VALUES ('Computing');
INSERT INTO genres (name) VALUES ('Crafts and Hobbies');
INSERT INTO genres (name) VALUES ('Crime and Thriller');
INSERT INTO genres (name) VALUES ('Education');
INSERT INTO genres (name) VALUES ('Entertainment');
INSERT INTO genres (name) VALUES ('Fantasy');
INSERT INTO genres (name) VALUES ('Food and Drink');
INSERT INTO genres (name) VALUES ('Graphic Novel');
INSERT INTO genres (name) VALUES ('History');
INSERT INTO genres (name) VALUES ('Home and Garden');
INSERT INTO genres (name) VALUES ('Horror');
INSERT INTO genres (name) VALUES ('Humour');
INSERT INTO genres (name) VALUES ('Medical and Health');
INSERT INTO genres (name) VALUES ('Mind, Body and Spirit');
INSERT INTO genres (name) VALUES ('Natural History');
INSERT INTO genres (name) VALUES ('Personal Development');
INSERT INTO genres (name) VALUES ('Poetry and Drama');
INSERT INTO genres (name) VALUES ('Reference');
INSERT INTO genres (name) VALUES ('Religion');
INSERT INTO genres (name) VALUES ('Romance');
INSERT INTO genres (name) VALUES ('Science-Fiction');
INSERT INTO genres (name) VALUES ('Science and Geography');
INSERT INTO genres (name) VALUES ('Sport');
INSERT INTO genres (name) VALUES ('Travel');

INSERT INTO categories (name) VALUES ('Fiction');
INSERT INTO categories (name) VALUES ('Non-Fiction');

INSERT INTO formats (name) VALUES ('Audio');
INSERT INTO formats (name) VALUES ('eBook');
INSERT INTO formats (name) VALUES ('Hardback');
INSERT INTO formats (name) VALUES ('Paperback');
INSERT INTO formats (name) VALUES ('Trade paperback');

INSERT INTO books (title,author,genre_id,category_id,format_id,loaned_to)
VALUES ('Knights of Dark Renown','David Gemmell',11,1,4,'');

INSERT INTO books (title,author,genre_id,category_id,format_id,loaned_to)
VALUES ('Playing To Win','Michael Gordon',28,2,1,'');

INSERT INTO books (title,author,genre_id,category_id,format_id,loaned_to)
VALUES ('Wassup?','Girly Girl',7,1,2,'');

INSERT INTO books (title,author,genre_id,category_id,format_id,loaned_to)
VALUES ('Yada Yada Yada','That Fella',3,2,3,'Kill Bill');

INSERT INTO books (title,author,genre_id,category_id,format_id,loaned_to)
VALUES ('The Warlock of Firetop Mountain','Steve Jackson, Ian Livingstone',11,1,4,'');

INSERT INTO books (title,author,genre_id,category_id,format_id,loaned_to)
VALUES ('An Unfinished Life: John F. Kennedy, 1917-1963','Robert Dallek',3,2,4,'Rob Stewart');