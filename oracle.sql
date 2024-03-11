SELECT 문 : 데이터베이스로부터 저장되어있는 데이터를 검색하는데 사용

전체 컬럼의 데이터 읽기
SELECT empno, ename,job,mgr,hiredate,sal,comm,deptno FROM emp;
SELECT *  FROM emp;

부분 컬럼의 데이터 읽기
SELECT ename,sal FROM emp;

주석
SELECT * FROM emp;
/**/

DUAL:함수 및 계산의 결과를 볼 때 사용할 수 있는 공용(public) 테이블
      사용자 데이터가 있는 테이블에서 유래하지 않은 상수 값
      의사열(pesudo-coumn), 표현식 등의 값을 단 한번만 돌리거나 현재 날짜,
      시각을 알고자 할 때 이용. 일시적인 산술, 날짜 연산 등에 주로 사용

SELECT SYSDATE FROM dual;
SELECT ASCII('A') FROM dual;
SELECT ASCII(0) FROM dual;
SELECT 7 + 10 FROM dual;

연산
select ename,sal from emp;
select ename, sal, sal + 300 from emp;

null값의 정의 : null은 사용할 수 없거나, 할당되지 않았거나, 알 수 없거나, 적용할 수 없는 값
               (null은 0이나 공백과 다름)