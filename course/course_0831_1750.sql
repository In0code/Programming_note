ALTER TABLE student
	DROP
		CONSTRAINT FK_major_TO_student
		CASCADE;

ALTER TABLE course
	DROP
		CONSTRAINT FK_subject_TO_course
		CASCADE;

ALTER TABLE course
	DROP
		CONSTRAINT FK_hakyeon_TO_course
		CASCADE;

ALTER TABLE subject
	DROP
		CONSTRAINT FK_emp_TO_subject
		CASCADE;

ALTER TABLE subject
	DROP
		CONSTRAINT FK_major_TO_subject
		CASCADE;

ALTER TABLE subject_plan
	DROP
		CONSTRAINT FK_subject_TO_subject_plan
		CASCADE;

ALTER TABLE subject_plan
	DROP
		CONSTRAINT FK_emp_TO_subject_plan
		CASCADE;

ALTER TABLE hakyeon
	DROP
		CONSTRAINT FK_student_TO_hakyeon
		CASCADE;

ALTER TABLE emp
	DROP
		CONSTRAINT FK_major_TO_emp
		CASCADE;

ALTER TABLE major
	DROP
		CONSTRAINT FK_dpt_TO_major
		CASCADE;

ALTER TABLE tgrade
	DROP
		CONSTRAINT FK_course_TO_tgrade
		CASCADE;

ALTER TABLE dpt
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE student
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE course
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE subject
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE subject_plan
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE hakyeon
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE emp
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE major
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE tgrade
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 학부 */
CREATE TABLE dpt (
	dptcode CHAR(10) NOT NULL, /* 학부코드 */
	dptname VARCHAR2(50) /* 학부명 */
);

INSERT INTO dpt VALUES ('CMP','컴퓨터공학부');
INSERT INTO dpt VALUES ('KOR','인문사회부');
INSERT INTO dpt VALUES ('KBS','연극학부');
INSERT INTO dpt VALUES ('ARC','건축학부');
INSERT INTO dpt VALUES ('SPO','체육학부');
insert into DPT values('EMP','직원');


select * from user_constraints;

COMMENT ON TABLE dpt IS '학부';

COMMENT ON COLUMN dpt.dptcode IS '학부코드';

COMMENT ON COLUMN dpt.dptname IS '학부명';

CREATE UNIQUE INDEX PK_dpt
	ON dpt (
		dptcode ASC
	);

ALTER TABLE dpt
	ADD
		CONSTRAINT PK_dpt
		PRIMARY KEY (
			dptcode
		);



/* 학생정보 */
CREATE  TABLE student (
	stuno NUMBER(10) NOT NULL, /* 학번 */
	dptcode CHAR(10) NOT NULL, /* 학부코드 */
	majorcode CHAR(10) NOT NULL, /* 학과코드 */
	pass VARCHAR2(50), /* 비밀번호 */
	sname VARCHAR2(20), /* 이름 */
	phone CHAR(13), /* 전화번호 */
	email VARCHAR2(30), /* 이메일주소 */
	nowlevel NUMBER(1), /* 학년 */
	addr VARCHAR2(600), /* 주소 */
	img VARCHAR2(200), /* 사진 */
	input_date DATE default sysdate /* 추가일자 */
);






INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230002,'CMP001','CMP','2631','이동원','010-1234-2631','test@naver.com',1,'서울시 동작구','img1.png');
INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230003,'KOR001','KOR','0839','김인영','010-4567-0839','kim1@gmail.com',2,'서울시 강남구','img2.png');
INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230004,'KBS001','KBS','2332','임태균','010-1244-2332','marklim@daum.net',2,'경기도 성남시','img3.png');
INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230005,'ARC001','ARC','5869','양승연','010-5125-5869','yang99@naver.com',3,'경기도 의정부시','img4.png');
INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230006,'SPO001','SPO','6687','이숭구','010-5020-6687','cake22@gmail.com',4,'경기도 용인시','img5.png');




COMMENT ON TABLE student IS '학생정보';

COMMENT ON COLUMN student.stuno IS '학번';

COMMENT ON COLUMN student.dptcode IS '학부코드';

COMMENT ON COLUMN student.majorcode IS '학과코드';

COMMENT ON COLUMN student.pass IS '비밀번호';

COMMENT ON COLUMN student.sname IS '이름';

COMMENT ON COLUMN student.phone IS '전화번호';

COMMENT ON COLUMN student.email IS '이메일주소';

COMMENT ON COLUMN student.nowlevel IS '학년';

COMMENT ON COLUMN student.addr IS '주소';

COMMENT ON COLUMN student.img IS '사진';

COMMENT ON COLUMN student.input_date IS '추가일자';

CREATE UNIQUE INDEX PK_student
	ON student (
		stuno ASC
	);

