
/* Drop Triggers */

DROP TRIGGER TRI_Board_bno;
DROP TRIGGER TRI_Reply_rno;



/* Drop Tables */

DROP TABLE Admins CASCADE CONSTRAINTS;
DROP TABLE Reply CASCADE CONSTRAINTS;
DROP TABLE Board CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_Board_bno;
DROP SEQUENCE SEQ_Reply_rno;




/* Create Sequences */

CREATE SEQUENCE SEQ_Board_bno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reply_rno INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE Admins
(
	id varchar2(30) NOT NULL,
	updatedate date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE Board
(
	bno number(10) NOT NULL,
	title varchar2(30) NOT NULL,
	content varchar2(1500),
	writer varchar2(30) NOT NULL,
	PRIMARY KEY (bno)
);


CREATE TABLE Reply
(
	rno number(10) NOT NULL,
	content varchar2(500),
	writer varchar2(30) NOT NULL,
	bno number(10) NOT NULL,
	PRIMARY KEY (rno)
);


CREATE TABLE Users
(
	ID varchar2(30) NOT NULL,
	NAME varchar2(30) NOT NULL,
	REGDATE date,
	PRIMARY KEY (ID)
);



/* Create Foreign Keys */

ALTER TABLE Reply
	ADD FOREIGN KEY (bno)
	REFERENCES Board (bno)
;


ALTER TABLE Admins
	ADD FOREIGN KEY (id)
	REFERENCES Users (ID)
;


ALTER TABLE Board
	ADD FOREIGN KEY (writer)
	REFERENCES Users (ID)
;


ALTER TABLE Reply
	ADD FOREIGN KEY (writer)
	REFERENCES Users (ID)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_Board_bno BEFORE INSERT ON Board
FOR EACH ROW
BEGIN
	SELECT SEQ_Board_bno.nextval
	INTO :new.bno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Reply_rno BEFORE INSERT ON Reply
FOR EACH ROW
BEGIN
	SELECT SEQ_Reply_rno.nextval
	INTO :new.rno
	FROM dual;
END;

/




