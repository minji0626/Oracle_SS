SELECT �� : �����ͺ��̽��κ��� ����Ǿ��ִ� �����͸� �˻��ϴµ� ���

��ü �÷��� ������ �б�
SELECT empno, ename,job,mgr,hiredate,sal,comm,deptno FROM emp;
SELECT *  FROM emp;

�κ� �÷��� ������ �б�
SELECT ename,sal FROM emp;

�ּ�
SELECT * FROM emp;
/**/

DUAL:�Լ� �� ����� ����� �� �� ����� �� �ִ� ����(public) ���̺�
   ����� �����Ͱ� �ִ� ���̺��� �������� ���� ��� ��
   �ǻ翭(pesudo-coumn), ǥ���� ���� ���� �� �ѹ��� �����ų� ���� ��¥,
   �ð��� �˰��� �� �� �̿�. �Ͻ����� ���, ��¥ ���� � �ַ� ���

SELECT SYSDATE FROM dual;
SELECT ASCII('A') FROM dual;
SELECT ASCII(0) FROM dual;
SELECT 7 + 10 FROM dual;

����
select ename,sal from emp;
select ename, sal, sal + 300 from emp;

null���� ���� : null�� ����� �� ���ų�, �Ҵ���� �ʾҰų�, �� �� ���ų�, ������ �� ���� �� (null�� 0�̳� ����� �ٸ�)   
SELECT empno,ename,job,comm FROM emp;

������� NULL�� : NULL ���� �����ϴ� �������  NULL�� ���
SELECT ename, (sal+comm)*12 FROM emp; 

�� ALIAS : ���� ��Ī
�� �̸� �ٷ� �ڿ� ����. �� �̸��� ALIAS ���̿� ���û����� AS Ű���尡 �� �� ����
�˸��ƽ��� ū����ǥ�� ����ϴ� ���
- ��ҹ��� ������ ���� ��
- ���� ���Խ�
- _,# �� Ư������ ����(_�� ""���� �߰����� �� �� ������ �� �տ� ���� ���� �߻�)
- ���ڷ� ������ ��� 
SELECT sal*12 ASal FROM emp;
SELECt sal*12 AS AsAl FROM emp;
SELECT sal*12 "Annual Salary" FROM emp;

���� ������ : ���̳� ���ڿ��� �ٸ� ���� ����, �ΰ��� ���μ�(||)���� ��Ÿ�� ��� ���� ���ڽ��� ����
SELECT ename || ' has $' || sal FROM emp;

���� �����ڿ� null ��: ���ڿ��� nulll���� ������ ��� ����� ���ڿ�
SELECT ename || comm From emp;

DISTINCT :�ߺ��� ����
SELECT DISTINCT deptno FROM emp;

[�ǽ� ����]
1. emp ���̺��� �����ȣ, ��� �̸�, ������ ����Ͻÿ�
2. emp ���̺��� ����̸��� ������ ����ϴµ� �÷� ���� "�� ��" ,  "�� ��"���� �ٲ㼭 ���
3. emp���̺��� ��� ��ȣ, ��� �̸�, ����, ������ ���ϰ� ���� Į������
"�����ȣ" , "����̸�" "����" "����"
4. emp ���̺��� ������ �ߺ����� �ʰ� ǥ���Ͻÿ�

SELECT empno , ename, sal FROM emp;

SELECT ename AS "�� ��" , sal AS "�� ��" FROM emp;

SELECT empno "�����ȣ",  ename "����̸�" , sal  "����" , (sal*12) "����" FROM emp;

SELECT DISTINCT job FROM emp; 

WHERE�� ��� : ���� üũ ��� �� �����ϱ�
                    // (����) ALIAS ��� �Ұ�
                     
SELECT * FROM emp WHERE deptno = 10;
SELECT ename, job, deptno FROM emp WHERE ename = 'SMITH';
SELECT * FROM emp WHERE hiredate > '81-12-03' ; 
//81�� 12�� 3�� ������ �Ի���
SELECT * FROM emp WHERE hiredate < '81-12-03';
// 81�� 12�� 3�� ������ �Ի���
SELECT ename, sal, sal*12 ansal FROM emp WHERE  sal*12 > 15000;

SELECT * FROM emp WHERE hiredate != '80-12-17'; 
SELECT * FROM emp WHERE hiredate <> '80-12-17';
SELECT * FROM emp WHERE hiredate ^= '80-12-17';
80�� 12�� 17�� �Ի��ڸ� ������ ������ ����� �� �ҷ���

SELECT * FROM emp WHERE sal > 2000 AND sal <=5000 ;
SELECT * FROM emp WHERE sal >= 800 AND sal <= 3000 ;
Ư�� ������ �����͸� �ҷ��´�

BETWEEN ... AND ... : �� �� ���� (������ �� ����)
SELECT * FROM emp WHERE sal BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE sal NOT BETWEEN 800 AND 3000;
SELECT * FROM emp WHERE ename BETWEEN 'KING' AND 'SMITH';
SELECT * FROM emp WHERE ename NOT BETWEEN 'KING' AND 'SMITH';

