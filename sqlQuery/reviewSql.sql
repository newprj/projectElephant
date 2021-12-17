create table tbl_review( /*리뷰에 대한 테이블*/
    rno number,
    group_name varchar2(30),
    title varchar2(200),
    content varchar2(2000),
    writer varchar2(30),
    regdate date default sysdate );    

create sequence seq_rno;

alter table tbl_review add reply_count int DEFAULT '0';
alter table tbl_review add view_count int DEFAULT '0';
alter table tbl_review add attachedFile int DEFAULT '0'; -- 추가


create table attachFile(/*첨부파일에 대한 테이블*/
    rno number,
    fileName varchar2(100),
    uploadPath varchar2(20),
    uuid varchar2(50),
    fileSize number );

create sequence seq_cno;




    create table cpage( /*소모임장 페이지에 대한 테이블*/ 
    rno number,
    group_name varchar2(30),
    member varchar2(50),
    captain varchar2(2)default 'N',
    Membership varchar2(2) default 'N'
    );    

 create sequence seq_cpno;
 
 
 
 
drop table tbl_group;
delete from tbl_group;    


create table tbl_group(
    gno number,
    group_name varchar2(100),
    leader varchar2(30),
    subject varchar2(30),
    description varchar2(500),
    member_number number);

drop sequence seq_gno;
create sequence seq_gno;

create table tbl_calendar(
    cid number,
    title varchar2(50),
    startDate varchar2(50),
    endDate varchar2(50),
    editable varchar2(1) default 'N',
    color varchar2(50),
    description_ varchar2(500),
    location varchar2(100),
    group_ varchar2(500),
    user_ varchar2(50),
    member_ varchar2(50));

create sequence seq_cid;
desc tbl_calendar;

desc tbl_user;

drop table tbl_user;
create table tbl_user(
    uno number,
    user_id varchar2(30),
    password varchar2(30),
    name varchar2(30),
    email varchar2(30));
drop sequence seq_uno;
create sequence seq_uno;


drop table tbl_groupuser;
create table tbl_groupuser(
    cno number,
    authorized varchar2(1) default 'N',
    user_id varchar2(30),
    group_name varchar2(30));
    


create table tbl_review(
    rno number,
    group_name varchar2(30),
    title varchar2(200),
    content varchar2(2000),
    writer varchar2(30),
    regdate date default sysdate );  

drop table board_file;   
create table board_file(
    uuid varchar2(100),
    uploadPath varchar2(200),
    fileName varchar2(100),
    fileType char(1) default '1',
    bno number);

create table tbl_qanda(
    qno number,
    title varchar2(200),
    content varchar2(2000),
    writer varchar2(30),
    regdate date default sysdate );   
    
create sequence seq_qno;
drop sequence seq_qno;  
    
create table tbl_board(
    bno number,
    group_name varchar2(30),
    title varchar2(200),
    content varchar2(2000),
    writer varchar2(30),
    regdate date default sysdate );  
create sequence seq_bno;
drop sequence seq_bno; 
alter table tbl_board add constraint pk_board primary key(bno)


create table board_reply(
    rno number,
    bno number,
    reply varchar2(500),
    replyer varchar2(100),
    replydate date default sysdate);    
create sequence board_rno;  
create sequence seq_rno;
drop sequence seq_rno;
    

--- 어디에 쓴건지 모르는 시퀀스
create sequence seq_cno;
drop sequence seq_cno;



select * from tbl_groupuser;
select * from tbl_board;
select * from tbl_user;
select * from tbl_group;
select * from board_file;
select * from board_reply;

select * from user_sequences;
commit;

desc tbl_review;

select * from tbl_review order by rno desc;
select * from attachFile;

