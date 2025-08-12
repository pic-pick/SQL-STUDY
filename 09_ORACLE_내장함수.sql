-- 오라클 내장함수

-- 수학함수
-- ROUND(값, 자리수) : 자리수 아래에서 반올림

SELECT ROUND(3.862,1) FROM DUAL;
SELECT ROUND(3.862,2) FROM DUAL;

-- 고객별 평균 주문액을 계산해서 조회(백원단위에서 반올림한 계산결과 조회)
SELECT CLIENTNO, ROUND(AVG(BOOKPRICE*BSQTY)) AS 평균주문액,
                 ROUND(AVG(BOOKPRICE*BSQTY),0) AS 평균주문액,
                 ROUND(AVG(BOOKPRICE*BSQTY),-1) AS "10자리까지출력",
                 ROUND(AVG(BOOKPRICE*BSQTY),-2) AS "100자리까지출력",
                 ROUND(AVG(BOOKPRICE*BSQTY),-3) AS "1000자리까지출력"
FROM BOOK, BOOKSALE
WHERE BOOK.BOOKNO = BOOKSALE.BOOKNO
GROUP BY CLIENTNO
ORDER BY CLIENTNO;

--------------

SELECT REPLACE('자바프로그래밍','자바','파이썬') FROM DUAL;
SELECT REPLACE('apple airplane apart','ap','*^') FROM DUAL;

-- 도서명에 안드로이드가 포함된 도서에 대해
-- ANDROID로 변경해서 조회

SELECT BOOKNO, BOOKNAME, BOOKAUTHOR, BOOKPRICE
FROM BOOK
WHERE BOOKNAME LIKE '%안드로이드%';

-- 각 도서의 도서명에 대한 크기를 확인
-- 도서명은 문자열(개수, 바이트 수)




CREATE TABLE CUBETBL(
    PRDNAME VARCHAR2(10),
    COLOR VARCHAR2(6),
    AMOUNT NUMBER(2)
    );
INSERT INTO CUBETBL VALUES('컴퓨터','검정',11);
INSERT INTO CUBETBL VALUES('컴퓨터','파랑',22);
INSERT INTO CUBETBL VALUES('모니터','검정',33);
INSERT INTO CUBETBL VALUES('모니터','파랑',44);
INSERT INTO CUBETBL VALUES('마우스','검정',55);
INSERT INTO CUBETBL VALUES('마우스','파랑',66);

create table pivotTest(
  singer varchar2(10),
  season varchar2(10),
  amount number(3)
);
insert into pivotTest values('김범수','겨울',10);
insert into pivotTest values('윤종신','여름',15);
insert into pivotTest values('김범수','가을',25);
insert into pivotTest values('김범수','봄',3);
insert into pivotTest values('김범수','봄',37);
insert into pivotTest values('윤종신','가을',40);
insert into pivotTest values('김범수','여름',14);
insert into pivotTest values('김범수','겨울',22);
insert into pivotTest values('윤종신','여름',64);