IN : �� ��� ���� ���� ��ġ
SELECT * FROM emp WHERE sal IN (1300,2450,3000);
SELECT * FROM emp WHERE sal NOT IN (1300,2450,3000);
SELECT ename,mgr,deptno  FROM emp WHERE ename IN ('ALLEN' , 'FORD');
SELECT ename,mgr,deptno  FROM emp WHERE ename NOT IN ('ALLEN' , 'FORD');

[�ǽ� ����]
1. emp ���̺��� �����ȣ�� 7698�� ����� �̸�, ����, �޿��� ����Ͻÿ�.
2. emp ���̺��� ��� �̸��� SMITH�� ����� �̸��� ���� �μ���ȣ�� ���Ͻÿ�.
3. emp���̺��� ������ 2500 �̻� 3500 �̸��� ����� �̸�, �Ի���, ������ ���Ͻÿ�.
4. emp ���̺��� 2000����  3000���̿� ���Ե��� �ʴ� ����� �̸�, ����, �޿��� ����ϼ���.

SELECT ename, job, sal FROM emp WHERE empno = '7698';
SELECT ename, sal ,deptno FROM emp WHERE ename = 'SMITH';
SELECT ename, hiredate, sal FROM emp WHERE sal >= 2500 AND sal < 3500 ;
SELECT ename, job, sal FROM emp WHERE sal BETWEEN 2000 AND 3000;

LIKE : ���ϰ� ��ġ�ϴ� �����͸� �˻�
%�� 0�� �̻��� ���ڸ� ��Ÿ��
_�� �� ���ڸ� ��Ÿ��

S�� ó��, �߰�, ���� ���� �̸��� �˻�
SELECT * FROM emp WHERE ename LIKE '%S%'; 
SELECT * FROM emp WHERE ename NOT LIKE '%S%';

�Ի����� 22�� ������ ��� ���� ���ϱ�
SELECT ename, hiredate FROM emp WHERE hiredate LIKE '%22';

FOR������ �������� ���� �� ���ڸ� ���� ����� �ҷ�����
SELECT * FROM emp WHERE ename LIKE 'FOR_';

�� ���� ������ M, M������ ���ų� ������
SELECT * FROM emp WHERE ename LIKE '_M%';


SELECT * FROM emp WHERE ename LIKE'SC\_%' ESCAPE '\';
�˻��ϰ��� �ϴ� ���ڿ��� _�� ���ԵǾ� ������ _ �տ� \�� ���̰� escape \�� ������ش�.
SELECT * FROM emp WHERE ename like '%\%' ESCAPE '\';
�˻��ϰ��� �ϴ� ���ڿ��� %�� ���ԵǾ� ���� ���

NULL ���� ���
����� �� comm ����� �� ���� ��� ���ϱ�
select * from emp where comm is null;
select * from emp where comm is not null;

�� ������(AND, OR, NOT)�� ����Ͽ� ���� ����
AND �������� ��� : ���� ��� ������ ��� TRUE�̸� TRUE�� ��ȯ
SELECT empno, ename, job, sal From emp WHERE sal >= 2000 AND job LIKE  '%MAN%'; 
��� ��ȣ, �̸�, ����, �޿��� �ҷ������� �׷��� �޿��� 2000�̻��̰� �������� MAN�� �����մϴ�.

OR �������� ��� : ���� �� �ϳ��� TRUE�� TRUE�� ��ȯ
SELECT empno, ename, job, sal FROM emp WHERE sal>=2000 OR job LIKE '%MAN%';
��� ��ȣ, �̸� , ����, �޿��� ����ϼ��� �޿��� 2000�̻��̰ų� ������ MAN�� ���ٸ�

NOT �������� ���
SELECT ename, job FROM emp WHERE job NOT IN ('CLERK' , 'SALESMAN');
����̸��� ������ ����ϼ��� �׷��� ������ CLERK, SALESMAN�� ������� ���ܽ�Ű����

[�ǽ� ����]
1. EMP ���̺��� 81�� 05�� 01�ϰ� 81�� 12�� 03�� ���̿� �Ի��� ����� �̸�, �޿�, �Ի����� ����ϼ���
2. EMP ���̺��� ��� ��ȣ�� 7566. 7782, 7934�� ����� ������ ������� �����ȣ, �̸�, ������ ����ϼ���.
3. EMP ���̺��� �޿��� $2,000�� $5,000���̰� �μ� ��ȣ�� 10 �Ǵ� 30�� ����� �̸��� �޿�, �μ���ȣ�� ����ϼ���.
4. EMP ���̺��� ������ SALESMAN �Ǵ� MANAGER�̸鼭 �޿��� $1,600 , $2,975 , $2,850�� �ƴ� ��� ����̸�, ����, �޿��� ǥ���ϼ���.

