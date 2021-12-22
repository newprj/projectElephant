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




create table attachFile(/*÷�����Ͽ� ���� ���̺�*/
    rno number,
    fileName varchar2(100),
    uploadPath varchar2(20),
    uuid varchar2(50),
    fileSize number );

create sequence seq_cno;




    create table cpage( /*�Ҹ����� �������� ���� ���̺�*/ 
    rno number,
    group_name varchar2(30),
    member varchar2(50),
    captain varchar2(2)default 'N',
    Membership varchar2(2) default 'N'
    );    

 create sequence seq_cpno;