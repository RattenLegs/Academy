
-- 테이블 생성과 제약조건

--테이블 열레벨 제약조건(PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY)
-- PRIMARY KEY: 테이블의 고유 식별 컬럼입니다(주요 키)
-- UNIQUE: 유일한 값을 갖게 하는 컬럼(중복값 방지)
-- NOT NULL: null값을 허용하지 않음(필수값)
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼
-- CHECK: 정의된 형식만 저장되도록 허용

DROP TABLE dept2;

CREATE TABLE dept2(
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk,
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);

-- 테이블레벨 제약조건(모든 열 선언후 제약조건을 취하는 방식)
CREATE TABLE dept2(
    dept_no NUMBER(2)
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4)
    dept_date DATE,
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no),
    CONSTRAINT dept_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_deptdate_uk UNIQUE(dept_date),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
); 

-- 외래키(foreign key)가 부모테이블에 없다면 INSERT가 불가능
INSERT INTO dept2
VALUES(10, 'gg', 4000, sysdate, 100000, 'M');

INSERT INTO dept2
VALUES(10, 'hh', 1800, sysdate, 100000, 'M');

UPDATE dept2
SET loca = 4000
WHERE loca = 1800; -- 실패

SELECT * FROM dept2;

UPDATE locations
SET location_id = 4000
WHERE location_id = 1800;

-- 제약 조건 변경
-- 제약조건은 추가, 삭제가 가능합니다. 변경은 안됩니다.
-- 변경하려면 삭제하고 새로운 내용으로 추가해야 합니다.

DROP TABLE dept2;

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);

-- PK 추가
ALTER TABLE dept2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);
-- FK 추가
ALTER TABLE dept2 ADD CONSTRAINT dept_loca_fk
FOREIGN KEY(loca) REFERENCES locations(location_id);
-- check 추가
ALTER TABLE dept2 ADD CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'));
-- unique 추가
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptdate_uk UNIQUE(dept_date);
-- NOT NULL은 열 수정형태로 변경합니다.
ALTER TABLE dept2 MODIFY dept_date DATE NOT NULL;

-- 제약조건 삭제(제약조건 이름으로)
ALTER TABLE dept2 DROP CONSTRAINT dept_no_pk;

-- 제약조건 확인
SELECT * FROM user_constraints


-- 연습문제 
-- 문제 1
CREATE TABLE members(
    m_name VARCHAR2(20) NOT NULL,
    m_num NUMBER(3) CONSTRAINT mem_memnum_pk PRIMARY KEY,
    reg_date DATE NOT NULL CONSTRAINT mem_regdate_uk UNIQUE,
    gender VARCHAR2(5),
    loca NUMBER(4) CONSTRAINT mem_loca_loc_locid_fk REFERENCES locations(location_id)
    -- CONSTRAINT mem_loca_loc_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id)
    );
    
    SELECT * FROM user_constraints
    WHERE table_name = 'MEMBERS';

INSERT INTO members --4개 삽입
