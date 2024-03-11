SELECT 문 : 데이터베이스로부터 저장되어있는 데이터를 검색하는데 사용

전체 컬럼의 데이터 읽기
SELECT empno, ename,job,mgr,hiredate,sal,comm,deptno FROM emp;
SELECT *  FROM emp;

부분 컬럼의 데이터 읽기
SELECT ename,sal FROM emp;

주석
SELECT * FROM emp;