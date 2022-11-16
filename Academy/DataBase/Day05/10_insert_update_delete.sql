
-- insert
-- 테이블 구조 확인
-- DESCRIBE
DESC departments;

-- INSERT의 첫번째 방법(모든 컬럼 데이터를 한번에 지정)
INSERT INTO departments
VALUES(280, '개발자', null, 1700);

SELECT * FROM departments;

ROLLBACK;

-- INSERT의 두번째 방법(직접 컬럼을 지정하고 저장)
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES
    (280, '개발자', 1700);

--INSERT 연습
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES (290, '디자이너', 1700);
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES (310, '데이터분석가', 1800);
INSERT INTO departments
VALUES (320, '퍼블리셔', 200, 1800);
INSERT INTO departments
VALUES (330, '서버관리자', 200, 1800);

SELECT * FROM departments;
ROLLBACK;

SELECT * FROM employees;

CREATE TABLE managers AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM managers;

DROP TABLE managers;

-- WHERE 1=1(true): 테이블 컬럼 구조+안의 데이터까지 몽땅 복사해서 사본테이블로 생성
-- WHERE 1=2(false): 테이블 컬럼 구조만 복사, 안의 데이터 안가져옴

-- INSERT (INSERT와 서브쿼리문을 이용해 데이터를 집어넣을 수 있다.)
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees); 

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);

-- CTAS를 사용하면 제약조건(규칙)은 NOT NULL 말고는 복사되지 않습니다.
-- 제약조건은 업무규칙을 지키는 데이터만 저장하고, 그렇지 않은 것들이
-- DB에 저장되는 것을 방지하는 목적으로 사용합니다.
-- emps와 employees는 똑같아 보이지만 제약조건이 복사되지 않았습니다.

-- UPDATE를 진행할 때는 누구를 수정할지 잘 지목해야 합니다.
-- 그렇지 않으면 수정대상이 테이블 전체로 지목됩니다.

SELECT * FROM emps;

DROP TABLE emps;

27일 10번째 영상파일부터