SELECT ename, sal, hiredate FROM emp  WHERE hiredate BETWEEN '81-05-01' AND '81-12-03';
SELECT empno, ename, sal FROM emp WHERE empno NOT IN (7566 , 7782, 7934);
SELECT ename, sal, deptno FROM emp WHERE (sal >= 2000 AND sal <=5000) AND deptno IN (10, 30); 
SELECT ename, job, sal FROM emp WHERE job IN ('SALESMAN' ,  'MANAGER') AND sal NOT IN (1600, 2975, 2850);


ORDER BY �� : ����
SELECT * FROM emp WHERE deptno = 10 ORDER BY sal ASC;
SELECT * FROM emp WHERE deptno = 10 ORDER BY sal DESC;
SELECT * FROM emp WHERE deptno = 10 ORDER BY sal, ename;
SELECT * FROM emp WHERE deptno = 10 ORDER BY sal ASC , ename DESC; 

�������� ����
SELECT ename, job, deptno, hiredate FROM emp ORDER BY hiredate DESC;

1�� ���Ŀ��� �ߺ����� ���� ��� 2�� ���� ����
SELECT * FROM emp ORDER BY sal DESC, ename DESC;

��¥ ����
SELECT ename, job, deptno, hiredate FROM emp ORDER BY hiredate DESC;

�� ALIAS�� �������� ����
SELECT empno, ename, (sal*12) annsal FROM emp ORDER BY annsal;

���� ���� ��ġ�� ����Ͽ� ����
SELECT ename, job, deptno, hiredate FROM emp ORDER BY 3;

���̺� ������ ������� �� ���� ��ġ �ο�
SELECT * FROM emp ORDER BY 2;

NULL���� ���� �ִ� Į���� ������ ��
NULLS FIRST �Ǵ� NULLS LAST Ű���带 ����Ͽ� ��ȯ�� �� ��
NULL ���� �����ϴ� ���� ���� ������ �� ó���� ��Ÿ���ų� �������� ��Ÿ������ ����
SELECT * FROM emp ORDER BY comm NULLS FIRST;
SELECT * FROM emp ORDER BY comm NULLS LAST;

SELECT * FROM emp ORDER BY comm NULLS LAST, ename DESC;
SELECT * FROM emp ORDER BY comm DESC NULLS FIRST;

���� ���� �������� ����
SELECT ename, deptno, sal FROM emp ORDER BY deptno, sal DESC;

[�ǽ� ����]
1. ��� ��ȣ, ��� �̸�, �Ի����� ����ϴµ� �Ի����� ���� ��������������Ͻÿ�.
2. ��� �̸�, �޿�, ������ ���ϰ� ������ ���� ������ �����Ͻÿ�.
3. 10�� �Ǵ� 20�� �μ����� �ٹ��ϰ� �ִ� ����� �̸��� �μ� ��ȣ�� ����ϴµ� �̸��� �����ڼ����� ǥ���Ͻÿ�.
4. Ŀ�̼� ����� ���� ��� ����� �̸�, �޿�, Ŀ�̼��� ����ϴµ� Ŀ�̼��� �������� �������� �����Ͻÿ�.

SELECT empno, ename, hiredate FROM emp ORDER BY hiredate ASC; 
SELECT ename, sal, sal*12 FROM emp ORDER by sal*12 DESC;
SELECT ename, deptno FROM emp WHERE deptno IN(10 , 20) ORDER BY ename ASC; 
SELECT ename, sal, comm FROM emp WHERE comm IS NOT null ORDER BY comm DESC;

�Լ�

���� �Լ�
��ҹ��� ���� �Լ� - LOWER, UPPER, INITCAP
SELECT LOWER('HELLO') FROM dual;
SELECT LOWER(ename) FROM emp;

SELECT UPPER ('hello')  FROM dual;

������ ù ���ڸ� �빮�ڷ� ����, �� ������ �ҹ���
SELECT INITCAP('hello wORLD') FROM dual;

���� ���� �Լ�
CONCAT(���ڿ�1, ���ڿ�2) : ���ڿ� 1�� ���ڿ�2�� �����Ͽ� �ϳ��� ���ڿ��� ��ȯ
SELECT CONCAT('Hello' , 'World') FROM dual;
SELECT CONCAT (ename , job)  FROM emp;

SUBSTR(����ڿ�, �ε���) : ����ڿ����� ������ �ε������� ���ڿ��� ���� [����] �ε��� 1���� ����
SELECT SUBSTR ('Hello World' , 3) FROM dual;
SELECT SUBSTR ('Hello World' ,3,3) FROM dual; -- �ε��� 3���� ���� 3�� ����
SELECT SUBSTR ('Hello World',-3) FROM dual;  -- �ڿ��� 3��°���� ������ ����
SELECT SUBSTR ('Hello World',-3,2) FROM dual; -- �ڿ��� 3��°���� ���� 2�� ����

LENGTH(����ڿ�) : ���ڿ��� ����
SELECT LENGTH ('Hello World') FROM dual;
SELECT LENGTH (ename)   FROM emp;

INSTR (����ڿ�, �˻� ����) : �˻������� ��ġ�� �˻�
SELECT INSTR('Hello World' , 'e' ) FROM dual;
�˻� ���ڰ� ���� ��� 0 ��ȯ
SELECT INSTR('Hello World','E') FROM dual;

SELECT INSTR ('Hello World','o') FROM dual;
SELECT INSTR ('Hello World','o',6) FROM dual;
SELECT INSTR ('Hello World','o',1,2) FROM dual;

LPAD(����ڿ�, �ѱ���, ����) : ������ �濡 ���ڿ��� ����ϴµ� ������ ���ʿ� ������ ���ڷ� ä��
SELECT LPAD ('HELLO', 10 , '*' ) FROM dual;

RPAD(����ڿ�, �ѱ���, ����) : ������ �濡 ���ڿ��� ����ϴµ� ������ �����ʿ� ������ ���ڷ� ä��
SELECT RPAD ('HELLO', 10 , '*' ) FROM dual;


TRIM :  ���ڿ����� �����̳� Ư�� ���ڸ� ������ ������ ���� ���� ��ȯ
���� : ���� -> LEADING ,  ������ -> TRAILING , ���� -> BOTH <- DEFAULT
SELECT TRIM (LEADING 'h' FROM 'habchh') FROM dual;
SELECT TRIM (TRAILING 'h' FROM 'habchh') FROM dual;
SELECT TRIM (BOTH 'h' FROM 'hahchh') FROM dual;

LTRIM : ���ڿ��� ���ʿ��� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ
RTRIM : ���ڿ��� �����ʿ��� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ

REPLACE (����ڿ�,OLD,NEW) : ����ڿ����� OLD ���ڸ� NEW ���ڷ� ��ü
SELECT REPLACE ('010.1234.5678' , '.' , '-') FROM dual;

�Լ� ��ø
SELECT ename , LOWER(SUBSTR(ename,1,3)) FROM emp;

[�ǽ� ����]
1. EMP ���̺��� ������ ù���ڴ� �빮�� �������� �ҹ��ڷ� ����Ͻÿ�.
2. EMP ���̺��� ��� �̸��� A�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3���ڸ� �����Ͽ� ����Ͻÿ�.
3. EMP ���̺��� �̸��� 3��°�� ���ڰ� A�� ��� ����� �̸��� ǥ���Ͻÿ�.
4. EMP ���̺��� �̸��� J, A, M���� �����ϴ� ��� ����� �̸�[ù ���ڴ� �빮�ڷ� �������� �ҹ���] �� �̸��� ���̸� ǥ���Ͻÿ�.
[�� ���̺��� name, length�� ǥ��]

SELECT INITCAP (job) FROM emp;

SELECT SUBSTR ( ename, 1 , 3) FROM emp WHERE ename LIKE '%A%';

SELECT ename FROM emp WHERE ename LIKE '__A%' ;
SELECT ename FROM emp WHERE SUBSTR( name, 3, 1) = 'A' ;

SELECT INITCAP (ename) name, LENGTH (ename) length FROM emp WHERE (ename LIKE 'J%' OR ename LIKE 'A%' OR ename LIKE 'M%');
SELECT INITCAP (ename) name, LENGTH (ename) length FROM emp WHERE SUBSTR ( ename , 1 , 1) IN( 'J' , 'A', 'M') ;


���� �Լ�

CEIL (�Ǽ�) : �ø� ó���� �������� ��ȯ
SELECT CEIL(1.4) FROM dual;

FLOOR(�Ǽ�) : ���� ó���� ���� ���� ��ȯ
SELECT FLOOR (1.7) FROM dual;

ROUND (������, �����ڸ���) : �ݿø�
SELECT ROUND (45.926 , 2) FROM dual;
SELECT ROUND (45.926) FROM dual;

SELECT empno , ename , sal , ROUND(sal * 1.15) "New Salary" , ROUND(sal* 1.15) - sal "Increase" FROM emp;

TRUNC (������ , �����ڸ���) : ����
SELECT TRUNC (45.926 , 2 ) FROM dual;

MOD ( ������, ��������) : ��������
SELECT MOD (17,2) FROM dual;

��¥ �Լ�

��¥�� ��� ������ ���
SELECT ename , TRUNC((SYSDATE - hiredate) / 7) AS weeks FROM emp WHERE deptno = 10;

MONTHS_BETWEEN(��¥1, ��¥2) :  �� ��¥ ���� ���� ��
SELECT MONTHS_BETWEEN ('2012-03-23','2010-01-23') FROM dual;
SELECT ename, TRUNC ( MONTHS_BETWEEN (SYSDATE , hiredate)) months_worked FROM emp ORDER BY months_worked;

