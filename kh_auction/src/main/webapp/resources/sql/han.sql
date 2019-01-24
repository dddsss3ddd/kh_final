-- ��Ź ��û �Խ���
drop table consignment;
create table consignment(
	cons_no			number,			-- ��Ź��ȣ
	cons_id			varchar2(40),	-- ��Ź�� id ����Ű
	cons_title		varchar2(200),	-- ��Ź �Խ� ����
	cons_img1		varchar2(100),	-- ��Ź �̹���1
	cons_img2		varchar2(1000),	-- ��Ź �̹���2
	cons_content	varchar2(4000),	-- ��Ź���� ����
	cons_gua		varchar2(10), -- check(cons_gua in('yes','no')), -- ��Ź�� ������ ����
	gua_info		varchar2(1000), -- ������ ����
	cons_price		number default 0,	-- �Ƿ��� ����� 0�̸� ����
	cons_date		date,			-- ���� ��û ��¥
	cons_result1	varchar2(30), --check(cons_result1 in('accept','deny','yet')) default 'yet',	-- ���� ��û ���
	cons_result1_date date, --������û ��� �Է���
	cons_go_date	date, --�����湮 ��¥ ����
	cons_go_time_f	number(3),	-- �����湮 �ð� ���� from
	cons_go_time_t	number(3),	-- �����湮 �ð� ���� to
	cons_go_content	varchar2(1000),	-- �����湮 �䱸����
	cons_result2	varchar2(30) , --check(cons_result2 in('accept','deny','yet')) default 'yet',	-- ��Ź ���� �ź�
	cons_result2_date date, -- ��Ź ���� �ź� �Է���
	cons_ant_price	number, 			-- ����
	cons_ans		varchar2(1000),	-- ������� ����
	cons_commit		varchar2(10) default 'yet',
	cons_auc_no		number -- ��Ź�� ��ϵ� ��� �����Ǿ� ��ϵ� ���ǰ�� ��ȣ. ����Ű
);
create sequence cons_no_seq; -- ��Ź ��ȣ ���� ���� ������
