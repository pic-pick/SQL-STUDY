--SELECT
/*
SELECT [ALL | DISTINCT] 열이름 리스트
FROM 테이블명
[WHERE 검색조건(들)]
[GROUP BY 열이름]
[HAVING 검색조건(들)]
[ORDER BY 열이름 [ASC | DESC]]
*/

-- 서점 관계 테이블 IMPORT
SELECT * FROM BOOK;

-- 테이블에 제약 조건 설정

-- 참조 무결성 제약 조건
-- 참조되는 테이블의 기본키 먼저 구성 참조하는 테이블의 외래키 구성

-- 서점의 모든 도서는 거래하고 있는 출판사에서 구매된다 - 도서테이블(BOOK) 출판사데이터(PUBNO)는 출판사테이블(PUBLISHER)의 기본키 도메인의 범위에 국한된다
-- 서점의 모든 도서(BOOK)는 회원가입되어 있는 회원(CLIENT)이 서점에 등록되어있는 도서를 구매할 수 있다 : 구매관계 테이블(BOOKSALE)

-- 기본키 제약조건
ALTER TABLE PUBLISHER
    ADD CONSTRAINT PK_publisher_pubno
    PRIMARY KEY(PUBNO);
    
ALTER TABLE BOOK
    ADD CONSTRAINT PK_book_bookno
    PRIMARY KEY(BOOKNO);

ALTER TABLE CLIENT
    ADD CONSTRAINT PK_client_clientno
    PRIMARY KEY(CLIENTNO);
    
ALTER TABLE BOOKSALE
    ADD CONSTRAINT PK_booksale_bsno
    PRIMARY KEY(BSNO);
    
-- 외래키 제약조건 추가
ALTER TABLE BOOK
    ADD CONSTRAINT FK_book_publisher
    FOREIGN KEY (pubNo) REFERENCES PUBLICSHER(pubNo);
    
ALTER TABLE BOOKSALE
    ADD CONSTRAINT FK_bookSale_client
    FOREIGN KEY (clientNO) REFERENCES CLIENT(clientNO);
    
    
ALTER TABLE BOOKSALE
    ADD CONSTRAINT FK_bookSale_book
    FOREIGN KEY (bookNo) REFERENCES BOOK(bookNO);
    
    
--------------------------------------------------------------------------------
-- 특정 테이블의 모든 튜블을 반환 -> 반환결과 테이블
SELECT * FROM PUBLICSHER;

SELECT * FROM BOOK;
    
SELECT * FROM CLIENT;
    
SELECT * FROM BOOKSALE;
    
--------------------------------------------------------------------------------
-- BOOK테이블에서 모든 행 검색하여 출력
-- (*) 모든
SELECT *
FROM BOOK;

-- BOOK테이블에서 도서명, 도서가격만 출력
SELECT BOOKNAME, BOOKPRICE FROM BOOK;

-- BOOK테이블에서 저자 검색(중복 튜플은 한번만 반환) : DISTINCT
SELECT DISTINCT BOOKAUTHOR
FROM BOOK;

--------------------------------------------------------------------------------
/*
WHERE 조건절 : 검색의 세분화
조건 사용 연산자
비교 : =, <, >, <=, >=, !=
범위 : BETWEEN
리스트에 포함 : IN, NOT IN
NULL : IS NULL, IS NOT NULL
논리 : AND, OR
패턴 매칭 : LIKE
*/

-- 비교 : =, <, >, <=, >=, !=
-- 저자가 홍길동인 도서의 도서명, 저자 반환
SELECT BOOKNAME, BOOKAUTHOR FROM BOOK
WHERE BOOKAUTHOR='홍길동';

-- 도서가가 3만원 이상인 도서의 도서명, 가격, 재고 반환
SELECT BOOKNAME, BOOKPRICE, BOOKSTOCK FROM BOOK
WHERE BOOKPRICE >= 30000;

-- 도서재고가 3권 이상이고 5권 이하인 도서의 도서명과 수량 반환
SELECT BOOKNAME, BOOKSTOCK FROM BOOK
WHERE BOOKSTOCK >= 3 AND BOOKSTOCK <= 5;