ALTER TABLE student
	ADD
		CONSTRAINT PK_student
		PRIMARY KEY (
			stuno
		);


/* 수강 테이블 */

CREATE TABLE course (
	subcode VARCHAR2(10) NOT NULL, /* 과목코드 */
	stuno NUMBER(10) NOT NULL, /* 학번 */

	slevel NUMBER(1) NOT NULL, /* 학년 */
	semester NUMBER(1) NOT NULL /* 학기 */
);

insert into course values('CMP001001',20230002, 1 ,1 );
insert into course values('KOR001001',20230003, 2 ,2 );
insert into course values('KBS001001',20230004, 3 ,1 );
insert into course values('ARC001001',20230005, 4 ,2 );
insert into course values('SPO001001',20230006, 1 ,2 );


COMMENT ON TABLE course IS '수강 테이블';

COMMENT ON COLUMN course.subcode IS '과목코드';

COMMENT ON COLUMN course.stuno IS '학번';

COMMENT ON COLUMN course.slevel IS '학년';

COMMENT ON COLUMN course.semester IS '학기';

CREATE UNIQUE INDEX PK_course
	ON course (
		subcode ASC,
		stuno ASC,
		slevel ASC,
		semester ASC
	);

ALTER TABLE course
	ADD
		CONSTRAINT PK_course
		PRIMARY KEY (
			subcode,
			stuno,
			slevel,
			semester
		);



/* 과목 정보 */
CREATE TABLE subject (
	subcode VARCHAR2(10) NOT NULL, /* 과목코드 */
	subname VARCHAR2(50), /* 과목명 */
	credit NUMBER(1), /* 학점 */
	subtype CHAR(1), /* 이수 구분 */
	empno CHAR(10), /* 사번 */
	majorcode CHAR(10), /* 학과코드 */
	dptcode CHAR(10) /* 학부코드 */
);

INSERT INTO subject (subcode,subname, credit, subtype) VALUES('CMP001001','프로그래밍기초',3,'M');
INSERT INTO subject (subcode,subname, credit, subtype) VALUES('KOR001001','현대문학사',4,'M');
INSERT INTO subject (subcode,subname, credit, subtype) VALUES('KBS001001','영화의이해',2,'M');
INSERT INTO subject (subcode,subname, credit, subtype) VALUES('ARC001001','스키',1,'G');
INSERT INTO subject (subcode,subname, credit, subtype) VALUES('SPO001001','건물구조의이해',2,'G');



COMMENT ON TABLE subject IS '과목 정보';

COMMENT ON COLUMN subject.subcode IS '과목코드';

COMMENT ON COLUMN subject.subname IS '과목명';

COMMENT ON COLUMN subject.credit IS '학점';

COMMENT ON COLUMN subject.subtype IS '이수 구분';

COMMENT ON COLUMN subject.empno IS '사번';

COMMENT ON COLUMN subject.majorcode IS '학과코드';

COMMENT ON COLUMN subject.dptcode IS '학부코드';

CREATE UNIQUE INDEX PK_subject
	ON subject (
		subcode ASC
	);

ALTER TABLE subject
	ADD
		CONSTRAINT PK_subject
		PRIMARY KEY (
			subcode
		);

/* 강의 계획서 */
CREATE TABLE subject_plan (
	subcode VARCHAR2(10) NOT NULL, /* 과목코드 */
	subgoal VARCHAR2(2000), /* 학습목표 */
	subinfo VARCHAR2(4000), /* 강의내용 */
	empno CHAR(10) /* 사번 */
);

insert INTO subject_plan(subcode,subinfo, subgoal) values
('CMP001001','안녕하세요 저는 김인영입니다. 이건 테스트 강의내용입니다. 그럼 20000 할려고 했는데 옆에서 좀만 더 길게 하라네요..혹시 꼰대?ㅋㅋㅋㅋㅋ 크크루삥뽕 hi my name is kim in young what your name?',
'짤게 hi 더 쓰래요 확꼰');
insert INTO subject_plan(subcode,subinfo, subgoal) values
('KOR001001','동해물과 백두산이 마르고 닳다록 하느님이 보우하사 우리나라만세 무궁화 삼천리 화려강산 대한사랑 대한으로 길이보전하세 yea~hi~dong ha mul ga back du san e',
'임태균 개꼰머 이수업 듣지 마셈. 도망기세요 지금이 기회');
insert INTO subject_plan(subcode,subinfo, subgoal) values
('KBS001001','아침해 떠있해의 색 내 맘대로 색칠해! 어떤 색! 을 고를지 고민중 내 친구가 던졌네~ ok man 네가 고른데로 오늘 하루를 살아보자곤 때론, 검정색의 물감이 나를 막아도 내가 든 붓으로 때려',
'홍돈이가 랩을 한다 홍홍홍');
insert INTO subject_plan(subcode,subinfo, subgoal) values
('ARC001001','이것은 테스트 강의 내용. 어찌라고, 내가 알아서 할게. 미안하면 군대 생활이 끝나냐? 대가리 박아 . 얼릉. 너 이번달 휴가 반납해 ~ haha',
'준대장은 너에게 실망했다');
insert INTO subject_plan(subcode,subinfo, subgoal) values
('SPO001001','집에가고 싶어요/ 지금 마침 4시 44분이네요. 죽음의 시간. 그럼 20000 skdjfalskdjfa;lskdjf;asdkjf;alskdjf;asdlkf;asdk',
'에에에에에에에에에에에에에에엥 기모찌');

