
/*
lower(�ϰ� �ҹ���) 
initcap(�ձ��ڸ� �빮��) 
upper(�ϰ� �빮��)
*/

/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�
���� �� �࿡ �� column�� ��� �ִ� dummy ���̺��̴�.
�Ͻ����� ��� �����̳� ��¥ ���� ���� �ַ� ����Ѵ�.
��� ����ڰ� ������ �� �ִ�.
*/

SELECT 'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM dual;

SELECT last_name, lower(last_name), initcap(last_name), upper(last_name)
FROM employees;

SELECT last_name FROM employees
WHERE lower(last_name) = 'austin';
-- ��ҹ��ڸ� Ȯ���� �������� ���� ���¿��� '����� ���� �ҹ��ڷ� ��ȯ�ϸ� �̰Ŵ�?'
-- last_name�� �ҹ��ڰ� austin�̴�?

--length(����), instr(���� ã��. ������ 0�� ����, �ε�����.
SELECT 'abcdef' AS ex, LENGTH('abcdef'), INSTR('bcadef', 'a')
FROM dual;

SELECT first_name, LENGTH(first_name), INSTR(first_name, 'a')
FROM employees;

--substr(���ڿ� �ڸ���, ���ڿ� ���� �Լ�), 
--concat(���� ����, 2���ۿ� �ȵ�, �� �̻��� ������ �̿�)
--Ÿ ������ ��κ� INDEX���� 0������ �����ϴµ� SQL������ 1������ ����
SELECT 'abcdef' As ex,
SUBSTR('abcdef', 1, 4), CONCAT('abc', 'def')
FROM dual;

SELECT first_name, SUBSTR(first_name, 1, 3),
CONCAT(first_name, last_name) AS Ǯ����
FROM employees;

--LPAD, RPAD(��, ���� �������ڿ��� ä���)
SELECT LPAD('abc', 10, '*') FROM dual;
SELECT RPAD('abc', 10, '*') FROM dual;

--LTRIM(), RTRIM(), TRIM() ���� ����
SELECT LTRIM('javascript_java', 'java') FROM dual;
SELECT RTRIM('javascript_java', 'java') FROM dual;
SELECT TRIM('      JAVA       ') FROM dual;

--REPLACE()
SELECT REPLACE('My dream is a president', 'president', 'doctor')
FROM dual;

SELECT REPLACE('My dream is a president', ' ', '')
FROM dual;

SELECT REPLACE(REPLACE('My dream is a president', 'president', 'doctor'), ' ', '')
FROM dual;

SELECT REPLACE(CONCAT('hello', 'world!'), '!', '?')
FROM dual;

-- ��������

SELECT 
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name) , '*')   AS name, 
    LPAD(salary, 10, '*') AS salary
FROM employees
WHERE LOWER(job_id)='it_prog';
  

SELECT 
    CONCAT(first_name, last_name) AS �̸�,
    REPLACE(hire_date, '/', '') AS �Ի�����
FROM employees
ORDER BY �̸� ASC;

 SELECT 
    CONCAT('(02)', SUBSTR(phone_number, 4, LENGTH(phone_number))) AS phone_number
    
 FROM employees;