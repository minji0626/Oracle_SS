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

null���� ���� : null�� ����� �� ���ų�, �Ҵ���� �ʾҰų�, �� �� ���ų�, ������ �� ���� ��
               (null�� 0�̳� ����� �ٸ�)