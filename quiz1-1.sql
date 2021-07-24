CREATE TABLE photo
(
    photo_title VARCHAR(100) PRIMARY KEY,
    photo_desc VARCHAR(1000),
    photo_privacy VARCHAR(20),
    photo_uploadDate DATE,
    photo_noViews VARCHAR(10),
    members_id NUMERIC(5),
    album_id NUMERIC(5),
    loc_id NUMERIC(5),
    CONSTRAINT pk_photo PRIMARY KEY(photo_title, album_id, loc_id),
    CONSTRAINT fk_members FOREIGN KEY(members_id) REFERENCES members (members_id) ON DELETE SET NULL,
    CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES album(album_id) ON DELETE SET NULL,
    CONSTRAINT fk_loc FOREIGN KEY(loc_id) REFERENCES loc(loc_id) ON DELETE SET NULL
    );

    CREATE TABLE comment
    (
        comment_postDate DATE,
        comment_content VARCHAR(1000)
        CONSTRAINT pk_comment PRIMARY KEY(photo_title, comment_postDate),
        CONSTRAINT fk_photo FOREIGN KEY(photo_title) REFERENCES photo(photo_title) ON DELETE SET NULL
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
    START WITH 1
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

    CREATE TABLE tag
    (
        tag_title VARCHAR(100)
    );

    INSERT INTO loc
    VALUES(NEXTVAL(seq_location_no), 'Spanish Coast', 'Spain');

    INSERT INTO loc
    VALUES(NEXTVAL(seq_location_no), 'Southern Italy', 'Italy');

    INSERT INTO loc
    VALUES(NEXTVAL(seq_location_no), 'England', 'UK');

    INSERT INTO members
    VALUES(NEXTVAL(seq_members_no), 'Tony', 'S', 'Stark', 12345678, 'tony@stark.inc', NULL, 1, 'Superhero Way', 'Los Angeles', 'California', 90210);


    DROP TABLE tag;
    DROP TABLE album;
    DROP TABLE loc;
    DROP TABLE members;
    DROP TABLE comment;
    DROP TABLE photo;

