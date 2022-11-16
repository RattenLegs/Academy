
-- 시퀀스(순차적으로 증가하는 값을 만들어주는 객체)
SELECT * FROM user_sequences;

-- 시퀀스 생성
CREATE SEQUENCE dept2_seq
    START WITH 1 -- 시작값 (기본값은 증가할때 최소값, 감소할때 최대값)
    INCREMENT BY 1 -- 증가값 (양수: 증가, 음수: 감소, 기본값 1)
    MAXVALUE 10 -- 최대값(콤마 안찌금)(기본값 증가 1027, 감소 -1)
    MINVALUE 1 -- 최소값(기본값 증가시: 1, 감소시: -1028)
    NOCACHE -- 캐시메모리 사용여부(기본값 CACHE)
    NOCYCLE; --순환여부(NOCYCLE이 기본, 순환시키려면 CYCLE)
    
CREATE TABLE dept3(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);

RENAME dept2_seq TO dept3_seq; --테이블은 ALTER TABLE, 시퀀스는 그냥바로확

-- 시퀀스 사용하기(NEXTVAL, CURRVAL)
INSERT INTO dept3
VALUES(dept3_seq.NEXTVAL, 'test', 'test', sysdate);

SELECT * FROM dept3;

SELECT dept3_seq.CURRVAL FROM dual;

-- 시퀀스 수정(직접 수정 가능)
-- START WITH은 수정이 불가능합니다
ALTER SEQUENCE dept3_seq MAXVALUE 9999; -- 최대값 증가

DROP SEQUENCE dept3_seq;

/*
- index
index는 primary key, unique 제약 조건에서 자동으로 생성되고,
조회를 빠르게 해주는 hint 역할을 합니다
index는 조회를 빠르게 하지만,
무작위하게 많은 인덱스를 생성해서 사용하면 오히려 성능 부하를 일으킬 수 이습니다
정말 필요한때만 index를 사용하는 것이 올바릅니다.
*/

SELECT * FROM employees WHERE first_name = 'Nancy';


CREATE TABLE tbl_board(
    bno NUMBER(10) PRIMARY KEY,
    writer VARCHAR2(20)
);


-- 인덱스 추가
CREATE INDEX emp_first_name_idx ON employees(first_name);

/*
- 인덱스가 권장되는 경우 
1. 컬럼이 WHERE 또는 조인조건에서 자주 사용되는 경우
2. 열이 광범위한 값을 포함하는 경우
3. 테이블이 대형인 경우
4. 타겟 컬럼이 많은 수의 null값을 포함하는 경우.
5. 테이블이 자주 수정되고, 이미 하나 이상의 인덱스를 가지고 있는 경우에는
 권장하지 않습니다.
*/