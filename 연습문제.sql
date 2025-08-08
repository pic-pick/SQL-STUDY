
-- 연습문제

-- INSERT 문제
INSERT INTO STUDENT (STDNO, STDNAME, STDYEAR, DepartNo, STDBIRTH)
VALUES ('2016001', '홍길동', 4, '1', '1997-01-01');
INSERT INTO STUDENT
VALUES ('2015002', '성춘향', 3, '3', '1996-12-10');
INSERT ALL
    INTO STUDENT VALUES ('2014004', '이몽룡' , 2, '2', '1996-03-03')
    INTO STUDENT VALUES ('2016002', '변학도' , 4, '1', '1995-05-07')
    INTO STUDENT VALUES ('2015003', '손흥민' , 3, '2', '1997-11-11')
    SELECT * FROM DUAL;
select * FROM STUDENT;







CREATE SEQUENCE NO_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000
    MINVALUE 1
    NOCYCLE;

DROP TABLE board;
CREATE TABLE  board(
    bNo NUMBER PRIMARY KEY,
    bSubject VARCHAR2(30) NOT NULL,
    bname   VARCHAR2(20) NOT NULL
    );
    
-- 데이터 추가
INSERT INTO BOARD VALUES (NO_SEQ.NEXTVAL, '추석', '홍길동');   -- NO_SEQ.NEXTVAL : 현재값에서 증가분만큼 증가시켜 반환하고 반환된 값 저장
INSERT INTO BOARD VALUES (NO_SEQ.NEXTVAL, '미세먼지', '홍길동');
INSERT INTO BOARD VALUES (NO_SEQ.NEXTVAL, '휴가', '홍길동');

SELECT * FROM BOARD;

-- 시퀀스 값 검색
SELECT NO_SEQ.CURRVAL

-- 시퀀스 수정
ALTER SEQUENCE NO_SEQ
    MAXVALUE 1000;
    
    
-- 고객테이블 생성
DROP TABLE CUSTOMER;

CREATE TABLE customer (
    custNo      VARCHAR2(10) NOT NULL PRIMARY KEY,
    custName    VARCHAR2(30) NOT NULL,
    custTel     VARCHAR2(30),
    custAddress VARCHAR2(40)
);

-- 주문 테이블 : 고객이 상품을 주문한다
CREATE TABLE ORDERPRODUCT (
    ORDERNO VARCHAR2(10) NOT NULL PRIMARY KEY,
    ORDERDATE DATE,
    ORDERQTY NUMBER(3),
    CUSTNO VARCHAR2(10) NOT NULL,
    PRDNO VARCHAR2(4) NOT NULL,
    CONSTRAINT FK_ORDERPRODUCT_CUSTOMER FOREIGN KEY (CUSTNO) REFERENCES CUSTOMER (CUSTNO),
    CONSTRAINT FK_ORDERPRODUCT_PRODUCT FOREIGN KEY (PRDNO) REFERENCES PRODUCT (PRDNO)
);



-- 1.고객 테이블에서 고객명, 생년월일, 성별 출력
SELECT CLIENTNAME,CLIENTBIRTH,CLIENTGENDER FROM CLIENT;

-- 2.고객 테이블에서 주소만 검색하여 출력 (중복되는 튜플은 한번만 출력)
SELECT DISTINCT CLIENTADDRESS FROM CLIENT;

-- 3.고객 테이블에서 취미가 '축구'이거나 '등산'인 고객의 고객명, 취미 출력
SELECT CLIENTNAME,CLIENTHOBBY FROM CLIENT
WHERE CLIENTHOBBY = '축구' OR CLIENTHOBBY = '등산';

-- 4.도서 테이블에서 저자의 두 번째 위치에 '길'이 들어 있는 저자명 출력 (중복되는 튜플은 한번만 출력)
SELECT DISTINCT BOOKAUTHOR FROM BOOK
WHERE BOOKAUTHOR LIKE '_길%';

-- 5.도서 테이블에서 발행일이 2018년인 도서의 도서명, 저자, 발행일 출력
SELECT BOOKNAME, BOOKAUTHOR, BOOKDATE FROM BOOK
WHERE BOOKDATE LIKE '2018%'; 

-- 6.도서판매 테이블에서 고객번호1, 2를 제외한 모든 튜플 출력
SELECT CLIENTNO FROM BOOKSALE
WHERE CLIENTNO NOT IN ('1','2');

-- 7.고객 테이블에서 취미가 NULL이 아니면서 주소가 '서울'인 고객의 고객명, 주소, 취미 출력
SELECT CLIENTHOBBY 

8.도서 테이블에서 가격이 25000 이상이면서 저자 이름에 '길동'이 들어가는 도서의 도서명, 저자, 가격, 재고 출력
9.도서 테이블에서 가격이 20,000 ~25,000원인 모든 튜플 출력
10.도서 테이블에서 저자명에 '길동'이 들어 있지 않는 도서의 도서명, 저자 출력































