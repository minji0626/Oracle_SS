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