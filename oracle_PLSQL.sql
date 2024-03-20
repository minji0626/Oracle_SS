PL/SQL : Procedural language extension to Structured Query Language(SQL)
            SQL을 확장한 순차적 처리 언어

PL/SQL의 기본 구조
PL/SQL의 기본 단위는 블록(block)
1) 선언부 (Declarative Part) : 사용할 변수나 상수를 선언
                                    (선언부에만 변수와 상수 선언 가능)
2) 실행부 (Executable Part) : 실제 처리할 로직을 담당하는 부분
3) 예외처리부(Exception-Building Part) : 실행부에서 로직을 처리하던 중 발생할 수 있는 각종 오류들에 대해 처리

실행부만 명시한 형태
BEGIN
   DBMS_OUTPUT.PUT_LINE('Hello World!');
END;

변수 사용
DECLARE
   -- 변수를 선언할 수 있는 선언부
   message VARCHAR2(100);
BEGIN
   -- 실행부에서 사용할 변수는 선언부에서 미리 선언되어야 함
   message := 'Hello World!';
      DBMS_OUTPUT.PUT_LINE(message);
END;

변수 선언과 초기화
DECLARE
--변수 선언 및 초기화
   message VARCHAR2(100) := 'Hello ORACLE!';
BEGIN
   DBMS_OUTPUT.PUT_LINE(message);
END;

DECLARE
-- 변수 선언 후 초기화를 하지 않으면  null 
counter INTEGER;
BEGIN
counter :=counter +1;
IF counter IS NULL THEN
   DBMS_OUTPUT.PUT_LINE('result : counter is null');
   END IF;
END;


DECLARE
--변수 선언
counter INTEGER;
i INTEGER;
BEGIN
   FOR i IN 1..9 LOOP
   counter := 2 * i;
   DBMS_OUTPUT.PUT_LINE('2*'|| i || '=' || counter);
   END LOOP;
END;

예외처리부
EXCEPTION WHEN 예외 1   THEN 예외처리1
               WHEN 예외 2   THEN 예외처리2
               WHEN OTHERS THEN 예외처리

DECLARE
   -- 변수 선언
   counter INTEGER;
BEGIN
   -- 변수 초기화
   counter := 10;
   counter := counter/0;
   DBMS_OUTPUT.PUT_LINE(counter);
   EXCEPTION WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('errors');
END;

변수와 상수

변수
emp_num1 NUMBER(9);
grade CHAR(2);
emp_num2 INTEGER := 1;

상수
nYear CONSTANT INTEGER := 30;    (o)
nYear CONSTANT INTEGER;           (x)

%TYPE : 참조할 테이블에 있는 컬럼의 데이터 타입을 자동으로 가져옴
nSal emp.sal%TYPE;

%ROWTYPE : %TYPE은 하나의 값에 대해 적용되지만, %ROWTYPE은 하나 이상의 값에 대해 적용
                   로우타입 변수를 선언해서 테이블에 있는 로우를 대입

컬렉션
 VARRAY는 VARIABLE ARRAY 의 약자로 고정 길이(Fixed Number)를 가진 배열

DECLARE
   TYPE VARRAY_TEST IS VARRAY(3) OF INTEGER;
   varray1 VARRAY_TEST; -- 위에서 선언한 VARRAY_TEST 타입 변수
BEGIN
   varray1 := VARRAY_TEST(10,20,30);
   DBMS_OUTPUT.PUT_LINE(varray1(1));
   DBMS_OUTPUT.PUT_LINE(varray1(2));
   DBMS_OUTPUT.PUT_LINE(varray1(3));
END;

중첩테이블 : varray와 흡사하지만 중첩테이블은 선언시에 전체 크기를 명시할 필요가 없다.

DECLARE
   TYPE NESTED_TEST IS TABLE OF VARCHAR2(10);
   nested1 NESTED_TEST;
