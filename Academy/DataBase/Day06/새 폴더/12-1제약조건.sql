
-- ���̺� ������ ��������

--���̺� ������ ��������(PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�(�ֿ� Ű)
-- UNIQUE: ������ ���� ���� �ϴ� �÷�(�ߺ��� ����)
-- NOT NULL: null���� ������� ����(�ʼ���)
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���

DROP TABLE dept2;

CREATE TABLE dept2(
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk,
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);

-- ���̺��� ��������(��� �� ������ ���������� ���ϴ� ���)
CREATE TABLE dept2(
    dept_no NUMBER(2)
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4)
    dept_date DATE,
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no),
    CONSTRAINT dept_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_deptdate_uk UNIQUE(dept_date),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
); 

-- �ܷ�Ű(foreign key)�� �θ����̺� ���ٸ� INSERT�� �Ұ���
INSERT INTO dept2
VALUES(10, 'gg', 4000, sysdate, 100000, 'M');

INSERT INTO dept2
VALUES(10, 'hh', 1800, sysdate, 100000, 'M');

UPDATE dept2
SET loca = 4000
WHERE loca = 1800; -- ����

SELECT * FROM dept2;

UPDATE locations
SET location_id = 4000
WHERE location_id = 1800;

-- ���� ���� ����
-- ���������� �߰�, ������ �����մϴ�. ������ �ȵ˴ϴ�.
-- �����Ϸ��� �����ϰ� ���ο� �������� �߰��ؾ� �մϴ�.

DROP TABLE dept2;

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);

-- PK �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);
-- FK �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept_loca_fk
FOREIGN KEY(loca) REFERENCES locations(location_id);
-- check �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'));
-- unique �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptdate_uk UNIQUE(dept_date);
-- NOT NULL�� �� �������·� �����մϴ�.
ALTER TABLE dept2 MODIFY dept_date DATE NOT NULL;

-- �������� ����(�������� �̸�����)
ALTER TABLE dept2 DROP CONSTRAINT dept_no_pk;

-- �������� Ȯ��
SELECT * FROM user_constraints


-- �������� 
-- ���� 1
CREATE TABLE members(
    m_name VARCHAR2(20) NOT NULL,
    m_num NUMBER(3) CONSTRAINT mem_memnum_pk PRIMARY KEY,
    reg_date DATE NOT NULL CONSTRAINT mem_regdate_uk UNIQUE,
    gender VARCHAR2(5),
    loca NUMBER(4) CONSTRAINT mem_loca_loc_locid_fk REFERENCES locations(location_id)
    -- CONSTRAINT mem_loca_loc_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id)
    );
    
    SELECT * FROM user_constraints
    WHERE table_name = 'MEMBERS';

INSERT INTO members --4�� ����
