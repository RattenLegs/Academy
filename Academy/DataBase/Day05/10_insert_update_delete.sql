
-- insert
-- ���̺� ���� Ȯ��
-- DESCRIBE
DESC departments;

-- INSERT�� ù��° ���(��� �÷� �����͸� �ѹ��� ����)
INSERT INTO departments
VALUES(280, '������', null, 1700);

SELECT * FROM departments;

ROLLBACK;

-- INSERT�� �ι�° ���(���� �÷��� �����ϰ� ����)
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES
    (280, '������', 1700);

--INSERT ����
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES (290, '�����̳�', 1700);
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES (310, '�����ͺм���', 1800);
INSERT INTO departments
VALUES (320, '�ۺ���', 200, 1800);
INSERT INTO departments
VALUES (330, '����������', 200, 1800);

SELECT * FROM departments;
ROLLBACK;

SELECT * FROM employees;

CREATE TABLE managers AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM managers;

DROP TABLE managers;

-- WHERE 1=1(true): ���̺� �÷� ����+���� �����ͱ��� ���� �����ؼ� �纻���̺�� ����
-- WHERE 1=2(false): ���̺� �÷� ������ ����, ���� ������ �Ȱ�����

-- INSERT (INSERT�� ������������ �̿��� �����͸� ������� �� �ִ�.)
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees); 

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);

-- CTAS�� ����ϸ� ��������(��Ģ)�� NOT NULL ����� ������� �ʽ��ϴ�.
-- ���������� ������Ģ�� ��Ű�� �����͸� �����ϰ�, �׷��� ���� �͵���
-- DB�� ����Ǵ� ���� �����ϴ� �������� ����մϴ�.
-- emps�� employees�� �Ȱ��� �������� ���������� ������� �ʾҽ��ϴ�.

-- UPDATE�� ������ ���� ������ �������� �� �����ؾ� �մϴ�.
-- �׷��� ������ ��������� ���̺� ��ü�� ����˴ϴ�.

SELECT * FROM emps;

DROP TABLE emps;

27�� 10��° �������Ϻ���