BEGIN
   nested1 := NESTED_TEST('A','B','C','D');
   DBMS_OUTPUT.PUT_LINE(nested1(1));
   DBMS_OUTPUT.PUT_LINE(nested1(2));
   DBMS_OUTPUT.PUT_LINE(nested1(3));
   DBMS_OUTPUT.PUT_LINE(nested1(4));
END;

ASSOCIATIVE ARRAY (INDEX-BY TABLE) : 연관 배열
                        키와 값의 쌍으로 구성된 컬렉션
                        하나의 키는 하나의 값과 연관

DECLARE
   TYPE ASSOC_ARRAY_NUM_TYPE IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
-- 키는 PLS_INTEGER형이며, 값은 NUMBER형인 요소들로 구성
--(주의) 키에 PLS_INTEGER 형 대신 INTEGER를 사용하면 오류 발생
   assoc1 ASSOC_ARRAY_NUM_TYPE;
BEGIN
-- 키와 값 저장
   assoc1(3) := 33; -- 키가 3이고 값은 33이다.
   DBMS_OUTPUT.PUT_LINE(assoc1(3)); 
END;

레코드
테이블의 컬럼들이 서로 다른 유형의 데이터 타입으로 구성되듯이 
레코드 역시 해당 필드 (레코드에서는 요소란 말 대신 필드란 용어를 사용함)들이 각기 다른 데이터 타입을 가질 수 있음

DECLARE
-- TYPE으로 선언한 레코드
TYPE RECORD1 IS RECORD (deptno NUMBER NOT NULL := 50,
                                 dname VARCHAR2(14),
                                 loc VARCHAR2(13));
-- 위에서 선언한 record1을 받는 변수 선언
rec1 RECORD1;
BEGIN
--record1 타입의  rec1의 dname 필드에 값 할당.
rec1.dname := 'RECORD';
rec1.loc := 'Seoul';
--rec1 레코드 값을 dept 테이블에 insert
INSERT INTO dept VALUES rec1;
COMMIT;
EXCEPTION  WHEN OTHERS THEN ROLLBACK;
END; 

IF 문
DECLARE
   grade CHAR(1);
BEGIN
-- 변수의 초기화
   grade := 'B';
IF grade ='A' THEN
DBMS_OUTPUT.PUT_LINE('Excellent');
ELSIF grade ='B' THEN
DBMS_OUTPUT.PUT_LINE('Good');
ELSIF grade = 'C' THEN
DBMS_OUTPUT.PUT_LINE('Fair');
ELSIF grade = 'D' THEN
DBMS_OUTPUT.PUT_LINE('Poor');
END IF;
END;

CASE 문
DECLARE
grade CHAR(1);
BEGIN
grade :=('C');
   case grade
WHEN 'A' THEN
DBMS_OUTPUT.PUT_LINE('Excellent');
WHEN 'B' THEN
DBMS_OUTPUT.PUT_LINE('Good');
WHEN 'C' THEN
DBMS_OUTPUT.PUT_LINE('Fair');
WHEN 'D' THEN
DBMS_OUTPUT.PUT_LINE('Poor');
ELSE
DBMS_OUTPUT.PUT_LINE('NOT FOUND');
END case;
END;

LOOP 문
DECLARE
   test_number INTEGER;
   result_num INTEGER;
 BEGIN
   test_number :=1;
 LOOP
 result_num := 2 * test_number;
 IF result_num > 20 THEN
   EXIT; -- 블럭 종료
 ELSE
   DBMS_OUTPUT.PUT_LINE(result_num);
   END IF;
test_number := test_number + 1;
 END LOOP;
-- loop 블럭을 빠져나오면 아래 코드를 실행한다.
DBMS_OUTPUT.PUT_LINE('프로그램 종료');
END;


DECLARE
   test_number INTEGER;
   result_num INTEGER;
BEGIN
--변수 초기화
test_number := 1;
Loop
   result_num := 2 * test_number;
