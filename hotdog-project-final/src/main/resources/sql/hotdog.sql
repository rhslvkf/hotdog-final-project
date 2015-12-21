	
update hotdog_member set member_attendance = '9' where member_id = 'gonipal@naver.com';
update hotdog_member set member_grade = 'SILVER' where member_id = 'gonipal@naver.com';
update hotdog_member set member_grade = 'GOLD' where member_id = 'dbtn751@gmail.com';
update hotdog_member set member_latestdate = '20151214' where member_id = 'gonipal1@gmail.com';
update hotdog_member set member_grade = 'GOLD';
update hotdog_member set member_grade = 'ADMIN' where member_id = 'rhslvkf@gmail.com';
select * from hotdog_member where member_id = 'gonipal@naver.com';
update hotdog_member set member_latestdate = '20151219';

-- 쪽지 테이블 만들기!!!
create table message_box(
	sender varchar2(30) not null,
	receiver varchar2(30) not null,
    message_post_date date not null,
    primary key(sender,receiver,message_post_date),
    message_title varchar2(50) not null,
    message_content varchar2(1000) not null,
    message_readed varchar2(3) default 0,
    message_to_del varchar2(3) not null, 
    message_from_del varchar2(3) not null
)

-- 댓글 테이블 전부 드랍시키고 다시 만들기!!!(제약조건 변경)
drop table board_abandoned_comment;
drop table board_adoption_comment;
drop table board_community_comment;
drop table board_petInfo_comment;
drop table board_petPicture_comment;
-- 댓글 시퀀스 드랍
drop sequence abandoned_comment_seq;
drop sequence adoption_comment_seq;
drop sequence community_comment_seq;
drop sequence petInfo_comment_seq;
drop sequence petPicture_comment_seq;

-- 테이블 전부 드랍시키고 다시 만들기!!!(content 타입 clob으로 변경, 제약조건 변경)
drop table board_abandoned cascade constraints;
drop table board_adoption cascade constraints;
drop table board_community cascade constraints;
drop table board_notice cascade constraints;
drop table board_petInfo cascade constraints;
drop table board_petPicture cascade constraints;
drop table board_QnA cascade constraints;
-- 게시판 시퀀스 드랍
drop sequence abandoned_seq;
drop sequence adoption_seq;
drop sequence community_seq;
drop sequence petInfo_seq;
drop sequence petPicture_seq;

-- 회원 드랍
drop table hotdog_member cascade constraints

-- 스크랩 드랍
drop table board_abandoned_scrape;
drop table board_adoption_scrape;
drop table board_petinfo_scrape;

-- 파일 드랍
drop table board_abandoned_file; 
drop table board_adoption_file;
drop table board_community_file;
drop table board_notice_file;
drop table board_petinfo_file;
drop table board_petpicture_file;
drop table board_QnA_file;

-- 쪽지 드랍
drop table message_box;

-- select, drop 모음    
select * from hotdog_member;
on cascade drop table hotdog_member;


drop table hotdog_member;


select * from pet;


drop table pet; 

select * from board_adoption;
drop table board_adoption; 

select * from board_adoption_comment;
drop table board_adoption_comment;  

select * from board_notice;
drop table board_notice;  

select * from board_community;
drop table board_community; 

select * from board_community_comment;
drop table board_community_comment; 

select * from board_petinfo;
drop table board_petinfo cascade constraints 

select * from board_petinfo_comment;
drop table board_petinfo_comment;	

select * from board_abandoned;
drop table board_abandoned;	

select * from board_abandoned_comment;
drop table board_abandoned_comment;	

select * from board_petPicture;
drop table board_petPicture cascade constraints

select * from board_petPicture_comment;
drop table board_petPicture_comment;	

select * from board_QnA;
drop table board_QnA;		

select * from board_QnA_comment;
drop table board_QnA_comment;		

-- 회원 테이블
select * from hotdog_member

