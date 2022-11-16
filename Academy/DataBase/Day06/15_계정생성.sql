
-- ����� ���� Ȯ��
SELECT * FROM all_users;

-- ���� ���� ���
CREATE USER user1 IDENTIFIED BY user1;

-- DCL: GRANT(���� �ο�), REVOKE(���� ȸ��)
/*
CREATE USER -> �����ͺ��̽� ���� ���� ����
CREATE SESSION -> �����ͺ��̽� ���� ����
CREATE TABLE -> ���̺� ���� ����
CREATE VIEW -> �� ���� ����
CREATE SEQUENCE -> ������ ���� ����
ALTER ANY TABLE -> ��� ���̺� ������ �� �ִ� ����.
INSERT ANY TABLE -> ��� ���̺��� �����͸� �����ϴ� ����.
SELECT ANY TABLE....

SELECT ON [���̺� �̸�] TO [���� �̸�] -> Ư�� ���̺� ��ȸ�� �� �ִ� ����.
INSERT ON....
UPDATE ON....

-- �����ڿ� ���ϴ� ������ �ο��ϴ� ����.
RESOURCE, CONNECT, DBA TO [���� �̸�]
*/
GRANT CREATE SESSION TO user1;

GRANT SELECT ON hr.employees TO user1;

GRANT CONNECT, RESOURCE TO user1;

CREATE TABLE t_test (
    bno NUMBER(3) 
);

CREATE SEQUENCE t_test_seq;

INSERT INTO t_test VALUES(t_test_seq.NEXTVAL);

SELECT * FROM t_test;

REVOKE CONNECT, RESOURCE FROM user1;

-- ����� ���� ����
-- DROP USER [�����̸�] CASCADE;
-- -> CASCADE ���� �� -> ���̺� ������ �����Ѵٸ� ���� ���� �ȵ�.
DROP USER user1 CASCADE;


SELECT * FROM dba_tab_privs
WHERE grantee='user1';

CREATE USER test1 IDENTIFIED BY test1;

GRANT CREATE SESSION TO test1;

GRANT CONNECT, RESOURCE TO test1;

/*
���̺� �����̽��� �����ͺ��̽� ��ü �� ���� �����Ͱ� ����Ǵ� �����Դϴ�.
���̺� �����̽��� �����ϸ� ������ ��ο� ���� ���Ϸ� ������ �뷮��ŭ��
������ ������ �ǰ�, �����Ͱ� ���������� ����˴ϴ�.
�翬�� ���̺� �����̽��� �뷮�� �ʰ��Ѵٸ� ���α׷��� ������������ �����մϴ�.
*/

SELECT * FROM dba_tablespaces;

-- USERS ���̺� �����̽��� �⺻ ��� �������� ����.
ALTER USER user1 DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users;