EXIT WHEN result_num > 20;          -- 조건 체크
DBMS_OUTPUT.PUT_LINE(result_num);
test_number := test_number + 1;
END LOOP;
END;

WHILE LOOP 문


DECLARE 
test_number INTEGER;
result_num INTEGER;
BEGIN
 test_number := 1;
 result_num := 0;
WHILE result_num > 20 LOOP
   result_num := 2 * test_number;
   DBMS_OUTPUT.PUT_LINE(result_num);
test_number := test_number + 1;
END LOOP;
END;


FOR .... LOOP 문

DECLARE
test_number INTEGER;
result_num INTEGER;
BEGIN
 FOR test_number IN 1..10 LOOP
result_num := 2 * test_number;
DBMS_OUTPUT.PUT_LINE(result_num);
END LOOP;
END;


DECLARE
test_number INTEGER;
result_num INTEGER;
BEGIN
 FOR test_number IN REVERSE 1..10 LOOP
result_num := 2 * test_number;
DBMS_OUTPUT.PUT_LINE(result_num);
END LOOP;
END;


CURSOR(커서) : 쿼리에 의해 반환되는 결과는 메모리 상에 위치하게 되는데 
                     PL/SQL에서는 바로 커서(CURSOR)를 사용하여 이 결과 집합에 접근할 수 있다.

DECLARE
-- 커서 선언 : 커서에 이름을 주고, 이 커서가 접근하려는 쿼리를 정의
CURSOR emp_csr IS
SELECT empno
FROM emp
WHERE deptno = 10;
emp_no emp.empno%TYPE;
BEGIN
-- 커서 열기 : 커서로 정의된 쿼리를 실행하는 역할
OPEN emp_csr;
Loop
   FETCH emp_csr into emp_no;
--%NOT FOUND : 커서에서만 사용 가능한 속성 더이상 패치(할당)할 로우가 없음을 의미한다
EXIT WHEN emp_csr%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(emp_no);
END LOOP;
CLOSE emp_csr;
END;

함수

입력받은 값으로부터 10%의 세율을 얻는 함수
CREATE OR REPLACE FUNCTION tax(p_value IN NUMBER)
   RETURN NUMBER
IS
BEGIN
   RETURN p_value * 0.1;
END;

SELECT TAX(100) FROM dual;
SELECT empno,ename, sal, TAX(sal) tax FROM emp;

급여와 커미션을 합쳐서 세금 계산
CREATE OR REPLACE FUNCTION tax2(p_sal IN emp.sal%TYPE,
                                                p_comm emp.comm%TYPE)
      RETURN NUMBER
IS 
BEGIN
RETURN (p_sal + NVL(p_comm , 0 ) ) * 0.1;
END;

SELECT empno, ename, sal+NVL(comm,0) "실급여", TAX2( sal,comm) AS tax FROM emp;

급여(커미션 포함)에 대한 세율을 다음과 같이 정의함.
급여가 월 $1000이상 $2000이하면 10%, $2000을 초과하면 20%를 적용함.
CREATE OR REPLACE FUNCTION tax3(p_sal IN emp.sal%TYPE,
                                                p_comm emp.comm%TYPE)
RETURN NUMBER
IS 
-- 변수 선언
l_sum NUMBER;
l_tax NUMBER;

BEGIN 
l_sum := p_sal + NVL(p_comm,0);

IF l_sum < 1000 THEN 
   l_tax := l_sum * 0.05;
ELSIF l_sum <= 2000  THEN
      l_tax := l_sum * 0.1;
ELSE
      l_tax := l_sum * 0.2;
END IF;
RETURN(l_tax);
END;

SELECT empno, ename, sal+NVL(comm,0), TAX3(sal,comm) FROM emp;

