create table bbs6(
  bbs_num		number(38)		primary key ,
  bbs_name		varchar2(50)	not null ,
  bbs_pass		varchar2(50)	not null ,
  bbs_subject	varchar2(100)	not null ,
  bbs_content	varchar2(4000)	not null ,
  bbs_file		varchar2(100)	,
  bbs_re_ref	number	,
  bbs_re_lev	number	,
  bbs_re_seq	number	,
  bbs_readcount	number	,
  bbs_date		date	,
  bbs_original	varchar2(100)
/*같은 이름의 파일명이 존재할 경우 해결하도록 하는 라이브러리 사용을 하지 않고 해결할 수 있도록 한다. 이를 위해 이 컬럼 생성한다.*/

)

select * from BBS6;

create sequence bbs6_num_seq;