CREATE USER spring
    IDENTIFIED BY 1234
    DEFAULT TABLESPACE USERS users
    TEMPORARY TABLESPACE temp;
show user;
GRANT CONNECT TO spring;
GRANT RESOURCE TO spring;
GRANT DBA TO spring;
grant connect ,dba  to spring ;

-------------------------qna 구현하면서 필요한 테이블
create table qna_tbl
(
    qno number(10,0) primary key,
    title varchar2(50) not null,
    writer varchar2(100) not null,
    reg_date timestamp not null,
    pwd varchar2(10) null,
    p_group varchar2(10) default 'public' constraint group_ch check (p_group in ('public','private'))
);
alter table qna_tbl add up_date timestamp;
create sequence qna_seq;

create table reply_tbl(
    rno number(10,0) primary key,
    qno number(10,0) not null,
    r_writer varchar2(50) not null,
    r_content varchar2(100) not null,
    r_reg_date timestamp not null,
    r_up_date timestamp ,
    constraint fk_qna_no foreign key(qno) references qna_tbl(qno) on delete cascade
);
alter table reply_tbl rename to qna_reply_tbl;
create sequence reply_seq;
insert into  qna_tbl values(qna_seq.nextval,'test2','test2',sysdate,null,'public');
select*from qna_tbl;
select * from qna_reply_tbl order by rno ;
grant connect ,dba  to spring ;
select writer from qna_tbl where qno=1 ;
select * from qna_tbl where qno=1;
select*from reply_tbl where qno=1 order by rno;
delete from qna_reply_tbl where rno=5;
update qna_reply_tbl set r_content='수정되나' where rno=1;
select *from qna_tbl order by reg_date desc;
desc tbl_attach;
create table qna_attach_tbl(
    uuid varchar2(100) primary key,
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    fileType char(1) default 'I',
    qno number(10,0),
    constraint fk_attach_qno foreign key(qno) references qna_tbl(qno) on delete cascade
);
select*from qna_attach_tbl;
select count(*) from qna_reply_tbl where qno=1;

select * from  qna_tbl where not up_date is null order by up_date desc, reg_date asc;
select * from  qna_tbl order by up_date desc nulls LAST, reg_date desc;


SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
  FROM    user_objects
WHERE   object_type = 'TABLE';

-- spring database???? ??? table?? ???? ??????
drop table tbl_user;

create table tbl_user(
    uno number,
    user_id varchar2(30),
    password varchar2(30),
    name varchar2(30),
    email varchar2(30));

create sequence seq_uno;
alter table tbl_user add suspension varchar2(50) check(suspension in('Y','N'))
alter table qna_tbl add up_date timestamp;



drop table tbl_group;
create table tbl_group(
    sno number primary key,
    group_name varchar2(30),
    leader varchar2(30),
    subject varchar2(30),
    description varchar2(30),
    member_number number);
create sequence seq_sno;

select*from tbl_group;

create table tbl_groupuser(
    cno number,
    authorized varchar2(1),
    user_id number(30),
    group_name varchar2(30));

create sequence seq_cno;

create table tbl_review(
    rno number,
    group_name varchar2(30),
    title varchar2(200),
    content varchar2(2000),
    writer varchar2(30),
    regdate date default sysdate );    

create sequence seq_rno;

create table tbl_qanda(
    qno number,
    title varchar2(200),
    content varchar2(2000),
    writer varchar2(30),
    regdate date default sysdate );    
    
create sequence seq_gno;

desc tbl_board;
drop table tbl_board  CASCADE CONSTRAINTS;;
create table tbl_board(
    bno number,
    group_name varchar2(30),
    title varchar2(200),
    content varchar2(2000),
    writer varchar2(30),
    regdate date default sysdate );  

create sequence seq_bno;
    
commit;

    

    

    

