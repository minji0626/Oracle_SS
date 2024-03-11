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

DISTINCT :중복행 삭제
SELECT DISTINCT deptno FROM emp;

[실습 문제]
1. emp 테이블에서 사원번호, 사원 이름, 월급을 출력하시오
2. emp 테이블에서 사원이름과 월급을 출력하는데 컬럼 명은 "이 름" ,  "월 급"으로 바꿔서 출력
3. emp테이블에서 사원 번호, 사원 이름, 월급, 연봉을 구하고 각각 칼럼명은
"사원번호" , "사원이름" "월급" "연봉"
4. emp 테이블의 업무를 중복되지 않게 표시하시오

SELECT empno , ename, sal FROM emp;

SELECT ename AS "이 름" , sal AS "월 급" FROM emp;

SELECT empno "사원번호",  ename "사원이름" , sal  "월급" , (sal*12) "연봉" FROM emp;

SELECT DISTINCT job FROM emp; 

WHERE절 사용 : 조건 체크 결과 행 제한하기
                       // (주의) ALIAS 사용 불가
                        
SELECT * FROM emp WHERE deptno = 10;
SELECT ename, job, deptno FROM emp WHERE ename = 'SMITH';
SELECT * FROM emp WHERE hiredate > '81-12-03' ; 
//81년 12월 3일 이후의 입사자
SELECT * FROM emp WHERE hiredate < '81-12-03';
// 81년 12월 3일 이전의 입사자
SELECT ename, sal, sal*12 ansal FROM emp WHERE  sal*12 > 15000;

SELECT * FROM emp WHERE hiredate != '80-12-17'; 
SELECT * FROM emp WHERE hiredate <> '80-12-17';
SELECT * FROM emp WHERE hiredate ^= '80-12-17';
80년 12월 17일 입사자를 제외한 나머지 사람들 다 불러옴

SELECT * FROM emp WHERE sal > 2000 AND sal <=5000 ;
SELECT * FROM emp WHERE sal >= 800 AND sal <= 3000 ;
특정 구간의 데이터를 불러온다

BETWEEN ... AND ... : 두 값 사이 (지정한 값 포함)
SELECT * FROM emp WHERE sal BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE sal NOT BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE ename BETWEEN 'KING' AND 'SMITH';
SELECT * FROM emp WHERE ename NOT BETWEEN 'KING' AND 'SMITH';

IN : 값 목록 중의 값과 일치
SELECT * FROM emp WHERE sal IN (1300,2450,3000);
SELECT * FROM emp WHERE sal NOT IN (1300,2450,3000);
SELECT ename,mgr,deptno  FROM emp WHERE ename IN ('ALLEN' , 'FORD');
SELECT ename,mgr,deptno  FROM emp WHERE ename NOT IN ('ALLEN' , 'FORD');

[실습 문제]
1. emp 테이블에서 사원번호가 7698인 사원의 이름, 업무, 급여를 출력하시오.
2. emp 테이블에서 사원 이름이 SMITH인 사람의 이름과 월급 부서번호를 구하시오.
3. emp테이블에서 월급이 2500 이상 3500 미만인 사원의 이름, 입사일, 월급을 구하시오.
4. emp 테이블에서 2000에서  3000사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하세요.

SELECT ename, job, sal FROM emp WHERE empno = '7698';
SELECT ename, sal ,deptno FROM emp WHERE ename = 'SMITH';
SELECT ename, hiredate, sal FROM emp WHERE sal >= 2500 AND sal < 3500 ;
SELECT ename, job, sal FROM emp WHERE sal BETWEEN 2000 AND 3000;