create table hotdog_member(
	member_id varchar2(100) primary key,
	member_name varchar2(100) not null,
	member_password varchar2(100) not null,
	member_nickname varchar2(100) not null,
	member_grade varchar2(100) default 'NULL',
	member_attendance number default 0,
	member_tel varchar2(100) not null,
	member_status varchar2(100) not null,
	member_latestdate varchar2(100) default '0',
	pass_period date default sysdate
)

-- 유기견 테이블
drop table pet;
create table pet(
	pet_type varchar2(100) not null,
	pet_gender varchar2(100) not null,
	pet_neutralinfo varchar2(100) not null,
	pet_age number not null,
	pet_size varchar2(100) not null
)

-- 유기견 테이블 시퀀스

create sequence pet_seq nocache;

-- 분양게시판 테이블
drop table board_adoption;
select * from board_adoption;
create table board_adoption(
	adoption_number number primary key,     -- 게시판번호
	adoption_title varchar2(90) not null,       -- 게시판제목
	adoption_date date not null,                     -- 게시판올린날짜
	adoption_hits number default 0,               -- 게시판 조회수
	adoption_content clob not null,  -- 게시글
	adoption_residence varchar2(50) not null, --거주지역
	pet_type varchar2(50) not null,
	pet_gender varchar2(20) not null,
	pet_neutralinfo varchar2(20) not null,
	pet_age number not null,
	pet_size varchar2(20) not null,
	member_id varchar2(40) not null,            -- 회원아이디
	member_tel number not null,                    --회원전화번호
	board_type varchar2(30) default '분양게시판',
	constraint fk_board_adoption_member foreign key(member_id) references hotdog_member(member_id) on delete cascade
)

 		update board_adoption set
		adoption_title='분양게시판이다!!',adoption_content='유기견분양합니다.',adoption_residence='판교',
		pet_type='우리집개',pet_gender='암컷',pet_neutralinfo='아니오',pet_age='7',pet_size='중형'
		where adoption_number='103'

		insert into board_adoption(adoption_number,adoption_title,adoption_content,adoption_date,adoption_residence,pet_type,pet_age,pet_gender,pet_neutralinfo,pet_size,member_id,member_tel)
		values(adoption_seq.nextval,'애견분양게시판','아와와와',sysdate,'판교','골든리트리버','7','암컷','아니오','대형','wayneboney@nate.com','01040897835');

-- 분양게시판 테이블 시퀀스

create sequence adoption_seq nocache;

-- 분양 게시판 댓글 테이블
drop table board_adoption_comment
select * from board_adoption_comment
create table board_adoption_comment(
	comment_number number primary key,
	comment_date date not null,
	comment_content varchar2(100) not null,
	member_nickname varchar2(100) not null,
	comment_group number default 0,
	comment_step number default 0,
	comment_indent number default 0,
	board_number number not null,
	constraint fk_board_adoption_comment foreign key(board_number) references board_adoption(adoption_number) on delete cascade
)

-- 분양게시판 댓글 테이블 시퀀스

create sequence adoption_comment_seq nocache;

-- 분양게시판 파일 테이블

create table board_adoption_file(
	file_name varchar2(100) primary key,
	board_number number not null,
	constraint fk_board_adoption_file1 foreign key(board_number) references board_adoption(adoption_number)
)
select * from board_adoption_file
drop table board_adoption_file

-- 분양게시판 스크랩 테이블
drop table board_adoption_scrape
create table board_adoption_scrape(
	member_id varchar2(100) not null,
	board_number number not null,
	primary key(member_id, board_number),
	constraint fk_board_adoption_scrape_id foreign key(member_id) references hotdog_member(member_id),
	constraint fk_board_adoption_scrape_no foreign key(board_number) references board_adoption(adoption_number)
)

-- 공지사항 테이블

drop table board_notice;
create table board_notice(
	notice_number number primary key,
	member_id varchar2(40) not null,
	notice_title varchar2(90) not null,
	notice_date date not null,
	notice_hits number default 0,
	notice_content clob not null,
	board_type varchar2(30) default '공지사항',
	constraint fk_board_notice_member  foreign key(member_id) references hotdog_member(member_id) on delete cascade
)

