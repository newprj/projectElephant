CREATE USER spring
    IDENTIFIED BY 1234
    DEFAULT TABLESPACE USERS users
    TEMPORARY TABLESPACE temp;
show user;
GRANT CONNECT TO spring;
GRANT RESOURCE TO spring;
GRANT DBA TO spring;
grant connect ,dba  to spring ;
create table qna_tbl
(
    qno number(10,0) primary key,
    title varchar2(50) not null,
    writer varchar2(100) not null,
    reg_date timestamp not null,
    pwd varchar2(10) null,
    p_group varchar2(10) default 'public' constraint group_ch check (p_group in ('public','private'))
);

create sequence qna_seq;
insert into  qna_tbl values(qna_seq.nextval,'test2','test2',sysdate,null,'public');
select*from qna_tbl;
select * from qna_tbl ;
grant connect ,dba  to spring ;
select writer from qna_tbl where qno=1 ;

