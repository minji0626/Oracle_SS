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
   
   LIKE : 패턴과 일치하는 데이터를 검색
%는 0개 이상의 문자를 나타냄
_는 한 문자를 나타냄

S가 처음, 중간, 끝에 오는 이름을 검색
SELECT * FROM emp WHERE ename LIKE '%S%'; 
SELECT * FROM emp WHERE ename NOT LIKE '%S%';

입사일이 22로 끝나는 사원 정보 구하기
SELECT ename, hiredate FROM emp WHERE hiredate LIKE '%22';

FOR다음에 정해지지 않은 한 문자를 가진 사람을 불러오기
SELECT * FROM emp WHERE ename LIKE 'FOR_';

한 글자 다음의 M, M다음에 없거나 여러개
SELECT * FROM emp WHERE ename LIKE '_M%';


SELECT * FROM emp WHERE ename LIKE'SC\_%' ESCAPE '\';
검색하고자 하는 문자열에 _가 포함되어 있으면 _ 앞에 \를 붙이고 escape \를 명시해준다.
SELECT * FROM emp WHERE ename like '%\%' ESCAPE '\';
검색하고자 하는 문자열에 %가 포함되어 있을 경우

NULL 조건 사용
사원들 중 comm 계약을 안 맺은 사람 구하기
select * from emp where comm is null;
select * from emp where comm is not null;

논리 연산자(AND, OR, NOT)를 사용하여 조건 정의
AND 연산자의 사용 : 구성 요소 조건이 모두 TRUE이면 TRUE를 반환
SELECT empno, ename, job, sal From emp WHERE sal >= 2000 AND job LIKE  '%MAN%'; 
사원 번호, 이름, 업무, 급여를 불러오세요 그러나 급여는 2000이상이고 업무에는 MAN이 들어가야합니다.

OR 연산자의 사용 : 조건 중 하나가 TRUE면 TRUE를 반환
SELECT empno, ename, job, sal FROM emp WHERE sal>=2000 OR job LIKE '%MAN%';
사원 번호, 이름 , 업무, 급여를 출력하세요 급여가 2000이상이거나 업무에 MAN이 들어간다면

NOT 연산자의 사용
SELECT ename, job FROM emp WHERE job NOT IN ('CLERK' , 'SALESMAN');
사원이름과 업무를 출력하세요 그러나 업무가 CLERK, SALESMAN인 사람들은 제외시키세요

[실습 문제]
1. EMP 테이블에서 81년 05월 01일과 81년 12월 03일 사이에 입사한 사원의 이름, 급여, 입사일을 출력하세요
2. EMP 테이블에서 사원 번호가 7566. 7782, 7934인 사원을 제외한 사람들의 사원번호, 이름, 월급을 출력하세요.
3. EMP 테이블에서 급여가 $2,000와 $5,000사이고 부서 번호가 10 또는 30인 사원의 이름과 급여, 부서번호를 출력하세요.
4. EMP 테이블에서 업무가 SALESMAN 또는 MANAGER이면서 급여가 $1,600 , $2,975 , $2,850이 아닌 모든 사원이름, 업무, 급여를 표시하세요.

SELECT ename, sal, hiredate FROM emp  WHERE hiredate BETWEEN '81-05-01' AND '81-12-03';
SELECT empno, ename, sal FROM emp WHERE empno NOT IN (7566 , 7782, 7934);
SELECT ename, sal, deptno FROM emp WHERE (sal >= 2000 AND sal <=5000) AND deptno IN (10, 30); 
SELECT ename, job, sal FROM emp WHERE job IN ('SALESMAN' ,  'MANAGER') AND sal NOT IN (1600, 2975, 2850);


ORDER BY 절 : 정렬
SELECT * FROM emp WHERE deptno = 10 ORDER BY sal ASC;
SELECT * FROM emp WHERE deptno = 10 ORDER BY sal DESC;
SELECT * FROM emp WHERE deptno = 10 ORDER BY sal, ename;
SELECT * FROM emp WHERE deptno = 10 ORDER BY sal ASC , ename DESC; 

내림차순 정렬
SELECT ename, job, deptno, hiredate FROM emp ORDER BY hiredate DESC;

1차 정렬에서 중복값이 있을 경우 2차 정렬 수행
SELECT * FROM emp ORDER BY sal DESC, ename DESC;

날짜 정렬
SELECT ename, job, deptno, hiredate FROM emp ORDER BY hiredate DESC;