사원 번호를 통해서 급여를 알려주는 함수
CREATE OR REPLACE FUNCTION   emp_salaries(emp_no NUMBER)
RETURN NUMBER
IS
-- 변수 선언
nSalaries NUMBER(9);
BEGIN
SELECT sal
-- 결과행이 단일행일 경우 INTO를 이용해서 읽어온 값을 변수에 담을 수 있다.
INTO nSalaries
FROM emp
WHERE empno = emp_no;

RETURN nSalaries;
END;

SELECT EMP_SALARIES(7839) FROM  dual;
SELECT empno, ename, EMP_SALARIES(empno) FROM emp;

부서번호를 전달하면 부서명을 구할 수 있는 함수
CREATE OR REPLACE FUNCTION get_dept_name(dept_no NUMBER)
RETURN VARCHAR2
IS
sDeptName VARCHAR2(30);

BEGIN
SELECT dname
INTO sDeptName
FROM dept
WHERE deptno = dept_no;

RETURN sDeptName;
END;

SELECT GET_DEPT_NAME(10) FROM dual;
SELECT deptno, GET_DEPT_NAME(deptno) "Department NAME" FROM dept;
SELECT empno, ename, sal, GET_DEPT_NAME(deptno) FROM emp;

 [실습 문제]
1. 두 숫자를 제공하면 덧셈을 해서 결과값을 반환하는 함수를 정의하시오. (add_num)
CREATE OR REPLACE FUNCTION add_num (num1 INTEGER, num2 INTEGER)
RETURN INTEGER
IS
BEGIN
RETURN num1 +num2;
END;
SELECT ADD_NUM(2,5) FROM dual;

2. 부서 번호를 입력하면 해당 부서에서 근무하는 사원 수를 반환하는 함수를 정의하시오. (get_emp_count)
CREATE OR REPLACE FUNCTION get_emp_count(dept_no IN emp.deptno%TYPE)
RETURN INTEGER
IS
   emp_count INTEGER;
BEGIN
   SELECT COUNT(empno)
   INTO emp_count
   FROM emp
   WHERE deptno = dept_no;
RETURN emp_count;
END;
SELECT deptno, dname, GET_emp_COUNT(deptno) FROM dept;

3. emp 테이블의 입사일을 입력하면 근무연차를 구하는 함수를 정의하세요.( 소수점은 절삭한다 TRUNC 사용)
   GET_INFO_HIREDATE
CREATE OR REPLACE FUNCTION get_info_hiredate(p_hiredate IN emp.hiredate%TYPE)
RETURN NUMBER
IS
BEGIN
   RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_hiredate) / 12);
END;
SELECT empno, ename,GET_INFO_HIREDATE(hiredate) FROM emp;

4. emp 테이블을 이용해서 사원 번호를 입력하면 해당 사원의 관리자 이름을 구하는 함수를 정의하세요
get_mgr_name
-- 서브쿼리 형태로 작성
CREATE OR REPLACE FUNCTION GET_MGR_NAME(emp_no IN emp.empno%TYPE)
RETURN VARCHAR2
IS
-- 변수 선언
m_name VARCHAR2(10);
BEGIN
   SELECT ename
   INTO  m_name
   FROM emp
   WHERE empno = (SELECT mgr FROM emp WHERE empno = emp_no);
RETURN m_name;
END;
SELECT empno, ename, GET_MGR_NAME(empno)  FROM emp;
--
-- Join으로 작성
CREATE OR REPLACE FUNCTION GET_MGR_NAME( emp_no emp.empno%TYPE)
RETURN VARCHAR2
IS
m_name VARCHAR2(10);
BEGIN
SELECT m.ename
INTO m_name
FROM emp e, emp m
WHERE e.mgr = m.empno AND e.empno = emp_no ;
RETURN m_name;
END;
--
5. emp 테이블을 이용해서 사원 번호를 입력하면 급여 등급을 구하는 함수를 정의하세요. GET_SAL_GRADE
--
CREATE OR REPLACE FUNCTION GET_SAL_GRADE (emp_no emp.empno%TYPE)
RETURN CHAR
IS
   sgrade CHAR(1);
