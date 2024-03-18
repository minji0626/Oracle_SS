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