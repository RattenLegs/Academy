
/*
# PL/SQL �̶�
- ����Ŭ���� �����ϴ� SQL ���α׷��� ����̴�.
- �Ϲ����� ���α׷��ְ��� ���̰� ������, ����Ŭ ���ο��� ������ ó���� ���ؼ�
������ �� �� �ִ� ���������� �ڵ� �ۼ� ����Դϴ�.
- �������� �������� ��� ������ �ϰ�ó���ϱ� ���� �뵵�� ����մϴ�.
*/

SET SERVEROUTPUT ON; -- ��¹� Ȱ��ȭ

DECLARE -- ���� �����ϴ� ���� (�����)
    emp_num NUMBER; -- ���� ����(Ÿ��+������)
BEGIN  -- �ڵ带 �����ϴ� ���� ���� (�����)
    emp_num := 10; -- ���� ������ :=
    dbms_output.put_line(emp_num);
    dbms_output.put_line('hello pl/sql!!!');
END; -- PL/SQL�� ������ ���� (�����)

-- ������
-- �Ϲ� SQL���� ��� �������� ����� �����ϰ�,
-- **�� ������ �ǹ��մϴ�.

DECLARE
    A NUMBER := 2**2*3**2;
BEGIN
    dbms_output.put_line('a = ' || TO_CHAR(A));    
END;

/*
- DML��
DDL���� ����� �Ұ����ϰ�, �Ϲ����� SQL���� SELECT ���� ����ϴµ�,
Ư���� ���� SELECT�� �Ʒ��� INTO���� ����� ��ȸ����� ������ �Ҵ��� �� �ֽ��ϴ�.
*/

DECLARE
    v_emp_name VARCHAR2(50); -- ����� ���� (���ڿ� ������ �������� �ʼ�)
    v_dep_name VARCHAR2(50); -- �μ��� ����
BEGIN
    SELECT
        e.first_name, 
        d.department_name
    INTO
        v_emp_name, v_dep_name -- ������ ��ȸ�� ��� ������ �ǹ�
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 100;
    
    dbms_output.put_line(v_emp_name || '-' || v_dep_name);
END;

-- �ش� ���̺�� ���� Ÿ���� �÷� ������ �����Ϸ���
-- ���̺��.�÷���%TYPE�� ��������ν� Ÿ���� ������ Ȯ���ϴ� ���ŷο��� ������ �� �ֵ�.
DECLARE
    v_emp_name employees.first_name%TYPE; -- ã�Ƽ� ����(���� �߿� ����)
    v_dep_name departments.department_name%TYPE;
BEGIN
    SELECT
        e.first_name, 
        d.department_name
    INTO
        v_emp_name, v_dep_name -- ������ ��ȸ�� ��� ������ �ǹ�
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(v_emp_name || '-' || v_dep_name);
END;