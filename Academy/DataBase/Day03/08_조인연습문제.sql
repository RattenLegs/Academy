-- ���� 1

SELECT * 
FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id; -- 106��

SELECT *
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id; -- 107��

SELECT *
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id; -- 122��

SELECT *
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;  123��

--���� 2

SELECT 
    e.first_name || ' ' || e.last_name AS �̸�,
    e.department_id
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 200;

-- ����3

SELECT e.first_name, e.job_id, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.first_name ASC;

--���� 4

SELECT *
FROM jobs j LEFT OUTER JOIN job_history h
ON j.job_id = h.job_id;

-- ����5

select 
    e.first_name || ' ' || e.last_name AS,
    d.department_name
FROM employees e 
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE first_name = 'Steven' 
AND last_name = 'King';

-- ����6
SELECT *
FROM employees e
CROSS JOIN departments d;

/*
1. EMPLOYEES ���̺�� DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ� ���� INNER, LEFT OUTER, RIGHT OUTER, FULL OUTER �����Ͻÿ�(�޶����� ���� ���� Ȯ��).

2. EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�Ͻÿ�.
����) employee_id�� 200�� ����� �̸�, department_id�� ����Ͻÿ�.
����) �̸� �÷��� first_name�� last_name�� ���� ����մϴ�.

3. EMPLOYEES, JOBS ���̺��� INNER JOIN�Ͻÿ�.

����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����Ǿ� �ִ��� Ȯ��

4. JOBS ���̺�� JOB_HISTORY ���̺��� LEFT OUTER JOIN�Ͻÿ�.

5. Steven King�� �μ����� ����Ͻÿ�.

6. EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross Join) ó���Ͻÿ�.
*/

-- ���� 7

SELECT e.employee_id, e.first_name, e.salary, d.department_name, loc.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations loc
ON d.location_id = loc.location_id
WHERE job_id = 'SA_MAN';

-- ���� 8
SELECT e.employee_id, e.first_name, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE j.job_title = 'Stock Manager'
OR j.job_title = 'Stock Clerk';

SELECT e.employee_id, e.first_name, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE j.job_title IN('Stock Manager', 'Stock Clerk');

-- ���� 9

SELECT d.department_name
FROM departments d LEFT OUTER JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id is null;

-- ����10

SELECT 
    e1.first_name, e2.first_name AS manager_name
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;

-- ����11
SELECT
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.job_id, e2.salary
FROM employees e1 LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e1.salary DESC;

/*
7. EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ����Ͻÿ�. (Alias ���)

8. employees, jobs ���̺��� ���� �����ϰ� job_title�� ��Stock Manager', 'Stock Clerk'�� ���� ������ ����Ͻÿ�.

9. departments ���̺��� ������ ���� �μ��� ã�� ����Ͻÿ�. (LEFT OUTER JOIN ���)

10. join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����Ͻÿ�.
��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����Ͻÿ�.

11.
6�� �������� LEFT JOIN�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �޿����� ����Ͻÿ�.
�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����Ͻÿ�.


*/