-- 공지사항 테이블 시퀀스

create sequence notice_seq nocache;
drop sequence notice_seq;

-- 공지사항 파일 테이블
drop table board_notice_file
create table board_notice_file(
	file_name varchar2(100) primary key,
	board_number number not null,
	constraint fk_board_notice_file1 foreign key(board_number) references board_notice(notice_number)
)

			drop table board_QnA CASCADE CONSTRAINTS;



drop table board_notice_file

-- 자유게시판 테이블

create table board_community(
	community_number number primary key,
	member_id varchar2(40) not null,
	community_title varchar2(90) not null,
	community_date date not null,
	community_hits number default 0,
	community_content clob not null,
	board_type varchar2(30) default '자유게시판',
	constraint fk_board_community_member foreign key(member_id) references hotdog_member(member_id) on delete cascade
)
-- 자유게시판 테이블 시퀀스


create sequence community_seq nocache;
drop sequence community_seq
-- 자유게시판 댓글 테이블
drop table board_community_comment


select * from board_community_comment



create table board_community_comment(
	comment_number number primary key,
	comment_date date not null,
	comment_content varchar2(100) not null,
	member_nickname varchar2(100) not null,
	comment_group number default 0,
	comment_step number default 0,
	comment_indent number default 0,
	board_number number not null,
	constraint fk_board_community_comment foreign key(board_number) references board_community(community_number) on delete cascade
)
insert into BOARD_COMMUNITY_COMMENT
(comment_number,comment_date,comment_content,member_nickname,comment_group,comment_step,
comment_indent,board_number)values('1',sysdate,'1','PPPSH','1','0','0','11')

insert into BOARD_COMMUNITY_COMMENT
(comment_number,comment_date,comment_content,member_nickname,comment_group,comment_step,
comment_indent,board_number)values('2',sysdate,'1-1','PPPSH','1','1','1','11')

insert into BOARD_COMMUNITY_COMMENT
(comment_number,comment_date,comment_content,member_nickname,comment_group,comment_step,
comment_indent,board_number)values('4',sysdate,'1-1-1','PPPSH','1','2','2','11')

insert into BOARD_COMMUNITY_COMMENT
(comment_number,comment_date,comment_content,member_nickname,comment_group,comment_step,
comment_indent,board_number)values('5',sysdate,'1-1-2','PPPSH','1','3','2','11')


insert into BOARD_COMMUNITY_COMMENT
(comment_number,comment_date,comment_content,member_nickname,comment_group,comment_step,
comment_indent,board_number)values('3',sysdate,'1-2','PPPSH','1','4','1','11')


select * from BOARD_COMMUNITY_COMMENT
-- 자유게시판 댓글 테이블 시퀀스

create sequence community_comment_seq nocache;
drop sequence community_comment_seq
-- 자유게시판 파일 테이블

drop table board_community_file;
create table board_community_file(
	file_name varchar2(100) primary key,
	board_number number not null,
	constraint fk_board_community_file1 foreign key(board_number) references board_community(community_number)
)

-- 애견정보 게시판 테이블

create table board_petinfo(
	petinfo_number number primary key,
	member_id varchar2(40) not null,
	petinfo_title varchar2(90) not null,
	petinfo_date date not null,
	petinfo_hits number default 0,
	petinfo_content clob not null,
	board_type varchar2(30) default '애견정보',
	constraint fk_board_petinfo_member foreign key(member_id) references hotdog_member(member_id) on delete cascade
)
select * from board_petinfo

-- 애견정보 게시판 테이블 시퀀스

create sequence petinfo_seq nocache;

select * from board_petinfo_comment
-- 애견 정보 게시판 댓글 테이블
drop table board_petinfo_comment
create table board_petinfo_comment(
	comment_number number primary key,
	comment_date date not null,
	comment_content varchar2(100) not null,
	member_nickname varchar2(100) not null,
	comment_group number default 0,
	comment_step number default 0,
	comment_indent number default 0,
	board_number number not null,
	constraint fk_board_petinfo_comment foreign key(board_number) references board_petinfo(petinfo_number) on delete cascade
)




