-- 조인
-- 여러개의 테이블을 결합하여 조건에 맞는 행 검색
-- ex. 홍길동학생의 소속과명
-- 조인종류
-- 1. inner join / outer join
-- 1. inner join : 두 테이블에 공통되는 열이 있을 때
-- 2. outer join : 두 테이블에 공통되는 열이 없을 때도 표현

-- 고객 / 주문 테이블
-- 상품을 주문한 고객을 조회 : inner join
-- 상품을 주문한 고객과 주문하지 않은 고객도 주문내역과 같이 조회 : outer join

-- 형식
/* select 열리스트
     from 테이블명 1
     inner join 테이블명 2
     on 조인조건(기본키 = 외래키); */

-- 주문한 적이 있는 고객의 번호 이름
-- 고객테이블에서 고객 번호와 이름이 있지만 주문여부는 확인 불가능
-- 주문테이블에서는 주문여부 확인이 가능하지만 고객번호와 고객이름은 확인 불가능

-- 주문한 적이 있는 고객의 모든 정보 (ANSI JOIN 표기법)
SELECT client.clientno, clientname
FROM client
INNER JOIN booksale
    ON client.clientno = booksale.clientno;

-- 주문한 적이 있는 고객의 모든 정보 (구 표기법)
SELECT client.clientno, clientname
FROM client, booksale  -- 결합하고자 하는 테이블 나열
WHERE client.clientno = booksale.clientno;

-- 결과는 clientno를 제외하고는 테이블명 포홤시키지 않아도 동일함
-- 오라클 서버 입장에서는 속성의 소속을 명확히 하게됨으로 위치를 정확이 알려주므로 성능이 향상
SELECT client.clientno, client.clientname, booksale.bsqty
FROM client, booksale  -- 결합하고자 하는 테이블 나열
WHERE client.clientno = booksale.clientno;

-- 테이블에 별칭 사용
select clientno, clientname bsqty
from client A, booksale B
where A.clientno = b.clientno;

-- 주문한 적이 있는 고객의 모든 정보 (INNER JOIN 표기법)
SELECT client.clientno, clientname
FROM client
    INNER JOIN booksale
    ON client.clientno = bs.clientno
ORDER BY C.clientno;
    
    
    