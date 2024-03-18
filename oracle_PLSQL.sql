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

RETURN emp_count
END;

SELECT empno, ename, deptno, GET_EMP_COUNT(empno) FROM emp;
