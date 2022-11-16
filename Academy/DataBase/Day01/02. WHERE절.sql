
SELECT * FROM employees;

--WHERE�� �� (������ ���� ��/�ҹ��ڸ� �����մϴ�)
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

--������ �� ����(BETWEEN, IN, LIKE)
--BETWEEN: ~�� ~����
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

--IN �������� ���(Ư�� ����� ���Ҷ� ���)

--manager_id�� 100, 101, 102�� ����� �� ��ȸ
SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN('IT_PROG', 'AD_VP');

--LIKE ������ 
--%�� ����, _�� �������� ��ġ�� ã�Ƴ� ��
SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '03%';
--03% =03���� �����ϴ� ��� ������ �� ������

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%15';
--%15 =15�� ������ �������� �� ������

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';
--%05% =�յ� ������� 05 ���� ��

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%';
-- _ =�ڸ��� ����, ___ =3�ڸ� ���X, �� %�� ����ȭ����

--IS NULL (null���� ã��)
SELECT * FROM employees
WHERE manager_id IS NULL;
--IS NOT NULL
SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

/*�� ������: ���װ� ������ ���� �� �� ������
�� ������ �����ؼ� �ϳ��� ��� ������ ����
AND, OR
AND�� OR���� ��������� ����
AND: �Ѵ� TRUE���� TRUE, ex) ID/PW
*/
SELECT * FROM employees
WHERE job_id = 'IT_PROG' --����
OR job_id = 'FI_MGR'
AND salary >= 6000; --����
/* 
�ϴ� salary�� 6000�� ����� �Ÿ��� 
�� �ȿ��� IT_PROG�� FI_MGR�� ã����
*/
SELECT * FROM employees
WHERE (job_id = 'IT_PROG'

OR job_id = 'FI_MGR') -- ����
AND salary >=6000; -- ����
--(): ����� ���� ������!

--�������� ���� (SELECT ������ ���� �������� ��ġ)
--ASC: ascending ��������
--DESC: descending ��������
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