ADD_MONTHS : Ư�� ��¥�� ���� ������ ���� ���� �ش� ��¥�� ��ȯ�ϴ� �Լ�
select add_months('2022-01-01',8) from dual;

NEXT_DAY : ������ ������ ���� ��¥
SELECT NEXT_DAY ('2024-03-12','������') FROM dual;

1(�Ͽ���) - 7(�����)
SELECT NEXT_DAY ('2024-03-12',2) FROM dual;

LAST_DAY : ���� ������ ��
SELECT LAST_DAY ('2012-11-07' ) FROM dual;

EXTRACT : ��¥ �������� Ư���� ����, ��, ��, �ð�, ��, �� ���� ����
SELECT EXTRACT (YEAR FROM SYSDATE), EXTRACT (MONTH FROM SYSDATE) , EXTRACT(DAY FROM SYSDATE) FROM dual;

[�ǽ� ����]
1. EMP ���̺��� ��� ����� �̸��� �޿��� ǥ���ϼ���. �޿��� 15�� ���̷� ���ʿ� $ ��ȣ�� ä���� �������� ǥ���ϰ�
�� ���̺��� SALARY�� �����ϼ���.
2. EMP ���̺��� ��� ����� �̸�, ����, �޿�, �μ� ��ȣ�� ����ϼ���. 
�μ� ��ȣ�� �������� ������ �ϰ� ����� �̸��� ���� :  10 , ��ĭ�� *�� ǥ���ϼ���.
3. ���ú��� �̹� ���� ������ �� ������ ���� �� ���� ���ϼ���.
4. EMP ���̺��� �� ����� ���� ��� ��ȣ, �̸�, �޿� �� 15% �λ�� �޿��� ����(�ݿø�)�� ǥ���ϼ���.
�λ�� �޿����� ���̺��� NEW SALARY�� �����ϼ���.

SELECT ename, LPAD (sal,15,'$') "Salary"  FROM emp;
SELECT RPAD (ename ,10,'*'), job, sal, deptno FROM emp ORDER BY deptno ASC ;
SELECT (LAST_DAY(SYSDATE) - SYSDATE ) FROM dual;
SELECT empno, ename, sal, ROUND(sal *1.15) "New Salary" FROM emp;

��ȯ �Լ�

TO_CHAR : ���� => ���� ,  ��¥ => ����
TO_NUMBER : ���� => ����
TO_DATE : ���� => ��¥

TO_CHAR : ���ڰ� ���� , ��¥�� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR (SYSDATE, 'YYYY-MM-DD PM HH:MI:SS') FROM dual;

���� �ڸ����� ��ġ
SELECT TO_CHAR (1234 , 9999) FROM dual;
SELECT TO_CHAR (1234 , '9999') FROM dual;
SELECT TO_CHAR (1234 , 0000) FROM dual;

�ڸ����� ���ڶ� => ####
SELECT TO_CHAR (1234 , 999) FROM dual;
SELECT TO_CHAR (1234 , '999') FROM dual;
SELECT TO_CHAR (1234 , '000') FROM dual;

���� �ڸ��� ���� ���� �ڸ��� ����
SELECT TO_CHAR (1234 , 99999) FROM dual;
SELECT TO_CHAR (1234 , '99999') FROM dual;
SELECT TO_CHAR (1234 , '00000') FROM dual;

�Ҽ��� �ڸ� ����
SELECT TO_CHAR (1234, 9999.99) FROM dual;
SELECT TO_CHAR (1234, '9999.99') FROM dual;
SELECT TO_CHAR (1234, '0000.00 ') FROM dual;

�ݿø��ؼ� �Ҽ��� ��°�ڸ����� ǥ��
SELECT TO_CHAR (25.897, '99.99') FROM dual;

�λ�� �޿��� �Ҽ��� ù°�ڸ����� ǥ��
SELECT TO_CHAR (SAL*1.15, '9,999.9') FROM EMP;

��ȭ ǥ��
SELECT TO_CHAR(1234, '$0000') FROM dual;
SELECT TO_CHAR(1234, '$9999') FROM dual;

���� ��ȭ ǥ��
SELECT TO_CHAR(1234, 'L9999') FROM dual;

TO_DATE : ���� -> ��¥
SELECT TO_DATE ('24-03-12','YYYY-MM-DD') FROM dual;
���� ���� ���� ����
SELECT TO_DATE ('24-03-12') FROM dual;

TO_NUMBER : ���� -> ����
SELECT TO_NUMBER('100' , 999) FROM dual;