BEGIN
         SELECT CASE WHEN sal>=4000 THEN 'A'
                           WHEN sal>=3000 AND sal < 4000 THEN 'B'
                           WHEN sal>=2000 AND sal < 3000 THEN 'C'
                           WHEN sal>=1000 AND sal < 2000 THEN 'D'
                           ELSE 'F'
      END grade
INTO sgrade
FROM emp
WHERE empno = emp_no;

RETURN sgrade;
END;
--
-- 기존의 테이블을 사용함
CREATE OR REPLACE FUNCTION GET_SAL_GRADE (emp_no emp.empno%TYPE)
RETURN NUMBER
IS
sgrade NUMBER;
BEGIN
SELECT s.grade
INTO sgrade
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal AND e.empno = emp_no;
RETURN sgrade;
END;
--
SELECT ename,sal,GET_SAL_GRADE(empno) "급여등급" FROM emp ORDER BY "급여등급";

6. 사원번호를 입력하면 근무지를 구하는 함수 (find_loc) varchar2 이용
-- 서브 쿼리 형태
CREATE OR REPLACE FUNCTION FIND_LOC (emp_no emp.empno%TYPE)
RETURN VARCHAR2
IS
-- 변수 선언
dloc VARCHAR2(14);
BEGIN
SELECT loc
INTO dloc
FROM dept 
WHERE deptno = (SELECT deptno FROM emp WHERE empno = emp_no);
RETURN dloc;
END;
--
-- Join 형태
CREATE OR REPLACE FUNCTION FIND_LOC (emp_no emp.empno%TYPE)
RETURN VARCHAR2
IS
dloc VARCHAR2(14);
BEGIN
SELECT d.loc
INTO dloc
FROM emp e JOIN dept d
ON e.deptno = d.deptno 
WHERE e.empno = emp_no;
RETURN dloc;
END;
----------------------------------------------------------------------------------------------
SELECT FIND_LOC(empno), ename FROM emp;
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
생성된 함수 확인하기
데이터 사전 (DATA Dictionary)을 통해 검색. 
데이터 사전에 저장된 모든 값은 대문자로 저장되기 때문에 대문자로 검색.
SELECT object_name, object_type FROM user_objects WHERE object_type = 'FUNCTION';
----------------------------------------------------------------------------------------------
작성된 함수의 소스 코드 확인
SELECT text FROM user_source 
WHERE type='FUNCTION' AND name='TAX';
----------------------------------------------------------------------------------------------
프로시저
CREATE OR REPLACE PROCEDURE hello_world
IS 
-- 변수 선언
message VARCHAR2(100);
BEGIN
message := 'Hello World~~';
DBMS_OUTPUT.PUT_LINE(message);
END;
----------------------------------------------------------------------------------------------
프로시저 실행
EXECUTE HELLO_WORLD;
----------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE HELLO_ORACLE(p_message IN VARCHAR2)
IS
BEGIN
DBMS_OUTPUT.PUT_LINE(p_message);
END;
----------------------------------------------------------------------------------------------
EXECUTE HELLO_ORACLE('KOREA');
----------------------------------------------------------------------------------------------
작성된 STORED PROCEDURE 확인
SELECT object_name, object_type FROM user_objects WHERE object_type = 'PROCEDURE';
----------------------------------------------------------------------------------------------
작성된 프로시저의 소스 코드 확인
SELECT text FROM user_source WHERE type='PROCEDURE';
----------------------------------------------------------------------------------------------
부서테이블에 부서 정보를 입력하는 프로시저를 생성
CREATE OR REPLACE PROCEDURE add_department(p_deptno IN dept.deptno%TYPE,
                                                                     p_dname IN dept.dname%TYPE,
                                                                     p_loc IN dept.loc%TYPE)
