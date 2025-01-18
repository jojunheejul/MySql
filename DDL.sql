## DDL

# 1. CREATE
CREATE TABLE examples (
    ExamId INT PRIMARY KEY AUTO_INCREMENT,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50)
);
# 2. ALTER
# 2-1. examples 테이블에 Country 필드 추가 (varchar(100) NOT NULL)
USE db;

ALTER TABLE examples
ADD COLUMN Country VARCHAR(100) NOT NULL DEFAULT 'default value';

# 2-2. examples 테이블에 Age, Address 필드 추가
#  	   Age : int, not null, 기본값은 0
# 	   Address : 가변길이문자(100), not null, 기본값은 'default value'

ALTER TABLE examples
ADD COLUMN ( Age int NOT NULL DEFAULT '0',
			Address VARCHAR(100) NOT NULL DEFAULT 'deafault value'); 
            
# 2-3. 컬럼의 이름 변경(Address를 PostCode로 변경)
ALTER TABLE examples
RENAME COLUMN Address TO postCode; 
# 2-4. 테이블 이름 변경 (examples를 new_examples로 변경)
ALTER TABLE examples
RENAME TO new_examples;
# 2-5. 컬럼 삭제 (age 컬럼 삭제)
ALTER TABLE new_examples
DROP COLUMN Age;
# 2-6. 제약조건 추가 (employee 테이블의 store_id가 store테이블의  store_id 참조할 수 있게 FK로 추가 설정)
ALTER TABLE employee
ADD CONSTRAINT FOREIGN KEY (store_id) REFERENCES store(store_id);


## 3. DROP
# 3-1. new_examples 테이블 삭제
USE db;
DROP TABLE new_examples;

## 4. TRUNCATE : 테이블의 모든 데이터를 비우는 작업
#				 drop과 유사하지만 table을 drop 후 재생성하기 때문에 ID(PK) 값이 초기화됨

# 문법
# TRUNCATE TABLE table_name;
