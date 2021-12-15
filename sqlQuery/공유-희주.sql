-------------------------qna �����ϸ鼭 �ʿ��� ���̺�
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


----------------admin 페이지에서 user 활동 정지 (12월 15일 수정)
create table tbl_user(
    uno number,
    user_id varchar2(30),
    password varchar2(30),
    name varchar2(30),
    email varchar2(30));

create sequence seq_uno;

-- 정지 칼럼 :기본으로 N(활동가능) /Y는 정지
alter table tbl_user add suspension varchar2(50) default 'N' check(suspension in('Y','N'));
alter table tbl_user add susDate timestamp;
alter table tbl_user add suspContent varchar2(100);

select*from tbl_user;


-- 스터디 승인 칼럼추가 (12/15)
create table tbl_group(
    sno number primary key,
    group_name varchar2(30),
    leader varchar2(30),
    subject varchar2(30),
    description varchar2(30),
    member_number number,
    authorized char(1) default 'N' check(authorized in('Y','N'))
    
);
