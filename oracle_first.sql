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