select * from subject_plan;

COMMENT ON TABLE subject_plan IS '강의 계획서';

COMMENT ON COLUMN subject_plan.subcode IS '과목코드';

COMMENT ON COLUMN subject_plan.subgoal IS '학습목표';

COMMENT ON COLUMN subject_plan.subinfo IS '강의내용';

COMMENT ON COLUMN subject_plan.empno IS '사번';

CREATE UNIQUE INDEX PK_subject_plan
	ON subject_plan (
		subcode ASC
	);

ALTER TABLE subject_plan
	ADD
		CONSTRAINT PK_subject_plan
		PRIMARY KEY (
			subcode
		);

/* 학년 */
CREATE TABLE hakyeon (
	stuno NUMBER(10) NOT NULL, /* 학번 */
	slevel NUMBER(1) NOT NULL, /* 학년 */
	semester NUMBER(1) NOT NULL /* 학기 */
);


insert into hakyeon values(20230002,1,1);
insert into hakyeon values(20230003,2,2);
insert into hakyeon values(20230004,3,1);
insert into hakyeon values(20230005,4,2);
insert into hakyeon values(20230006,1,2);

select * from HAKYEON;

COMMENT ON TABLE hakyeon IS '학년';

COMMENT ON COLUMN hakyeon.stuno IS '학번';

COMMENT ON COLUMN hakyeon.slevel IS '학년';

COMMENT ON COLUMN hakyeon.semester IS '학기';

CREATE UNIQUE INDEX PK_hakyeon
	ON hakyeon (
		stuno ASC,
		slevel ASC,
		semester ASC
	);

ALTER TABLE hakyeon
	ADD
		CONSTRAINT PK_hakyeon
		PRIMARY KEY (
			stuno,
			slevel,
			semester
		);

/* 사원 */
CREATE TABLE emp (
	empno CHAR(10) NOT NULL, /* 사번 */
	usercode CHAR(1) NOT NULL, /* 구분코드 */
	pass VARCHAR2(60), /* 비밀번호 */
	ename VARCHAR2(21), /* 이름 */
	phone CHAR(13), /* 전화번호 */
	email VARCHAR2(100), /* 이메일주소 */
	img VARCHAR2(200), /* 사진 */
	majorcode CHAR(10), /* 학과코드 */
	dptcode CHAR(10) /* 학부코드 */
);

insert into EMP values('EMP000100','E',1234,'강사님','010-4654-1545','test@test.com','image1.png','EMP000','EMP');
insert into EMP values('CMP001500','P',1234,'강앨린','010-2345-3463','prof@gmail.com','image2.png','CMP001','CMP');
insert into EMP values('KOR001501','P',1234,'장석원','010-8475-1789','test@naver.com','image3.png','KOR001','KOR');
insert into EMP values('KBS001502','P',4321,'정우성','010-5767-1686','test@daum.net','image4.png','KBS001','KBS');



COMMENT ON TABLE emp IS '사원';

COMMENT ON COLUMN emp.empno IS '사번';

COMMENT ON COLUMN emp.usercode IS '구분코드';

COMMENT ON COLUMN emp.pass IS '비밀번호';

COMMENT ON COLUMN emp.ename IS '이름';

COMMENT ON COLUMN emp.phone IS '전화번호';

COMMENT ON COLUMN emp.email IS '이메일주소';

COMMENT ON COLUMN emp.img IS '사진';

COMMENT ON COLUMN emp.majorcode IS '학과코드';

COMMENT ON COLUMN emp.dptcode IS '학부코드';

CREATE UNIQUE INDEX PK_emp
	ON emp (
		empno ASC
	);

ALTER TABLE emp
	ADD
		CONSTRAINT PK_emp
		PRIMARY KEY (
			empno
		);

/* 학과 */
CREATE TABLE major (
	majorcode CHAR(10) NOT NULL, /* 학과코드 */
	dptcode CHAR(10) NOT NULL, /* 학부코드 */
	majorname VARCHAR2(60) /* 학과명 */
);

