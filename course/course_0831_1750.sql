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

/* �к� */
CREATE TABLE dpt (
	dptcode CHAR(10) NOT NULL, /* �к��ڵ� */
	dptname VARCHAR2(50) /* �кθ� */
);

INSERT INTO dpt VALUES ('CMP','��ǻ�Ͱ��к�');
INSERT INTO dpt VALUES ('KOR','�ι���ȸ��');
INSERT INTO dpt VALUES ('KBS','�����к�');
INSERT INTO dpt VALUES ('ARC','�����к�');
INSERT INTO dpt VALUES ('SPO','ü���к�');
insert into DPT values('EMP','����');


select * from user_constraints;

COMMENT ON TABLE dpt IS '�к�';

COMMENT ON COLUMN dpt.dptcode IS '�к��ڵ�';

COMMENT ON COLUMN dpt.dptname IS '�кθ�';

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



/* �л����� */
CREATE  TABLE student (
	stuno NUMBER(10) NOT NULL, /* �й� */
	dptcode CHAR(10) NOT NULL, /* �к��ڵ� */
	majorcode CHAR(10) NOT NULL, /* �а��ڵ� */
	pass VARCHAR2(50), /* ��й�ȣ */
	sname VARCHAR2(20), /* �̸� */
	phone CHAR(13), /* ��ȭ��ȣ */
	email VARCHAR2(30), /* �̸����ּ� */
	nowlevel NUMBER(1), /* �г� */
	addr VARCHAR2(600), /* �ּ� */
	img VARCHAR2(200), /* ���� */
	input_date DATE default sysdate /* �߰����� */
);






INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230002,'CMP001','CMP','2631','�̵���','010-1234-2631','test@naver.com',1,'����� ���۱�','img1.png');
INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230003,'KOR001','KOR','0839','���ο�','010-4567-0839','kim1@gmail.com',2,'����� ������','img2.png');
INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230004,'KBS001','KBS','2332','���±�','010-1244-2332','marklim@daum.net',2,'��⵵ ������','img3.png');
INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230005,'ARC001','ARC','5869','��¿�','010-5125-5869','yang99@naver.com',3,'��⵵ �����ν�','img4.png');
INSERT INTO student(stuNo,majorcode,dptcode, pass,sname, phone,email,nowlevel,addr,img) VALUES (20230006,'SPO001','SPO','6687','�̼���','010-5020-6687','cake22@gmail.com',4,'��⵵ ���ν�','img5.png');




COMMENT ON TABLE student IS '�л�����';

COMMENT ON COLUMN student.stuno IS '�й�';

COMMENT ON COLUMN student.dptcode IS '�к��ڵ�';

COMMENT ON COLUMN student.majorcode IS '�а��ڵ�';

COMMENT ON COLUMN student.pass IS '��й�ȣ';

COMMENT ON COLUMN student.sname IS '�̸�';

COMMENT ON COLUMN student.phone IS '��ȭ��ȣ';

COMMENT ON COLUMN student.email IS '�̸����ּ�';

COMMENT ON COLUMN student.nowlevel IS '�г�';

COMMENT ON COLUMN student.addr IS '�ּ�';

COMMENT ON COLUMN student.img IS '����';

COMMENT ON COLUMN student.input_date IS '�߰�����';

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


/* ���� ���̺� */

CREATE TABLE course (
	subcode VARCHAR2(10) NOT NULL, /* �����ڵ� */
	stuno NUMBER(10) NOT NULL, /* �й� */

	slevel NUMBER(1) NOT NULL, /* �г� */
	semester NUMBER(1) NOT NULL /* �б� */
);

insert into course values('CMP001001',20230002, 1 ,1 );
insert into course values('KOR001001',20230003, 2 ,2 );
insert into course values('KBS001001',20230004, 3 ,1 );
insert into course values('ARC001001',20230005, 4 ,2 );
insert into course values('SPO001001',20230006, 1 ,2 );


COMMENT ON TABLE course IS '���� ���̺�';

COMMENT ON COLUMN course.subcode IS '�����ڵ�';

COMMENT ON COLUMN course.stuno IS '�й�';

COMMENT ON COLUMN course.slevel IS '�г�';

COMMENT ON COLUMN course.semester IS '�б�';

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



