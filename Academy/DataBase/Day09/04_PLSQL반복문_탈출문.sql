
-- WHILE문

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

-- 탈출문
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

-- FOR문

DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .을 두개 작성해서 범위 표현
    LOOP
        dbms_output.put_line(v_num || 'x' || i || ' = ' || v_num * i);
    END LOOP;
END;

-- CONTINUE 문

DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .을 두개 작성해서 범위 표현
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || ' = ' || v_num * i);
    END LOOP;
END;

-- 1. 모든 구구단을 출력하는 '익명 블록'을 만드시오. (2~9단)
-- '단수'도 반복되어야 함 > 중첩 반복문(LOOP 안에 LOOP)
-- 단은 고정, 행만 1~9까지 하나씩 올라가는데,
-- 한 단이 다 출력되면 다음 단도 올라감, 어디에 반복문을 배치해야하는가?

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


-- 2. INSERT를 300번 실행하는 익명 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요. (bno writer title 컬럼이 존재한다.)
-- bno는 SEQUENCE로 올려 주시고, writer와 title에 번호를 붙여서 INSERT 진행해 주세요.
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