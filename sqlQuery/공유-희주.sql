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

create table qna_reply_tbl(
    rno number(10,0) primary key,
    qno number(10,0) not null,
    r_writer varchar2(50) not null,
    r_content varchar2(100) not null,
    r_reg_date timestamp not null,
    r_up_date timestamp ,
    constraint fk_qna_no foreign key(qno) references qna_tbl(qno) on delete cascade
);
create sequence reply_seq;

create table qna_attach_tbl(
    uuid varchar2(100) primary key,
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    fileType char(1) default 'I',
    qno number(10,0),
    constraint fk_attach_qno foreign key(qno) references qna_tbl(qno) on delete cascade
);

drop table tbl_user;


----------------admin 페이지에서 회원 정지 관련 칼럼 추가
create table tbl_user(
    uno number,
    user_id varchar2(30),
    password varchar2(30),
    name varchar2(30),
    email varchar2(30));

create sequence seq_uno;
alter table tbl_user add suspension varchar2(50) check(suspension in('Y','N'));
alter table qna_tbl add up_date timestamp;


------------admin에서 필요한 정보
drop table tbl_user;
create table tbl_user(
    uno number,
    user_id varchar2(30),
    password varchar2(30),
    name varchar2(30),
    email varchar2(30));
drop sequence seq_uno;
create sequence seq_uno;
alter table tbl_user add regDate timestamp;

select*from tbl_user;
