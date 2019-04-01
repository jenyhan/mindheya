create sequence bmSEQ nocache;

create table BMList(
    bmSEQ varchar2(100) primary key,
    id varchar2(100) references member(id),
    title varchar2(200),
    summary varchar2(2000),
    press varchar2(50),
    address varchar2(3000),
    indate date default sysdate);

commit;