IS
BEGIN
-- PARAMETER 변수에 입력받은 값으로 부서(dept)테이블의 각 컬럼에 데이터를 추가하고
-- 정상적으로 TRANSACTION 종료
   INSERT INTO dept
   VALUES(p_deptno, p_dname,p_loc);
   COMMIT;
   EXCEPTION WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE(p_dname || 'register is failed');
   ROLLBACK;
END;
----------------------------------------------------------------------------------------------
EXEC ADD_DEPARTMENT(60,'IT SERVICE', 'BUSAN');
SELECT * FROM dept;
---------------------------------------------------------------------------------------------
사원 테이블에 사원정보를 저장
CREATE OR  REPLACE PROCEDURE register_emp(e_empno IN emp.empno%TYPE,
      e_ename IN emp.ename%TYPE,  
      e_job IN emp.job%TYPE, 
      e_mgr IN emp.mgr%TYPE,  
      e_sal IN emp.sal%TYPE,
      e_comm IN emp.comm%TYPE, 
      e_deptno IN emp.deptno%TYPE )
IS
BEGIN
INSERT INTO emp (empno,ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (e_empno,e_ename,e_job, e_mgr, SYSDATE, e_sal, e_comm, e_deptno);
COMMIT;

EXCEPTION WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE(e_ename || 'Register Failed!');
   ROLLBACK;
END;
----------------------------------------------------------------------------------------------
EXEC register_emp(9000,'PETER','MANAGER', 7902, 6000, 200, 30);
----------------------------------------------------------------------------------------------
부서 번호를 통해서 부서명과 부서의 위치 구하기
CREATE OR REPLACE PROCEDURE output_department(
                                             p_dept_no IN dept.deptno%TYPE)
IS
-- 변수 선언
d_dname dept.dname%TYPE;
d_loc dept.loc%TYPE;

BEGIN
-- PARANMETER 변수로부터 부서번호를 받아 해당 부서의 정보 질의
SELECT dname, loc
INTO d_dname, d_loc
FROM dept
WHERE deptno = p_dept_no;

DBMS_OUTPUT.PUT_LINE(d_dname || ',' || d_loc);
END;
----------------------------------------------------------------------------------------------
EXEC OUTPUT_DEPARTMENT(10);
----------------------------------------------------------------------------------------------
사원이 입사한 연도를 입력해서 사원 정보 구하기
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS
-- %ROWTYPE 으로 데이터 타입이 지정되어 있는 
-- 사원테이블(emp)의 하나의 행이 가지는 모든 컬럼의 데이터 타입을 가져옴
e_emp emp%ROWTYPE; --record 형태
BEGIN
SELECT empno, ename, sal
-- 단일행일 경우에 INTO 사용 할 수 있지만 다중행일 경우에는 오류가 발생한다.
-- 다중행은 CURSOR를 사용해야한다.
INTO e_emp.empno, e_emp.ename, e_emp.sal
FROM emp
WHERE TO_CHAR(hiredate,'YYYY') = p_year;
DBMS_OUTPUT.PUT_LINE(e_emp.empno || ',' || e_emp.ename || ',' || e_emp.sal);
END;
----------------------------------------------------------------------------------------------
EXEC INFO_HIREDATE('1980');
----------------------------------------------------------------------------------------------
커서를 이용하여 질의 수행 결과 반환되는 여러행을 처리
CREATE OR REPLACE PROCEDURE info_hiredate(p_year IN VARCHAR2)
IS 
e_emp emp%ROWTYPE;
-- 커서 선언
CURSOR emp_cur IS 
SELECT empno, ename, sal
FROM emp
WHERE TO_CHAR(hiredate, 'YYYY') = p_year;
BEGIN
-- 커서 열기
OPEN emp_cur;
-- 커서로부터 데이터 읽기
LOOP
   FETCH emp_cur INTO e_emp.empno , e_emp.ename , e_emp.sal;
   EXIT WHEN emp_cur%NOTFOUND;
   DBMS_OUTPUT.PUT_LINE(e_emp.empno || ',' || e_emp.ename || ',' || e_emp.sal);
END LOOP;
--커서 닫기
CLOSE emp_cur;
END;
----------------------------------------------------------------------------------------------
EXEC INFO_HIREDATE('1981');
----------------------------------------------------------------------------------------------
SALES 부서에 속한 사원의 정보 보기
CREATE OR REPLACE PROCEDURE emp_info (p_dept IN dept.dname%TYPE)
IS
-- 커서 선언
CURSOR emp_cur IS
SELECT empno, ename
FROM emp e JOIN dept d
ON e.deptno = d.deptno
WHERE dname = UPPER(p_dept);
-- 변수 선언
e_empno emp.empno%TYPE;
e_ename emp.ename%TYPE;
BEGIN
   OPEN emp_cur;
   -- 커서로부터 데이터 일기
   LOOP 
   FETCH emp_cur INTO e_empno, e_ename;
   EXIT WHEN emp_cur%NOTFOUND;
   DBMS_OUTPUT.PUT_LINE(e_empno || ',' || e_ename);
   END LOOP;
   CLOSE emp_cur;
END;
----------------------------------------------------------------------------------------------
EXEC EMP_INFO('SALES');
----------------------------------------------------------------------------------------------
[실습문제]
1) 업무(job)를 입력하여 해당 업무를 수행하는 사원들의 사원 번호,이름, 급여, 업무를 출력하세요.
CREATE OR REPLACE PROCEDURE job_info(p_job IN emp.job%TYPE)
IS
e_emp emp%ROWTYPE;
CURSOR emp_cur IS
SELECT empno, ename, sal, job
FROM emp
WHERE p_job = job;
BEGIN
OPEN emp_cur;
LOOP
   FETCH emp_cur INTO e_emp.empno , e_emp.ename , e_emp.sal , e_emp.job;
   EXIT WHEN emp_cur%NOTFOUND; 