INSERT INTO major(majorcode,dptcode, majorname) VALUES ('CMP001','CMP','컴퓨터과학과');
INSERT INTO major(majorcode,dptcode, majorname) VALUES ('KOR001','KOR','국어국문학과');
INSERT INTO major(majorcode, dptcode,majorname) VALUES ('KBS001','KBS','연극영화과');
INSERT INTO major(majorcode, dptcode,majorname) VALUES ('ARC001','ARC','건축공학과');
INSERT INTO major(majorcode, dptcode,majorname) VALUES ('SPO001','SPO','사회체육학과');
insert into major values('EMP000','EMP','직원');

COMMENT ON TABLE major IS '학과';

COMMENT ON COLUMN major.majorcode IS '학과코드';

COMMENT ON COLUMN major.dptcode IS '학부코드';

COMMENT ON COLUMN major.majorname IS '학과명';

CREATE UNIQUE INDEX PK_major
	ON major (
		majorcode ASC,
		dptcode ASC
	);

ALTER TABLE major
	ADD
		CONSTRAINT PK_major
		PRIMARY KEY (
			majorcode,
			dptcode
		);

/* 성적 */
CREATE TABLE tgrade (
	subcode VARCHAR2(10) NOT NULL, /* 과목코드 */
	stuno NUMBER(10) NOT NULL, /* 학번 */
	slevel NUMBER(1) NOT NULL, /* 학년 */
	semester NUMBER(1) NOT NULL, /* 학기 */
	grade CHAR(2) /* 성적 */
);

insert into tgrade values('CMP001001',20230002,1,1,2);

COMMENT ON TABLE tgrade IS '성적';

COMMENT ON COLUMN tgrade.subcode IS '과목코드';

COMMENT ON COLUMN tgrade.stuno IS '학번';

COMMENT ON COLUMN tgrade.slevel IS '학년';

COMMENT ON COLUMN tgrade.semester IS '학기';

COMMENT ON COLUMN tgrade.grade IS '성적';

CREATE UNIQUE INDEX PK_tgrade
	ON tgrade (
		subcode ASC,
		stuno ASC,
		slevel ASC,
		semester ASC
	);

ALTER TABLE tgrade
	ADD
		CONSTRAINT PK_tgrade
		PRIMARY KEY (
			subcode,
			stuno,
			slevel,
			semester
		);

ALTER TABLE student
	ADD
		CONSTRAINT FK_major_TO_student
		FOREIGN KEY (
			majorcode,
			dptcode
		)
		REFERENCES major (
			majorcode,
			dptcode
		);

ALTER TABLE course
	ADD
		CONSTRAINT FK_subject_TO_course
		FOREIGN KEY (
			subcode
		)
		REFERENCES subject (
			subcode
		);

ALTER TABLE course
	ADD
		CONSTRAINT FK_hakyeon_TO_course
		FOREIGN KEY (
			stuno,
			slevel,
			semester
		)
		REFERENCES hakyeon (
			stuno,
			slevel,
			semester
		);

ALTER TABLE subject
	ADD
		CONSTRAINT FK_emp_TO_subject
		FOREIGN KEY (
			empno
		)
		REFERENCES emp (
			empno
		);

ALTER TABLE subject
	ADD
		CONSTRAINT FK_major_TO_subject
		FOREIGN KEY (
			majorcode,
			dptcode
		)
		REFERENCES major (
			majorcode,
			dptcode
		);

ALTER TABLE subject_plan
	ADD
		CONSTRAINT FK_subject_TO_subject_plan
		FOREIGN KEY (
			subcode
		)
		REFERENCES subject (
			subcode
		);

ALTER TABLE subject_plan
	ADD
		CONSTRAINT FK_emp_TO_subject_plan
		FOREIGN KEY (
			empno
		)
		REFERENCES emp (
			empno
		);

ALTER TABLE hakyeon
	ADD
		CONSTRAINT FK_student_TO_hakyeon
		FOREIGN KEY (
			stuno
		)
		REFERENCES student (
			stuno
		);

ALTER TABLE emp
	ADD
		CONSTRAINT FK_major_TO_emp
		FOREIGN KEY (
			majorcode,
			dptcode
		)
		REFERENCES major (
			majorcode,
			dptcode
		);

ALTER TABLE major
	ADD
		CONSTRAINT FK_dpt_TO_major
		FOREIGN KEY (
			dptcode
		)
		REFERENCES dpt (
			dptcode
		);

ALTER TABLE tgrade
	ADD
		CONSTRAINT FK_course_TO_tgrade
		FOREIGN KEY (
			subcode,
			stuno,
			slevel,
			semester
		)
		REFERENCES course (
			subcode,
			stuno,
			slevel,
			semester
		);


 commit;
