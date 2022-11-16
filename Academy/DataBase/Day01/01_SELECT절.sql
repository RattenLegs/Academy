
--����Ŭ�� �ּ��Դϴ�.
/*SQL�� ���α׷��� �� ^�ƴϰ�^ ���� ����Դϴ�.*/

-- SELECT �÷���(������ ����) FROM ���̺� �̸�
SELECT * FROM employees;

SELECT employee_id, first_name, last_name FROM employees;

SELECT email, phone_number, hire_date
FROM employees;

--�÷��� ��ȸ�ϴ� ��ġ���� */+-������ �����մϴ�.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary+salary*0.1 AS supersalary /*�������� �ʴ� �÷��� ���� ���� */
FROM
    employees;
    
--NULL ���� Ȯ��(���� 0�̳� ����� �ٸ� ����)
--'����ִ�, �����Ͱ� �������� �ʴ´�'=NULL, ���߿� ���������� ���� NULL���� �������/������ ����
SELECT department_id, commission_pct
FROM employees;

--'��Ī'
--alias(�÷���, ���̺���� �̸��� �����ؼ� ��ȸ)= ali'as'
--�÷����� �ʹ� �� ��, 
--JOIN�� ����� ��, 
--������ �ȿ� ���������� �ۼ��Ҷ� �ٸ����̺��� �÷��� ������ ���
--�̸��� �� ���̺��� ������ �� ��Ī�� ����
SELECT first_name as �̸�, last_name as ��, salary
FROM employees;

--����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�
--���ڿ� �ȿ� Ȭ����ǥ�� ǥ���ϰ� �ʹٸ� ''�� �ι� �������� ���� �˴ϴ�.
--||->������

--first_name+last_name�� �����ϰ� ������ +��� || ' ' ||���



SELECT 
first_name || ' ' || last_name || '''s salary is $' || salary as �޿�����
FROM employees;

--DISTINCT (�ߺ� ���� ����)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

--ROWNUM, ROWID(���ȣ, ��ID)
--**ROWNUM: ������ ���� ��ȯ�Ǵ� �� ��ȣ ���
--ROWID: �����ͺ��̽����� ���� �ּҰ� ��ȯ
--�����ͺ��̽��� �Ҵ�� �޸� ������ ���� ���̰�, 
--���� �� �����Ͱ� �޸� �ּ� ����뿡 �ִ��� �˷���

--���߿� ������ ��ȣ�� �޾� ����¡ ó���� �Ҷ� ���
--(1���� 12-07-01~ �ٽõ��)

SELECT ROWNUM, ROWID, employee_id
FROM employees;