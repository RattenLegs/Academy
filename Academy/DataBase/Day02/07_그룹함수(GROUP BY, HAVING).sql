
--그룹함수 AVG, MAX, MIN, SUM, COUNT

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees; -- 표본: 해당 테이블 자체

SELECT COUNT(*) FROM employees; -- 총 행 데이터의 수, null포함
SELECT COUNT(first_name) FROM employees; -- 
SELECT COUNT(commission_pct) FROM employees; -- null이 아닌 행의 수
SELECT COUNT(manager_id) FROM employees; -- null이 아닌 행의 수

--부서별로 그룹화, 그룹함수의 사용
--에러코드 보는법
SELECT
    department_id,
    AVG(salary)
FROM employees --에러
GROUP BY department_id;
-- 그룹함수(AVG)가 단독적으로 존재했을때 그룹화하지 않으면 
-- 데이터는 테이블 전체 데이터를 기준으로 평균을 구할수있음
-- 일반 컬럼까지 추가되면 그룹을 지어야함 department_id를 그룹화시켜야함
-- (이해 추가)


-- GROUP BY절을 사용할때 GROUP 절에 묶이지 않으면 다른 컬럼을 조회할 수 없습니다.
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;
--GROUP BY절 2개 이상 사용

SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

SELECT
    department_id,
    SUM(salary)
FROM employees
WHERE SUM(salary) > 100000
GROUP BY department_id;
--WHERE은 FROM 다음

SELECT
    department_id,
    SUM(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;
--HAVING(그룹화 후 조건 걸기)

SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >=20;

-- 부서 아이디가 50 이상인것들을 그룹화시키고, 그룹 월급 평균 중 5000 이상만 조회
SELECT 
        department_id, 
        AVG(salary) AS 평균
FROM employees
WHERE department_id > 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;

--
SELECT
    department_id,
    AVG(salary) AS 평균
FROM employees
WHERE department_id >=50
GROUP BY department_id
HAVING AVG(salary) > = 5000
ORDER BY department_id DESC;






-- 과제해답

-- 문제 1
SELECT
    job_id,
    COUNT(*) AS 사원수
FROM employees
GROUP BY job_id;

SELECT 
    job_id,
    AVG(salary) AS 평균월급
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;

-- 문제 2
SELECT
    TO_CHAR(hire_date, 'YY'),
    COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YY');

-- 문제 3
SELECT
    department_id,
    AVG(salary)
FROM employees
WHERE salary >= 8000
GROUP BY department_id
HAVING AVG(salary) >= 5000;
--국어와 연동이 안되는 치명적인 문제 발생

-- 문제 4
SELECT
    department_id,
    TRUNC(AVG(salary + salary*commission_pct), 2) AS 평균,
    COUNT (*)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;