/* ���� ���� */
CREATE TABLE subject (
	subcode VARCHAR2(10) NOT NULL, /* �����ڵ� */
	subname VARCHAR2(50), /* ����� */
	credit NUMBER(1), /* ���� */
	subtype CHAR(1), /* �̼� ���� */
	empno CHAR(10), /* ��� */
	majorcode CHAR(10), /* �а��ڵ� */
	dptcode CHAR(10) /* �к��ڵ� */
);

INSERT INTO subject (subcode,subname, credit, subtype) VALUES('CMP001001','���α׷��ֱ���',3,'M');
INSERT INTO subject (subcode,subname, credit, subtype) VALUES('KOR001001','���빮�л�',4,'M');
INSERT INTO subject (subcode,subname, credit, subtype) VALUES('KBS001001','��ȭ������',2,'M');
INSERT INTO subject (subcode,subname, credit, subtype) VALUES('ARC001001','��Ű',1,'G');
INSERT INTO subject (subcode,subname, credit, subtype) VALUES('SPO001001','�ǹ�����������',2,'G');



COMMENT ON TABLE subject IS '���� ����';

COMMENT ON COLUMN subject.subcode IS '�����ڵ�';

COMMENT ON COLUMN subject.subname IS '�����';

COMMENT ON COLUMN subject.credit IS '����';

COMMENT ON COLUMN subject.subtype IS '�̼� ����';

COMMENT ON COLUMN subject.empno IS '���';

COMMENT ON COLUMN subject.majorcode IS '�а��ڵ�';

COMMENT ON COLUMN subject.dptcode IS '�к��ڵ�';

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

/* ���� ��ȹ�� */
CREATE TABLE subject_plan (
	subcode VARCHAR2(10) NOT NULL, /* �����ڵ� */
	subgoal VARCHAR2(2000), /* �н���ǥ */
	subinfo VARCHAR2(4000), /* ���ǳ��� */
	empno CHAR(10) /* ��� */
);

insert INTO subject_plan(subcode,subinfo, subgoal) values
('CMP001001','�ȳ��ϼ��� ���� ���ο��Դϴ�. �̰� �׽�Ʈ ���ǳ����Դϴ�. �׷� 20000 �ҷ��� �ߴµ� ������ ���� �� ��� �϶�׿�..Ȥ�� ����?���������� ũũ���� hi my name is kim in young what your name?',
'©�� hi �� ������ Ȯ��');
insert INTO subject_plan(subcode,subinfo, subgoal) values
('KOR001001','���ع��� ��λ��� ������ ��ٷ� �ϴ����� �����ϻ� �츮���󸸼� ����ȭ ��õ�� ȭ������ ���ѻ�� �������� ���̺����ϼ� yea~hi~dong ha mul ga back du san e',
'���±� ������ �̼��� ���� ����. �����⼼�� ������ ��ȸ');
insert INTO subject_plan(subcode,subinfo, subgoal) values
('KBS001001','��ħ�� �������� �� �� ����� ��ĥ��! � ��! �� ���� ����� �� ģ���� ������~ ok man �װ� ������ ���� �Ϸ縦 ��ƺ��ڰ� ����, �������� ������ ���� ���Ƶ� ���� �� ������ ����',
'ȫ���̰� ���� �Ѵ� ȫȫȫ');
insert INTO subject_plan(subcode,subinfo, subgoal) values
('ARC001001','�̰��� �׽�Ʈ ���� ����. ������, ���� �˾Ƽ� �Ұ�. �̾��ϸ� ���� ��Ȱ�� ������? �밡�� �ھ� . ��. �� �̹��� �ް� �ݳ��� ~ haha',
'�ش����� �ʿ��� �Ǹ��ߴ�');
insert INTO subject_plan(subcode,subinfo, subgoal) values
('SPO001001','�������� �;��/ ���� ��ħ 4�� 44���̳׿�. ������ �ð�. �׷� 20000 skdjfalskdjfa;lskdjf;asdkjf;alskdjf;asdlkf;asdk',
'������������������������������ �����');

select * from subject_plan;

COMMENT ON TABLE subject_plan IS '���� ��ȹ��';

COMMENT ON COLUMN subject_plan.subcode IS '�����ڵ�';

COMMENT ON COLUMN subject_plan.subgoal IS '�н���ǥ';

COMMENT ON COLUMN subject_plan.subinfo IS '���ǳ���';

COMMENT ON COLUMN subject_plan.empno IS '���';

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

/* �г� */
CREATE TABLE hakyeon (
	stuno NUMBER(10) NOT NULL, /* �й� */
	slevel NUMBER(1) NOT NULL, /* �г� */
	semester NUMBER(1) NOT NULL /* �б� */
);