-- 애견 정보 게시판 댓글 테이블 시퀀스

create sequence petinfo_comment_seq nocache;

-- 애견 정보 게시판 파일 테이블
drop table board_petinfo_file;
create table board_petinfo_file(
	file_name varchar2(100) primary key,
	board_number number not null,
	constraint fk_board_petinfo_file1 foreign key(board_number) references board_petinfo(petinfo_number)
)

-- 애견 정보 게시판 스크랩 테이블

create table board_petinfo_scrape(
	member_id varchar2(100) not null,
	board_number number not null,
	primary key(member_id, board_number),
	constraint fk_board_petinfo_scrape_id foreign key(member_id) references hotdog_member(member_id),
	constraint fk_ foreign key(board_number) references board_petinfo(petinfo_number)
)
select * from board_petinfo_scrape;
drop table board_petinfo_scrape;

-- 유기견 게시판 테이블

create table board_abandoned(
	abandoned_number number primary key,
	member_id varchar2(40) not null,
	abandoned_title varchar2(90) not null,
	abandoned_date date not null,
	abandoned_hits number default 0,
	abandoned_content clob not null,
	board_type varchar2(30) default '유기견정보',
	constraint fk_board_abandoned_member foreign key(member_id) references hotdog_member(member_id) on delete cascade
)

-- 유기견 게시판 테이블 시퀀스

create sequence abandoned_seq nocache;

-- 유기견 게시판 댓글 테이블
drop table board_abandoned_comment
create table board_abandoned_comment(
	comment_number number primary key,
	comment_date date not null,
	comment_content varchar2(100) not null,
	member_nickname varchar2(100) not null,
	comment_group number default 0,
	comment_step number default 0,
	comment_indent number default 0,
	board_number number not null,
	constraint fk_board_abandoned_comment foreign key(board_number) references board_abandoned(abandoned_number) on delete cascade
)


select abandoned_comment_seq.nextval from dual
-- 유기견 게시판 댓글 테이블 시퀀스


create sequence abandoned_comment_seq nocache;

-- 유기견 게시판 파일 테이블

create table board_abandoned_file(
	file_name varchar2(100) primary key,
	board_number number not null,
	constraint fk_board_abandoned_file1 foreign key(board_number) references board_abandoned(abandoned_number)
)

drop table board_abandoned_file

-- 유기견 게시판 스크랩 테이블
drop table board_abandoned_scrape
create table board_abandoned_scrape(
	member_id varchar2(100) not null,
	board_number number not null,
	primary key(member_id, board_number),
	constraint fk_board_abandoned_scrape_id foreign key(member_id) references hotdog_member(member_id),
	constraint fk_board_abandoned_scrape_no foreign key(board_number) references board_abandoned(abandoned_number)
)

-- 애견사진 게시판 테이블

create table board_petPicture(
	petPicture_number number primary key,
	member_id varchar2(40) not null,
	petPicture_title varchar2(90) not null,
	petPicture_date date not null,
	petPicture_hits number default 0,
	petPicture_content clob not null,
	board_type varchar2(30) default '애견사진',
	constraint fk_board_petPicture_member foreign key(member_id) references hotdog_member(member_id) on delete cascade
)

-- 애견사진 게시판 테이블 시퀀스

create sequence petPicture_seq nocache;

-- 애견 사진 게시판 댓글 테이블
drop table board_petPicture_comment
create table board_petPicture_comment(
	comment_number number primary key,
	comment_date date not null,
	comment_content varchar2(100) not null,
	member_nickname varchar2(100) not null,
	comment_group number default 0,
	comment_step number default 0,
	comment_indent number default 0,
	board_number number not null,
	constraint fk_board_petPicture_comment foreign key(board_number) references board_petPicture(petPicture_number) on delete cascade
)

-- 애견 사진 게시판 댓글 테이블 시퀀스

create sequence petPicture_comment_seq nocache;

