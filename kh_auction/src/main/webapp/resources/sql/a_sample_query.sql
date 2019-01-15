
--테스트용 테이블입니다. 생성후 index.jsp를 실행해보세요.
create table test(
	tval number,
	tstr varchar2(10)
);

select * from test;


-- 테이블에 컬럼명이나 컬럼의 데이터형이 이상할경우 바로 말씀해주세요!!!!!!!!!



drop table auction_item;

select * from auction_item;
-- 경매 아이템 테이블
create table auction_item(
	auc_no			number,				-- 경매번호
	user_id			varchar2(40),		-- 아이디
	auc_state		number			default 0,					-- 경매상태(낙찰/유찰)
	auc_info1		varchar2(10)	check(auc_info1 in('vip','normal')),	-- 일반/vip 구분
	auc_info2		varchar2(10)	check(auc_info2 in('time','blind')),	-- 실시간/블라인드 구분
	auc_title		varchar2(200),		-- 경매 제목
	auc_img1		varchar2(100),		-- 경매 이미지1
	auc_img2		varchar2(1000),		-- 경매 이미지2
	auc_content		varchar2(4000),		-- 경매 내용
	guarantee		varchar2(10)	check(guarantee in('yes','no')),	-- 보증서 유무
	guarantee_info	varchar2(1000),		-- 보증서 정보
	auc_price		number,				-- 시작가
	auc_interval	number,				-- 가격 단위
	auc_add			date,				-- 경매 등록일
	auc_start		date,				-- 경매 시작일
	auc_end			date,				-- 경매 종료일
	method			varchar2(30),		-- 거래방법
	method_price	number				-- 택배거래일경우 택배비
);
create sequence auction_item_no_seq; -- 경매 번호 생성을 위한 시퀀스(필요시 사용)






-- 경매 입찰 리스트
create table auction_bid(
	auc_no			number,			-- 경매 번호
	user_id			varchar2(40),	-- 입찰자 id
	user_bid		number,			-- 입찰금액
	bid_time		date			-- 입찰시간(milisec?)
);





-- 회원정보
create table join001(
	user_id			varchar2(40),	-- 아이디
	user_pw			varchar2(20),	-- 비밀번호
	user_name		varchar2(50),	-- 이름
	user_zip		varchar2(10),	-- 우편번호
	user_address1	varchar2(100),	-- 주소1
	user_address2	varchar2(100),	-- 주소2
	user_tel		varchar2(20),	-- 전화번호
	user_phone		varchar2(20),	-- 폰번호
	user_email		varchar2(100),	-- 이멜
	user_file		varchar2(100),	-- 파일
	user_regdate	date,			-- 가입일
	user_state		number(10),		-- 회원 상태
	user_delcont	varchar2(4000),	-- 탈퇴 사유
	user_deldate	date,			-- 탈퇴 날짜
	user_original	varchar2(100),	-- 파일 원본
	user_amount		number,			-- 총 거래 금액
	user_grade		varchar2(100),	-- 등급
	user_cash		number			-- 캐쉬 잔액
);

insert into join001(user_id) values('uuuu1');
insert into join001(user_id) values('usss2');
insert into join001(user_id) values('usee3');
insert into join001(user_id) values('user4');



-- 캐쉬 결제 정보
create table cash(
	cash_no			number,			-- 결제 번호
	cash_price		number,			-- 결제 금액
	cash_yn			varchar2(30),	-- 결제 여부
	cash_phone_name	varchar2(30),	-- 핸드폰 명의자
	cash_phone_no	varchar2(30),	-- 핸드폰 번호
	cash_card_name	varchar2(30),	-- 카드 명의자
	cash_card_no	varchar2(30),	-- 카드 번호
	cash_card_cvc	varchar2(30),	-- 카드 cvc
	cash_non_name	varchar2(30),	-- 무통장 입금자 명
	cash_date		date,			-- 결제 시간
	user_id			varchar2(40)	-- 회원 아이디
	);
create sequence cash_no_seq; -- 캐쉬 no 시퀀스 생성



-- 위탁 신청 게시판
create table consignment(
	cons_no			number,			-- 위탁번호
	cons_id			varchar2(40),	-- 위탁자 id
	cons_title		varchar2(200),	-- 위탁 게시 제목
	cons_img1		varchar2(100),	-- 위탁 이미지1
	cons_img2		varchar2(1000),	-- 위탁 이미지2
	cons_content	varchar2(4000),	-- 위탁내용 설명
	cons_gua		varchar2(10) check(cons_gua in('yes','no')), -- 위탁물 보증서 유무
	gua_info		varchar2(1000), -- 보증서 정보
	cons_price		number default 0,	-- 의뢰자 희망가 0이면 미정
	cons_date		date,			-- 감정 신청 날짜
	cons_result1	varchar2(30) check(cons_result1 in('accept','deny')),	-- 감정 신청 결과
	cons_go_date	date, --감정방문 날짜 선택
	cons_go_time	varchar2(300),	-- 감정방문 시간 선택
	cons_go_content	varchar2(1000),	-- 감정방문 요구사항
	cons_result2	varchar2(30) check(cons_result2 in('accept','deny')),	-- 위탁 승인 거부
	cons_ant_price	number, 			-- 예상가
	cons_ans		varchar2(1000)	-- 감정결과 설명
);
create sequence cons_no_seq; -- 위탁 번호 생성 위한 시퀀스




/*경매등급*/
	create table grade(
	grade_no		number,			/*등급 번호*/
	grade_price		number,			/*등급 기준 아직 등급 미정임.*/
	grade_name		varchar2(100)	/*등급 이름*/
);



-- 정기경매 날짜 정보 테이블 아직 미정임
create table period(
	period_no		number,
	period_start	date,
	period_end		date,
	period_auc		varchar2(1000)
);
create sequence period_no_seq;

/*관리자 QnA*/
create table qna(
	qna_num 		number,				/*글 번호*/
	qna_name 		varchar2(20),		/*작성자*/
	qna_pass		varchar2(20),		/*비밀번호*/
	qna_subject	 	varchar2(40),		/*글 제목*/
	qna_content		varchar2(200),		/*글 내용*/
	qna_file		varchar2(100),		/*저장 파일명*/
	qna_original	varchar2(100),		/*원래 파일명*/
	qna_re_ref		number,			/*글 답변*/
	qna_re_lev 		number,				/*답변글 레벨*/
	qna_re_seq 		number,				/*화면에 보이는 위치*/
	qna_readcount 	number,				/*조회수*/
	qna_insert_date date,				/*등록 날짜*/
	qna_edit_date 	date				/*수정 날짜*/
);
create sequence qna_no_seq;

/*우편번호*/
	create table zipcode(
	zipcode			varchar2(10),		/*우편 번호*/
	sido 			varchar2(30),		/*시 & 도*/
	sigungu			varchar2(30),		/*시 & 도 & 군*/
	ym				varchar2(30),		/*아직 모름*/
	doro			varchar2(60)		/*도로 명*/
);



