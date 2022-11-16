
SELECT * FROM employees;

--WHERE절 비교 (데이터 값은 대/소문자를 구분합니다)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';

SELECT * FROM employees
WHERE last_name = 'King';

SELECT * FROM employees
WHERE department_id = 90;

SELECT * FROM employees
WHERE salary >= 15000;

SELECT * FROM employees
WHERE hire_date = '04/01/30';

--데이터 행 제한(BETWEEN, IN, LIKE)
--BETWEEN: ~랑 ~사이
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

--IN 연산자의 사용(특정 값들과 비교할때 사용)

--manager_id가 100, 101, 102인 사람들 다 조회
SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN('IT_PROG', 'AD_VP');

--LIKE 연산자 
--%는 뭐든, _는 데이터의 위치를 찾아낼 때
SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '03%';
--03% =03으로 시작하는 모든 데이터 다 가져옴

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%15';
--%15 =15로 끝나고 나머지는 다 가져옴

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';
--%05% =앞뒤 상관없이 05 들어가면 됨

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%';
-- _ =자리를 뜻함, ___ =3자리 상관X, 즉 %의 세분화버전

--IS NULL (null값을 찾음)
SELECT * FROM employees
WHERE manager_id IS NULL;
--IS NOT NULL
SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

/*논리 연산자: 좌항과 우항의 논리값 둘 다 있을때
그 논리값을 연산해서 하나의 결과 논리값을 도출
AND, OR
AND가 OR보다 연산순서가 빠름
AND: 둘다 TRUE여야 TRUE, ex) ID/PW
*/
SELECT * FROM employees
WHERE job_id = 'IT_PROG' --좌항
OR job_id = 'FI_MGR'
AND salary >= 6000; --우항
/* 
일단 salary가 6000인 사람을 거르고 
그 안에서 IT_PROG나 FI_MGR을 찾아줌
*/
SELECT * FROM employees
WHERE (job_id = 'IT_PROG'

OR job_id = 'FI_MGR') -- 좌항
AND salary >=6000; -- 우항
--(): 얘부터 먼저 연산해!

--데이터의 정렬 (SELECT 구문의 가장 마지막에 배치)
--ASC: ascending 오름차순
--DESC: descending 내림차순
SELECT * FROM employees
ORDER BY hire_date ASC;

SELECT * FROM employees
ORDER BY hire_date DESC;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;

SELECT * FROM employees
WHERE salary >=5000
ORDER BY employee_id DESC;

SELECT first_name, salary * 12 AS pay
FROM employees
ORDER BY pay ASC;