[����]
1) emp ���̺��� ������ ������ ��ǥ(,)�� �����ؼ� ǥ���ϰ� �÷����� Employee and Job���� ǥ���Ͻÿ�.
2) �μ���ȣ 30(deptno)���� �ٹ��ϸ� �� 2,000�޷� ���ϸ� �޴� 81�� 5�� 1�� ������ �Ի��� ����� �̸�, �޿�, �μ���ȣ, �Ի����� ����Ͻÿ�.
3) emp ���̺��� �̸��� A�� E�� �ִ� ��� ����� �̸��� ǥ���Ͻÿ�.
4) emp ���̺��� ����̸� �� S�� ���Ե��� ���� ����� �� �μ���ȣ�� 20�� ������� �̸��� �μ���ȣ�� ����Ͻÿ�.
5) emp ���̺��� ������(mgr)�� ���� ��� ����� �̸��� ������ ǥ���Ͻÿ�.
6) emp ���̺��� Ŀ�̼� �׸��� �Էµ� ������� �̸��� �޿�, Ŀ�̼��� ���Ͻÿ�.
7) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �ҹ��ڷ� �̸��� ����Ͻÿ�.
8) �̸��� ���ڼ��� 6���̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� ����Ͻÿ�.
9) �� ����� �̸��� ǥ���ϰ� �ٹ� �� ��(�Ի��Ϸκ��� ��������� �� ��)�� ����Ͽ� �����̺��� MONTHS_WORKED�� �����Ͻʽÿ�. ����� ������ �ݿø��Ͽ� ǥ���ϰ� �ٹ� �� ���� �������� ������������ �����Ͻÿ�.
10) emp ���̺��� �̸�(�ҹ��ڷ� ǥ��), ����, �ٹ������� ����Ͻÿ�.

1) SELECT ename || ', ' || job AS "Employee and Job" FROM emp;
2) SELECT ename, sal, deptno, hiredate FROM emp WHERE deptno = 30 AND sal<= 2000 AND hiredate < '81-5-1' ; 
3) SELECT ename FROM emp WHERE ename LIKE '%A%' AND ename LIKE '%E%';
4) SELECT ename, deptno FROM emp WHERE ename NOT LIKE '%S%' AND deptno = 20;
5) SELECT ename, job FROM emp WHERE mgr IS NOT null;
6) SELECT ename, sal, comm FROM emp WHERE comm IS NOT null;
7) SELECT LOWER(ename) FROM emp WHERE LENGTH(ename) >= 6;
8) SELECT SUBSTR (LOWER(ename) , 1 , 3) FROM emp WHERE LENGTH(ename) >= 6 ;
9) SELECT ename, ROUND( MONTHS_BETWEEN (SYSDATE , hiredate) ) AS MONTHS_WORKED FROM emp  ORDER BY MONTHS_WORKED ASC ;
10) SELECT LOWER(ename) , job, TRUNC ( (SYSDATE - hiredate ) / 365 ) AS YEARS_WORKED FROM emp;

�Ϲ� �Լ�

NVL( value1 , value2) : value1�� null�̸� value2�� ����. value1�� value2�� �ڷ����� ��ġ
SELECT ename, sal, comm , (sal + NVL (comm , 0)) * 12 FROM emp;
SELECT ename, NVL ( TO_CHAR(comm)  , 'No Commission')  AS "COMM" FROM emp;

NVL2 ( value1 , value2, value3) : value1�� null���� ��. null�̸� value3, null�� �ƴϸ� value2 �ڷ����� ��ġ���� �ʾƵ� �ȴ�.
SELECT NVL2(comm , 'Commission' , 'No  Commision') FROM emp;

NULLIF (value1, value2) :  �� ���� ���� ��ġ�ϸ� NULL ,  �� ���� ���� ��ġ���� ������ value1
SELECT NULLIF (LENGTH(ename) , LENGTH( job )) "NULLIF" FROM emp;

COALESCE (value1, valu2, value3 ...) : NULL���� �ƴ� ���� ����Ѵ�. (�ڷ��� ��ġ)
SELECT comm, sal, COALESCE(comm, sal, 0) FROM emp;
SELECT comm, mgr, sal, COALESCE ( comm, mgr, sal) FROM emp;

CASE Į��  WHEN �񱳰� THEN �����
               WHEN           THEN
               WHEN           THEN
               (ELSE �����)
      END

SELECT ename, sal, job, CASE job WHEN 'SALESMAN' THEN sal * 0.1
                                             WHEN 'MANAGER' THEN sal * 0.2
                                             WHEN 'ANALYST' THEN sal * 0.3
                                             ELSE sal * 0.4
                              END "Bonus" FROM emp;

SELECT ename, sal, job, CASE WHEN sal >= 4000 AND sal <= 5000 THEN 'A'
                                       WHEN sal >= 3000 AND sal < 4000 THEN 'B'
                                       WHEN sal >= 2000 AND sal < 3000 THEN 'C'
                                       WHEN sal >= 1000 AND sal < 2000 THEN 'D'
                                       ELSE 'F'
                        END "Grade"
               FROM emp;

DECODE : = �񱳸� �׳���, ����Ŭ ����
         DECODE (Į��, �񱳰�, ��ȯ��,
                              �񱳰�, ��ȯ��,
                              �񱳰�, ��ȯ��,
                              ��ȯ��)
