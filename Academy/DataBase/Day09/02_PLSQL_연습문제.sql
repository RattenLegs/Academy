
-- 1. 구구단 중 3단을 출력하는 익명 블록을 만들어 보자 (출력문 9개를 복사해서 쓰세요.)
-- 3*1, 3*2, 3*3 ... 

SET SERVEROUTPUT ON;


BEGIN
    dbms_output.put_line('3 x 1 = ' || 3*1); 
    dbms_output.put_line('3 x 2 = ' || 3*2);
    dbms_output.put_line('3 x 3 = ' || 3*3);
    dbms_output.put_line('3 x 4 = ' || 3*4);
    dbms_output.put_line('3 x 5 = ' || 3*5);
    dbms_output.put_line('3 x 6 = ' || 3*6);
    dbms_output.put_line('3 x 7 = ' || 3*7);
    dbms_output.put_line('3 x 8 = ' || 3*8);
    dbms_output.put_line('3 x 9 = ' || 3*9);
    
END;

-- 2. 사원 테이블에서 201번 사원의 이름과 이메일주소를 출력하는 익명 블록을 만들어보자
-- 변수에 담아서 출력하시오.

DECLARE
    v_emp_name employees.first_name%TYPE;
    v_emp_email employees.email%TYPE;
BEGIN

    SELECT 
        first_name, 
        email
    INTO v_emp_name,v_emp_email 
    FROM employees
    WHERE employee_id = '201';
    
    dbms_output.put_line(v_emp_name || ': ' || v_emp_email);
END;

-- 3. 사원 테이블(employees)에서 사원번호가 제일 큰 사원을 찾아낸 뒤(MAX함수 사용), 
-- 이 번호 + 1번으로 아래의 사원을 emps에
-- employee_id, last_name, email, hire_date, job_id를 신규 입력하는 익명 블록을 만드시오.
-- SELECT절 이후에 INSERT문 사용이 가능합니다.

/*
<사원명>: steven
<이메일>: stevenjobs
<입사일자>: 오늘날짜
<JOB_ID>: CEO
*/


DROP TABLE emps;
CREATE TABLE emps AS (SELECT * FROM employees WHERE 1 = 2);


DECLARE
    v_max_empno employees.employee_id%TYPE;
BEGIN

    SELECT MAX(employee_id)
    INTO v_max_empno
    FROM employees;
    
    INSERT INTO emps
        (employee_id, last_name, email, hire_date, job_id)
    VALUES
        (v_max_empno + 1, 'steven', 'stevenjobs', sysdate, 'CEO');

    COMMIT;

END;

SELECT * FROM emps;
