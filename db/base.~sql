-----------------------------------------------------
-- Export file for user SHJ                        --
-- Created by Administrator on 2015/5/19, 23:01:49 --
-----------------------------------------------------

spool base.log

prompt
prompt Creating table BASEENTITY
prompt =========================
prompt
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
)
tablespace SHE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
  );
comment on table BASEENTITY
  is '基础实体类';
comment on column BASEENTITY.ID
  is 'guid';
comment on column BASEENTITY.NAME
  is '用户名称';
comment on column BASEENTITY.CREATEDATE
  is '创建日期';
comment on column BASEENTITY.MODIFYDATE
  is '修改日期';
comment on column BASEENTITY.CREATEUSERID
  is '创建人Id[sys_user.id]';
comment on column BASEENTITY.MODIFYUSERID
  is '修改人Id[sys_user.id]';
comment on column BASEENTITY.VERSION
  is '版本号';
comment on column BASEENTITY.STATE
  is '状态（0为正常，-1为不可用）';
comment on column BASEENTITY.ORD
  is '排序';
comment on column BASEENTITY.MEMO
  is '备注说明';

prompt
prompt Creating table SUPERENTITY
prompt ==========================
prompt
create table SUPERENTITY
(
  ID           VARCHAR2(32) default sys_guid() not null,
  CREATEDATE   TIMESTAMP(6) default sysdate,
  MODIFYDATE   TIMESTAMP(6),
  CREATEUSERID VARCHAR2(100),
  MODIFYUSERID VARCHAR2(100),
  VERSION      VARCHAR2(10) default '1.0.0',
  ORD          NUMBER default 0
)
tablespace SHE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
  );
comment on table SUPERENTITY
  is '实体顶层类';
comment on column SUPERENTITY.ID
  is 'guid';
comment on column SUPERENTITY.CREATEDATE
  is '创建日期';
comment on column SUPERENTITY.MODIFYDATE
  is '修改日期';
comment on column SUPERENTITY.CREATEUSERID
  is '创建人Id[sys_user.id]';
comment on column SUPERENTITY.MODIFYUSERID
  is '修改人Id[sys_user.id]';
comment on column SUPERENTITY.VERSION
  is '版本号';
comment on column SUPERENTITY.ORD
  is '排序';


spool off
