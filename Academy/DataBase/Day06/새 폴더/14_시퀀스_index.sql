
-- ������(���������� �����ϴ� ���� ������ִ� ��ü)
SELECT * FROM user_sequences;

-- ������ ����
CREATE SEQUENCE dept2_seq
    START WITH 1 -- ���۰� (�⺻���� �����Ҷ� �ּҰ�, �����Ҷ� �ִ밪)
    INCREMENT BY 1 -- ������ (���: ����, ����: ����, �⺻�� 1)
    MAXVALUE 10 -- �ִ밪(�޸� �����)(�⺻�� ���� 1027, ���� -1)
    MINVALUE 1 -- �ּҰ�(�⺻�� ������: 1, ���ҽ�: -1028)
    NOCACHE -- ĳ�ø޸� ��뿩��(�⺻�� CACHE)
    NOCYCLE; --��ȯ����(NOCYCLE�� �⺻, ��ȯ��Ű���� CYCLE)
    
CREATE TABLE dept3(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);

RENAME dept2_seq TO dept3_seq; --���̺��� ALTER TABLE, �������� �׳ɹٷ�Ȯ

-- ������ ����ϱ�(NEXTVAL, CURRVAL)
INSERT INTO dept3
VALUES(dept3_seq.NEXTVAL, 'test', 'test', sysdate);

SELECT * FROM dept3;

SELECT dept3_seq.CURRVAL FROM dual;

-- ������ ����(���� ���� ����)
-- START WITH�� ������ �Ұ����մϴ�
ALTER SEQUENCE dept3_seq MAXVALUE 9999; -- �ִ밪 ����

DROP SEQUENCE dept3_seq;

/*
- index
index�� primary key, unique ���� ���ǿ��� �ڵ����� �����ǰ�,
��ȸ�� ������ ���ִ� hint ������ �մϴ�
index�� ��ȸ�� ������ ������,
�������ϰ� ���� �ε����� �����ؼ� ����ϸ� ������ ���� ���ϸ� ����ų �� �̽��ϴ�
���� �ʿ��Ѷ��� index�� ����ϴ� ���� �ùٸ��ϴ�.
*/

SELECT * FROM employees WHERE first_name = 'Nancy';


CREATE TABLE tbl_board(
    bno NUMBER(10) PRIMARY KEY,
    writer VARCHAR2(20)
);


-- �ε��� �߰�
CREATE INDEX emp_first_name_idx ON employees(first_name);

/*
- �ε����� ����Ǵ� ��� 
1. �÷��� WHERE �Ǵ� �������ǿ��� ���� ���Ǵ� ���
2. ���� �������� ���� �����ϴ� ���
3. ���̺��� ������ ���
4. Ÿ�� �÷��� ���� ���� null���� �����ϴ� ���.
5. ���̺��� ���� �����ǰ�, �̹� �ϳ� �̻��� �ε����� ������ �ִ� ��쿡��
 �������� �ʽ��ϴ�.
*/