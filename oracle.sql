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

null값의 정의 : null은 사용할 수 없거나, 할당되지 않았거나, 알 수 없거나, 적용할 수 없는 값 (null은 0이나 공백과 다름)   
SELECT empno,ename,job,comm FROM emp;

산술식의 NULL값 : NULL 값을 포함하는 산술식은  NULL로 계산
SELECT ename, (sal+comm)*12 FROM emp; 

열 ALIAS : 열의 별칭
열 이름 바로 뒤에 나옴. 열 이름과 ALIAS 사이에 선택사항인 AS 키워드가 올 수 있음
알리아스에 큰따옴표를 사용하는 경우
- 대소문자 구별을 원할 때
- 공백 포함시
- _,# 등 특수문자 사용시(_는 ""없이 중간에는 올 수 있으나 맨 앞에 오면 오류 발생)
- 숫자로 시작할 경우 
SELECT sal*12 ASal FROM emp;
SELECt sal*12 AS AsAl FROM emp;
SELECT sal*12 "Annual Salary" FROM emp;

연결 연산자 : 열이나 문자열을 다른 열에 연결, 두개의 세로선(||)으로 나타냄 결과 열로 문자식을 생성
SELECT ename || ' has $' || sal FROM emp;

연결 연산자와 null 값: 문자열에 nulll값을 결합할 경우 결과는 문자열
SELECT ename || comm From emp;