-- 범위 : BETWEEN
-- 도서 재고가 3권 이상이고 5권 이하의 도서의 도서명과 재고 수량 반환
SELECT BOOKNAME, BOOKSTOCK FROM BOOK
WHERE BOOKSTOCK BETWEEN 3 AND 5;

-- 리스트에 포함 : IN, NOT IN : (값1, 값2, ...) -> 리스트
-- 서울 출판사와 도서출판 강남의 도서명과 출판사 번호 출력
SELECT BOOKNAME, PUBNO FROM BOOK
WHERE PUBNO IN('1','2');


-- NULL : IS NULL, IS NOT NULL

-- 모든 클라이언트의 이름과 취미를 반환
SELECT CLIENTNAME, CLIENTHOBBY FROM CLIENT;

-- 취미정보가 NULL인 클라이언트의 이름과 취미를 반환
SELECT CLIENTNAME, CLIENTHOBBY FROM CLIENT
WHERE CLIENTHOBBY IS NULL;

-- 취미정보가 NULL이 아닌 클라이언트의 이름과 취미를 반환
SELECT CLIENTNAME, CLIENTHOBBY FROM CLIENT
WHERE CLIENTHOBBY IS NOT NULL;

-- 취미에 공백값이 저장되어 있는 클라이언트의 이름과 취미를 반환
SELECT CLIENTNAME, CLIENTHOBBY FROM CLIENT
WHERE CLIENTHOBBY = ' ';

-- 논리(AND,OR)

-- 저자가 홍길동 이면서 재고가 3권 이상인 도서의 정보 반환
SELECT * FROM BOOK
WHERE BOOKAUTHOR = '홍길동' AND BOOKSTOCK >= 3;

-- 저자가 홍길동 이거나 성춘향인 도서의 정보
SELECT * FROM BOOK
WHERE BOOKAUTHOR = '홍길동' OR BOOKAUTHOR = '성춘향';

-- IN
SELECT * FROM BOOK
WHERE BOOKAUTHOR IN('홍길동','성춘향');

-- 패턴매칭 : LIKE
-- WHERE 컬럼명 LIKE '패턴'
-- % : 0개 이상의 문자를 가진 문자열, _ : 한개의열 문자
-- '홍%' : 홍으로 시작하는 문자열 EX. 홍, 홀길, 홍길동
-- '%길%' : 길을 포함하는 문자열 EX. 길, 홍길, 길동, 홍길동
-- '%동' : 동으로 끝나는 문자 EX. 동, 길동, 홍길동
-- ____ : 4개의 문자로 구성된 문자열  EX. 홍길동전

-- 출판사 명에 출판사 문자열이 포함된 출판사 정보
SELECT * FROM PUBLICSHER
WHERE PUBNAME LIKE '%출판사%';

-- 출생년도가 19901년대인 고객의 정보 반환
SELECT * FROM CLIENT
WHERE CLIENTBIRTH LIKE '199%';

-- 이름이 4글자인 고객의 정보 반환
SELECT * FROM CLIENT순
WHERE CLIENTNAME LIKE '____';

-- NOT LIKE
-- 도서명에 안드로이드가 포함되지 않은 도서의 정보
SELECT * FROM BOOK
WHERE BOOKNAME NOT LIKE '%안드로이드%';

--------------------------------------------------------------------------------
-- ORDER BY
-- 특정 열의 값을 기준으로 질의 결과 정렬
-- 가장 마지막에 진행되는 연산 (ORDER BY 절은 마지막에 질의가 나옴)
-- 기준열을 두개 이상 나열 가능 - 우선기준, 두번쨰 기준, 세번째 기준
SELECT * FROM BOOK
ORDER BY BOOKNAME;

-- 조건절 뒤에 ORDER BY
SELECT BOOKNAME, BOOKAUTHOR, BOOKPRICE, BOOKSTOCK FROM BOOK
WHERE BOOKPRICE >= 20000
ORDER BY BOOKPRICE;

-- 정렬 조건 2개 이상일 경우
-- 도서재고를 기준으로 내림차순정렬하고 재고가 동일한 경우 저자를 기준으로 오름차순으로 도서정보 반
SELECT * FROM BOOK
ORDER BY BOOKSTOCK DESC, BOOKAUTHOR ASC;
환