DBMS_OUTPUT.PUT_LINE(e_emp.empno || ',' || e_emp.ename || ',' || e_emp.sal || ',' || e_emp.job);
   END LOOP;
   CLOSE emp_cur;
END;

EXEC JOB_INFO('MANAGER');

2) 사원 번호와 새 업무를 입력하면 EMP 테이블의 해당 사원의 업무를 갱신할 수 있는 프로시저를 작성하시오.
CREATE OR REPLACE PROCEDURE update_job(e_empno IN emp.empno%TYPE,
                                                            e_job IN emp.job%TYPE)
IS
BEGIN
UPDATE emp SET job = e_job WHERE empno = e_empno;
COMMIT;
EXCEPTION
   WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE(e_empno || ',' || 'Update Failed');
   ROLLBACK;
END;

EXEC UPDATE_JOB(7369,'DRIVER');

-- Table Book 생성
CREATE TABLE book(
   bookid NUMBER PRIMARY KEY,
   bookname VARCHAR2(60) NOT NULL,
   publisher VARCHAR2(60)  NOT NULL,
   price NUMBER NOT NULL
);
-- 데이터 삽입
INSERT INTO book VALUES (1,'자바를 찾아서','서울',30000);
INSERT INTO book VALUES (2,'도시','천국',10000);
INSERT INTO book VALUES (3,'하늘','신라',50000);
 COMMIT;

-- 프로시저 생성
동일한 도서가 있는지 점검한 후 동일한 도서가 없으면 삽입하고 
동일한 도서가 있으면 가격을 업데이트하는 프로시저를 작성하시오. (book_info)
CREATE OR REPLACE PROCEDURE BOOK_INFO(
    mybookid book.bookid%TYPE,
    mybookname book.bookname%TYPE,
    mypublisher book.publisher%TYPE,
    myprice book.price%TYPE
)
IS
    mycount NUMBER;
BEGIN
    SELECT COUNT(*)  INTO mycount FROM book WHERE bookname = mybookname;
    IF mycount != 0 THEN
       -- 동일한 도서가 있으면 가격을 업데이트
        UPDATE book  SET price = myprice
        WHERE bookname = mybookname;
        COMMIT;
    ELSE
        -- 동일한 도서가 없으면 삽입
         INSERT INTO book (bookid, bookname, publisher, price)
         VALUES (mybookid, mybookname, mypublisher, myprice);
         COMMIT;
    END IF;
EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR!');
        ROLLBACK;
END;

EXEC BOOK_INFO(4,'스포츠','쿨서울',20000); -- 삽입
EXEC BOOK_INFO(5,'도시' , '천국' ,50000); -- 가격 변경
EXEC BOOK_INFO(4,'도시2','천국',50000); -- 오류 발생


패키지(Package)
패키지는 업무와 관련된 Stored Procedure 및 Stored Function을 관리하고, 
이를 패키지 단위로 배포할 때 유용하게 사용된다.
패키지는 선언부와 본문으로 구분한다.

선언부 생성
CREATE OR REPLACE PACKAGE employee_pkg AS
   PROCEDURE print_ename(p_empno NUMBER);
   PROCEDURE print_sal(p_empno NUMBER);
END employee_pkg;

본문 생성
CREATE OR REPLACE PACKAGE BODY employee_pkg AS
   PROCEDURE print_ename(p_empno NUMBER) IS -- name을 불러옵니다
   e_name emp.ename%TYPE; --emp테이블의 ename과 같은 타입을 사용합니다
BEGIN 
   SELECT ename --ename을 불러오고
   INTO e_name --e_name에 삽입 시키세요
   FROM emp -- emp테이블에서 불러오세요
   WHERE empno = p_empno; -- empno(사원번호)가 파라미터의 p_empno와 같습니다.
   DBMS_OUTPUT.PUT_LINE(e_name); -- e_name을 출력하세요
EXCEPTION WHEN NO_DATA_FOUND THEN -- 그러나 예외 상황인 입력한 사원번호(empno)가 emp 테이블에 등록되지 않은 데이터라면
   DBMS_OUTPUT.PUT_LINE('Invalid Employee Number'); -- 이 문구를 출력하세요
END print_ename;
   
   PROCEDURE print_sal(p_empno NUMBER) IS-- 급여를 출력하겠습니다
   e_sal emp.sal%TYPE; -- emp테이블의 sal 과 같은 타입을 사용하세요
BEGIN 
   SELECT sal -- sal을 선택하여 그 값을 불러오고
   INTO e_sal -- e_sal에 데이터를 삽입시키세요
   FROM emp -- emp 테이블에서 데이터를 불러오면 됩니다.
   WHERE empno = p_empno; -- 사원번호(empno)는 p_empno의 값과 같습니다.
   DBMS_OUTPUT.PUT_LINE(e_sal); -- e_sal에 저장한 값을 출력하세요.
EXCEPTION WHEN NO_DATA_FOUND THEN -- 예외상황인 사원번호(empno)가 emp 테이블에 없는 데이터라면
   DBMS_OUTPUT.PUT_LINE('Invalid Employee Number'); -- 이 문구를 출력하세요
END print_sal;
END employee_pkg;

실행
EXEC EMPLOYEE_PKG.PRINT_ENAME(8000);
EXEC EMPLOYEE_PKG.PRINT_SAL(7369);

트리거 (Trigger)
트리거는 데이터의 변경(INSERT, DELETE, UPDATE)문이 실행될 때 자동으로 같이 실행되는 프로시저를 말한다.
오라클은 기본적으로 실행 전(BEFORE)과 실행 후(AFTER) 트리거를 지원한다.

CREATE OR REPLACE TRIGGER print_message
AFTER INSERT ON dept
BEGIN
DBMS_OUTPUT.PUT_LINE('dept 테이블에 정상적으로 데이터가 추가되었습니다.');
END;