
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

--------------------------------------------------------------------------------------------
-- 1.도서 테이블에서 가격 순으로 내림차순 정렬하여,  도서명, 저자, 가격 출력 (가격이 같으면 저자 순으로 오름차순 정렬)
SELECT bookname, bookauthor, bookprice FROM book
ORDER BY bookprice DESC, bookauthor ASC;

-- 2.도서 테이블에서 저자에 '길동'이 들어가는 도서의 총 재고 수량 계산하여 출력
SELECT SUM(bookstock) AS 총재고수량 FROM book
WHERE bookauthor LIKE '%길동%';

-- 3.도서 테이블에서 ‘서울 출판사' 도서 중 최고가와 최저가 출력
SELECT MAX(bookprice) AS 최고가, MIN(bookprice) AS 최저가 FROM book b
JOIN publisher p ON b.pubno = p.pubno
WHERE p.pubname = '서울 출판사';

-- 4.도서 테이블에서 출판사별로 총 재고수량과 평균 재고 수량 계산하여 출력 (‘총 재고 수량’으로 내림차순 정렬)
SELECT MAX(bookprice) AS 최고가, MIN(bookprice) AS 최저가 FROM book b
JOIN publisher p ON b.pubno = p.pubno
WHERE p.pubname = '서울 출판사';

-- 5.도서판매 테이블에서 고객별로 ‘총 주문 수량’과 ‘총 주문 건수’ 출력. 단 주문 건수가 2이상인 고객만 해당
SELECT p.pubname, SUM(b.bookstock) AS 총재고수량, AVG(b.bookstock) AS 평균재고수량
FROM book b
JOIN publisher p ON b.pubno = p.pubno
GROUP BY p.pubname
ORDER BY 총재고수량 DESC;



--------------------------------------------------------------------------------

-- 1) 모든 도서: 도서번호, 도서명, 출판사명
SELECT b.bookno, b.bookname, p.pubname
FROM book b
JOIN publisher p ON b.pubno = p.pubno;

-- 2) '서울 출판사'에서 출간한 도서: 도서명, 저자명, 출판사명
SELECT b.bookname, b.bookauthor, p.pubname
FROM book b
JOIN publisher p ON b.pubno = p.pubno
WHERE p.pubname = '서울 출판사';

-- 3) '정보출판사'에서 출간된 도서 중 "판매된" 도서의 도서명 (중복 1회만)
SELECT DISTINCT b.bookname
FROM book b
JOIN publisher p ON b.pubno = p.pubno
JOIN booksale s ON s.bookno = b.bookno
WHERE p.pubname = '정보출판사';

-- 4) 도서가격이 30,000원 이상인 도서를 주문한 고객: 고객명, 도서명, 도서가격, 주문수량
SELECT c.clientname, b.bookname, b.bookprice, s.bsqty
FROM booksale s
JOIN book b     ON b.bookno = s.bookno
JOIN client c   ON c.clientno = s.clientno
WHERE b.bookprice >= 30000;

-- 5) '안드로이드 프로그래밍'을 구매한 고객: 도서명, 고객명, 성별, 주소 (고객명 오름차순)
SELECT b.bookname, c.clientname, c.clientgender, c.clientaddress
FROM booksale s
JOIN book b   ON b.bookno = s.bookno
JOIN client c ON c.clientno = s.clientno
WHERE b.bookname = '안드로이드 프로그래밍'
ORDER BY c.clientname ASC;

-- 6) '도서출판 강남'에서 출간된 도서 중 판매된 도서의 총 매출액
-- (매출액 = 가격 * 수량)
SELECT SUM(b.bookprice * s.bsqty) AS 총매출액
FROM booksale s
JOIN book b       ON b.bookno = s.bookno
JOIN publisher p  ON p.pubno = b.pubno
WHERE p.pubname = '도서출판 강남';



--------------------------------------------------------------------------------
-- 8월 12일 실습

-- 1.호날두(고객명)가 주문한 도서의 총 구매량 출력
SELECT SUM(bsqty) AS 총구매량
FROM booksale
WHERE clientno = (
    SELECT clientno
    FROM client
    WHERE clientname = '호날두'
);
-- 2.‘정보출판사’에서 출간한 도서를 구매한 적이 있는 고객명 출력
SELECT DISTINCT c.clientname
FROM client c
JOIN booksale s ON c.clientno = s.clientno
WHERE s.bookno IN (
    SELECT bookno
    FROM book
    WHERE pubno = (
        SELECT pubno
        FROM publisher
        WHERE pubname = '정보출판사'
    )
);
-- 3.베컴이 주문한 도서의 최고 주문수량 보다 더 많은 도서를 구매한 고객명 출력
SELECT DISTINCT c.clientname
FROM client c
JOIN booksale s ON c.clientno = s.clientno
WHERE s.bsqty > (
    SELECT MAX(bsqty)
    FROM booksale
    WHERE clientno = (
        SELECT clientno
        FROM client
        WHERE clientname = '베컴'
    )
);
-- 4.천안에 거주하는 고객에게 판매한 도서의 총 판매량 출력
SELECT SUM(bsqty) AS 총판매량
FROM booksale
WHERE clientno IN (
    SELECT clientno
    FROM client
    WHERE clientaddress = '천안'
);


















