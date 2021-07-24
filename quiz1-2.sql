CREATE TABLE photo
(
    photo_title VARCHAR(100) NOT NULL,
    photo_desc VARCHAR(1000) NOT NULL,
    photo_privacy VARCHAR(20) NOT NULL,
    photo_uploadDate DATE NOT NULL,
    photo_noViews VARCHAR(10) NOT NULL,
    members_id NUMERIC(5),
    album_id NUMERIC(5) NOT NULL,
    loc_id NUMERIC(5) NOT NULL,
    CONSTRAINT pk_photo PRIMARY KEY(photo_title, album_id, loc_id),
    CONSTRAINT fk_members FOREIGN KEY(members_id) REFERENCES members (members_id) ON DELETE SET NULL,
    CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES album(album_id) ON DELETE SET NULL,
    CONSTRAINT fk_loc FOREIGN KEY(loc_id) REFERENCES loc(loc_id) ON DELETE SET NULL
);

CREATE TABLE members
(
    members_id NUMERIC(5) PRIMARY KEY,
    members_fName VARCHAR(50) NOT NULL,
    members_mName VARCHAR(50),
    members_lName VARCHAR(50) NOT NULL,
    members_phoneNum CHAR(10),
    members_email VARCHAR(50) NOT NULL,
    members_houseNo NUMERIC(5) NOT NULL,
    members_streetNo NUMERIC(5) NOT NULL,
    members_streetName VARCHAR(200),
    members_suburb VARCHAR(50) NOT NULL,
    members_state VARCHAR(20) NOT NULL,
    members_postCode CHAR(5) NOT NULL
);

CREATE SEQUENCE seq_members_no
    start with 1
    INCREMENT BY 1;

CREATE TABLE loc
(
    loc_id NUMERIC(5) PRIMARY KEY,
    loc_name VARCHAR(100),
    loc_shortName VARCHAR(50)
);

CREATE SEQUENCE seq_location_no
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE album
(
    album_id NUMERIC(5) PRIMARY KEY,
    album_title VARCHAR(100),
    album_desc VARCHAR(1000),
    album_noViews VARCHAR(10)
);

CREATE SEQUENCE seq_album
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE comment
(
    comment_postDate DATE NOT NULL,
    comment_content VARCHAR(200) NOT NULL,
    photo_title VARCHAR(100) NOT NULL,
    album_id NUMERIC(5) NOT NULL,
    loc_id NUMERIC(5) NOT NULL,
    CONSTRAINT pk_comment PRIMARY KEY(comment_postDate, photo_title, album_id, loc_id),
    CONSTRAINT fk_comment_photo FOREIGN KEY(photo_title, album_id, loc_id) REFERENCES photo(photo_title, album_id, loc_id) ON DELETE SET NULL
);

CREATE TABLE tag
(
    tag_id NUMERIC(5) PRIMARY KEY,
    tag_title VARCHAR(100)
);

CREATE SEQUENCE seq_tag
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE photo_tag
(
    photoTag_id NUMERIC(5) PRIMARY KEY,
    photo_title VARCHAR(50) NOT NULL,
    album_id NUMERIC(5) NOT NULL,
    loc_id NUMERIC(5) NOT NULL,
    tag_id NUMERIC(5) NOT NULL,
    CONSTRAINT fk_photoTag_photo FOREIGN KEY(photo_title, album_id, loc_id) REFERENCES photo(photo_title, album_id, loc_id),
    CONSTRAINT fk_photoTag_tag FOREIGN KEY(tag_id) REFERENCES tag(tag_id) 
);

INSERT INTO loc
    VALUES(NEXTVAL(seq_location_no), 'Spanish Coast', 'Spain');

INSERT INTO loc
    VALUES(NEXTVAL(seq_location_no), 'Southern Italy', 'Italy');

INSERT INTO loc
    VALUES(NEXTVAL(seq_location_no), 'England', 'UK');

INSERT INTO members
    VALUES(NEXTVAL(seq_members_no), 'Tony', 'S', 'Stark', 12345678, 'tony@stark.inc', NULL, 1, 'Superhero Way', 'Los Angeles', 'California', 90210);

INSERT INTO members
    VALUES(NEXTVAL(seq_members_no), 'Pepper', 'P', 'Potts', 98765432, 'potts@stark.inc', NULL, 1, 'Superhero Way', 'Los Angeles', 'California', 90210);

INSERT INTO members
    VALUES(NEXTVAL(seq_members_no), 'Happy', 'H', 'Hogan', 54326789, 'happy@stark.inc', 2, 2, 'Common Place', 'Sacramento', 'California', 90210);

INSERT INTO album
    VALUES(NEXTVAL(seq_album), 'Spanish Holiday', 'Summer holidays in Spain', 10);

INSERT INTO album
    VALUES(NEXTVAL(seq_album), 'Vacationing in Italy', 'Solo southern Italy adventure', 250);

INSERT INTO album
    VALUES(NEXTVAL(seq_album), 'Historic England', 'School trip to England to study history', 5);

INSERT INTO photo
    VALUES ('Italy', 'Italian Riviera in Southern Italy', 'Public', '12 Jun 2019', 3);

INSERT INTO photo
    VALUES ('Spain', 'Spanish Coast in Spain', 'Public', '28 Mar 2019', 72);

INSERT INTO photo
    VALUES ('Stonehenge', 'School trip to study England history', 'Private', '1 April 2018', 74);

DROP TABLE tag;
DROP TABLE album;
DROP TABLE loc;
DROP TABLE members;
DROP TABLE comment;
DROP TABLE photo;

