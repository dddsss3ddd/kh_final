-- 위탁 신청 게시판
drop table consignment;
create table consignment(
	cons_no			number,			-- 위탁번호
	cons_id			varchar2(40),	-- 위탁자 id 포린키
	cons_title		varchar2(200),	-- 위탁 게시 제목
	cons_img1		varchar2(100),	-- 위탁 이미지1
	cons_img2		varchar2(1000),	-- 위탁 이미지2
	cons_content	varchar2(4000),	-- 위탁내용 설명
	cons_gua		varchar2(10), -- check(cons_gua in('yes','no')), -- 위탁물 보증서 유무
	gua_info		varchar2(1000), -- 보증서 정보
	cons_price		number default 0,	-- 의뢰자 희망가 0이면 미정
	cons_date		date,			-- 감정 신청 날짜
	cons_result1	varchar2(30), --check(cons_result1 in('accept','deny','yet')) default 'yet',	-- 감정 신청 결과
	cons_result1_date date, --감정신청 결과 입력일
	cons_go_date	date, --감정방문 날짜 선택
	cons_go_time_f	number(3),	-- 감정방문 시간 선택 from
	cons_go_time_t	number(3),	-- 감정방문 시간 선택 to
	cons_go_content	varchar2(1000),	-- 감정방문 요구사항
	cons_result2	varchar2(30) , --check(cons_result2 in('accept','deny','yet')) default 'yet',	-- 위탁 승인 거부
	cons_result2_date date, -- 위탁 승인 거부 입력일
	cons_ant_price	number, 			-- 예상가
	cons_ans		varchar2(1000),	-- 감정결과 설명
	cons_commit		varchar2(10) default 'yet',
	cons_auc_no		number -- 위탁물 등록될 경우 연동되어 등록된 경매품의 번호. 포린키
);
create sequence cons_no_seq; -- 위탁 번호 생성 위한 시퀀스
