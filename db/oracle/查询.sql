select * from SYS_MENU;
exp shj/shj@ORCL file=E:\shj.dmp owner=(shj)
imp shj/shj@ORCL file=E:\shj.dmp fromuser=shj touser=shj


/*shj */
/*��1����������ʱ��ռ�  */
create temporary tablespace shj_temp
tempfile 'E:\app\Administrator\oradata\shj\shj_temp.dbf' 
size 100m  
autoextend on  
next 500m maxsize 1000m  
extent management local;  
 
/*��2�����������ݱ�ռ�  */
create tablespace shj_data  
logging  
datafile 'E:\app\Administrator\oradata\shj\shj_data.dbf' 
size 500m  
autoextend on  
next 500m maxsize 10000m  
extent management local;  
 
/*��3���������û���ָ����ռ�  */
create user shj identified by shj
default tablespace shj_data  
temporary tablespace shj_temp;
 
/*��4�������û�����Ȩ��  */
grant connect,resource,dba to shj
