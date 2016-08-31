select * from SYS_MENU;
exp shj/shj@ORCL file=E:\shj.dmp owner=(shj)
imp shj/shj@ORCL file=E:\shj.dmp fromuser=shj touser=shj


/*shj */
/*第1步：创建临时表空间  */
create temporary tablespace shj_temp
tempfile 'E:\app\Administrator\oradata\shj\shj_temp.dbf' 
size 100m  
autoextend on  
next 500m maxsize 1000m  
extent management local;  
 
/*第2步：创建数据表空间  */
create tablespace shj_data  
logging  
datafile 'E:\app\Administrator\oradata\shj\shj_data.dbf' 
size 500m  
autoextend on  
next 500m maxsize 10000m  
extent management local;  
 
/*第3步：创建用户并指定表空间  */
create user shj identified by shj
default tablespace shj_data  
temporary tablespace shj_temp;
 
/*第4步：给用户授予权限  */
grant connect,resource,dba to shj
