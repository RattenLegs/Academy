
--�׷��Լ� AVG, MAX, MIN, SUM, COUNT

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees; -- ǥ��: �ش� ���̺� ��ü

SELECT COUNT(*) FROM employees; -- �� �� �������� ��, null����
SELECT COUNT(first_name) FROM employees; -- 
SELECT COUNT(commission_pct) FROM employees; -- null�� �ƴ� ���� ��
SELECT COUNT(manager_id) FROM employees; -- null�� �ƴ� ���� ��

--�μ����� �׷�ȭ, �׷��Լ��� ���
--�����ڵ� ���¹�
SELECT
    department_id,
    AVG(salary)
FROM employees --����
GROUP BY department_id;
-- �׷��Լ�(AVG)�� �ܵ������� ���������� �׷�ȭ���� ������ 
-- �����ʹ� ���̺� ��ü �����͸� �������� ����� ���Ҽ�����
-- �Ϲ� �÷����� �߰��Ǹ� �׷��� ������� department_id�� �׷�ȭ���Ѿ���
-- (���� �߰�)


-- GROUP BY���� ����Ҷ� GROUP ���� ������ ������ �ٸ� �÷��� ��ȸ�� �� �����ϴ�.
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;
--GROUP BY�� 2�� �̻� ���

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
--WHERE�� FROM ����

SELECT
    department_id,
    SUM(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;
--HAVING(�׷�ȭ �� ���� �ɱ�)

SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >=20;

-- �μ� ���̵� 50 �̻��ΰ͵��� �׷�ȭ��Ű��, �׷� ���� ��� �� 5000 �̻� ��ȸ
SELECT 
        department_id, 
        AVG(salary) AS ���
FROM employees
WHERE department_id > 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;

--
SELECT
    department_id,
    AVG(salary) AS ���
FROM employees
WHERE department_id >=50
GROUP BY department_id
HAVING AVG(salary) > = 5000
ORDER BY department_id DESC;






-- �����ش�

-- ���� 1
SELECT
    job_id,
    COUNT(*) AS �����
FROM employees
GROUP BY job_id;

SELECT 
    job_id,
    AVG(salary) AS ��տ���
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;

-- ���� 2
SELECT
    TO_CHAR(hire_date, 'YY'),
    COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YY');

-- ���� 3
SELECT
    department_id,
    AVG(salary)
FROM employees
WHERE salary >= 8000
GROUP BY department_id
HAVING AVG(salary) >= 5000;
--����� ������ �ȵǴ� ġ������ ���� �߻�

-- ���� 4
SELECT
    department_id,
    TRUNC(AVG(salary + salary*commission_pct), 2) AS ���,
    COUNT (*)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;