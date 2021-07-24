CREATE TABLE Location
(
    loc_id NUMERIC(5) PRIMARY KEY,
    loc_name VARCHAR(100) NOT NULL,
    loc_shortname VARCHAR(50) NOT NULL
);

CREATE SEQUENCE seq_location
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE Members
(
    mem_id NUMERIC(5) PRIMARY KEY,
    mem_fname VARCHAR(50) NOT NULL,
    mem_mname VARCHAR(50),
    mem_lname VARCHAR(50) NOT NULL,
    mem_phonenum CHAR(10),
    mem_email VARCHAR(50) NOT NULL,
    mem_houseno NUMERIC(5) NOT NULL,
    mem_streetno NUMERIC(5) NOT NULL,
    mem_streetname VARCHAR(100) NOT NULL,
    mem_suburb VARCHAR(50) NOT NULL,
    mem_state VARCHAR(20) NOT NULL,
    mem_postcode CHAR(5) NOT NULL
);

CREATE SEQUENCE seq_members
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE Album
(
    alb_id NUMERIC(5) PRIMARY KEY,
    alb_title VARCHAR(50) NOT NULL,
    alb_description VARCHAR(200) NOT NULL,
    alb_noviews NUMERIC(8) NOT NULL
);

CREATE SEQUENCE seq_album
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE Photo
(
    pho_title VARCHAR(50) NOT NULL,
    pho_description VARCHAR(50) NOT NULL,
    pho_privacy VARCHAR(20) NOT NULL,
    pho_uploaddate DATE NOT NULL,
    pho_noviews NUMERIC(8) NOT NULL,
    mem_id NUMERIC(5),
    alb_id NUMERIC(5) NOT NULL,
    loc_id NUMERIC(5) NOT NULL,
    CONSTRAINT      pk_photo        PRIMARY KEY (pho_title, alb_id, loc_id),
    CONSTRAINT      fk_pho_mem      FOREIGN KEY(mem_id)
                                    REFERENCES Members(mem_id) ON DELETE SET NULL,
    CONSTRAINT      fk_pho_alb      FOREIGN KEY(alb_id)
                                    REFERENCES Album(alb_id),
    CONSTRAINT      fk_pho_loc      FOREIGN KEY(loc_id)
                                    REFERENCES Location(loc_id)
);

CREATE TABLE Comment
(
    comm_postdate DATE NOT NULL,
    comm_content VARCHAR(200) NOT NULL,
    pho_title VARCHAR(50) NOT NULL,
    loc_id NUMERIC(5) NOT NULL,
    alb_id NUMERIC(5) NOT NULL,
    CONSTRAINT      pk_comment      PRIMARY KEY (comm_postdate, pho_title, loc_id, alb_id),
    CONSTRAINT      fk_comm_pho     FOREIGN KEY (pho_title, alb_id, loc_id)
                                    REFERENCES Photo(pho_title, alb_id, loc_id)
);

CREATE TABLE Tag
(
    tag_id NUMERIC(5) PRIMARY KEY,
    tag_description VARCHAR(50) NOT NULL
);

CREATE SEQUENCE seq_tag
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE PhotoTag
(
    photag_id NUMERIC(5) PRIMARY KEY,
    pho_title VARCHAR(50) NOT NULL,
    loc_id NUMERIC(5) NOT NULL,
    alb_id NUMERIC(5) NOT NULL,
    tag_id NUMERIC(5) NOT NULL,
    CONSTRAINT      fk_photag_pho   FOREIGN KEY(pho_title, alb_id, loc_id)
                                    REFERENCES Photo(pho_title, alb_id, loc_id),
    CONSTRAINT      fk_photag_tag   FOREIGN KEY(tag_id)
                                    REFERENCES Tag(tag_id)
);

CREATE SEQUENCE seq_phototag
    START WITH 1
    INCREMENT BY 1;