SELECT ename, sal, job,
         DECODE ( job , 'SALESMAN' , sal * 0.1 ,
                              'MANAGER' , sal * 0.2 ,
                              'ANALYST' , sal * 0.3 ,
                               sal * 0.4 )
                  "Bonus"
FROM emp;

SELECT ename, sal, job,
            DECODE ( TRUNC ( sal / 1000) , 5, 'A',
                                                      4 , 'A',
                                                      3 , 'B',
                                                      2 , 'C',
                                                      1 , 'D',
                                                      'F' ) "Grade"
   FROM emp;

[�ǽ� ����]
1. EMP ���̺��� ��� �̸�, ����, ���ް� Ŀ�̼��� ���� ���� �÷��� �Ǳ޿���� �ؼ� ����ϼ���.
   �� , NULL ���� ��Ÿ���� �ʰ� �ۼ��ϼ���.
2. EMP ���̺��� ���ް� Ŀ�̼��� ��ģ �ݾ��� 2000 �̻��� �޿��� �޴� ����� �̸�, ����, ����, Ŀ�̼�, ��볯¥�� ����ϼ���.
   ��, ��� ��¥�� 1980 - 12 - 17 ���·� ����ϼ���.

SELECT ename, sal,  ( sal + NVL ( comm , 0 ) ) AS "�Ǳ޿�" FROM emp;
SELECT ename, job, sal, comm, TO_CHAR ( hiredate , 'YYYY-MM-DD') "hiredate"FROM emp WHERE ( sal + NVL ( comm , 0 ) ) >= 2000;

�׷� �Լ� : �� ���� ������ �����Ͽ� �׷캰�� �ϳ��� ����� ����

AVG() : NULL�� ������ ��� ������ ����� ��ȯ. NULL���� ��� ��꿡�� ���õ�
SELECT AVG(sal)   FROM emp;
SELECT ROUND ( AVG(sal)) FROM emp;

COUNT() : NULL�� ������ ���� ���� ��� ���ڵ��� ���� ��ȯ. COUNT(*) ������ ����ϸ� NULL�� ��꿡 ����
SELECT COUNT (empno) FROM emp;
SELECT COUNT (comm) FROM emp;
SELECT COUNT(*) FROM emp;

MAX () : ���ڵ� ���� �ִ� ���� �� �� ���� ū ���� ��ȯ
SELECT MAX (sal) FROM emp;
SELECT MAX (ename) FROM emp;
SELECT MAX (hiredate) FROM emp;

MIN () : ���ڵ� ���� �ִ� ���� �� �� ���� ���� ���� ��ȯ
SELECT MIN(sal) FROM emp;
SELECT MIN (ename) FROM emp;
SELECT MIN(hiredate) FROM emp;

SUM() : ���ڵ���� �����ϰ� �ִ� ��� ���� ���Ͽ� ��ȯ
SELECT SUM(sal) FROM emp;

SELECT MAX(sal) �ִ� ,MIN(sal) �ּ� , ROUND(AVG(sal)) ��� , SUM(sal) �հ� FROM emp;
SELECT MAX(sal), MIN (sal), ROUND(AVG(sal)) , SUM(sal) FROM emp WHERE deptno = 10;
SELECT COUNT(*) FROM emp WHERE deptno = 20;

GROUP BY : SELECT���� �����Լ� ����� ���� �÷��� ������ �� ����.
                 ���� �÷��� ������ ��쿡�� �ݵ�� GROUP BY ���� ������ �÷��� �����ϴ�.
                 
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno;
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno ORDER BY deptno;

�μ����� ��� �� ���ϱ�
SELECT deptno , COUNT(empno) FROM emp GROUP BY deptno ORDER BY deptno;
SELECT * FROM emp;
SELECT COUNT(empno) ,job FROM emp GROUP BY job;

���� ������ GROUP BY �� ����ϱ�
SELECT deptno , job, SUM(sal) FROM emp GROUP BY deptno, job ORDER BY deptno;

�׷��Լ��� ����� �߸��� Query

HAVING : �׷��Լ��� �̿��ؼ� ���� üũ�� �� ��� �˸��ƽ� ��� �Ұ���
[���� �߻�]
SELECT deptno , AVG(sal) FROM emp WHERE AVG(sal) >= 2000 GROUP BY deptno; -- WHERE �� �׷� �Լ��� �̿��ؼ� ������ üũ�ϸ� ���� �߻�
[���� ����]
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal) >= 2000;
               
�μ����� �ִ� �޿��� ���ϴµ� 3000�� �ʰ��� �ִ� �޿��� ���ϼ���.
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno HAVING MAX(sal) > 3000 ;

�׷� �Լ� ��ø 
SELECT MAX(AVG(sal)) FROM emp GROUP BY deptno;

�б⺰�� �Ի��� ����� �� 
SELECT TO_CHAR (hiredate , 'Q') "�б�" , COUNT(ename) "��� ��" FROM emp GROUP BY TO_CHAR (hiredate , 'Q') ORDER BY "�б�";