-- 애견 사진 게시판 파일 테이블
drop table board_petPicture_file;
create table board_petPicture_file(
	file_name varchar2(100) primary key,
	board_number number not null,
	constraint fk_board_petPicture_file1 foreign key(board_number) references board_petPicture(petPicture_number)
)

-- Q&A 게시판 테이블
drop table board_QnA

create table board_QnA(
	QnA_number number primary key,
	member_id varchar2(40) not null,
	QnA_title varchar2(90) not null,
	QnA_date date not null,
	QnA_hits number default 0,
	QnA_content clob not null,
	board_type varchar2(30) default 'Q&A',
	constraint fk_board_QnA_member foreign key(member_id) references hotdog_member(member_id) on delete cascade
)
alter table board_QnA add(QnA_ref number not null); -- 답변글묶음 번호, 원게시글 번호 (새로추가함)
alter table board_QnA add(QnA_restep number not null); -- 답변글묶음내 글순서(정렬 오름차순) (새로추가함)
alter table board_QnA add(QnA_relevel number not null); -- 답변글레벨 , 답변의 단계 (새로추가함)

-- Q&A 게시판 테이블 시퀀스

create sequence QnA_seq nocache;
drop sequence QnA_seq;

-- Q&A 게시판 댓글 테이블
drop table board_QnA_comment

create table board_QnA_comment(
	comment_number number primary key,
	comment_date date not null,
	comment_content varchar2(100) not null,
	member_id varchar2(100) not null,
	comment_group number default 0,
	comment_step number default 0,
	comment_indent number default 0,
	board_number number not null,
	constraint fk_board_QnA_comment foreign key(board_number) references board_QnA(QnA_number),
	constraint fk_board_QnA_comment_id foreign key(member_id) references hotdog_member(member_id)
)

-- Q&A 게시판 댓글 테이블 시퀀스
drop sequence QnA_comment_seq;
create sequence QnA_comment_seq nocache;

-- Q&A 게시판 파일 테이블
drop table board_QnA_file;
create table board_QnA_file(
	file_name varchar2(100) primary key,
	board_number number not null,
	constraint fk_board_QnA_file1 foreign key(board_number) references board_QnA(QnA_number)
)


