create table tbl_review( /*���信 ���� ���̺�*/
    rno number,
    group_name varchar2(30),
    title varchar2(200),
    content varchar2(2000),
    writer varchar2(30),
    regdate date default sysdate );    

create sequence seq_rno;

alter table tbl_review add reply_count int DEFAULT '0';
alter table tbl_review add view_count int DEFAULT '0';
alter table tbl_review add attachedFile int DEFAULT '0';


create table review_reply( /*���信 ���� ���̺�*/
    cno number,
    rno number,
    writer varchar2(30),
    content varchar2(2000),
    regdate date default sysdate ); 
create sequence seq_acno;
    
    

create table attachFile(/*÷�����Ͽ� ���� ���̺�*/
    rno number,
    fileName varchar2(100),
    uploadPath varchar2(20),
    uuid varchar2(50),
    fileSize number );


