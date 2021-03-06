update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'common.schema.version';

alter table ACT_RU_ENTITYLINK add ROOT_SCOPE_ID_ NVARCHAR2(255);
alter table ACT_RU_ENTITYLINK add ROOT_SCOPE_TYPE_ NVARCHAR2(255);
create index ACT_IDX_ENT_LNK_ROOT_SCOPE on ACT_RU_ENTITYLINK(ROOT_SCOPE_ID_, ROOT_SCOPE_TYPE_, LINK_TYPE_);

alter table ACT_HI_ENTITYLINK add ROOT_SCOPE_ID_ NVARCHAR2(255);
alter table ACT_HI_ENTITYLINK add ROOT_SCOPE_TYPE_ NVARCHAR2(255);
create index ACT_IDX_HI_ENT_LNK_ROOT_SCOPE on ACT_HI_ENTITYLINK(ROOT_SCOPE_ID_, ROOT_SCOPE_TYPE_, LINK_TYPE_);

alter table ACT_RU_ENTITYLINK add SUB_SCOPE_ID_ NVARCHAR2(255);
alter table ACT_RU_ENTITYLINK add PARENT_ELEMENT_ID_ NVARCHAR2(255);

alter table ACT_HI_ENTITYLINK add SUB_SCOPE_ID_ NVARCHAR2(255);
alter table ACT_HI_ENTITYLINK add PARENT_ELEMENT_ID_ NVARCHAR2(255);

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'entitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'identitylink.schema.version';

alter table ACT_RU_JOB add CATEGORY_ NVARCHAR2(255);

alter table ACT_RU_TIMER_JOB add CATEGORY_ NVARCHAR2(255);

alter table ACT_RU_SUSPENDED_JOB add CATEGORY_ NVARCHAR2(255);

alter table ACT_RU_DEADLETTER_JOB add CATEGORY_ NVARCHAR2(255);

create table ACT_RU_EXTERNAL_JOB (
    ID_ NVARCHAR2(64) NOT NULL,
    REV_ INTEGER,
    CATEGORY_ NVARCHAR2(255),
    TYPE_ NVARCHAR2(255) NOT NULL,
    LOCK_EXP_TIME_ TIMESTAMP(6),
    LOCK_OWNER_ NVARCHAR2(255),
    EXCLUSIVE_ NUMBER(1,0) CHECK (EXCLUSIVE_ IN (1,0)),
    EXECUTION_ID_ NVARCHAR2(64),
    PROCESS_INSTANCE_ID_ NVARCHAR2(64),
    PROC_DEF_ID_ NVARCHAR2(64),
    ELEMENT_ID_ NVARCHAR2(255),
    ELEMENT_NAME_ NVARCHAR2(255),
    SCOPE_ID_ NVARCHAR2(255),
    SUB_SCOPE_ID_ NVARCHAR2(255),
    SCOPE_TYPE_ NVARCHAR2(255),
    SCOPE_DEFINITION_ID_ NVARCHAR2(255),
    RETRIES_ INTEGER,
    EXCEPTION_STACK_ID_ NVARCHAR2(64),
    EXCEPTION_MSG_ NVARCHAR2(2000),
    DUEDATE_ TIMESTAMP(6),
    REPEAT_ NVARCHAR2(255),
    HANDLER_TYPE_ NVARCHAR2(255),
    HANDLER_CFG_ NVARCHAR2(2000),
    CUSTOM_VALUES_ID_ NVARCHAR2(64),
    CREATE_TIME_ TIMESTAMP(6),
    TENANT_ID_ NVARCHAR2(255) DEFAULT '',
    primary key (ID_)
);

create index ACT_IDX_EJOB_EXCEPTION on ACT_RU_EXTERNAL_JOB(EXCEPTION_STACK_ID_);
create index ACT_IDX_EJOB_CUSTOM_VAL_ID on ACT_RU_EXTERNAL_JOB(CUSTOM_VALUES_ID_);

alter table ACT_RU_EXTERNAL_JOB
    add constraint ACT_FK_EJOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_EXTERNAL_JOB
    add constraint ACT_FK_EJOB_CUSTOM_VAL
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_EJOB_SCOPE on ACT_RU_EXTERNAL_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_EJOB_SUB_SCOPE on ACT_RU_EXTERNAL_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_EJOB_SCOPE_DEF on ACT_RU_EXTERNAL_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

alter table ACT_RU_JOB add CORRELATION_ID_ NVARCHAR2(255);
alter table ACT_RU_TIMER_JOB add CORRELATION_ID_ NVARCHAR2(255);
alter table ACT_RU_SUSPENDED_JOB add CORRELATION_ID_ NVARCHAR2(255);
alter table ACT_RU_DEADLETTER_JOB add CORRELATION_ID_ NVARCHAR2(255);
alter table ACT_RU_EXTERNAL_JOB add CORRELATION_ID_ NVARCHAR2(255);

create index ACT_IDX_JOB_CORRELATION_ID on ACT_RU_JOB(CORRELATION_ID_);
create index ACT_IDX_TJOB_CORRELATION_ID on ACT_RU_TIMER_JOB(CORRELATION_ID_);
create index ACT_IDX_SJOB_CORRELATION_ID on ACT_RU_SUSPENDED_JOB(CORRELATION_ID_);
create index ACT_IDX_DJOB_CORRELATION_ID on ACT_RU_DEADLETTER_JOB(CORRELATION_ID_);
create index ACT_IDX_EJOB_CORRELATION_ID on ACT_RU_EXTERNAL_JOB(CORRELATION_ID_);

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'job.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'batch.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'task.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'variable.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'eventsubscription.schema.version';