-----Test--------------------------------------------------------------------------------------------------
	--유기견 게시판
		select b.abandoned_number,b.abandoned_title,b.abandoned_date,m.member_id,m.member_nickname,b.abandoned_hits from(
		select abandoned_number,abandoned_title,abandoned_date,abandoned_hits,ceil(rownum/5) as page,member_id from(
			select abandoned_number,abandoned_title,abandoned_hits,to_char(abandoned_date,'YYYY.MM.DD') as abandoned_date,
			member_id from board_abandoned order by abandoned_number desc
		)
		)b,hotdog_member m where b.member_id=m.member_id and page='1'
	-- 자유
				select b.community_number,b.community_title,b.community_date,m.member_id,m.member_nickname,b.community_hits from(
		select community_number,community_title,community_date,community_hits,ceil(rownum/5) as page,member_id from(
			select community_number,community_title,community_hits,to_char(community_date,'YYYY.MM.DD') as community_date,
			member_id from board_community order by community_number desc
		)
		)b,hotdog_member m where b.member_id=m.member_id and page='1'

	-- 애견정보
	select b.petInfo_number,b.petInfo_title,b.petInfo_date,m.member_id,m.member_nickname,b.petInfo_hits from(
		select petInfo_number,petInfo_title,petInfo_date,petInfo_hits,ceil(rownum/5) as page,member_id from(
			select petInfo_number,petInfo_title,petInfo_hits,to_char(petInfo_date,'YYYY.MM.DD') as petInfo_date,
			member_id from board_petInfo order by petInfo_number desc
		)
		)b,hotdog_member m where b.member_id=m.member_id and page='1'
		
		--공지사항
			select b.notice_number,b.notice_title,b.notice_date,m.member_id,m.member_nickname,b.notice_hits from(
		select notice_number,notice_title,notice_date,notice_hits,ceil(rownum/5) as page,member_id from(
			select notice_number,notice_title,notice_hits,to_char(notice_date,'YYYY.MM.DD') as notice_date,
			member_id from board_notice order by notice_number desc
		)
		)b,hotdog_member m where b.member_id=m.member_id and page='1'
		--
	select b.notice_number,b.notice_title,b.notice_date,b.notice_hits,b.member_id,m.member_name from(
		select notice_content,notice_number,notice_title,notice_date,notice_hits,ceil(rownum/8) as page,member_id from(
			select notice_content,notice_number,notice_title,to_char(notice_date,'YYYY.MM.DD') as notice_date,
			notice_hits,member_id from board_notice  order by notice_number desc
		)
	) b,hotdog_member m where b.member_id=m.member_id and page='1' and b.notice_content like '%' || '아이' || '%'

	
			select b.notice_number,b.notice_title,b.notice_date,b.notice_hits,b.member_id,m.member_name from(
		select notice_number,notice_title,notice_date,notice_hits,ceil(rownum/8) as page,member_id from(
			select notice_number,notice_title,to_char(notice_date,'YYYY.MM.DD') as notice_date,
			notice_hits,member_id from board_notice  order by notice_number desc
		)
	) b,hotdog_member m where b.member_id=m.member_id and page='1' and b.notice_title like '%' || '방가' || '%'
	
	select b.notice_number,b.notice_title,b.notice_date,b.notice_hits,b.member_id,m.member_name from(
		select notice_content,notice_number,notice_title,notice_date,notice_hits,ceil(rownum/8) as page,member_id from(
			select notice_content,notice_number,notice_title,to_char(notice_date,'YYYY.MM.DD') as notice_date,
			notice_hits,member_id from(
			select * from board_notice where notice_content like '%' || '아이' || '%' order by notice_number desc
			)
		)
	) b,hotdog_member m where b.member_id=m.member_id and page='1'

	select * from board_notice
	where notice_content like '%' || '아이' || '%'

	select count(*) from board_notice where notice_content like '%' || '45' || '%'
	
	select count(*) from(
		select m.member_nickname from board_notice b, hotdog_member m where b.member_id = m.member_id
	) where member_nickname like '%' || '11' || '%';
	
		select b.notice_number,b.notice_title,b.notice_date,b.notice_hits,b.member_id,m.member_nickname from(
			select notice_content,notice_number,notice_title,notice_date,notice_hits,ceil(rownum/8) as page,member_id,member_nickname from(
				select notice_content,notice_number,notice_title,to_char(notice_date,'YYYY.MM.DD') as notice_date,notice_hits,member_id,member_nickname from(
						select notice_content,notice_number,notice_title,notice_date,notice_hits,m.member_id,m.member_nickname from(
							select * from board_notice b, hotdog_member m where b.member_id = m.member_id order by notice_number desc
						)b, hotdog_member m where m.member_nickname like '%' || '11' || '%' 
				)
			)
		) b,hotdog_member m where b.member_id=m.member_id and page='1';
		
		select b.notice_number,b.notice_title,b.notice_date,b.notice_hits,b.member_id,m.member_nickname from (
			select notice_number,notice_title,notice_date,notice_hits,ceil(rownum/8) as page,member_id from (
					select notice_number,notice_title,to_char(notice_date,'YYYY.MM.DD') as notice_date,
					notice_hits,member_id from board_notice  order by notice_number desc
		     )
       ) b,hotdog_member m where b.member_id=m.member_id and page='1';
       
       insert into board_abandoned(abandoned_number,member_id,abandoned_title,abandoned_date,abandoned_content) 
       values(abandoned_seq.nextval,'1@1.com','안녕하십니까',sysdate,'안녕못하다');
       insert into board_abandoned(abandoned_number,member_id,abandoned_title,abandoned_date,abandoned_content) 
       values(abandoned_seq.nextval,'1@1.com','안녕하십니까',sysdate,'안녕못하다');
         insert into board_abandoned(abandoned_number,member_id,abandoned_title,abandoned_date,abandoned_content) 
       values(abandoned_seq.nextval,'1@1.com','안녕하십니까',sysdate,'안녕못하다');
         insert into board_abandoned(abandoned_number,member_id,abandoned_title,abandoned_date,abandoned_content) 
       values(abandoned_seq.nextval,'1@1.com','안녕하십니까',sysdate,'안녕못하다');
         insert into board_abandoned(abandoned_number,member_id,abandoned_title,abandoned_date,abandoned_content) 
       values(abandoned_seq.nextval,'1@1.com','안녕하십니까',sysdate,'안녕못하다');
         insert into board_abandoned(abandoned_number,member_id,abandoned_title,abandoned_date,abandoned_content) 
       values(abandoned_seq.nextval,'1@1.com','안녕하십니까',sysdate,'안녕못하다');
       
       select b.abandoned_title,b.board_type,b.abandoned_number,b.abandoned_hits,b.abandoned_date,m.member_nickname from(
       select abandoned_title,board_type,abandoned_number,abandoned_hits,to_char(abandoned_date,'YYYY.MM.DD') as abandoned_date from board_abandoned
		where member_id = 'rhslvkf@gmail.com'
		)b, hotdog_member m where m.member_id = 'rhslvkf@gmail.com';

		
		select bm.community_number,bm.community_title, bm.community_date,bm.community_content,
		bm.community_hits,bm.member_id,bm.member_nickname,f.file_name from
		(
			select b.community_number,b.community_title,to_char(b.community_date,'YYYY.MM.DD') as community_date,b.community_content,
			b.community_hits,m.member_id,m.member_nickname
			from board_community b,hotdog_member m
			where b.member_id=m.member_id and b.community_number='35'
		) bm, board_community_file f where f.board_number = '35';
		
		select * from board_community;
		select * from board_community_file;
		
		insert into board_community_file(file_name,board_number) values('f077988d598e4baf84c73e0ff9044a93.jpg','34');
		insert into board_community_file(file_name,board_number) values('ebf589baeef9402b9419f071c043d0e0.png','34');

			select * from board_community_comment
			select comment_number,comment_content,to_char(comment_date,'MM.DD HH:MM') as comment_date
		,member_nickname,comment_group,comment_step,comment_indent from board_community_comment where board_number=14 
		order by comment_group desc,comment_number asc
		
		select * from board_community_comment
		
		insert into board_community_comment
			(comment_number,member_nickname,comment_date,comment_content,comment_group,comment_step,comment_indent,board_number)
			values('1','PPPSH',sysdate,'다날라갔네...','101','0','0','15')
			
			select * from board_community_comment 
			
	select comment_number,comment_content,to_char(comment_date,'MM.DD HH:MM')
	,member_nickname,comment_group,comment_step,comment_indent from board_community_comment where board_number=11 
	order by comment_group desc,comment_number asc
	
	select comment_number,to_char(comment_date,'MM.DD HH:MM') from board_community_comment
	
	
	insert into board_community_comment
			(comment_number,member_nickname,comment_date,comment_content,comment_group,comment_step,comment_indent,board_number)
			values('555','23',SYSDATE,'23','23','0','0','11')
		
			select community_comment_seq.nextval from dual
			select community_comment_seq.currval from dual
			select max(comment_number) from board_community_comment
			
			
		//같은 group,indent+1값이 존재하면 그 값들의 최대 maxstep+1에 +1,indent+1입력하고 
		//	자기 스텝과 같거나 크면 step+1씩 시킨다. 
		//존재 하지 않으면 부모 스텝보다 큰 step에 +1씩 && 부모의 step+1,indent+1로 입력 
		
		select max(cindet) from board_community_comment where comment_group=#{cvo.cgroup} and comment_indent=#{cvo.cindent}+1
		존재하면 위 sql List의 maxstep +1 부모 indent+1로 insert &&
		insert into board_community_comment values(**,maxstep+1,indent+1)
		
		update  board_community_comment set step+1 where group=#{} and step>=#{} 
			
		select * from board_community_comment where comment_group=#{} and comment_indent-1=#{}
		존재하지 않으면 update board_community_comment set step+1 where group=#{} and step>#{} &&
		insert into board_community_comment(부모step+1,부모 indent+1)	
		
		select * from board_community_comment
		
			select comment_group,comment_step,comment_indent 
		from board_community_comment where comment_number=29
		
		if(select count(*) from(select * from board_community_comment where comment_group='1' and comment_indent-1='0'))!=0
		x= select max(comment_step) from board_community_comment where comment_group='1' and comment_indent-1='0'
		insert into board_community_comment value x+1 부모indent+1
		update  board_community_comment set step+1 where group=#{} and step>=#{입력된 자기 스텝} 
		
		
		if(select count(*) from(select * from board_community_comment where comment_group='1' and comment_indent-1='0'))==0
		insert into board_community_comment value 부모step+1 부모indent+1
		
		
		update  board_community_comment set step+1 where group=#{} and step>#{부모스텝} 
		update board_community_comment set comment_step = comment_step + 1 where comment_group ='1' and comment_step >= '0'	and board_number='17'

			
			
		//쪽지 보내기 
		
