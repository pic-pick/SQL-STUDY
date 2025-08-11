-- 데이터 조작오(DML)
-- 데이터 입력/삭제/수정/검색
-- INSERT문 : 테이블에 데이터(튜플)을 저장하는 조작
-- INSERT INTO 테이블명(열이름 리스트) VALUES(값 리스트) : 부분열만 저장 가능 - NULL 허용하는 열의 값은 생략해도 됨
-- INSERT INTO 테이블명 VALUES(값 리스트) : 값리스트에 모든열의 값이 테이블 생성 시 순서에 맞춰 나열되어야 함

-- STUDENT 테이블에 행 삽입-- 결이름 리스트 나열하면 열수
INSERT INTO STUDENT (STDNO, STDNAME, STDYEAR, DPTNO)
VALUES('2016005','변학도','4','1');
-- 값 문자열일떄는 ' ' 표시

-- 열 나열 없이 실제 값만 나열 : 단, 모든 필드의 값이 다 나열되어야 함
INSERT INTO STUDENT
VALUES('20160006','변학도','4','2020-01-01','1');

--=====================================================================
INSERT INTO book
VALUES('5','자바스크립트',230000,'2019-05-17','2');

-- BOOK 테이블 내용 조회 : DB로부터 반환되는 결과는 릴레이션 형태로 나옴
SELECT * FROM BOOK;

-- SELECT EX
SELECT BOOKNAME FROM BOOK WHERE BOOKNO='1';

-- 여러개의 DATA(튜플)을 저장 : INSERT ALL INTO 테이블명 () VALUES () INTO 테이블명

INSERT ALL
    INTO BOOK VALUES('6','데이터베이스',35000,'2021-05-12','2')
    INTO BOOK VALUES('6','알고리즘',35000,'2021-05-12','1')
SELECT *
    