열 ALIAS를 기준으로 정렬
SELECT empno, ename, (sal*12) annsal FROM emp ORDER BY annsal;

열의 숫자 위치를 사용하여 정렬
SELECT ename, job, deptno, hiredate FROM emp ORDER BY 3;

테이블에 생성된 순서대로 열 숫자 위치 부여
SELECT * FROM emp ORDER BY 2;

NULL값을 갖고 있는 칼럼을 정렬할 떄
NULLS FIRST 또는 NULLS LAST 키워드를 사용하여 반환된 행 중
NULL 값을 포함하는 행이 정렬 순서상 맨 처으멩 나타나거나 마지막에 나타나도록 지정
SELECT * FROM emp ORDER BY comm NULLS FIRST;
SELECT * FROM emp ORDER BY comm NULLS LAST;

SELECT * FROM emp ORDER BY comm NULLS LAST, ename DESC;
SELECT * FROM emp ORDER BY comm DESC NULLS FIRST;

여러 열을 기준으로 정렬
SELECT ename, deptno, sal FROM emp ORDER BY deptno, sal DESC;

[실습 문제]
1. 사원 번호, 사원 이름, 입사일을 출력하는데 입사일이 빠른 사람순으로정렬하시오.
2. 사원 이름, 급여, 연봉을 구하고 연봉이 많은 순으로 정렬하시오.
3. 10번 또는 20번 부서에서 근무하고 있는 사원의 이름과 부서 번호를 출력하는데 이름을 영문자순으로 표시하시오.
4. 커미션 계약을 맺은 모든 사원의 이름, 급여, 커미션을 출력하는데 커미션을 기준으로 내림차순 정렬하시오.

SELECT empno, ename, hiredate FROM emp ORDER BY hiredate ASC; 
SELECT ename, sal, sal*12 FROM emp ORDER by sal*12 DESC;
SELECT ename, deptno FROM emp WHERE deptno IN(10 , 20) ORDER BY ename ASC; 
SELECT ename, sal, comm FROM emp WHERE comm IS NOT null ORDER BY comm DESC;

함수

문자 함수
대소문자 조작 함수 - LOWER, UPPER, INITCAP
SELECT LOWER('HELLO') FROM dual;
SELECT LOWER(ename) FROM emp;

SELECT UPPER ('hello')  FROM dual;

문장의 첫 글자를 대문자로 변경, 그 다음은 소문자
SELECT INITCAP('hello wORLD') FROM dual;

문자 조작 함수
CONCAT(문자열1, 문자열2) : 문자열 1과 문자열2를 연결하여 하나의 문자열로 반환
SELECT CONCAT('Hello' , 'World') FROM dual;
SELECT CONCAT (ename , job)  FROM emp;

SUBSTR(대상문자열, 인덱스) : 대상문자열에서 지정한 인덱스부터 문자열을 추출 [주의] 인덱스 1부터 시작
SELECT SUBSTR ('Hello World' , 3) FROM dual;
SELECT SUBSTR ('Hello World' ,3,3) FROM dual; -- 인덱스 3부터 문자 3개 추출
SELECT SUBSTR ('Hello World',-3) FROM dual;  -- 뒤에서 3번째부터 끝까지 추출
SELECT SUBSTR ('Hello World',-3,2) FROM dual; -- 뒤에서 3번째부터 문자 2개 추출

LENGTH(대상문자열) : 문자열의 개수
SELECT LENGTH ('Hello World') FROM dual;
SELECT LENGTH (ename)   FROM emp;

INSTR (대상문자열, 검색 문자) : 검색문자의 위치값 검색
SELECT INSTR('Hello World' , 'e' ) FROM dual;
검색 문자가 없을 경우 0 반환
SELECT INSTR('Hello World','E') FROM dual;

SELECT INSTR ('Hello World','o') FROM dual;
SELECT INSTR ('Hello World','o',6) FROM dual;
SELECT INSTR ('Hello World','o',1,2) FROM dual;

LPAD(대상문자열, 총길이, 문자) : 지정한 길에 문자열을 출력하는데 공백은 왼쪽에 지정한 문자로 채움
SELECT LPAD ('HELLO', 10 , '*' ) FROM dual;

RPAD(대상문자열, 총길이, 문자) : 지정한 길에 문자열을 출력하는데 공백은 오른쪽에 지정한 문자로 채움
SELECT RPAD ('HELLO', 10 , '*' ) FROM dual;

