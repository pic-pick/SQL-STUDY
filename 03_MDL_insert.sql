-- 데이터 조작오(DML)
-- 데이터 입력/삭제/수정/검색
-- INSERT문 : 테이블에 데이터(튜플)을 저장하는 조작
-- INSERT INTO 테이블명(열이름 리스트) VALUES(값 리스트) : 부분열만 저장 가능 - NULL 허용하는 열의 값은 생략해도 됨
-- INSERT INTO 테이블명 VALUES(값 리스트) : 값리스트에 모든열의 값이 테이블 생성 시 순서에 맞춰 나열되어야 함

-- STUDENT 테이블에 행 삽입-- 결이름 리스트 나열하면 열수
INSERT INTO STUDENT (STDNO, STDNAME, STDYEAR, DPTNO)
VALUES('2016005','변학도','4','1');