insert into hakyeon values(20230002,1,1);
insert into hakyeon values(20230003,2,2);
insert into hakyeon values(20230004,3,1);
insert into hakyeon values(20230005,4,2);
insert into hakyeon values(20230006,1,2);

select * from HAKYEON;

COMMENT ON TABLE hakyeon IS '�г�';

COMMENT ON COLUMN hakyeon.stuno IS '�й�';

COMMENT ON COLUMN hakyeon.slevel IS '�г�';

COMMENT ON COLUMN hakyeon.semester IS '�б�';

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

/* ��� */
CREATE TABLE emp (
	empno CHAR(10) NOT NULL, /* ��� */
	usercode CHAR(1) NOT NULL, /* �����ڵ� */
	pass VARCHAR2(60), /* ��й�ȣ */
	ename VARCHAR2(21), /* �̸� */
	phone CHAR(13), /* ��ȭ��ȣ */
	email VARCHAR2(100), /* �̸����ּ� */
	img VARCHAR2(200), /* ���� */
	majorcode CHAR(10), /* �а��ڵ� */
	dptcode CHAR(10) /* �к��ڵ� */
);

insert into EMP values('EMP000100','E',1234,'�����','010-4654-1545','test@test.com','image1.png','EMP000','EMP');
insert into EMP values('CMP001500','P',1234,'���ٸ�','010-2345-3463','prof@gmail.com','image2.png','CMP001','CMP');
insert into EMP values('KOR001501','P',1234,'�弮��','010-8475-1789','test@naver.com','image3.png','KOR001','KOR');
insert into EMP values('KBS001502','P',4321,'���켺','010-5767-1686','test@daum.net','image4.png','KBS001','KBS');



COMMENT ON TABLE emp IS '���';

COMMENT ON COLUMN emp.empno IS '���';

COMMENT ON COLUMN emp.usercode IS '�����ڵ�';

COMMENT ON COLUMN emp.pass IS '��й�ȣ';

COMMENT ON COLUMN emp.ename IS '�̸�';

COMMENT ON COLUMN emp.phone IS '��ȭ��ȣ';

COMMENT ON COLUMN emp.email IS '�̸����ּ�';

COMMENT ON COLUMN emp.img IS '����';

COMMENT ON COLUMN emp.majorcode IS '�а��ڵ�';

COMMENT ON COLUMN emp.dptcode IS '�к��ڵ�';

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

/* �а� */
CREATE TABLE major (
	majorcode CHAR(10) NOT NULL, /* �а��ڵ� */
	dptcode CHAR(10) NOT NULL, /* �к��ڵ� */
	majorname VARCHAR2(60) /* �а��� */
);

INSERT INTO major(majorcode,dptcode, majorname) VALUES ('CMP001','CMP','��ǻ�Ͱ��а�');
INSERT INTO major(majorcode,dptcode, majorname) VALUES ('KOR001','KOR','������а�');
INSERT INTO major(majorcode, dptcode,majorname) VALUES ('KBS001','KBS','���ؿ�ȭ��');
INSERT INTO major(majorcode, dptcode,majorname) VALUES ('ARC001','ARC','������а�');
INSERT INTO major(majorcode, dptcode,majorname) VALUES ('SPO001','SPO','��ȸü���а�');
insert into major values('EMP000','EMP','����');

COMMENT ON TABLE major IS '�а�';

COMMENT ON COLUMN major.majorcode IS '�а��ڵ�';

COMMENT ON COLUMN major.dptcode IS '�к��ڵ�';

COMMENT ON COLUMN major.majorname IS '�а���';

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

/* ���� */
CREATE TABLE tgrade (
	subcode VARCHAR2(10) NOT NULL, /* �����ڵ� */
	stuno NUMBER(10) NOT NULL, /* �й� */
	slevel NUMBER(1) NOT NULL, /* �г� */
	semester NUMBER(1) NOT NULL, /* �б� */
	grade CHAR(2) /* ���� */
);

insert into tgrade values('CMP001001',20230002,1,1,2);

COMMENT ON TABLE tgrade IS '����';

COMMENT ON COLUMN tgrade.subcode IS '�����ڵ�';

COMMENT ON COLUMN tgrade.stuno IS '�й�';

COMMENT ON COLUMN tgrade.slevel IS '�г�';

COMMENT ON COLUMN tgrade.semester IS '�б�';

COMMENT ON COLUMN tgrade.grade IS '����';

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
