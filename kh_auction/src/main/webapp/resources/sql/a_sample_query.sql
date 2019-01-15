
--�׽�Ʈ�� ���̺��Դϴ�. ������ index.jsp�� �����غ�����.
create table test(
	tval number,
	tstr varchar2(10)
);

select * from test;


-- ���̺� �÷����̳� �÷��� ���������� �̻��Ұ�� �ٷ� �������ּ���!!!!!!!!!



drop table auction_item;

select * from auction_item;
-- ��� ������ ���̺�
create table auction_item(
	auc_no			number,				-- ��Ź�ȣ
	user_id			varchar2(40),		-- ���̵�
	auc_state		number			default 0,					-- ��Ż���(����/����)
	auc_info1		varchar2(10)	check(auc_info1 in('vip','normal')),	-- �Ϲ�/vip ����
	auc_info2		varchar2(10)	check(auc_info2 in('time','blind')),	-- �ǽð�/����ε� ����
	auc_title		varchar2(200),		-- ��� ����
	auc_img1		varchar2(100),		-- ��� �̹���1
	auc_img2		varchar2(1000),		-- ��� �̹���2
	auc_content		varchar2(4000),		-- ��� ����
	guarantee		varchar2(10)	check(guarantee in('yes','no')),	-- ������ ����
	guarantee_info	varchar2(1000),		-- ������ ����
	auc_price		number,				-- ���۰�
	auc_interval	number,				-- ���� ����
	auc_add			date,				-- ��� �����
	auc_start		date,				-- ��� ������
	auc_end			date,				-- ��� ������
	method			varchar2(30),		-- �ŷ����
	method_price	number				-- �ù�ŷ��ϰ�� �ù��
);
create sequence auction_item_no_seq; -- ��� ��ȣ ������ ���� ������(�ʿ�� ���)






-- ��� ���� ����Ʈ
create table auction_bid(
	auc_no			number,			-- ��� ��ȣ
	user_id			varchar2(40),	-- ������ id
	user_bid		number,			-- �����ݾ�
	bid_time		date			-- �����ð�(milisec?)
);





-- ȸ������
create table join001(
	user_id			varchar2(40),	-- ���̵�
	user_pw			varchar2(20),	-- ��й�ȣ
	user_name		varchar2(50),	-- �̸�
	user_zip		varchar2(10),	-- �����ȣ
	user_address1	varchar2(100),	-- �ּ�1
	user_address2	varchar2(100),	-- �ּ�2
	user_tel		varchar2(20),	-- ��ȭ��ȣ
	user_phone		varchar2(20),	-- ����ȣ
	user_email		varchar2(100),	-- �̸�
	user_file		varchar2(100),	-- ����
	user_regdate	date,			-- ������
	user_state		number(10),		-- ȸ�� ����
	user_delcont	varchar2(4000),	-- Ż�� ����
	user_deldate	date,			-- Ż�� ��¥
	user_original	varchar2(100),	-- ���� ����
	user_amount		number,			-- �� �ŷ� �ݾ�
	user_grade		varchar2(100),	-- ���
	user_cash		number			-- ĳ�� �ܾ�
);

insert into join001(user_id) values('uuuu1');
insert into join001(user_id) values('usss2');
insert into join001(user_id) values('usee3');
insert into join001(user_id) values('user4');



-- ĳ�� ���� ����
create table cash(
	cash_no			number,			-- ���� ��ȣ
	cash_price		number,			-- ���� �ݾ�
	cash_yn			varchar2(30),	-- ���� ����
	cash_phone_name	varchar2(30),	-- �ڵ��� ������
	cash_phone_no	varchar2(30),	-- �ڵ��� ��ȣ
	cash_card_name	varchar2(30),	-- ī�� ������
	cash_card_no	varchar2(30),	-- ī�� ��ȣ
	cash_card_cvc	varchar2(30),	-- ī�� cvc
	cash_non_name	varchar2(30),	-- ������ �Ա��� ��
	cash_date		date,			-- ���� �ð�
	user_id			varchar2(40)	-- ȸ�� ���̵�
	);
create sequence cash_no_seq; -- ĳ�� no ������ ����



-- ��Ź ��û �Խ���
create table consignment(
	cons_no			number,			-- ��Ź��ȣ
	cons_id			varchar2(40),	-- ��Ź�� id
	cons_title		varchar2(200),	-- ��Ź �Խ� ����
	cons_img1		varchar2(100),	-- ��Ź �̹���1
	cons_img2		varchar2(1000),	-- ��Ź �̹���2
	cons_content	varchar2(4000),	-- ��Ź���� ����
	cons_gua		varchar2(10) check(cons_gua in('yes','no')), -- ��Ź�� ������ ����
	gua_info		varchar2(1000), -- ������ ����
	cons_price		number default 0,	-- �Ƿ��� ����� 0�̸� ����
	cons_date		date,			-- ���� ��û ��¥
	cons_result1	varchar2(30) check(cons_result1 in('accept','deny')),	-- ���� ��û ���
	cons_go_date	date, --�����湮 ��¥ ����
	cons_go_time	varchar2(300),	-- �����湮 �ð� ����
	cons_go_content	varchar2(1000),	-- �����湮 �䱸����
	cons_result2	varchar2(30) check(cons_result2 in('accept','deny')),	-- ��Ź ���� �ź�
	cons_ant_price	number, 			-- ����
	cons_ans		varchar2(1000)	-- ������� ����
);
create sequence cons_no_seq; -- ��Ź ��ȣ ���� ���� ������




/*��ŵ��*/
	create table grade(
	grade_no		number,			/*��� ��ȣ*/
	grade_price		number,			/*��� ���� ���� ��� ������.*/
	grade_name		varchar2(100)	/*��� �̸�*/
);



-- ������ ��¥ ���� ���̺� ���� ������
create table period(
	period_no		number,
	period_start	date,
	period_end		date,
	period_auc		varchar2(1000)
);
create sequence period_no_seq;

/*������ QnA*/
create table qna(
	qna_num 		number,				/*�� ��ȣ*/
	qna_name 		varchar2(20),		/*�ۼ���*/
	qna_pass		varchar2(20),		/*��й�ȣ*/
	qna_subject	 	varchar2(40),		/*�� ����*/
	qna_content		varchar2(200),		/*�� ����*/
	qna_file		varchar2(100),		/*���� ���ϸ�*/
	qna_original	varchar2(100),		/*���� ���ϸ�*/
	qna_re_ref		number,			/*�� �亯*/
	qna_re_lev 		number,				/*�亯�� ����*/
	qna_re_seq 		number,				/*ȭ�鿡 ���̴� ��ġ*/
	qna_readcount 	number,				/*��ȸ��*/
	qna_insert_date date,				/*��� ��¥*/
	qna_edit_date 	date				/*���� ��¥*/
);
create sequence qna_no_seq;

/*�����ȣ*/
	create table zipcode(
	zipcode			varchar2(10),		/*���� ��ȣ*/
	sido 			varchar2(30),		/*�� & ��*/
	sigungu			varchar2(30),		/*�� & �� & ��*/
	ym				varchar2(30),		/*���� ��*/
	doro			varchar2(60)		/*���� ��*/
);