create table board_adoption_scrape(
	member_id varchar2(100) not null,
	board_number number not null,
	primary key(member_id, board_number),
	constraint fk_board_adoption_scrape_id foreign key(member_id) references hotdog_member(member_id),
	constraint fk_board_adoption_scrape_no foreign key(board_number) references board_adoption(adoption_number)
)
create table mail()
		

		
		drop table message_box
	
		select * from message_box
		
		
		create table message_box(
				sender varchar2(30) not null,
				receiver varchar2(30) not null,
			    message_post_date date not null,
			    primary key(sender,receiver,message_post_date),
			    message_title varchar2(50) not null,
			    message_content varchar2(1000) not null,
			    message_readed varchar2(3) default 0,
			    message_to_del varchar2(3) not null, 
			    message_from_del varchar2(3) not null
			)
		select to_char(message_post_date,'MM/DD HH24:MI:SS') from  message_box 
		
		where to_char(message_post_date,'MM/DD HH24:MI:SS')='12/14 15:21:54' 
 12/14 15:21:54

			
			
			
		//메시지 보내기
	 	insert into message_box(sender,receiver,message_post_date,message_title,message_content,message_readed,message_to_del,message_from_del)
 		values('to1','from1',sysdate,'야이새끼야','메롱','1','1','1')
 		
 		//보낸 메시지LIST
 		select message_title, receiver, message_post_date, message_readed from message_box 
 		where receiver='from1' and message_to_del='1'
 		
 		//보낸 메세지 삭제	
		update  message_box set message_to_del='0' where sender=#{} and receiver=#{} and message_post_date={}  
 		
 		//받은 메시지LIST
 		select message_title, sender, message_post_date, message_readed from message_box 
 		where sender='to1' and message_to_del='1'
 		
 		//받은&읽은 LIST
 		select message_title, sender, message_post_date, message_readed from message_box 
 		where receiver={} and message_to_del='1' and message_readed='0' 
 		
 		//받은&안읽은 LIST
 		select message_title, sender, message_post_date, message_readed from message_box 
 		where receiver={} and message_to_del='1' and message_readed='1' 
 		
 		
 		//Message 상세보기
 		select receiver, message_title, message_content, message_post_date from message_box
 		where receiver={} and sender and message_post_date={}  
 		&&
 	 	update  message_box set message_readed='0' where sender=#{} and receiver=#{} and message_post_date={}  
 		
 		
		//보낸메세지 삭제	
		update  message_box set message_to_del=0 where sender=#{} and receiver=#{} and message_post_date={}  
			
		//받은메시지 삭제
		update  message_box set message_from_del=0 where sender=#{} and receiver=#{} and message_post_date={}  
					
 		
		
		
		select message_title, sender, message_post_date, message_readed from message_box 
 		where receiver='꺼져' and message_to_del='1'
		

