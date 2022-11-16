
-- WHILE��

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
    
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        v_count := v_count + 1;
    END LOOP;
END;

-- Ż�⹮
DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
    
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        EXIT WHEN v_count = 5;
        v_count := v_count + 1;
    END LOOP;
END;

-- FOR��

DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .�� �ΰ� �ۼ��ؼ� ���� ǥ��
    LOOP
        dbms_output.put_line(v_num || 'x' || i || ' = ' || v_num * i);
    END LOOP;
END;

-- CONTINUE ��

DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .�� �ΰ� �ۼ��ؼ� ���� ǥ��
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || ' = ' || v_num * i);
    END LOOP;
END;

-- 1. ��� �������� ����ϴ� '�͸� ���'�� ����ÿ�. (2~9��)
-- '�ܼ�'�� �ݺ��Ǿ�� �� > ��ø �ݺ���(LOOP �ȿ� LOOP)
-- ���� ����, �ุ 1~9���� �ϳ��� �ö󰡴µ�,
-- �� ���� �� ��µǸ� ���� �ܵ� �ö�, ��� �ݺ����� ��ġ�ؾ��ϴ°�?

DECLARE
    v_num NUMBER := 2;
    i_num NUMBER := 1;
BEGIN 
    FOR v_num IN 2..9
        LOOP
            IF i_num < 10      
            THEN 
                FOR i_num IN 1..9
                LOOP DBMS_OUTPUT.PUT_line(v_num || '*' || i_num || '=' || v_num*i_num);  
                END LOOP;
            ELSE 
                i_num := 1;
            END IF;
        END LOOP;               
END;


-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno writer title �÷��� �����Ѵ�.)
-- bno�� SEQUENCE�� �÷� �ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT ������ �ּ���.
-- ex) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title3...

CREATE TABLE board (
    bno NUMBER(38),
    writer VARCHAR2(1000),
    title VARCHAR2(1000)
);

SELECT * FROM board;

SELECT board_seq.CURRVAL FROM dual;

CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
    

DROP SEQUENCE board_seq;
DROP TABLE board;    
ROLLBACK;

    
INSERT INTO board
VALUES(board_seq.NEXTVAL, 'test1', 'title1');    
    
    
DECLARE
    v_num NUMBER := 1;
BEGIN
    FOR v_num IN 1..300
        LOOP
            INSERT INTO board
            VALUES(v_num, 'test'||v_num, 'title'||v_num);                    
        END LOOP;
END;