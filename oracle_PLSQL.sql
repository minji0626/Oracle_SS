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
   
   
   
END;