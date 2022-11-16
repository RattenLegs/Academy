
--오라클의 주석입니다.
/*SQL은 프로그래밍 언어가 ^아니고^ 쿼리 언어입니다.*/

-- SELECT 컬럼명(여러개 가능) FROM 테이블 이름
SELECT * FROM employees;

SELECT employee_id, first_name, last_name FROM employees;

SELECT email, phone_number, hire_date
FROM employees;

--컬럼을 조회하는 위치에서 */+-연산이 가능합니다.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary+salary*0.1 AS supersalary /*실재하지 않는 컬럼도 연산 가능 */
FROM
    employees;
    
--NULL 값의 확인(숫자 0이나 공백과 다른 존재)
--'비어있다, 데이터가 존재하지 않는다'=NULL, 나중에 제약조건을 배우면 NULL값을 허용할지/말지도 결정
SELECT department_id, commission_pct
FROM employees;

--'별칭'
--alias(컬럼명, 테이블명의 이름을 변경해서 조회)= ali'as'
--컬럼명이 너무 길 때, 
--JOIN을 사용할 때, 
--쿼리문 안에 서브쿼리문 작성할때 다른테이블의 컬럼을 지목할 경우
--이름이 긴 테이블을 지목할 때 별칭을 붙임
SELECT first_name as 이름, last_name as 성, salary
FROM employees;

--오라클은 홑따옴표로 문자를 표현하고
--문자열 안에 홑따옴표를 표현하고 싶다면 ''를 두번 연속으로 쓰면 됩니다.
--||->연결자

--first_name+last_name을 연결하고 싶으면 +대신 || ' ' ||사용



SELECT 
first_name || ' ' || last_name || '''s salary is $' || salary as 급여내역
FROM employees;

--DISTINCT (중복 행의 제거)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

--ROWNUM, ROWID(행번호, 행ID)
--**ROWNUM: 쿼리에 의해 반환되는 행 번호 출력
--ROWID: 데이터베이스에서 행의 주소값 반환
--데이터베이스도 할당된 메모리 공간이 있을 것이고, 
--실제 그 데이터가 메모리 주소 어디쯤에 있는지 알려줌

--나중에 페이지 번호를 달아 페이징 처리를 할때 사용
--(1일차 12-07-01~ 다시듣기)

SELECT ROWNUM, ROWID, employee_id
FROM employees;