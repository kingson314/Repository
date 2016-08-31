 
create table BASEENTITY
(
  ID           VARCHAR2(32) default sys_guid() not null,
  NAME         VARCHAR2(100),
  CREATEDATE   TIMESTAMP(6) default sysdate,
  MODIFYDATE   TIMESTAMP(6),
  CREATEUSERID VARCHAR2(100),
  MODIFYUSERID VARCHAR2(100),
  VERSION      VARCHAR2(10) default '1.0.0',
  STATE        NUMBER(1) default 0,
  ORD          NUMBER default 0,
  MEMO         VARCHAR2(1000)
) ;
comment on table BASEENTITY
  is '����ʵ����';
comment on column BASEENTITY.ID
  is 'guid';
comment on column BASEENTITY.NAME
  is '�û�����';
comment on column BASEENTITY.CREATEDATE
  is '��������';
comment on column BASEENTITY.MODIFYDATE
  is '�޸�����';
comment on column BASEENTITY.CREATEUSERID
  is '������Id[sys_user.id]';
comment on column BASEENTITY.MODIFYUSERID
  is '�޸���Id[sys_user.id]';
comment on column BASEENTITY.VERSION
  is '�汾��';
comment on column BASEENTITY.STATE
  is '״̬��0Ϊ������-1Ϊ�����ã�';
comment on column BASEENTITY.ORD
  is '����';
comment on column BASEENTITY.MEMO
  is '��ע˵��';
 
create table SUPERENTITY
(
  ID           VARCHAR2(32) default sys_guid() not null,
  CREATEDATE   TIMESTAMP(6) default sysdate,
  MODIFYDATE   TIMESTAMP(6),
  CREATEUSERID VARCHAR2(100),
  MODIFYUSERID VARCHAR2(100),
  VERSION      VARCHAR2(10) default '1.0.0',
  ORD          NUMBER default 0
) ;
comment on table SUPERENTITY
  is 'ʵ�嶥����';
comment on column SUPERENTITY.ID
  is 'guid';
comment on column SUPERENTITY.CREATEDATE
  is '��������';
comment on column SUPERENTITY.MODIFYDATE
  is '�޸�����';
comment on column SUPERENTITY.CREATEUSERID
  is '������Id[sys_user.id]';
comment on column SUPERENTITY.MODIFYUSERID
  is '�޸���Id[sys_user.id]';
comment on column SUPERENTITY.VERSION
  is '�汾��';
comment on column SUPERENTITY.ORD
  is '����';
 