[�ǽ� ����]
1. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ǥ���Ͻÿ�.
   ���̺��� ���� MAXIMUM,MINIMUM,SUM,AVERAGE�� �����ϰ�
   ����� ������ �ݿø��ϰ� �� �ڸ� ������ ,�� ����ϼ���.
2. �޿��� Ŀ�̼��� ���� �ݾ��� �ְ�, ����, ��� �ݾ��� ���Ͻÿ�.
   ��� �ݾ��� �Ҽ��� ù° �ڸ����� ǥ���Ͻÿ�.
3. ������ ������ ������ ����� ���� ǥ���ϼ���.
   ������ ��� ���� ���ϼ���.
4. 30�� �μ��� ��� ���� ���ϼ���.
�μ� ��ȣ ��� ���� ����
SELECT COUNT(*) FROM emp WHERE deptno=30;
�μ� ��ȣ �����
SELECT deptno, COUNT(*) FROM emp WHERE deptno = 30 GROUP BY deptno;
5. ������ �ְ� ������ ���ϰ� ����, �ְ� ������ ����ϼ���.
6. 20�� �μ��� �޿� �հ踦 ���ϰ� �޿� �հ� �ݾ��� ����ϼ���.
7. �μ����� ���޵Ǵ� �� ���޿��� �ݾ��� 9000�̻��� �޴� ������� �μ���ȣ, �ѿ����� ����ϼ���.
8. �������� ����� ���� ���� ����� ���ϰ� �� ��� ������ ����� 79�� �����ϴ� ����� �����ּ���.
9. ������ �� ������ ����ϴ� ������'MANAGER'�� ������� �����ϰ� �� ������ 5000 ���� ���� ������ �� ���޸� ����ϼ���.
10. �������� ����� ���� 4�� �̻��� ������ �ο� ���� ����ϼ���.

SELECT TO_CHAR(MAX(sal), '9,999') "Maximum" , TO_CHAR(MIN(sal), '9,999') "Minimum" , TO_CHAR(SUM(sal) , '99,999') "Sum" , TO_CHAR (ROUND(AVG(sal)), '9,999') "Average" FROM emp;   
SELECT MAX( sal + NVL ( comm , 0 )) "Max", MIN( sal + NVL ( comm , 0 )) "Min", ROUND(AVG( sal + NVL ( comm , 0 )) , 1) "Avg" FROM emp;
SELECT COUNT(ename), job FROM emp GROUP BY job ORDER BY job;
SELECT COUNT(ename) FROM emp WHERE deptno = 30;
SELECT job, MAX(sal) FROM emp GROUP BY job;
SELECT SUM(sal) FROM emp WHERE deptno = 20;
SELECT SUM(sal) "�� ����", deptno FROM emp GROUP BY deptno HAVING SUM(sal) >= 9000;
SELECT job, MAX(empno) FROM emp GROUP BY job  HAVING MAX(empno) LIKE '79%';
SELECT job, MAX(empno) FROM emp WHERE empno LIKE '79%' GROUP BY job;
SELECT job , SUM(sal) FROM emp GROUP BY job HAVING job != 'MANAGER' AND SUM(sal) > 5000 ;
SELECT job , COUNT(empno) FROM emp GROUP BY job HAVING COUNT(*) >= 4;

�м� �Լ�
RANK () : ������ ǥ���� �� ����ϴ� �Լ�
RANK(���ǰ�) WITHIN GROUP (ORDER BY ���ǰ� �÷���) : Ư�� �������� ���� Ȯ���ϱ�
[����] RANK �ڿ� ������ �����Ϳ� ORDER BY �ڿ� ������ �����ʹ� ���� �ɷ��̾�� �Ѵ�.

SELECT RANK('SMITH') WITHIN GROUP (ORDER BY ename) "RANK" FROM emp;

RANK() OVER (ORDER BY �÷���) : ��ü ����
������� empno, ename, sal, �޿� ������ ���
SELECT empno, ename sal, RANK() OVER(ORDER BY sal DESC) "�޿� ����" FROM emp;

10�� �μ��� ���� �������� ����� �̸�, �޿�, �ش� �μ� ���� �޿� ������ ����ϼ���.
SELECT ename, sal, RANK() OVER(ORDER BY sal DESC)"�޿� ����" FROM emp WHERE deptno = 10;

emp ���̺��� ��ȸ�Ͽ� ���, �̸�, �޿�, �μ���ȣ, �μ��� �޿� ������ ���
SELECT empno, ename, sal, deptno, RANK() OVER (PARTITION BY deptno ORDER BY sal DESC) "�޿� ����" FROM emp;
emp ���̺��� ���� �μ����� job ���� �޿� ������ ��� empno, ename, sal, deptno, job �� ����ϼ���
SELECT empno, ename, sal, deptno,job, RANK() OVER (PARTITION BY deptno, job ORDER BY sal DESC) "�޿� ����" FROM emp;



