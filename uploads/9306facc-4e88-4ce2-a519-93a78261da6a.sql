-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.38 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- bank 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `bank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bank`;

-- 테이블 bank.bank_account 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_account` (
  `a_no` char(11) NOT NULL,
  `a_item_dist` char(2) NOT NULL,
  `a_item_name` varchar(20) NOT NULL,
  `a_c_no` varchar(14) NOT NULL,
  `a_balance` int DEFAULT '0',
  `a_open_date` date NOT NULL,
  PRIMARY KEY (`a_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bank.bank_account:~10 rows (대략적) 내보내기
INSERT INTO `bank_account` (`a_no`, `a_item_dist`, `a_item_name`, `a_c_no`, `a_balance`, `a_open_date`) VALUES
	('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 100000, '2005-07-21'),
	('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 43000, '2007-02-17'),
	('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14'),
	('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30'),
	('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07'),
	('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13'),
	('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-15'),
	('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25'),
	('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, '2013-12-11'),
	('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');

-- 테이블 bank.bank_customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_customer` (
  `c_no` varchar(14) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_dist` int DEFAULT '0',
  `c_phone` varchar(20) NOT NULL,
  `c_addr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`c_no`),
  UNIQUE KEY `c_phone` (`c_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bank.bank_customer:~9 rows (대략적) 내보내기
INSERT INTO `bank_customer` (`c_no`, `c_name`, `c_dist`, `c_phone`, `c_addr`) VALUES
	('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구'),
	('220-82-52237', '(주)한국전산', 2, '02-134-1054', '서울시 강서구'),
	('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시'),
	('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시'),
	('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시'),
	('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구'),
	('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구'),
	('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시'),
	('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

-- 테이블 bank.bank_transaction 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_transaction` (
  `t_no` tinyint NOT NULL AUTO_INCREMENT,
  `t_a_no` char(11) NOT NULL,
  `t_dist` tinyint NOT NULL,
  `t_amount` int DEFAULT '0',
  `t_datetime` datetime NOT NULL,
  PRIMARY KEY (`t_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bank.bank_transaction:~10 rows (대략적) 내보내기
INSERT INTO `bank_transaction` (`t_no`, `t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES
	(1, '101-11-1001', 1, 50000, '2022-08-21 04:26:52'),
	(2, '101-11-1003', 2, 120000, '2022-08-21 04:26:52'),
	(3, '101-11-2001', 2, 300000, '2022-08-21 04:26:52'),
	(4, '101-12-1002', 1, 1000000, '2022-08-21 04:26:52'),
	(5, '101-11-1001', 3, 0, '2022-08-21 04:26:52'),
	(6, '101-13-1005', 1, 200000, '2022-08-21 04:26:52'),
	(7, '101-11-1001', 1, 450000, '2022-08-21 04:26:52'),
	(8, '101-11-2002', 2, 32000, '2022-08-21 04:26:52'),
	(9, '101-11-2003', 3, 0, '2022-08-21 04:26:52'),
	(10, '101-11-1003', 1, 75000, '2022-08-21 04:26:52');

-- 테이블 bank.lecture 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecNo` int NOT NULL,
  `lecName` varchar(20) NOT NULL,
  `lecCredit` int NOT NULL,
  `lecTime` int NOT NULL,
  `lecClass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lecNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bank.lecture:~7 rows (대략적) 내보내기
INSERT INTO `lecture` (`lecNo`, `lecName`, `lecCredit`, `lecTime`, `lecClass`) VALUES
	(159, '인지행동심리학', 3, 40, '본304'),
	(167, '운영체제론', 3, 25, '본B05'),
	(234, '중급 영문법', 3, 20, '본201'),
	(239, '세법개론', 3, 40, '본204'),
	(248, '빅데이터 개론', 3, 20, '본B01'),
	(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
	(349, '사회복지 마케팅', 2, 50, '본301');

-- 테이블 bank.register 구조 내보내기
CREATE TABLE IF NOT EXISTS `register` (
  `regStdNo` char(8) NOT NULL,
  `regLecNo` int NOT NULL,
  `regMidScore` int DEFAULT NULL,
  `regFinalScore` int DEFAULT NULL,
  `regTotalScore` int DEFAULT NULL,
  `regGrade` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bank.register:~8 rows (대략적) 내보내기
INSERT INTO `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`) VALUES
	('20201126', 234, 36, 42, 78, 'C'),
	('20201016', 248, 24, 62, 86, 'B'),
	('20201016', 253, 28, 40, 68, 'D'),
	('20201126', 239, 37, 57, 94, 'A'),
	('20210216', 349, 28, 68, 96, 'A'),
	('20210326', 349, 16, 65, 81, 'B'),
	('20201016', 167, 18, 38, 56, 'F'),
	('20220416', 349, 25, 58, 83, 'B');

-- 테이블 bank.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `stdNo` char(8) NOT NULL,
  `stdName` varchar(20) NOT NULL,
  `stdHp` char(13) NOT NULL,
  `stdYear` int NOT NULL,
  `stdAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stdNo`),
  UNIQUE KEY `stdHp` (`stdHp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bank.student:~6 rows (대략적) 내보내기
INSERT INTO `student` (`stdNo`, `stdName`, `stdHp`, `stdYear`, `stdAddress`) VALUES
	('20201016', '김유신', '010-1234-1001', 3, NULL),
	('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
	('20210216', '장보고', '010-1234-1003', 2, '전라남도 완주시'),
	('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
	('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
	('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');


-- bankerd 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `bankerd` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bankerd`;

-- 테이블 bankerd.bank_account 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_account` (
  `a_no` char(11) NOT NULL,
  `a_item_dist` char(2) NOT NULL,
  `a_item_name` varchar(20) NOT NULL,
  `a_c_no` varchar(14) NOT NULL,
  `a_balance` int NOT NULL DEFAULT '0',
  `a_open_date` date NOT NULL,
  PRIMARY KEY (`a_no`),
  KEY `fk_bank_account_bank_customer_idx` (`a_c_no`),
  CONSTRAINT `fk_bank_account_bank_customer` FOREIGN KEY (`a_c_no`) REFERENCES `bank_customer` (`c_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 bankerd.bank_account:~0 rows (대략적) 내보내기

-- 테이블 bankerd.bank_customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_customer` (
  `c_no` varchar(14) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_dist` tinyint NOT NULL,
  `c_phone` char(13) NOT NULL,
  `c_addr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`c_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 bankerd.bank_customer:~0 rows (대략적) 내보내기

-- 테이블 bankerd.bank_transaction 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_transaction` (
  `t_no` int NOT NULL AUTO_INCREMENT,
  `t_a_no` char(11) NOT NULL,
  `t_dist` tinyint NOT NULL,
  `t_amount` int NOT NULL DEFAULT '0',
  `t_datetime` datetime NOT NULL,
  PRIMARY KEY (`t_no`),
  KEY `fk_bank_transaction_bank_account1_idx` (`t_a_no`),
  CONSTRAINT `fk_bank_transaction_bank_account1` FOREIGN KEY (`t_a_no`) REFERENCES `bank_account` (`a_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 bankerd.bank_transaction:~0 rows (대략적) 내보내기


-- bookorder 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `bookorder` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookorder`;

-- 테이블 bookorder.book 구조 내보내기
CREATE TABLE IF NOT EXISTS `book` (
  `bookNo` int NOT NULL,
  `bookName` varchar(45) NOT NULL,
  PRIMARY KEY (`bookNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 bookorder.book:~0 rows (대략적) 내보내기

-- 테이블 bookorder.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderNo` int NOT NULL,
  `bookNo` int NOT NULL,
  `count` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`orderNo`,`bookNo`),
  KEY `fk_table1_Book1_idx` (`bookNo`),
  CONSTRAINT `fk_table1_Book1` FOREIGN KEY (`bookNo`) REFERENCES `book` (`bookNo`),
  CONSTRAINT `fk_table1_UserOrder` FOREIGN KEY (`orderNo`) REFERENCES `userorder` (`orderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 bookorder.order:~0 rows (대략적) 내보내기

-- 테이블 bookorder.userorder 구조 내보내기
CREATE TABLE IF NOT EXISTS `userorder` (
  `orderNo` int NOT NULL,
  `orderDate` date NOT NULL,
  `userId` varchar(10) NOT NULL,
  `userName` varchar(10) NOT NULL,
  `userAddr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 bookorder.userorder:~0 rows (대략적) 내보내기


-- bookstore 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookstore`;

-- 테이블 bookstore.book 구조 내보내기
CREATE TABLE IF NOT EXISTS `book` (
  `bookId` int NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bookstore.book:~0 rows (대략적) 내보내기

-- 테이블 bookstore.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `CustId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`CustId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bookstore.customer:~0 rows (대략적) 내보내기

-- 테이블 bookstore.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `custId` int NOT NULL,
  `bookId` int NOT NULL,
  `salePrice` int NOT NULL,
  `orderDate` date NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bookstore.order:~0 rows (대략적) 내보내기


-- college 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `college` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `college`;

-- 테이블 college.lecture 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecNo` int NOT NULL,
  `lecName` varchar(20) NOT NULL,
  `lecCredit` int NOT NULL,
  `lecTime` int NOT NULL,
  `lecClass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lecNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 college.lecture:~7 rows (대략적) 내보내기
INSERT INTO `lecture` (`lecNo`, `lecName`, `lecCredit`, `lecTime`, `lecClass`) VALUES
	(159, '인지행동심리학', 3, 40, '본304'),
	(167, '운영체제론', 3, 25, '본B05'),
	(234, '중급 영문법', 3, 20, '본201'),
	(239, '세법개론', 3, 40, '본204'),
	(248, '빅데이터 개론', 3, 20, '본B01'),
	(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
	(349, '사회복지 마케팅', 2, 50, '본301');

-- 테이블 college.register 구조 내보내기
CREATE TABLE IF NOT EXISTS `register` (
  `regStdNo` char(8) NOT NULL,
  `regLecNo` int NOT NULL,
  `regMidScore` int DEFAULT NULL,
  `regFinalScore` int DEFAULT NULL,
  `regTotalScore` int DEFAULT NULL,
  `regGrade` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 college.register:~8 rows (대략적) 내보내기
INSERT INTO `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`) VALUES
	('20201126', 234, 36, 42, 78, 'C'),
	('20201016', 248, 24, 62, 86, 'B'),
	('20201016', 253, 28, 40, 68, 'D'),
	('20201126', 239, 37, 57, 94, 'A'),
	('20210216', 349, 28, 68, 96, 'A'),
	('20210326', 349, 16, 65, 81, 'B'),
	('20201016', 167, 18, 38, 56, 'F'),
	('20220416', 349, 25, 58, 83, 'B');

-- 테이블 college.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `stdNo` char(8) NOT NULL,
  `stdName` varchar(20) NOT NULL,
  `stdHp` char(13) NOT NULL,
  `stdYear` int NOT NULL,
  `stdAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stdNo`),
  UNIQUE KEY `stdHp` (`stdHp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 college.student:~6 rows (대략적) 내보내기
INSERT INTO `student` (`stdNo`, `stdName`, `stdHp`, `stdYear`, `stdAddress`) VALUES
	('20201016', '김유신', '010-1234-1001', 3, NULL),
	('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
	('20210216', '장보고', '010-1234-1003', 2, '전라남도 완주시'),
	('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
	('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
	('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');


-- collegeerd 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `collegeerd` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `collegeerd`;

-- 테이블 collegeerd.lecture 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecNo` int NOT NULL,
  `lecName` varchar(20) NOT NULL,
  `lecCredit` tinyint NOT NULL,
  `lectime` tinyint NOT NULL,
  `lecClass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lecNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 collegeerd.lecture:~0 rows (대략적) 내보내기

-- 테이블 collegeerd.register 구조 내보내기
CREATE TABLE IF NOT EXISTS `register` (
  `regStdNo` char(8) NOT NULL,
  `regLecNo` int NOT NULL,
  `regMidScore` int DEFAULT NULL,
  `regFinalScore` int DEFAULT NULL,
  `regTotalScore` int DEFAULT NULL,
  `regGrade` char(1) DEFAULT NULL,
  PRIMARY KEY (`regStdNo`,`regLecNo`),
  KEY `fk_Register_Lecture1_idx` (`regLecNo`),
  CONSTRAINT `fk_Register_Lecture1` FOREIGN KEY (`regLecNo`) REFERENCES `lecture` (`lecNo`),
  CONSTRAINT `fk_Register_Student` FOREIGN KEY (`regStdNo`) REFERENCES `student` (`stdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 collegeerd.register:~0 rows (대략적) 내보내기

-- 테이블 collegeerd.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `stdNo` char(8) NOT NULL,
  `stdName` varchar(20) NOT NULL,
  `stdHp` char(13) NOT NULL,
  `stdYear` tinyint NOT NULL,
  `stdAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stdNo`),
  UNIQUE KEY `stdHp_UNIQUE` (`stdHp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 collegeerd.student:~0 rows (대략적) 내보내기


-- farmstory 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `farmstory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `farmstory`;

-- 테이블 farmstory.article 구조 내보내기
CREATE TABLE IF NOT EXISTS `article` (
  `a_no` int NOT NULL AUTO_INCREMENT,
  `a_group` varchar(255) DEFAULT NULL,
  `a_cateNo` int DEFAULT NULL,
  `a_title` varchar(255) NOT NULL,
  `a_content` text NOT NULL,
  `a_file` int DEFAULT NULL,
  `a_hit` int NOT NULL DEFAULT '0',
  `a_com` int NOT NULL,
  `a_writer` varchar(50) DEFAULT NULL,
  `a_regip` varchar(255) DEFAULT NULL,
  `a_redate` varchar(255) DEFAULT NULL,
  `a_rdate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`a_no`),
  KEY `FK9fmu0oirukf46vnc6omydkk53` (`a_writer`),
  CONSTRAINT `FK9fmu0oirukf46vnc6omydkk53` FOREIGN KEY (`a_writer`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판';

-- 테이블 데이터 farmstory.article:~85 rows (대략적) 내보내기
INSERT INTO `article` (`a_no`, `a_group`, `a_cateNo`, `a_title`, `a_content`, `a_file`, `a_hit`, `a_com`, `a_writer`, `a_regip`, `a_redate`, `a_rdate`) VALUES
	(1, 'cr', 1, '우리 농장 자랑! 싱싱한 유기농 채소의 수확', '농작물이야기입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 14:24:10', NULL),
	(2, 'co', 2, '10월 1일 식단', '오늘의 식단 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(3, 'co', 4, '1대1문의 1', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(4, 'co', 2, '10월 2일 식단', '오늘의 식단 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(5, 'co', 4, '1대1문의 1', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(6, 'co', 2, '10월 3일 식단', '오늘의 식단 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(7, 'co', 4, '1대1문의 1', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(8, 'co', 2, '10월 4일 식단', '오늘의 식단 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(9, 'co', 4, '1대1문의 1', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(10, 'co', 2, '10월 5일 식단', '오늘의 식단 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(11, 'co', 4, '1대1문의 1', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(12, 'co', 2, '10월 6일 식단', '오늘의 식단 입니다.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(13, 'co', 4, '1대1문의 1', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(14, 'co', 3, '영양 가득 시금치 프리타타, 아침 식사로 딱!', '나도 요리사 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(15, 'co', 4, '주문을 잘못 넣었습니다. 일부 항목을 취소하거나 변경할 수 있을까요?', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(16, 'co', 5, '배송 상태를 어떻게 확인하나요?', '배송 추적 방법과 배송 상태 확인에 대한 안내.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(17, 'co', 3, '갈릭 버터 새우, 입에서 살살 녹는 맛의 비밀', '나도 요리사 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(18, 'co', 4, '배송 주소를 잘못 입력했습니다. 수정할 수 있을까요?', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(19, 'co', 5, '특정 알레르기 성분이 포함되어 있나요?', '제품에 포함된 성분 정보와 알레르기 유발 물질에 대한 정보 제공.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(20, 'co', 3, '따뜻하고 든든한 토마토 수프, 이건 꼭 따라 해보세요', '나도 요리사 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(21, 'co', 4, '결제 오류가 발생했습니다. 결제가 완료되었는지 확인해 주세요.', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(22, 'co', 5, '상품 유통기한은 어떻게 확인하나요?', '식품의 유통기한 확인 방법 및 보장 기간에 대한 안내.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(23, 'co', 3, '집에서 만드는 정통 치킨 카레 레시피', '나도 요리사 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(24, 'co', 4, '특정 제품이 재입고될 예정이 있나요?', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(25, 'co', 5, '정기 구독 서비스는 어떻게 이용하나요?', '정기적으로 제품을 받을 수 있는 구독 서비스 신청 및 해지 방법 안내.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(26, 'co', 3, '구수한 된장찌개, 초보도 쉽게 만드는 비법', '나도 요리사 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(27, 'co', 4, '정기 구독 서비스를 취소하고 싶습니다. 어떻게 해야 하나요?', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(28, 'co', 5, '환불 정책은 어떻게 되나요?', '제품이 손상되었거나 만족스럽지 않은 경우 환불 절차 및 조건에 대한 설명.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(29, 'co', 3, '촉촉하고 부드러운 찹스테이크 완벽 조리법', '나도 요리사 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(30, 'co', 4, '회원 계정에 로그인할 수 없습니다. 도와주세요.', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(31, 'co', 5, '주문 취소는 어떻게 하나요?', '주문을 취소하는 방법과 취소 가능 시간에 대한 정보.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(32, 'co', 3, '신선한 바질 페스토 파스타, 손쉽게 만드는 법', '나도 요리사 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(33, 'co', 4, '할인 코드를 적용하지 못했습니다. 나중에라도 적용할 수 있나요?', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(34, 'co', 5, '결제 방법은 어떤 것들이 있나요?', '신용카드, PayPal, 계좌이체 등 이용 가능한 결제 수단에 대한 안내.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(35, 'co', 3, '감바스 알 아히요: 집에서도 레스토랑처럼', '나도 요리사 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(36, 'co', 4, '제품이 손상되어 도착했습니다. 교환이나 환불이 가능한가요?', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(37, 'co', 5, '주문 후 배송 주소를 변경할 수 있나요?', '주문 완료 후 주소 변경이 가능한지 여부와 방법에 대한 안내.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(38, 'co', 3, '고소하고 달콤한 불고기, 이 방법이면 성공!', '나도 요리사 입니다.', 0, 3, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(39, 'co', 4, '잘못된 제품이 배송되었습니다. 어떻게 해결할 수 있을까요?', '1대1 문의 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(40, 'co', 5, '배송비는 얼마인가요?', '배송비 정책, 무료 배송 기준 등에 대한 설명.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(41, 'co', 3, '집에서 즐기는 간편한 크림 파스타 레시피', '나도 요리사 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:25:28', NULL),
	(42, 'co', 4, '주문이 아직 도착하지 않았습니다. 배송 상태를 확인해 주세요.', '1대1 문의 입니다.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:28:06', NULL),
	(43, 'co', 5, '배송 소요 시간은 얼마나 걸리나요?', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(44, 'cr', 1, '자부심 가득한 내 텃밭의 풍성한 결실', '농작물이야기 2 내용입니다.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:09:45', NULL),
	(45, 'cr', 1, '손수 기른 토마토로 만든 맛있는 요리 이야기', '농작물 이야기 3입니다.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:10:15', NULL),
	(46, 'cr', 3, '수확의 기쁨: 농사로 얻는 풍성한 결실', '귀농학교 1 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:02', NULL),
	(47, 'cr', 2, '작은 텃밭에서 시작하는 초보자 가이드', '텃밭가꾸기 1 내용입니다.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:41', NULL),
	(48, 'cr', 1, '올해의 최고 농작물: 우리 농장의 특별한 배추', '농작물 이야기 4 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:12:13', NULL),
	(49, 'cr', 1, '자연의 선물: 내 농장에서 자란 신선한 허브들', '농작물 이야기  5내용입니다.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:12:24', NULL),
	(50, 'cr', 1, '정성 가득한 내 농장 딸기의 달콤함을 소개합니다', '농작물 이야기 6 내용 입니다.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:12:43', NULL),
	(51, 'ev', 1, '현재 진행중인 이벤트', '!!이벤트 목록은 다음과 같습니다!!\r\n\r\n사과따기 체험 - 부산\r\n감귤 농장 일일 체험 -울산\r\n묘목 심기 캠페인 - 서울\r\n', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:15:13', NULL),
	(52, 'ev', 1, '예정된 이벤트', '예정된 이벤트는 다음과 같습니다.\r\n- 이벤트 1 2024.08.30\r\n- 이벤트 2 2024.09.10\r\n- 이벤트 3 2024.10.23\r\n- 이벤트 4 2024.11.30', 0, 11, 1, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:15:35', NULL),
	(53, 'co', 1, '신제품 출시 및 특별 할인 안내', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(54, 'co', 1, '서비스 점검 및 일시 중단 안내', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(55, 'co', 1, '회원 등급별 혜택 업데이트 소식', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(56, 'co', 1, '고객센터 운영 시간 변경 안내', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(57, 'co', 1, '제품 품절 및 재입고 일정 안내', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(58, 'co', 1, '정기 구독 서비스 개선 안내', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(59, 'co', 1, '배송비 정책 변경 공지', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(60, 'co', 1, '할인 이벤트 및 프로모션 소식', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(61, 'co', 1, '새로운 결제 수단 추가 안내', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 4, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(62, 'co', 1, '추석 연휴 기간 배송 일정 안내', '주문 후 배송까지의 평균 소요 시간과 지역별 차이에 대한 안내.', 0, 6, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-27 16:29:46', NULL),
	(63, 'cr', 3, '기후 변화에 대응하는 스마트 농사 기술', '귀농학교 1 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:02', NULL),
	(64, 'cr', 3, '친환경 비료 사용법: 건강한 작물 키우기', '귀농학교 1 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:02', NULL),
	(65, 'cr', 3, '농사 일지 작성의 중요성: 수확을 위한 계획 세우기', '귀농학교 1 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:02', NULL),
	(66, 'cr', 3, '농작물 병해충 관리: 예방과 대처법', '귀농학교 1 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-25 09:11:02', NULL),
	(67, 'cr', 3, '효율적인 관개 시스템 구축 방법', '귀농학교 1 내용입니다.', 0, 1, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-25 10:11:02', NULL),
	(68, 'cr', 3, '토양 관리의 중요성: 비옥한 땅 만들기', '귀농학교 1 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-28 10:11:02', NULL),
	(69, 'cr', 3, '유기농 농법의 비밀: 자연을 활용한 건강한 농사', '귀농학교 1 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-29 10:11:02', NULL),
	(70, 'cr', 3, '제철 작물 재배 가이드: 이번 달 농사 준비하기', '귀농학교 1 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-29 10:11:02', NULL),
	(71, 'cr', 3, '초보 농부를 위한 첫걸음: 농사의 기본', '귀농학교 1 내용입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:02', NULL),
	(72, 'cr', 2, '집에서 즐기는 작은 텃밭의 행복', '텃밭가꾸기 1 내용입니다.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:41', NULL),
	(73, 'cr', 2, '작은 공간, 큰 수확: 효율적인 텃밭 가꾸기', '텃밭가꾸기 1 내용입니다.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:41', NULL),
	(74, 'cr', 2, '초간단! 작은 텃밭에서 키우기 좋은 채소들', '텃밭가꾸기 1 내용입니다.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:41', NULL),
	(75, 'cr', 2, '텃밭 초보자를 위한 기본 도구와 활용법', '텃밭가꾸기 1 내용입니다.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:41', NULL),
	(76, 'cr', 2, '아파트에서도 가능한 작은 텃밭 가꾸기 팁', '텃밭가꾸기 1 내용입니다.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-26 10:11:41', NULL),
	(77, 'cr', 2, '텃밭 관리의 비법: 소규모 작물 재배 노하우', '텃밭가꾸기 1 내용입니다.', 0, 3, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-26 10:11:41', NULL),
	(78, 'cr', 2, '작은 텃밭에서 자연을 느끼는 방법', '텃밭가꾸기 1 내용입니다.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-28 10:11:41', NULL),
	(79, 'cr', 2, '한평의 기적: 작은 텃밭에서 최대 수확을', '텃밭가꾸기 1 내용입니다.', 0, 2, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-29 10:11:41', NULL),
	(80, 'cr', 2, '집에서 텃밭을 가꾸며 힐링하기', '텃밭가꾸기 1 내용입니다.', 0, 3, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:11:41', NULL),
	(81, 'cr', 1, '우리 농장의 수확: 품질 좋은 감자 이야기', '농작물 이야기 6 내용 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:12:43', NULL),
	(82, 'cr', 1, '농장의 자랑, 직접 기른 아보카도의 매력', '농작물 이야기 6 내용 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:12:43', NULL),
	(83, 'cr', 1, '텃밭에서 자란 파프리카, 이렇게 크고 맛있습니다', '농작물 이야기 6 내용 입니다.', 0, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:12:43', NULL),
	(84, 'cr', 1, '정성으로 기른 자두, 그 달콤한 맛을 공개합니다!', '농작물 이야기 6 내용 입니다.', 0, 9, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 10:12:43', NULL),
	(85, 'co', 3, '부드럽고 깊은 맛의 김치찜, 집에서도 쉽게 만들기', '김치찜은 오래된 김치와 돼지고기를 푹 끓여 만든 깊은 맛의 한식 요리입니다. 이번 포스팅에서는 김치찜을 간편하게 집에서 만드는 방법을 소개합니다.\r\n재료:\r\n오래된 김치 1/2통\r\n돼지고기 목살 300g\r\n양파 1개\r\n대파 1대\r\n마늘 3쪽\r\n생강 1조각\r\n고춧가루 1큰술\r\n간장 2큰술\r\n설탕 1큰술\r\n참기름 1큰술\r\n물 2컵\r\n조리법:\r\n돼지고기 준비: 돼지고기는 먹기 좋은 크기로 썰어주세요.\r\n양념 준비: 마늘과 생강은 다지고, 양파는 채 썰어주세요.\r\n팬에서 볶기: 팬에 참기름을 두르고, 돼지고기를 넣어 겉면이 노릇하게 볶습니다.\r\n김치와 양념 추가: 김치, 양파, 마늘, 생강을 넣고 고춧가루와 간장을 넣어 잘 섞어주세요.\r\n끓이기: 물을 부어 중불에서 30-40분 동안 끓입니다. 중간에 물이 부족하면 추가해주세요.\r\n마무리: 대파를 송송 썰어 넣고, 추가로 5분 정도 끓여주세요.', 1, 0, 0, 'qwerqwer1', '0:0:0:0:0:0:0:1', '2024-08-30 14:18:34', NULL);

-- 테이블 farmstory.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_no` int NOT NULL AUTO_INCREMENT,
  `cart_uid` varchar(50) NOT NULL,
  `cart_pNo` int NOT NULL,
  `cart_qty` int NOT NULL,
  `cart_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_no`),
  KEY `FK_Cart_cart_uid_Users_uid` (`cart_uid`),
  KEY `FK_Cart_cart_pNo_Products_p_no` (`cart_pNo`),
  CONSTRAINT `FK_Cart_cart_pNo_Products_p_no` FOREIGN KEY (`cart_pNo`) REFERENCES `products` (`p_no`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Cart_cart_uid_Users_uid` FOREIGN KEY (`cart_uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='장바구니';

-- 테이블 데이터 farmstory.cart:~0 rows (대략적) 내보내기

-- 테이블 farmstory.cartitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `pNo` int NOT NULL,
  `cart_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKreevoecws516t06sw2pgtx5ix` (`pNo`),
  KEY `FKem41lxdxo50fob8u2fydemwxa` (`cart_id`),
  CONSTRAINT `FKem41lxdxo50fob8u2fydemwxa` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_no`),
  CONSTRAINT `FKreevoecws516t06sw2pgtx5ix` FOREIGN KEY (`pNo`) REFERENCES `products` (`p_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 farmstory.cartitem:~0 rows (대략적) 내보내기

-- 테이블 farmstory.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `c_no` int NOT NULL AUTO_INCREMENT,
  `c_parent` int NOT NULL,
  `c_content` text NOT NULL,
  `c_writer` varchar(50) NOT NULL,
  `c_regip` varchar(255) NOT NULL,
  `c_rdate` datetime DEFAULT NULL,
  `content` text NOT NULL,
  `com` int DEFAULT NULL,
  PRIMARY KEY (`c_no`),
  KEY `FK_Comment_c_parent_Article_a_no` (`c_parent`),
  KEY `FKnex2dc1vge3uxtbb8k5b1bjxi` (`c_writer`),
  KEY `FKrmnedssyn077efhvx0biow33x` (`com`),
  CONSTRAINT `FK_Comment_c_parent_Article_a_no` FOREIGN KEY (`c_parent`) REFERENCES `article` (`a_no`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnex2dc1vge3uxtbb8k5b1bjxi` FOREIGN KEY (`c_writer`) REFERENCES `users` (`uid`),
  CONSTRAINT `FKrmnedssyn077efhvx0biow33x` FOREIGN KEY (`com`) REFERENCES `article` (`a_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='댓글';

-- 테이블 데이터 farmstory.comment:~0 rows (대략적) 내보내기

-- 테이블 farmstory.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `f_no` int NOT NULL AUTO_INCREMENT,
  `a_no` int NOT NULL,
  `f_oName` varchar(255) NOT NULL,
  `f_sName` varchar(255) NOT NULL,
  `f_download` int NOT NULL DEFAULT '0',
  `f_rdate` datetime DEFAULT NULL,
  `file` int DEFAULT NULL,
  PRIMARY KEY (`f_no`),
  KEY `FK_File_a_no_Article_a_no` (`a_no`),
  KEY `FKodqyy2t86k8j2c2of2emnav3c` (`file`),
  CONSTRAINT `FK_File_a_no_Article_a_no` FOREIGN KEY (`a_no`) REFERENCES `article` (`a_no`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKodqyy2t86k8j2c2of2emnav3c` FOREIGN KEY (`file`) REFERENCES `article` (`a_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='파일';

-- 테이블 데이터 farmstory.file:~0 rows (대략적) 내보내기

-- 테이블 farmstory.orderitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderitem` (
  `orderItemId` int NOT NULL AUTO_INCREMENT,
  `oNo` int NOT NULL,
  `qty` int NOT NULL,
  `productId` int DEFAULT NULL,
  `o_pNo` int DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK2trc1axtdk43ohmeitb4ix95a` (`productId`),
  KEY `FKopmfptgebjd75xkt00h51bgu5` (`o_pNo`),
  CONSTRAINT `FK2trc1axtdk43ohmeitb4ix95a` FOREIGN KEY (`productId`) REFERENCES `products` (`p_no`),
  CONSTRAINT `FKopmfptgebjd75xkt00h51bgu5` FOREIGN KEY (`o_pNo`) REFERENCES `orders` (`o_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 farmstory.orderitem:~0 rows (대략적) 내보내기

-- 테이블 farmstory.orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `orders` (
  `o_no` int NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `o_pNo` int NOT NULL COMMENT 'propk',
  `o_uid` varchar(50) NOT NULL COMMENT 'userpk',
  `o_rdate` datetime NOT NULL COMMENT '주문일',
  `o_recName` varchar(45) NOT NULL COMMENT '받는분',
  `o_recHp` char(13) NOT NULL COMMENT '연락처',
  `o_recZip` varchar(20) NOT NULL COMMENT '우편번호',
  `o_recAddr1` varchar(255) NOT NULL COMMENT '기본주소',
  `o_recAddr2` varchar(255) DEFAULT NULL COMMENT '상세주소',
  `o_payments` int NOT NULL COMMENT '결제방법',
  `o_etc` varchar(255) DEFAULT NULL COMMENT '기타',
  `o_qty` int NOT NULL COMMENT '수량',
  `o_delivery` int NOT NULL DEFAULT '0' COMMENT '배송비',
  `o_totalPrice` int NOT NULL COMMENT '합계',
  `o_status` varchar(255) DEFAULT NULL,
  `receiver` int DEFAULT NULL,
  PRIMARY KEY (`o_no`),
  UNIQUE KEY `UKflohpomim8l7qdq59bdtsoeyv` (`receiver`),
  KEY `FK_Orders_o_pNo_Products_p_no` (`o_pNo`),
  KEY `FK_Orders_o_uid_Users_uid` (`o_uid`),
  CONSTRAINT `FK_Orders_o_pNo_Products_p_no` FOREIGN KEY (`o_pNo`) REFERENCES `products` (`p_no`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Orders_o_uid_Users_uid` FOREIGN KEY (`o_uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKoob8mk3s1upokrmh6h3bk6mkn` FOREIGN KEY (`receiver`) REFERENCES `receiver` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='주문';

-- 테이블 데이터 farmstory.orders:~0 rows (대략적) 내보내기

-- 테이블 farmstory.products 구조 내보내기
CREATE TABLE IF NOT EXISTS `products` (
  `p_no` int NOT NULL AUTO_INCREMENT COMMENT '상품번호',
  `p_name` varchar(45) NOT NULL COMMENT '상품명',
  `p_cateType` varchar(255) NOT NULL,
  `p_price` int NOT NULL COMMENT '가격',
  `p_point` int NOT NULL COMMENT '포인트',
  `p_sale` int NOT NULL DEFAULT '0' COMMENT '할인',
  `p_delivery` int NOT NULL DEFAULT '0' COMMENT '배송비',
  `p_stock` int NOT NULL COMMENT '재고',
  `p_img1` varchar(255) NOT NULL DEFAULT '0' COMMENT '상품목록이미지',
  `p_img2` varchar(255) NOT NULL DEFAULT '0' COMMENT '기본정보이미지',
  `p_img3` varchar(255) NOT NULL DEFAULT '0' COMMENT '상품설명이미지',
  `p_etc` varchar(255) DEFAULT NULL COMMENT '기타',
  `p_redate` datetime NOT NULL COMMENT '둥록일',
  `p_rdate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`p_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='상품';

-- 테이블 데이터 farmstory.products:~0 rows (대략적) 내보내기

-- 테이블 farmstory.receiver 구조 내보내기
CREATE TABLE IF NOT EXISTS `receiver` (
  `no` int NOT NULL AUTO_INCREMENT,
  `recAddr1` varchar(255) DEFAULT NULL,
  `recAddr2` varchar(255) DEFAULT NULL,
  `recHp` varchar(255) DEFAULT NULL,
  `recName` varchar(255) DEFAULT NULL,
  `recNick` varchar(255) DEFAULT NULL,
  `recZip` varchar(255) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FKnjj78bwfg5vjl74fb17ynw5a3` (`user`),
  CONSTRAINT `FKnjj78bwfg5vjl74fb17ynw5a3` FOREIGN KEY (`user`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 farmstory.receiver:~0 rows (대략적) 내보내기

-- 테이블 farmstory.terms 구조 내보내기
CREATE TABLE IF NOT EXISTS `terms` (
  `term_id` int NOT NULL AUTO_INCREMENT,
  `term_content1` text NOT NULL,
  `term_content2` text NOT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='약관';

-- 테이블 데이터 farmstory.terms:~0 rows (대략적) 내보내기

-- 테이블 farmstory.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `uid` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(10) NOT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `hp` char(13) NOT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `addr1` varchar(255) DEFAULT NULL,
  `addr2` varchar(255) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `point` int NOT NULL DEFAULT '0',
  `rdate` datetime(6) DEFAULT NULL,
  `regIp` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQ_Users_1` (`hp`,`nick`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='사용자';

-- 테이블 데이터 farmstory.users:~1 rows (대략적) 내보내기
INSERT INTO `users` (`uid`, `password`, `name`, `nick`, `email`, `hp`, `zip`, `addr1`, `addr2`, `regdate`, `grade`, `point`, `rdate`, `regIp`, `role`) VALUES
	('qwerqwer1', '1234', '1234', '1234', '1234', '1234', '1234', '1234', '1234', '2024-09-15 19:09:51', '4', 0, '2024-09-15 19:10:00.000000', NULL, 'USER');


-- hospital 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;

-- 테이블 hospital.charts 구조 내보내기
CREATE TABLE IF NOT EXISTS `charts` (
  `chart_id` char(8) NOT NULL,
  `treat_no` int NOT NULL,
  `doc_id` char(7) NOT NULL,
  `pat_id` char(7) NOT NULL,
  `chart_contents` varchar(255) NOT NULL,
  PRIMARY KEY (`chart_id`,`treat_no`,`doc_id`,`pat_id`),
  KEY `fk_Charts_Treatments1_idx` (`treat_no`,`doc_id`,`pat_id`),
  CONSTRAINT `fk_Charts_Treatments1` FOREIGN KEY (`treat_no`, `doc_id`, `pat_id`) REFERENCES `treatments` (`treat_no`, `doc_id`, `pat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.charts:~0 rows (대략적) 내보내기

-- 테이블 hospital.departments 구조 내보내기
CREATE TABLE IF NOT EXISTS `departments` (
  `dep_no` char(3) NOT NULL,
  `dep_name` varchar(20) NOT NULL,
  `dep_manager` varchar(20) NOT NULL,
  `dep_tel` varchar(20) NOT NULL,
  PRIMARY KEY (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.departments:~0 rows (대략적) 내보내기

-- 테이블 hospital.doctors 구조 내보내기
CREATE TABLE IF NOT EXISTS `doctors` (
  `doc_id` char(7) NOT NULL,
  `doc_name` varchar(45) NOT NULL,
  `doc_birth` char(10) NOT NULL,
  `doc_gen` char(1) NOT NULL,
  `dep_no` char(3) NOT NULL,
  `doc_pos` varchar(45) NOT NULL,
  `doc_phone` varchar(20) NOT NULL,
  `doc_email` varchar(45) NOT NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_email_UNIQUE` (`doc_email`),
  UNIQUE KEY `doc_phone_UNIQUE` (`doc_phone`),
  KEY `fk_Doctor_Departments_idx` (`dep_no`),
  CONSTRAINT `fk_Doctor_Departments` FOREIGN KEY (`dep_no`) REFERENCES `departments` (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.doctors:~0 rows (대략적) 내보내기

-- 테이블 hospital.nurses 구조 내보내기
CREATE TABLE IF NOT EXISTS `nurses` (
  `nur_id` char(7) NOT NULL,
  `nur_name` varchar(45) NOT NULL,
  `nur_birth` char(10) NOT NULL,
  `nur_gender` char(1) NOT NULL,
  `dep_no` char(3) NOT NULL,
  `nur_pos` varchar(45) NOT NULL,
  `nur_phone` char(13) NOT NULL,
  `nur_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nur_id`),
  UNIQUE KEY `nur_phone_UNIQUE` (`nur_phone`),
  UNIQUE KEY `nur_email_UNIQUE` (`nur_email`),
  KEY `fk_Nurses_Departments1_idx` (`dep_no`),
  CONSTRAINT `fk_Nurses_Departments1` FOREIGN KEY (`dep_no`) REFERENCES `departments` (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.nurses:~0 rows (대략적) 내보내기

-- 테이블 hospital.partients 구조 내보내기
CREATE TABLE IF NOT EXISTS `partients` (
  `pat_id` char(7) NOT NULL,
  `doc_id` char(7) NOT NULL,
  `nur_id` char(7) NOT NULL,
  `pat_name` varchar(45) NOT NULL,
  `pat_jumin` char(14) NOT NULL,
  `pat_gen` char(1) NOT NULL,
  `pat_addr` varchar(100) NOT NULL,
  `pat_phone` varchar(45) NOT NULL,
  `pat_email` varchar(45) DEFAULT NULL,
  `pat_job` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pat_id`),
  UNIQUE KEY `pat_jumin_UNIQUE` (`pat_jumin`),
  UNIQUE KEY `pat_email_UNIQUE` (`pat_email`),
  KEY `fk_Partients_Doctors1_idx` (`doc_id`),
  KEY `fk_Partients_Nurses1_idx` (`nur_id`),
  CONSTRAINT `fk_Partients_Doctors1` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`),
  CONSTRAINT `fk_Partients_Nurses1` FOREIGN KEY (`nur_id`) REFERENCES `nurses` (`nur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.partients:~0 rows (대략적) 내보내기

-- 테이블 hospital.treatments 구조 내보내기
CREATE TABLE IF NOT EXISTS `treatments` (
  `treat_no` int NOT NULL,
  `doc_id` char(7) NOT NULL,
  `pat_id` char(7) NOT NULL,
  `treat_contents` varchar(255) NOT NULL,
  `treat_datetime` datetime NOT NULL,
  PRIMARY KEY (`treat_no`,`doc_id`,`pat_id`),
  KEY `fk_Treatment_Doctors1_idx` (`doc_id`),
  KEY `fk_Treatment_Partients1_idx` (`pat_id`),
  CONSTRAINT `fk_Treatment_Doctors1` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`),
  CONSTRAINT `fk_Treatment_Partients1` FOREIGN KEY (`pat_id`) REFERENCES `partients` (`pat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.treatments:~0 rows (대략적) 내보내기


-- jboard 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jboard` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jboard`;

-- 테이블 jboard.article 구조 내보내기
CREATE TABLE IF NOT EXISTS `article` (
  `ano` int NOT NULL AUTO_INCREMENT,
  `cate` varchar(45) NOT NULL DEFAULT 'free',
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `comment` int NOT NULL DEFAULT '0',
  `file` int NOT NULL,
  `hit` int NOT NULL DEFAULT '0',
  `writer` varchar(45) NOT NULL,
  `rdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `regip` varchar(45) NOT NULL,
  PRIMARY KEY (`ano`),
  KEY `fk_article_user_idx` (`writer`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`writer`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jboard.article:~31 rows (대략적) 내보내기
INSERT INTO `article` (`ano`, `cate`, `title`, `content`, `comment`, `file`, `hit`, `writer`, `rdate`, `regip`) VALUES
	(1, 'free', '첫 번째 게시글', '이것은 첫 번째 게시글입니다.', 2, 0, 50, 'user01', '2023-09-01 10:20:30', '192.168.0.1'),
	(2, 'tech', '기술 토론', '여기서는 기술적인 내용을 다룹니다.', 0, 0, 25, 'user02', '2023-09-02 11:00:00', '192.168.0.2'),
	(3, 'news', '오늘의 뉴스', '오늘 일어난 사건에 대한 뉴스입니다.', 3, 1, 100, 'user03', '2023-09-03 09:30:00', '192.168.0.3'),
	(4, 'free', '자유 게시판', '자유롭게 대화를 나누는 게시판입니다.', 1, 0, 75, 'user04', '2023-09-04 08:15:45', '192.168.0.4'),
	(5, 'game', '최신 게임 소식', '최신 게임 소식과 리뷰를 전합니다.', 5, 2, 152, 'user05', '2023-09-05 07:45:30', '192.168.0.5'),
	(6, 'free', '안녕하세요', '이 게시판에서 인사를 나눕니다.', 0, 0, 10, 'user06', '2023-09-06 10:50:20', '192.168.0.6'),
	(7, 'news', '긴급 뉴스', '긴급 뉴스가 전해졌습니다.', 7, 0, 300, 'user07', '2023-09-07 09:25:10', '192.168.0.7'),
	(8, 'tech', '신기술 소개', '최근 도입된 신기술에 대한 설명입니다.', 4, 0, 90, 'user08', '2023-09-08 08:50:00', '192.168.0.8'),
	(9, 'free', '문의 사항 있습니다', '문의 사항이 있으시면 이곳에 남겨주세요.', 2, 0, 45, 'user09', '2023-09-09 07:35:40', '192.168.0.9'),
	(10, 'game', '게임 리뷰', '새로운 게임 리뷰를 작성했습니다.', 0, 1, 110, 'user10', '2023-09-10 06:45:15', '192.168.0.10'),
	(11, 'free', '오늘의 할 일', '오늘 할 일을 정리하는 게시글입니다.', 0, 0, 5, 'user01', '2023-09-11 11:20:30', '192.168.0.1'),
	(12, 'news', '주요 뉴스', '오늘 가장 중요한 뉴스입니다.', 3, 1, 80, 'user02', '2023-09-12 14:10:00', '192.168.0.2'),
	(13, 'tech', '새로운 프로그래밍 언어', '새로운 언어에 대한 설명과 예시입니다.', 1, 0, 70, 'user03', '2023-09-13 16:25:45', '192.168.0.3'),
	(14, 'free', '취미생활', '취미생활을 공유하는 게시글입니다.', 2, 1, 35, 'user04', '2023-09-14 12:50:30', '192.168.0.4'),
	(15, 'game', '게임 대회 일정', '다가오는 게임 대회에 대한 정보입니다.', 4, 1, 120, 'user05', '2023-09-15 09:30:15', '192.168.0.5'),
	(16, 'news', '연예계 뉴스', '오늘의 연예 뉴스입니다.', 0, 0, 60, 'user06', '2023-09-16 14:45:00', '192.168.0.6'),
	(17, 'free', '자유 토론', '자유롭게 의견을 나누는 토론 게시글입니다.', 1, 0, 20, 'user07', '2023-09-17 15:35:10', '192.168.0.7'),
	(18, 'tech', '최신 하드웨어 소식', '최신 하드웨어 출시 소식입니다.', 3, 0, 130, 'user08', '2023-09-18 18:00:20', '192.168.0.8'),
	(19, 'game', '게임 팁 공유', '게임 플레이 팁을 공유합니다.', 1, 1, 175, 'user09', '2023-09-19 20:10:40', '192.168.0.9'),
	(20, 'free', '영화 리뷰', '최근 본 영화 리뷰를 작성했습니다.', 1, 0, 40, 'user10', '2023-09-20 11:00:15', '192.168.0.10'),
	(21, 'news', '정치 뉴스', '오늘 정치 뉴스입니다.', 1, 1, 220, 'user01', '2023-09-21 13:25:50', '192.168.0.1'),
	(22, 'tech', 'AI 기술 동향', 'AI 관련 최신 동향을 소개합니다.', 2, 0, 85, 'user02', '2023-09-22 16:15:00', '192.168.0.2'),
	(23, 'free', '이야기 나눔', '편하게 이야기를 나눌 수 있는 게시판입니다.', 1, 0, 15, 'user03', '2023-09-23 09:45:30', '192.168.0.3'),
	(24, 'game', '게임 이벤트', '다가오는 게임 이벤트에 대한 정보입니다.', 2, 1, 95, 'user04', '2023-09-24 14:30:00', '192.168.0.4'),
	(25, 'news', '경제 뉴스', '오늘의 경제 뉴스입니다.', 0, 0, 150, 'user05', '2023-09-25 12:00:40', '192.168.0.5'),
	(26, 'free', '질문 있습니다', '여기에 질문을 남겨주시면 답변 드립니다.', 2, 0, 56, 'user06', '2023-09-26 10:15:50', '192.168.0.6'),
	(27, 'tech', '소프트웨어 개발 트렌드', '최신 소프트웨어 개발 트렌드를 다룹니다.', 1, 0, 115, 'user07', '2023-09-27 18:45:00', '192.168.0.7'),
	(28, 'free', '음악 추천', '좋은 음악을 추천합니다.', 1, 0, 25, 'user08', '2023-09-28 17:30:15', '192.168.0.8'),
	(29, 'game', 'e스포츠 소식', 'e스포츠 대회 소식을 전합니다.', 1, 1, 160, 'user09', '2023-09-29 11:50:30', '192.168.0.9'),
	(30, 'news', '사회 이슈', '오늘의 사회 이슈를 전합니다.', 1, 0, 204, 'user10', '2023-09-30 19:25:40', '192.168.0.10'),
	(43, 'free', '테스트 글입니다', '파일을 첨부합니다', 0, 2, 8, 'user01', '2024-09-23 17:18:52', '0:0:0:0:0:0:0:1');

-- 테이블 jboard.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `cno` int NOT NULL AUTO_INCREMENT,
  `ano` int NOT NULL,
  `content` text NOT NULL,
  `writer` varchar(45) NOT NULL,
  `regip` varchar(45) NOT NULL,
  `rdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cno`),
  KEY `fk_comment_article1_idx` (`ano`),
  KEY `fk_comment_user1_idx` (`writer`),
  CONSTRAINT `fk_comment_article1` FOREIGN KEY (`ano`) REFERENCES `article` (`ano`),
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`writer`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jboard.comment:~52 rows (대략적) 내보내기
INSERT INTO `comment` (`cno`, `ano`, `content`, `writer`, `regip`, `rdate`) VALUES
	(1, 1, '정말 유익한 글입니다!', 'user02', '192.168.0.2', '2023-09-01 10:35:00'),
	(2, 1, '좋은 정보 감사합니다.', 'user03', '192.168.0.3', '2023-09-01 12:20:00'),
	(3, 3, '오늘 뉴스 감사합니다.', 'user04', '192.168.0.4', '2023-09-03 10:15:00'),
	(4, 3, '흥미로운 기사네요.', 'user05', '192.168.0.5', '2023-09-03 12:30:00'),
	(5, 3, '더 많은 정보 부탁드립니다.', 'user06', '192.168.0.6', '2023-09-03 13:45:00'),
	(6, 4, '자유게시판 좋네요!', 'user07', '192.168.0.7', '2023-09-04 14:00:00'),
	(7, 5, '게임 소식 감사합니다!', 'user08', '192.168.0.8', '2023-09-05 15:10:00'),
	(8, 5, '이 게임 기대되네요.', 'user09', '192.168.0.9', '2023-09-05 16:45:00'),
	(9, 5, '게임 대회 관련 정보도 있나요?', 'user10', '192.168.0.10', '2023-09-05 17:30:00'),
	(10, 5, '리뷰 감사합니다!', 'user01', '192.168.0.1', '2023-09-05 18:00:00'),
	(11, 5, '좋은 정보 공유해주셔서 감사해요!', 'user02', '192.168.0.2', '2023-09-05 19:20:00'),
	(12, 7, '긴급 뉴스 감사합니다!', 'user03', '192.168.0.3', '2023-09-07 09:30:00'),
	(13, 7, '정말 충격적인 소식이네요.', 'user04', '192.168.0.4', '2023-09-07 10:15:00'),
	(14, 7, '빠른 소식 감사합니다.', 'user05', '192.168.0.5', '2023-09-07 11:20:00'),
	(15, 7, '추가 정보도 있으면 좋겠어요.', 'user06', '192.168.0.6', '2023-09-07 12:35:00'),
	(16, 7, '이 사건에 대해 더 알고 싶네요.', 'user07', '192.168.0.7', '2023-09-07 13:50:00'),
	(17, 7, '다른 소식도 기대되네요.', 'user08', '192.168.0.8', '2023-09-07 15:00:00'),
	(18, 7, '긴급 소식 감사합니다!', 'user09', '192.168.0.9', '2023-09-07 16:15:00'),
	(19, 8, '신기술 소개 감사합니다!', 'user10', '192.168.0.10', '2023-09-08 10:30:00'),
	(20, 8, '유익한 정보네요.', 'user01', '192.168.0.1', '2023-09-08 11:20:00'),
	(21, 8, '더 많은 기술 관련 정보를 부탁드려요.', 'user02', '192.168.0.2', '2023-09-08 13:15:00'),
	(22, 8, '흥미로운 내용 감사합니다.', 'user03', '192.168.0.3', '2023-09-08 14:50:00'),
	(23, 9, '문의사항 남깁니다.', 'user04', '192.168.0.4', '2023-09-09 15:00:00'),
	(24, 9, '추가 문의사항이 있습니다.', 'user05', '192.168.0.5', '2023-09-09 16:10:00'),
	(25, 12, '뉴스 감사합니다.', 'user06', '192.168.0.6', '2023-09-12 12:10:30'),
	(26, 12, '중요한 소식이네요.', 'user07', '192.168.0.7', '2023-09-12 13:20:00'),
	(27, 12, '유익한 정보 감사합니다.', 'user08', '192.168.0.8', '2023-09-12 14:25:10'),
	(28, 13, '새로운 언어에 대한 설명이 흥미롭네요!', 'user04', '192.168.0.4', '2023-09-13 17:00:00'),
	(29, 14, '취미생활 공유 너무 좋아요!', 'user05', '192.168.0.5', '2023-09-14 13:15:00'),
	(30, 14, '저도 비슷한 취미를 가지고 있습니다.', 'user06', '192.168.0.6', '2023-09-14 14:20:00'),
	(31, 15, '게임 대회 일정 정말 도움이 됩니다.', 'user07', '192.168.0.7', '2023-09-15 10:00:00'),
	(32, 15, '참가 신청은 어디서 하나요?', 'user08', '192.168.0.8', '2023-09-15 11:30:00'),
	(33, 15, '좋은 정보 감사합니다.', 'user09', '192.168.0.9', '2023-09-15 12:45:00'),
	(34, 15, '대회 준비에 좋은 참고가 되었습니다.', 'user10', '192.168.0.10', '2023-09-15 13:55:00'),
	(35, 17, '자유롭게 의견을 나누는 것 좋네요.', 'user01', '192.168.0.1', '2023-09-17 16:00:00'),
	(36, 18, '하드웨어 소식 감사합니다!', 'user02', '192.168.0.2', '2023-09-18 18:30:00'),
	(37, 18, '정말 유익한 정보네요.', 'user03', '192.168.0.3', '2023-09-18 19:00:00'),
	(38, 18, '좋은 내용 잘 봤습니다.', 'user04', '192.168.0.4', '2023-09-18 20:10:00'),
	(39, 19, '게임 팁 덕분에 많이 배웠습니다!', 'user05', '192.168.0.5', '2023-09-19 20:45:00'),
	(40, 20, '영화 리뷰 흥미롭게 봤습니다.', 'user06', '192.168.0.6', '2023-09-20 12:00:00'),
	(41, 21, '정치 뉴스 감사합니다.', 'user07', '192.168.0.7', '2023-09-21 14:00:00'),
	(42, 22, 'AI 기술 동향 흥미롭네요!', 'user08', '192.168.0.8', '2023-09-22 17:00:00'),
	(43, 22, '더 많은 AI 소식 부탁드립니다.', 'user09', '192.168.0.9', '2023-09-22 18:20:00'),
	(44, 23, '편하게 대화를 나눌 수 있어 좋네요!', 'user10', '192.168.0.10', '2023-09-23 10:00:00'),
	(45, 24, '게임 이벤트 소식 감사합니다!', 'user01', '192.168.0.1', '2023-09-24 15:30:00'),
	(46, 24, '이번 이벤트 기대되네요.', 'user02', '192.168.0.2', '2023-09-24 16:00:00'),
	(47, 26, '질문 남깁니다.', 'user03', '192.168.0.3', '2023-09-26 11:00:00'),
	(48, 26, '답변 부탁드립니다.', 'user04', '192.168.0.4', '2023-09-26 12:15:00'),
	(49, 27, '소프트웨어 개발 트렌드 유익하네요.', 'user05', '192.168.0.5', '2023-09-27 19:00:00'),
	(50, 28, '음악 추천 감사합니다!', 'user06', '192.168.0.6', '2023-09-28 18:00:00'),
	(51, 29, 'e스포츠 소식 기대됩니다.', 'user07', '192.168.0.7', '2023-09-29 12:15:00'),
	(52, 30, '사회 이슈에 대한 좋은 글입니다.', 'user08', '192.168.0.8', '2023-09-30 19:50:00');

-- 테이블 jboard.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `fno` int NOT NULL AUTO_INCREMENT,
  `ano` int NOT NULL,
  `oName` varchar(45) NOT NULL,
  `sName` varchar(45) NOT NULL,
  `download` int NOT NULL DEFAULT '0',
  `rdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fno`),
  KEY `fk_file_article1_idx` (`ano`),
  CONSTRAINT `fk_file_article1` FOREIGN KEY (`ano`) REFERENCES `article` (`ano`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jboard.file:~15 rows (대략적) 내보내기
INSERT INTO `file` (`fno`, `ano`, `oName`, `sName`, `download`, `rdate`) VALUES
	(1, 3, 'news_report.pdf', 'news_report_20230903.pdf', 10, '2023-09-03 09:45:00'),
	(2, 5, 'game_review.docx', 'game_review_20230905.docx', 25, '2023-09-05 08:00:00'),
	(3, 5, 'game_screenshots.zip', 'game_screenshots_20230905.zip', 15, '2023-09-05 08:05:00'),
	(4, 10, 'game_review_final.pdf', 'game_review_final_20230910.pdf', 30, '2023-09-10 07:00:00'),
	(5, 12, 'news_highlights.pdf', 'news_highlights_20230912.pdf', 20, '2023-09-12 14:20:00'),
	(6, 14, 'hobby_photos.zip', 'hobby_photos_20230914.zip', 5, '2023-09-14 13:00:00'),
	(7, 15, 'game_tournament_schedule.pdf', 'game_tournament_schedule_20230915.pdf', 40, '2023-09-15 09:45:00'),
	(8, 19, 'game_tips.pdf', 'game_tips_20230919.pdf', 35, '2023-09-19 20:20:00'),
	(9, 21, 'political_report.pdf', 'political_report_20230921.pdf', 50, '2023-09-21 13:40:00'),
	(10, 24, 'game_event_details.pdf', 'game_event_details_20230924.pdf', 22, '2023-09-24 14:45:00'),
	(11, 28, 'music_recommendations.pdf', 'music_recommendations_20230928.pdf', 18, '2023-09-28 17:40:00'),
	(12, 28, 'album_covers.zip', 'album_covers_20230928.zip', 10, '2023-09-28 17:45:00'),
	(13, 29, 'esports_news.pdf', 'esports_news_20230929.pdf', 55, '2023-09-29 12:00:00'),
	(14, 43, 'save.txt', '1f5e355a-5ca1-43f8-a0ae-17cfe88afb93.txt', 0, '2024-09-23 17:20:40'),
	(15, 43, 'Penrose.txt', '1f5e355a-5ca1-43f8-a0ae-17cfe88afb94.txt', 0, '2024-09-23 17:21:14');

-- 테이블 jboard.terms 구조 내보내기
CREATE TABLE IF NOT EXISTS `terms` (
  `terms` text NOT NULL,
  `privacy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jboard.terms:~1 rows (대략적) 내보내기
INSERT INTO `terms` (`terms`, `privacy`) VALUES
	('여러분을 환영합니다.\r\n네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.\r\n\r\n네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.\r\n\r\n다양한 네이버 서비스를 즐겨보세요.\r\n네이버는 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.\r\n여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 네이버 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.\r\n\r\n네이버는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, \'청소년보호법\' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.\r\n\r\n네이버 서비스에는 기본적으로 본 약관이 적용됩니다만 네이버가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.\r\n\r\n회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다.\r\n여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요.\r\n\r\n네이버는 단체에 속한 여러 구성원들이 공동의 계정으로 네이버 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.\r\n따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.\r\n\r\n단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.\r\n\r\n여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.\r\n네이버는 여러분이 게재한 게시물이 네이버 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 네이버 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 말합니다.\r\n\r\n네이버는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다.\r\n\r\n한편, 네이버 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다.\r\n게시물 게재로 여러분은 네이버에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다.\r\n\r\n네이버는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 네이버 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.\r\n만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.\r\n\r\n또한 여러분이 제공한 소중한 콘텐츠는 네이버 서비스를 개선하고 새로운 네이버 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 네이버 및 네이버 계열사에서 사용될 수 있습니다. 네이버는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.\r\n\r\n네이버는 여러분이 자신이 제공한 콘텐츠에 대한 네이버 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 네이버 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.\r\n다만, 일부 네이버 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다.\r\n\r\n여러분의 개인정보를 소중히 보호합니다.\r\n네이버는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 네이버가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.\r\n\r\n네이버는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.\r\n\r\n타인의 권리를 존중해 주세요.\r\n여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. 네이버는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요.\r\n\r\n한편, 네이버 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다. 여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다.\r\n\r\n네이버는 여러분이 네이버 서비스를 마음껏 이용할 수 있도록 여러분께 네이버 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다. 이 경우 여러분의 자유로운 이용은 네이버가 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요.\r\n\r\n네이버에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.\r\n네이버는 여러분이 네이버 서비스를 효율적으로 이용할 수 있도록 포인트를 부여하고 있습니다. 포인트는 여러분의 일정한 네이버 서비스 이용과 연동하여 네이버가 임의로 책정하거나 조정하여 지급하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다. 포인트는 재산적 가치가 없기 때문에 금전으로 환불 또는 전환할 수 없지만, 포인트의 많고 적음에 따라 여러분의 네이버 서비스 이용에 영향을 주는 경우가 있으므로 경우에 따라 적절히 활용해 보세요.\r\n\r\n네이버는 네이버 서비스의 효율적 이용을 지원하거나 서비스 운영을 개선하기 위해 필요한 경우 사전에 여러분께 안내 드린 후 부득이 포인트의 일부 또는 전부를 조정할 수 있습니다. 그리고 포인트는 네이버가 정한 기간에 따라 주기적으로 소멸할 수도 있으니 포인트가 부여되는 네이버 서비스 이용 시 유의해 주시기 바랍니다.\r\n\r\n네이버 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.\r\n네이버는 여러분이 네이버 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 네이버 서비스를 보다 안전하게 이용하고 네이버 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 네이버 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.\r\n\r\n회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.\r\n타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.\r\n관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.\r\n자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.\r\n자동화된 수단을 활용하는 등 네이버 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 네이버 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 네이버 서비스 이용에 불편을 초래하고 더 나아가 네이버의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.\r\n네이버의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 네이버 서비스 회원으로 가입을 시도 또는 가입하거나, 네이버 서비스에 로그인을 시도 또는 로그인하거나, 네이버 서비스 상에 게시물을 게재하거나, 네이버 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), 네이버 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, 네이버 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 네이버 서비스의 제공 취지에 부합하지 않는 방식으로 네이버 서비스를 이용하거나 이와 같은 네이버 서비스에 대한 어뷰징(남용) 행위를 막기 위한 네이버의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.\r\n네이버의 동의 없이 자동화된 수단에 의해 네이버 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, 네이버 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. 네이버 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 네이버 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.\r\n네이버는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.\r\n\r\n부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.\r\n네이버는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 네이버가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.\r\n\r\n또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 네이버는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 네이버 서비스 이용에 대한 주의를 당부하거나, 네이버 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 네이버 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다.\r\n\r\n부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다.\r\n\r\n네이버의 잘못은 네이버가 책임집니다.\r\n네이버는 여러분이 네이버 서비스를 이용함에 있어 네이버의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 네이버가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 네이버는 책임을 부담하지 않습니다.\r\n\r\n그리고 네이버가 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다.\r\n\r\n한편, 네이버 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 네이버는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다.\r\n\r\n언제든지 네이버 서비스 이용계약을 해지하실 수 있습니다.\r\n네이버에게는 참 안타까운 일입니다만, 회원은 언제든지 네이버 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 네이버는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다.\r\n\r\n네이버 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 네이버가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.\r\n\r\n일부 네이버 서비스에는 광고가 포함되어 있습니다.\r\n여러분이 다양한 네이버 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다. 네이버 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다.\r\n\r\n원하는 네이버 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 네이버 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 네이버가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다.\r\n\r\n네이버는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다.\r\n\r\n서비스 중단 또는 변경 시 꼭 알려드리겠습니다.\r\n네이버는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다.\r\n\r\n한편, 네이버는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다.\r\n\r\n이 경우 네이버는 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다.\r\n\r\n주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.\r\n네이버는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다.\r\n\r\n네이버는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 네이버는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.\r\n\r\n여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.\r\n네이버는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다.\r\n\r\n네이버는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.\r\n\r\n네이버는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 네이버에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 네이버로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다.\r\n\r\n네이버 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다.\r\n\r\n본 약관은 한국어를 정본으로 합니다. 본 약관 또는 네이버 서비스와 관련된 여러분과 네이버와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 네이버 서비스와 관련하여 여러분과 네이버 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 \'민사소송법\'에서 정한 절차를 따릅니다.\r\n\r\n공지 일자: 2018년 3월 30일\r\n적용 일자: 2018년 5월 1일\r\n네이버 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 1588 – 3820/ 평일 09:00~18:00)로 문의 주시기 바랍니다.', '개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.\r\n\r\n1. 수집하는 개인정보\r\n이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.\r\n\r\n회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.\r\n- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만 14세 미만 아동의 경우, 법정대리인의 동의를 받고 있으며, 휴대전화번호 또는 아이핀 인증을 통해 법정대리인의 동의를 확인하고 있습니다. 이 과정에서 법정대리인의 정보(법정대리인의 이름, 중복가입확인정보(DI), 휴대전화번호(아이핀 인증인 경우 아이핀번호))를 추가로 수집합니다.\r\n- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.\r\n- 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.\r\n서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.\r\n- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.\r\n- 네이버 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.\r\n\r\n\r\n\r\n서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.\r\n구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하거나 이용자가 입력한 정보를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.\r\n서비스 이용 과정에서 위치정보가 수집될 수 있으며,\r\n네이버에서 제공하는 위치기반 서비스에 대해서는 \'네이버 위치기반서비스 이용약관\'에서 자세하게 규정하고 있습니다.\r\n이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.\r\n생성정보 수집에 대한 추가 설명\r\n- IP(Internet Protocol) 주소란?\r\nIP 주소는 인터넷 망 사업자가 인터넷에 접속하는 이용자의 PC 등 기기에 부여하는 온라인 주소정보 입니다. IP 주소가 개인정보에 해당하는지 여부에 대해서는 각국마다 매우 다양한 견해가 있습니다.\r\n- 서비스 이용기록이란?\r\n네이버 접속 일시, 이용한 서비스 목록 및 서비스 이용 과정에서 발생하는 정상 또는 비정상 로그 일체,메일 수발신 과정에서 기록되는 이메일주소, 친구 초대하기 또는 선물하기 등에서 입력하는 휴대전화번호, 스마트스토어 판매자와 구매자간 상담내역(네이버톡톡 및 상품 Q&A 게시글) 등을 의미합니다. 정보주체가 식별되는 일부 서비스 이용기록(행태정보 포함)과 관련한 처리 목적 등에 대해서는 본 개인정보 처리방침에서 규정하고 있는 수집하는 개인정보, 수집한 개인정보의 이용, 개인정보의 파기 등에서 설명하고 있습니다. 이는 서비스 제공을 위해 수반되는 것으로 이를 거부하시는 경우 서비스 이용에 제한이 있을 수 있으며, 관련하여서는 고객센터로 문의해주시길 바랍니다. 이 외에 정보주체를 식별하지 않고 행태정보를 처리하는 경우와 관련하여서는 \'네이버 맞춤형 광고 안내\'에서 확인하실 수 있습니다.\r\n- 기기정보란?\r\n본 개인정보처리방침에 기재된 기기정보는 생산 및 판매 과정에서 기기에 부여된 정보뿐 아니라, 기기의 구동을 위해 사용되는 S/W를 통해 확인 가능한 정보를 모두 일컫습니다. OS(Windows, MAC OS 등) 설치 과정에서 이용자가 PC에 부여하는 컴퓨터의 이름, PC에 장착된 주변기기의 일련번호, 스마트폰의 통신에 필요한 고유한 식별값(IMEI, IMSI), AAID 혹은 IDFA, 설정언어 및 설정 표준시, USIM의 통신사 코드 등을 의미합니다. 단, 네이버는 IMEI와 같은 기기의 고유한 식별값을 수집할 필요가 있는 경우, 이를 수집하기 전에 네이버도 원래의 값을 알아볼 수 없는 방식으로 암호화 하여 식별성(Identifiability)을 제거한 후에 수집합니다.\r\n- 쿠키(cookie)란?\r\n쿠키는 이용자가 웹사이트를 접속할 때에 해당 웹사이트에서 이용자의 웹브라우저를 통해 이용자의 PC에 저장하는 매우 작은 크기의 텍스트 파일입니다. 이후 이용자가 다시 웹사이트를 방문할 경우 웹사이트 서버는 이용자 PC에 저장된 쿠키의 내용을 읽어 이용자가 설정한 서비스 이용 환경을 유지하여 편리한 인터넷 서비스 이용을 가능케 합니다. 또한 방문한 서비스 정보, 서비스 접속 시간 및 빈도, 서비스 이용 과정에서 생성된 또는 제공(입력)한 정보 등을 분석하여 이용자의 취향과 관심에 특화된 서비스(광고 포함)를 제공할 수 있습니다. 이용자는 쿠키에 대한 선택권을 가지고 있으며, 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 네이버 일부 서비스의 이용에 불편이 있을 수 있습니다.\r\n\r\n<웹 브라우저에서 쿠키 허용/차단 방법>\r\n- 크롬(Chrome) : 웹 브라우저 설정 > 개인정보 보호 및 보안 > 인터넷 사용 기록 삭제\r\n- 엣지(Edge) : 웹 브라우저 설정 > 쿠키 및 사이트 권한 > 쿠키 및 사이트 데이터 관리 및 삭제\r\n\r\n<모바일 브라우저에서 쿠키 허용/차단>\r\n- 크롬(Chrome) : 모바일 브라우저 설정 > 개인정보 보호 및 보안 > 인터넷 사용 기록 삭제\r\n- 사파리(Safari) : 모바일 기기 설정 > 사파리(Safari) > 고급 > 모든 쿠키 차단\r\n- 삼성 인터넷 : 모바일 브라우저 설정 > 인터넷 사용 기록 > 인터넷 사용 기록 삭제\r\n쿠키에 관한 자세한 내용(네이버 프라이버시 센터) 알아보기\r\n\r\n2. 수집한 개인정보의 이용\r\n네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.\r\n\r\n- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.\r\n- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다. 신규 서비스 요소의 발굴 및 기존 서비스 개선 등에는 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 생성·제공·추천, 상품 쇼핑 등에서의 인공지능(AI) 기술 적용이 포함됩니다.\r\n- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.\r\n- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.\r\n- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.\r\n- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.\r\n- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.\r\n3. 개인정보의 보관기간\r\n회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.\r\n단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.\r\n이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.\r\n- 부정 가입 및 이용 방지\r\n부정 이용자의 DI (만 14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관\r\n탈퇴한 이용자의 휴대전화번호(휴대전화 인증 시, 복호화가 불가능한 일방향 암호화(해시)하여 보관), DI(아이핀 인증 시) : 탈퇴일로부터 6개월 보관\r\n- 네이버 서비스 제공을 위한 본인 확인\r\n통신사 정보, 휴대전화번호 : 수집 시점으로부터 1년 보관\r\n전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.\r\n- 전자상거래 등에서 소비자 보호에 관한 법률\r\n계약 또는 청약철회 등에 관한 기록: 5년 보관\r\n대금결제 및 재화 등의 공급에 관한 기록: 5년 보관\r\n소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관\r\n- 전자문서 및 전자거래 기본법\r\n공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관\r\n- 통신비밀보호법\r\n로그인 기록: 3개월\r\n\r\n4. 개인정보 수집 및 이용 동의를 거부할 권리\r\n이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.');

-- 테이블 jboard.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `uid` varchar(45) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `name` varchar(10) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `hp` char(13) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'USER',
  `zip` varchar(6) NOT NULL,
  `addr1` varchar(50) NOT NULL,
  `addr2` varchar(50) NOT NULL,
  `regip` varchar(45) NOT NULL,
  `rdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `leavedate` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `nick_UNIQUE` (`nick`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `hp_UNIQUE` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jboard.user:~10 rows (대략적) 내보내기
INSERT INTO `user` (`uid`, `pass`, `name`, `nick`, `email`, `hp`, `role`, `zip`, `addr1`, `addr2`, `regip`, `rdate`, `leavedate`) VALUES
	('user01', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '김철수', 'ironman', 'ironman01@example.com', '010-1234-5678', 'USER', '12345', '서울시 강남구 테헤란로', '101호', '192.168.0.1', '2023-09-01 10:20:30', NULL),
	('user02', 'password456', '이영희', 'wonderwoman', 'wonderwoman02@example.com', '010-2345-6789', 'USER', '54321', '부산시 해운대구 센텀시티로', '202호', '192.168.0.2', '2023-09-02 11:25:00', NULL),
	('user03', 'password789', '박민수', 'batman', 'batman03@example.com', '010-3456-7890', 'USER', '67890', '대구시 중구 동성로', '301호', '192.168.0.3', '2023-09-03 09:10:50', NULL),
	('user04', 'password012', '최수진', 'supergirl', 'supergirl04@example.com', '010-4567-8901', 'ADMIN', '09876', '인천시 남동구 구월로', '102호', '192.168.0.4', '2023-09-04 08:15:45', NULL),
	('user05', 'password345', '한지민', 'flash', 'flash05@example.com', '010-5678-9012', 'USER', '13579', '대전시 서구 둔산대로', '201호', '192.168.0.5', '2023-09-05 07:45:30', NULL),
	('user06', 'password678', '정우성', 'spiderman', 'spiderman06@example.com', '010-6789-0123', 'USER', '24680', '광주시 북구 금남로', '202호', '192.168.0.6', '2023-09-06 10:50:20', NULL),
	('user07', 'password901', '고아라', 'thor', 'thor07@example.com', '010-7890-1234', 'USER', '11223', '울산시 중구 성남로', '103호', '192.168.0.7', '2023-09-07 09:25:10', NULL),
	('user08', 'password234', '송혜교', 'aquaman', 'aquaman08@example.com', '010-8901-2345', 'USER', '33445', '경기도 성남시 분당구', '203호', '192.168.0.8', '2023-09-08 08:50:00', NULL),
	('user09', 'password567', '김혜수', 'hulk', 'hulk09@example.com', '010-9012-3456', 'USER', '55667', '경기도 용인시 처인구', '303호', '192.168.0.9', '2023-09-09 07:35:40', NULL),
	('user10', 'password890', '이동욱', 'captain', 'captain10@example.com', '010-0123-4567', 'USER', '77889', '강원도 춘천시 중앙로', '104호', '192.168.0.10', '2023-09-10 06:45:15', NULL);


-- shop 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop`;

-- 테이블 shop.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `custId` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `hp` char(13) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `rdate` date NOT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.customer:~10 rows (대략적) 내보내기
INSERT INTO `customer` (`custId`, `name`, `hp`, `addr`, `rdate`) VALUES
	('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01'),
	('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02'),
	('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03'),
	('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04'),
	('c105', '이성계', NULL, NULL, '2022-01-05'),
	('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06'),
	('c107', '허준', '', '경남 경주시', '2022-01-07'),
	('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08'),
	('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09'),
	('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

-- 테이블 shop.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderNo` int NOT NULL AUTO_INCREMENT,
  `orderId` varchar(10) NOT NULL,
  `orderProduct` int NOT NULL,
  `orderCount` int DEFAULT '1',
  `orderDate` datetime NOT NULL,
  PRIMARY KEY (`orderNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.order:~13 rows (대략적) 내보내기
INSERT INTO `order` (`orderNo`, `orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES
	(1, 'c102', 3, 2, '2022-07-01 13:15:10'),
	(2, 'c101', 4, 1, '2022-07-01 14:16:11'),
	(3, 'c108', 1, 1, '2022-07-01 17:23:18'),
	(4, 'c109', 6, 5, '2022-07-02 10:46:36'),
	(5, 'c102', 2, 1, '2022-07-03 09:15:37'),
	(6, 'c101', 7, 3, '2022-07-03 12:35:12'),
	(7, 'c110', 1, 2, '2022-07-03 16:55:36'),
	(8, 'c104', 2, 4, '2022-07-04 14:23:23'),
	(9, 'c102', 1, 3, '2022-07-04 21:54:34'),
	(10, 'c107', 6, 1, '2022-07-05 14:21:03'),
	(11, 'ssd', 3, 2, '2024-07-31 12:26:39'),
	(12, 'ssd', 4, 3, '2024-07-31 13:37:07'),
	(13, 'ssd', 2, 30, '2024-07-31 13:45:28');

-- 테이블 shop.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `prodNo` int NOT NULL,
  `prodName` varchar(10) NOT NULL,
  `stock` int DEFAULT '0',
  `price` int DEFAULT NULL,
  `company` varchar(20) NOT NULL,
  PRIMARY KEY (`prodNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.product:~7 rows (대략적) 내보내기
INSERT INTO `product` (`prodNo`, `prodName`, `stock`, `price`, `company`) VALUES
	(1, '새우깡', 5000, 1500, '농심'),
	(2, '초코파이', 2500, 2500, '오리온'),
	(3, '포카칩', 3600, 1700, '오리온'),
	(4, '양파링', 1250, 1800, '농심'),
	(5, '죠리퐁', 2200, NULL, '크라운'),
	(6, '마카렛트', 3500, 3500, '롯데'),
	(7, '뿌셔뿌셔', 1650, 1200, '오뚜기');


-- shoperd 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shoperd` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shoperd`;

-- 테이블 shoperd.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `custId` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `hp` char(13) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `rdate` date NOT NULL,
  PRIMARY KEY (`custId`),
  UNIQUE KEY `hp_UNIQUE` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shoperd.customer:~5 rows (대략적) 내보내기
INSERT INTO `customer` (`custId`, `name`, `hp`, `addr`, `rdate`) VALUES
	('C101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01'),
	('C102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02'),
	('C103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03'),
	('C104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04'),
	('C105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');

-- 테이블 shoperd.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderNo` int NOT NULL AUTO_INCREMENT,
  `orderId` varchar(10) NOT NULL,
  `orderProduct` int NOT NULL,
  `orderCount` int NOT NULL DEFAULT '1',
  `orderDate` datetime NOT NULL,
  PRIMARY KEY (`orderNo`),
  KEY `fk_Order_Customer_idx` (`orderId`),
  KEY `fk_Order_Product1_idx` (`orderProduct`),
  CONSTRAINT `fk_Order_Customer` FOREIGN KEY (`orderId`) REFERENCES `customer` (`custId`),
  CONSTRAINT `fk_Order_Product1` FOREIGN KEY (`orderProduct`) REFERENCES `product` (`prodNo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shoperd.order:~4 rows (대략적) 내보내기
INSERT INTO `order` (`orderNo`, `orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES
	(2, 'C102', 3, 2, '2023-01-01 13:15:10'),
	(3, 'C101', 4, 1, '2023-01-01 13:15:12'),
	(4, 'C102', 1, 1, '2023-01-01 13:15:14'),
	(5, 'C105', 2, 1, '2023-01-01 13:15:18');

-- 테이블 shoperd.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `prodNo` int NOT NULL,
  `prodName` varchar(10) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `price` int DEFAULT NULL,
  `company` varchar(20) NOT NULL,
  PRIMARY KEY (`prodNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shoperd.product:~5 rows (대략적) 내보내기
INSERT INTO `product` (`prodNo`, `prodName`, `stock`, `price`, `company`) VALUES
	(1, '새우깡', 5000, 1500, '농심'),
	(2, '초코파이', 2500, 2500, '오리온'),
	(3, '포카칩', 3600, 1700, '오리온'),
	(4, '양파링', 1250, 1800, '농심'),
	(5, '죠리퐁', 2200, NULL, '크라운');


-- shopping 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shopping` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shopping`;

-- 테이블 shopping.carts 구조 내보내기
CREATE TABLE IF NOT EXISTS `carts` (
  `cartNo` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `prodNo` int NOT NULL,
  `cartProdCount` int DEFAULT '1',
  `cartProdDate` datetime NOT NULL,
  PRIMARY KEY (`cartNo`,`userId`,`prodNo`),
  KEY `fk_Carts_Users1_idx` (`userId`),
  KEY `fk_Carts_Products1_idx` (`prodNo`),
  CONSTRAINT `fk_Carts_Products1` FOREIGN KEY (`prodNo`) REFERENCES `products` (`prodNo`),
  CONSTRAINT `fk_Carts_Users1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.carts:~0 rows (대략적) 내보내기

-- 테이블 shopping.categories 구조 내보내기
CREATE TABLE IF NOT EXISTS `categories` (
  `cateNo` int NOT NULL,
  `cateName` varchar(45) NOT NULL,
  PRIMARY KEY (`cateNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.categories:~0 rows (대략적) 내보내기

-- 테이블 shopping.orderitems 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderitems` (
  `itemNo` int NOT NULL AUTO_INCREMENT,
  `orderNo` char(11) NOT NULL,
  `prodNo` int NOT NULL,
  `itemPrice` int NOT NULL,
  `itemDiscount` tinyint NOT NULL,
  `itemCount` int DEFAULT '1',
  PRIMARY KEY (`itemNo`,`orderNo`,`prodNo`),
  KEY `fk_OrderItems_Orders1_idx` (`orderNo`),
  KEY `fk_OrderItems_Products1_idx` (`prodNo`),
  CONSTRAINT `fk_OrderItems_Orders1` FOREIGN KEY (`orderNo`) REFERENCES `orders` (`orderNo`),
  CONSTRAINT `fk_OrderItems_Products1` FOREIGN KEY (`prodNo`) REFERENCES `products` (`prodNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.orderitems:~0 rows (대략적) 내보내기

-- 테이블 shopping.orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `orders` (
  `orderNo` char(11) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `orderTotalPrice` int NOT NULL,
  `orderAddr` varchar(255) NOT NULL,
  `orderStatus` tinyint DEFAULT '0',
  `orderDate` datetime NOT NULL,
  PRIMARY KEY (`orderNo`,`userId`),
  KEY `fk_Orders_Users1_idx` (`userId`),
  CONSTRAINT `fk_Orders_Users1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.orders:~0 rows (대략적) 내보내기

-- 테이블 shopping.points 구조 내보내기
CREATE TABLE IF NOT EXISTS `points` (
  `pointNo` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `point` int NOT NULL,
  `pointDesc` varchar(45) NOT NULL,
  `pointDate` datetime NOT NULL,
  PRIMARY KEY (`pointNo`,`userId`),
  KEY `fk_Points_Users_idx` (`userId`),
  CONSTRAINT `fk_Points_Users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.points:~0 rows (대략적) 내보내기

-- 테이블 shopping.products 구조 내보내기
CREATE TABLE IF NOT EXISTS `products` (
  `prodNo` int NOT NULL,
  `cateNo` int NOT NULL,
  `sellerNo` int NOT NULL,
  `prodName` varchar(20) NOT NULL,
  `prodStock` int DEFAULT NULL,
  `prodPrice` int NOT NULL,
  `prodSold` int DEFAULT '0',
  `prodDiscount` tinyint DEFAULT '0',
  PRIMARY KEY (`prodNo`,`cateNo`),
  KEY `fk_Products_Categories1_idx` (`cateNo`),
  KEY `fk_Products_Sellers1_idx` (`sellerNo`),
  CONSTRAINT `fk_Products_Categories1` FOREIGN KEY (`cateNo`) REFERENCES `categories` (`cateNo`),
  CONSTRAINT `fk_Products_Sellers1` FOREIGN KEY (`sellerNo`) REFERENCES `sellers` (`sellerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.products:~0 rows (대략적) 내보내기

-- 테이블 shopping.sellers 구조 내보내기
CREATE TABLE IF NOT EXISTS `sellers` (
  `sellerNo` int NOT NULL,
  `sellerBizName` varchar(45) NOT NULL,
  `sellerPhone` varchar(20) NOT NULL,
  `sellerManager` varchar(20) NOT NULL,
  `sellerAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`sellerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.sellers:~0 rows (대략적) 내보내기

-- 테이블 shopping.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `userId` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userBirth` char(10) NOT NULL,
  `userGender` char(1) NOT NULL,
  `userHp` char(13) NOT NULL,
  `userEmail` varchar(45) DEFAULT NULL,
  `userPoint` int DEFAULT '1',
  `userLevel` tinyint DEFAULT '0',
  `userAddr` varchar(100) DEFAULT NULL,
  `userRegDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userHp_UNIQUE` (`userHp`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.users:~0 rows (대략적) 내보내기


-- studydb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `studydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `studydb`;

-- 테이블 studydb.board_article 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_article` (
  `no` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `rdate` datetime(6) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `writer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FKe2j3c1fedf3c8xde6wp7j5hv2` (`writer`),
  CONSTRAINT `FKe2j3c1fedf3c8xde6wp7j5hv2` FOREIGN KEY (`writer`) REFERENCES `board_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.board_article:~1 rows (대략적) 내보내기
INSERT INTO `board_article` (`no`, `content`, `rdate`, `title`, `writer`) VALUES
	(1, '저는 신사임당', '2024-09-09 16:48:09.205959', '안녕하세요', 's101');

-- 테이블 studydb.board_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_comment` (
  `no` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `rdate` datetime(6) DEFAULT NULL,
  `parent` int DEFAULT NULL,
  `writer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FKahre5ek2aayqjai2xalmyq84g` (`parent`),
  KEY `FKikyrrvh4ra4io4kwecbq6cjm1` (`writer`),
  CONSTRAINT `FKahre5ek2aayqjai2xalmyq84g` FOREIGN KEY (`parent`) REFERENCES `board_article` (`no`),
  CONSTRAINT `FKikyrrvh4ra4io4kwecbq6cjm1` FOREIGN KEY (`writer`) REFERENCES `board_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.board_comment:~1 rows (대략적) 내보내기
INSERT INTO `board_comment` (`no`, `content`, `rdate`, `parent`, `writer`) VALUES
	(3, '신사가 맞습니다', '2024-09-09 17:09:52.419566', 1, 's101');

-- 테이블 studydb.board_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_file` (
  `fno` int NOT NULL AUTO_INCREMENT,
  `oName` varchar(255) DEFAULT NULL,
  `sName` varchar(255) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  PRIMARY KEY (`fno`),
  KEY `FKbsylu1vroewx1f5dkd6un1k82` (`ano`),
  CONSTRAINT `FKbsylu1vroewx1f5dkd6un1k82` FOREIGN KEY (`ano`) REFERENCES `board_article` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.board_file:~1 rows (대략적) 내보내기
INSERT INTO `board_file` (`fno`, `oName`, `sName`, `ano`) VALUES
	(1, 'test.txt', '124412sdjadhiwajsjdckaldw.txt', 1);

-- 테이블 studydb.board_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_user` (
  `uid` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `regDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.board_user:~1 rows (대략적) 내보내기
INSERT INTO `board_user` (`uid`, `email`, `name`, `nick`, `regDate`) VALUES
	('s101', 'gentleman@imda.com', '신사임당', '사임사임', '2024-09-09 16:42:59.151192');

-- 테이블 studydb.bookorder 구조 내보내기
CREATE TABLE IF NOT EXISTS `bookorder` (
  `orderNo` int DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `userId` varchar(10) DEFAULT NULL,
  `userName` varchar(10) DEFAULT NULL,
  `userAddr` varchar(10) DEFAULT NULL,
  `bookNo` int DEFAULT NULL,
  `bookName` varchar(20) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.bookorder:~0 rows (대략적) 내보내기

-- 테이블 studydb.child 구조 내보내기
CREATE TABLE IF NOT EXISTS `child` (
  `cid` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hp` varchar(255) DEFAULT NULL,
  `parent` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `hp` (`hp`),
  KEY `parent` (`parent`),
  CONSTRAINT `child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.child:~4 rows (대략적) 내보내기
INSERT INTO `child` (`cid`, `name`, `hp`, `parent`) VALUES
	('C101', '김철수', '010-1234-1001', 'P101'),
	('C102', '김영희', '010-1234-1002', 'P101'),
	('C103', '강철수', '010-1234-1003', 'P103'),
	('C104', '이철수', '010-1234-1004', 'P105');

-- 테이블 studydb.department 구조 내보내기
CREATE TABLE IF NOT EXISTS `department` (
  `depNo` tinyint NOT NULL,
  `name` varchar(10) NOT NULL,
  `tel` char(12) NOT NULL,
  PRIMARY KEY (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.department:~7 rows (대략적) 내보내기
INSERT INTO `department` (`depNo`, `name`, `tel`) VALUES
	(101, '영업1부', '051-512-1001'),
	(102, '영업2부', '051-512-1002'),
	(103, '영업3부', '051-512-1003'),
	(104, '영업4부', '051-512-1004'),
	(105, '영업5부', '051-512-1005'),
	(106, '영업지원부', '051-512-1006'),
	(107, '인사부', '051-512-1007');

-- 테이블 studydb.filetest 구조 내보내기
CREATE TABLE IF NOT EXISTS `filetest` (
  `no` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `oname` varchar(100) DEFAULT NULL,
  `sname` varchar(100) DEFAULT NULL,
  `rdate` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.filetest:~1 rows (대략적) 내보내기
INSERT INTO `filetest` (`no`, `uid`, `name`, `oname`, `sname`, `rdate`) VALUES
	(7, 'under', '김주경', 'Penrose.txt', '0d187942-d801-4e9f-add3-e4ad010f8f24.txt', '2024-08-12 11:58:07');

-- 테이블 studydb.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `hp` char(13) NOT NULL,
  `pos` varchar(10) DEFAULT '사원',
  `dep` tinyint DEFAULT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.member:~12 rows (대략적) 내보내기
INSERT INTO `member` (`uid`, `name`, `hp`, `pos`, `dep`, `rdate`) VALUES
	('a101', '박혁거세', '010-1234-1001', '부장', 101, '2024-07-03 14:33:21'),
	('a102', '김유신', '010-1234-1002', '차장', 101, '2024-07-10 17:21:41'),
	('a103', '김춘추', '010-1234-1003', '사원', 101, '2024-07-10 17:21:41'),
	('a104', '장보고', '010-1234-1004', '대리', 102, '2024-07-10 17:21:41'),
	('a105', '강감찬', '010-1234-1005', '과장', 102, '2024-07-10 17:21:41'),
	('a106', '이성계', '010-1234-1006', '차장', 103, '2024-07-10 17:21:41'),
	('a107', '정철', '010-1234-1007', '차장', 103, '2024-07-10 17:21:41'),
	('a108', '이순신', '010-1234-1008', '부장', 104, '2024-07-10 17:21:41'),
	('a109', '허균', '010-1234-1009', '부장', 104, '2024-07-10 17:21:41'),
	('a110', '정약용', '010-1234-1010', '사원', 105, '2024-07-10 17:21:41'),
	('a111', '박지원', '010-1234-1011', '사원', 105, '2024-07-10 17:21:41'),
	('a112', '유관순', '010-1234-1012', '대리', 107, '2024-07-10 17:22:31');

-- 테이블 studydb.parent 구조 내보내기
CREATE TABLE IF NOT EXISTS `parent` (
  `pid` varchar(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.parent:~5 rows (대략적) 내보내기
INSERT INTO `parent` (`pid`, `name`, `birth`, `addr`) VALUES
	('P101', '김유신', '1968-05-09', '경남 김해시'),
	('P102', '김춘추', '1972-11-23', '경남 경주시'),
	('P103', '장보고', '1978-03-01', '전남 완도군'),
	('P104', '강감찬', '1979-08-16', '서울시 관악구'),
	('P105', '이순신', '1981-05-23', '부산시 진구');

-- 테이블 studydb.sales 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales` (
  `no` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `year` year NOT NULL,
  `month` tinyint NOT NULL,
  `sale` int DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.sales:~30 rows (대략적) 내보내기
INSERT INTO `sales` (`no`, `uid`, `year`, `month`, `sale`) VALUES
	(1, 'a101', '2018', 1, 98100),
	(2, 'a102', '2018', 1, 136000),
	(3, 'a103', '2018', 1, 80100),
	(4, 'a104', '2018', 1, 78000),
	(5, 'a105', '2018', 1, 93000),
	(6, 'a101', '2018', 2, 23500),
	(7, 'a102', '2018', 2, 126000),
	(8, 'a103', '2018', 2, 18500),
	(9, 'a105', '2018', 2, 19000),
	(10, 'a106', '2018', 2, 53000),
	(11, 'a101', '2019', 1, 24000),
	(12, 'a102', '2019', 1, 109000),
	(13, 'a103', '2019', 1, 101000),
	(14, 'a104', '2019', 1, 53500),
	(15, 'a107', '2019', 1, 24000),
	(16, 'a102', '2019', 2, 160000),
	(17, 'a103', '2019', 2, 101000),
	(18, 'a104', '2019', 2, 43000),
	(19, 'a105', '2019', 2, 24000),
	(20, 'a106', '2019', 2, 109000),
	(21, 'a102', '2020', 1, 201000),
	(22, 'a104', '2020', 1, 63000),
	(23, 'a105', '2020', 1, 74000),
	(24, 'a106', '2020', 1, 122000),
	(25, 'a107', '2020', 1, 111000),
	(26, 'a102', '2020', 2, 120000),
	(27, 'a103', '2020', 2, 93000),
	(28, 'a104', '2020', 2, 84000),
	(29, 'a105', '2020', 2, 180000),
	(30, 'a108', '2020', 2, 76000);

-- 테이블 studydb.sales2 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales2` (
  `no` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `year` year NOT NULL,
  `month` tinyint NOT NULL,
  `sale` int DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.sales2:~30 rows (대략적) 내보내기
INSERT INTO `sales2` (`no`, `uid`, `year`, `month`, `sale`) VALUES
	(1, 'a101', '2021', 1, 98100),
	(2, 'a102', '2021', 1, 136000),
	(3, 'a103', '2021', 1, 80100),
	(4, 'a104', '2021', 1, 78000),
	(5, 'a105', '2021', 1, 93000),
	(6, 'a101', '2021', 2, 23500),
	(7, 'a102', '2021', 2, 126000),
	(8, 'a103', '2021', 2, 18500),
	(9, 'a105', '2021', 2, 19000),
	(10, 'a106', '2021', 2, 53000),
	(11, 'a101', '2022', 1, 24000),
	(12, 'a102', '2022', 1, 109000),
	(13, 'a103', '2022', 1, 101000),
	(14, 'a104', '2022', 1, 53500),
	(15, 'a107', '2022', 1, 24000),
	(16, 'a102', '2022', 2, 160000),
	(17, 'a103', '2022', 2, 101000),
	(18, 'a104', '2022', 2, 43000),
	(19, 'a105', '2022', 2, 24000),
	(20, 'a106', '2022', 2, 109000),
	(21, 'a102', '2023', 1, 201000),
	(22, 'a104', '2023', 1, 63000),
	(23, 'a105', '2023', 1, 74000),
	(24, 'a106', '2023', 1, 122000),
	(25, 'a107', '2023', 1, 111000),
	(26, 'a102', '2023', 2, 120000),
	(27, 'a103', '2023', 2, 93000),
	(28, 'a104', '2023', 2, 84000),
	(29, 'a105', '2023', 2, 180000),
	(30, 'a108', '2023', 2, 76000);

-- 테이블 studydb.shop_customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_customer` (
  `custId` varchar(255) NOT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `hp` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int NOT NULL,
  `regDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.shop_customer:~3 rows (대략적) 내보내기
INSERT INTO `shop_customer` (`custId`, `addr`, `hp`, `name`, `age`, `regDate`) VALUES
	('a101', '경북 울진군', '010-1234-1234', '강감찬', 32, '2024-09-10 15:16:08.000000'),
	('a102', '경북 경주시', '010-1111-2222', '김유신', 28, '2024-09-10 15:17:06.000000'),
	('a103', '경주', '010-1234-1002', '김춘추', 21, '2024-09-10 15:32:45.495067');

-- 테이블 studydb.shop_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `orderDate` datetime(6) DEFAULT NULL,
  `orderPrice` int NOT NULL,
  `orderStatus` int NOT NULL,
  `orderCustomer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FKaxvnskexfst5e6rk4g0m25b9q` (`orderCustomer`),
  CONSTRAINT `FKaxvnskexfst5e6rk4g0m25b9q` FOREIGN KEY (`orderCustomer`) REFERENCES `shop_customer` (`custId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.shop_order:~1 rows (대략적) 내보내기
INSERT INTO `shop_order` (`orderId`, `orderDate`, `orderPrice`, `orderStatus`, `orderCustomer`) VALUES
	(1, '2024-09-10 15:38:29.529348', 3000, 1, 'a101');

-- 테이블 studydb.shop_order_item 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_order_item` (
  `orderItemId` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK8uiril3a4wmy7rdaw8d6j2v38` (`orderId`),
  KEY `FK5rp0yud1ws22yhp7rtwsho3r1` (`productId`),
  CONSTRAINT `FK5rp0yud1ws22yhp7rtwsho3r1` FOREIGN KEY (`productId`) REFERENCES `shop_product` (`productId`),
  CONSTRAINT `FK8uiril3a4wmy7rdaw8d6j2v38` FOREIGN KEY (`orderId`) REFERENCES `shop_order` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.shop_order_item:~2 rows (대략적) 내보내기
INSERT INTO `shop_order_item` (`orderItemId`, `count`, `orderId`, `productId`) VALUES
	(1, 2, 1, 1),
	(2, 3, 1, 2);

-- 테이블 studydb.shop_product 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.shop_product:~2 rows (대략적) 내보내기
INSERT INTO `shop_product` (`productId`, `price`, `productName`, `stock`) VALUES
	(1, 1000, '새우깡', 100),
	(2, 1500, '포카칩', 300);

-- 테이블 studydb.tblproduct 구조 내보내기
CREATE TABLE IF NOT EXISTS `tblproduct` (
  `prod_no` varchar(10) DEFAULT NULL,
  `prod_name` varchar(10) DEFAULT NULL,
  `prod_price` varchar(10) DEFAULT NULL,
  `prod_stock` int DEFAULT NULL,
  `prod_company` varchar(10) DEFAULT NULL,
  `prod_date` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.tblproduct:~6 rows (대략적) 내보내기
INSERT INTO `tblproduct` (`prod_no`, `prod_name`, `prod_price`, `prod_stock`, `prod_company`, `prod_date`) VALUES
	('1001', '냉장고', '800,000', 25, 'LG전자', '2022-01-06'),
	('1002', '노트북', '1,200,000', 120, '삼성전자', '2022-01-07'),
	('1003', '모니터', '350,000', 35, 'LG전자', '2023-01-13'),
	('1004', '세탁기', '1,000,000', 80, '삼성전자', '2021-01-01'),
	('1005', '컴퓨터', '1,500,000', 20, '삼성전자', '2023-10-01'),
	('1006', '휴대폰', '950,000', 102, '삼성전자', '2024-01-01');

-- 테이블 studydb.tbluser 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbluser` (
  `user_id` varchar(10) DEFAULT NULL,
  `user_name` varchar(10) DEFAULT NULL,
  `user_hp` char(13) DEFAULT NULL,
  `user_age` int DEFAULT NULL,
  `user_addr` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.tbluser:~4 rows (대략적) 내보내기
INSERT INTO `tbluser` (`user_id`, `user_name`, `user_hp`, `user_age`, `user_addr`) VALUES
	('p101', '김유신', '010-1234-1001', 25, '경남 김해시'),
	('p102', '김춘추', '010-1234-1002', 23, '경남 경주시'),
	('p104', '강감찬', NULL, 42, '서울시 중구'),
	('p105', '이순신', '010-1234-1005', 50, '부산시 진구');

-- 테이블 studydb.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(255) NOT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rdate` datetime(6) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user:~4 rows (대략적) 내보내기
INSERT INTO `user` (`username`, `birth`, `name`, `password`, `rdate`, `role`) VALUES
	('admin', '2024-09-12', 'ww', '$2a$10$IQlj/cPlEoPH06D6iwyjSeH8bsiAyOESj7PzMxsRW6.nFH9jVgYBG', NULL, 'ADMIN'),
	('man', '2024-09-01', 'wq', '$2a$10$c8Qg8eMrJtQvh6OEE4POsOhVqswUyX5nLweURXMl4rUousJX.dphe', NULL, 'MANAGER'),
	('st', '2024-09-13', '유신', '$2a$10$2wz1.6ZAVbrHua.uv3nrjOr9VTgYzL0USO.vUekbWtpG8Reg4hA2G', NULL, 'STAFF'),
	('user', '2024-09-03', '희빈', '$2a$10$w70f33Lsh/rVNz/G.Viu2OGBctwrDWBFaY3EsE9L02RaVEfPj7Ziy', '2024-09-11 11:10:38.000000', 'ADMIN');

-- 테이블 studydb.user1 구조 내보내기
CREATE TABLE IF NOT EXISTS `user1` (
  `uid` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `hp` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user1:~9 rows (대략적) 내보내기
INSERT INTO `user1` (`uid`, `name`, `birth`, `hp`, `age`) VALUES
	('A101', '김유신', '1990-03-02', '010-1234-1001', 26),
	('A104', '강감찬', '', '', 23),
	('A103', '장보고', '', '', 23),
	('A126', 'wd', '', '010-1234-1001', 35),
	('a201', '김유정', '1990-09-02', '010-1234-1234', 32),
	('a203', '김유정', '1990-09-02', '010-1234-1234', 32),
	('a205', '김유신', '1990-09-02', '010-1234-1234', 36),
	('a124', '강감찬', '1997-02-22', '010-1234-1234', 28),
	('f404', '장보고', '1993-02-06', '010-1234-1234', 22);

-- 테이블 studydb.user2 구조 내보내기
CREATE TABLE IF NOT EXISTS `user2` (
  `uid` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `age` int NOT NULL,
  `hp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user2:~5 rows (대략적) 내보내기
INSERT INTO `user2` (`uid`, `name`, `birth`, `addr`, `age`, `hp`) VALUES
	('A101', '김유신', '1968-05-14', '경남 김해시', 0, NULL),
	('A102', '김춘추', '1972-11-23', '경남 경주시', 0, NULL),
	('A103', '장보고', '1978-03-01', '전남 완도군', 0, NULL),
	('A104', '강감찬', '1979-08-16', '서울시 종로구', 0, NULL),
	('A105', '이순신', '1981-05-23', '부산시 진구', 0, NULL);

-- 테이블 studydb.user3 구조 내보내기
CREATE TABLE IF NOT EXISTS `user3` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user3:~5 rows (대략적) 내보내기
INSERT INTO `user3` (`uid`, `name`, `birth`, `hp`, `addr`) VALUES
	('A101', '김유신', '1968-05-09', '010-1234-1011', '경남 김해시'),
	('A102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시'),
	('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군'),
	('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울시 동작구'),
	('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');

-- 테이블 studydb.user4 구조 내보내기
CREATE TABLE IF NOT EXISTS `user4` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `age` int DEFAULT '1',
  `hp` char(13) DEFAULT NULL,
  `addr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user4:~6 rows (대략적) 내보내기
INSERT INTO `user4` (`uid`, `name`, `gender`, `age`, `hp`, `addr`) VALUES
	('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시'),
	('A102', '김춘추', 'M', 23, '010-1234-2222', '경남 경주시'),
	('A103', '장보고', 'M', 35, '010-1234-3333', '전남 완도군'),
	('A104', '강감찬', 'M', 42, '010-1234-4444', '서울시 관악구'),
	('A106', '신사임당', 'F', 32, NULL, '강릉시'),
	('A107', '허난설헌', 'F', 27, NULL, '경기도 광주시');

-- 테이블 studydb.user5 구조 내보내기
CREATE TABLE IF NOT EXISTS `user5` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `age` int DEFAULT '1',
  `addr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  CONSTRAINT `user5_chk_1` CHECK ((`gender` in (_utf8mb4'M',_utf8mb4'F'))),
  CONSTRAINT `user5_chk_2` CHECK (((`age` > 0) and (`age` < 100)))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 studydb.user5:~6 rows (대략적) 내보내기
INSERT INTO `user5` (`seq`, `name`, `gender`, `age`, `addr`) VALUES
	(1, '김유신', 'M', 25, '경남 김해시'),
	(2, '강감찬', 'M', 42, '서울시 관악구'),
	(3, '신사임당', 'F', 33, '경기도'),
	(4, '이순신', 'M', 51, '전남 여수시'),
	(5, '장희빈', 'F', 29, '강원도 강릉시'),
	(16, 'ddd', 'M', 28, '2ww');


-- theater 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `theater` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `theater`;

-- 테이블 theater.bookings 구조 내보내기
CREATE TABLE IF NOT EXISTS `bookings` (
  `booking_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `num_tickets` int NOT NULL,
  `booking_date` datetime NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 theater.bookings:~0 rows (대략적) 내보내기

-- 테이블 theater.customers 구조 내보내기
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` char(13) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 theater.customers:~5 rows (대략적) 내보내기
INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`) VALUES
	(1, '김유신', 'kys@example.com', '010-1234-1001'),
	(2, '김춘추', 'kcc@example.com', '010-1234-1002'),
	(3, '장보고', 'jbg@example.com', '010-1234-1003'),
	(4, '강감찬', 'kgc@example.com', '010-1234-1004'),
	(5, '이순신', 'lss@example.com', '010-1234-1005');

-- 테이블 theater.movies 구조 내보내기
CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `genre` varchar(10) NOT NULL,
  `release_date` date NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 theater.movies:~10 rows (대략적) 내보내기
INSERT INTO `movies` (`movie_id`, `title`, `genre`, `release_date`) VALUES
	(1, '쇼생크의 탈출', '드라마', '1994-10-14'),
	(2, '타이타닉', '로맨스', '1997-03-24'),
	(3, '탑건', '액션', '1987-07-16'),
	(4, '쥬라기공원', '액션', '1994-02-11'),
	(5, '글래디에이터', '액션', '2000-05-03'),
	(6, '시네마천국', '드라마', '1995-04-12'),
	(7, '미션임파서블', '액션', '1995-11-11'),
	(8, '노트북', '로맨스', '2003-08-23'),
	(9, '인터스텔라', 'SF', '2011-05-26'),
	(10, '아바타', 'SF', '2010-02-10');


-- university 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `university` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university`;

-- 테이블 university.departments 구조 내보내기
CREATE TABLE IF NOT EXISTS `departments` (
  `depNo` int NOT NULL,
  `depName` varchar(20) NOT NULL,
  `depTel` char(14) NOT NULL,
  PRIMARY KEY (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.departments:~0 rows (대략적) 내보내기

-- 테이블 university.lectures 구조 내보내기
CREATE TABLE IF NOT EXISTS `lectures` (
  `lecNo` char(6) NOT NULL,
  `proNo` char(6) NOT NULL,
  `lecName` varchar(45) NOT NULL,
  `lecCredit` tinyint NOT NULL,
  `lecTime` tinyint NOT NULL,
  `lecClass` varchar(45) NOT NULL,
  PRIMARY KEY (`lecNo`,`proNo`),
  KEY `fk_Lecture_Profeesors1_idx` (`proNo`),
  CONSTRAINT `fk_Lecture_Profeesors1` FOREIGN KEY (`proNo`) REFERENCES `profeesors` (`proNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.lectures:~0 rows (대략적) 내보내기

-- 테이블 university.profeesors 구조 내보내기
CREATE TABLE IF NOT EXISTS `profeesors` (
  `proNo` char(6) NOT NULL,
  `depNo` int NOT NULL,
  `proName` varchar(20) NOT NULL,
  `proJumin` char(14) NOT NULL,
  `proHp` char(13) NOT NULL,
  `proEmail` varchar(45) NOT NULL,
  `proAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`proNo`),
  UNIQUE KEY `proHp_UNIQUE` (`proHp`),
  UNIQUE KEY `proJumin_UNIQUE` (`proJumin`),
  KEY `fk_Profeesors_Departments1_idx` (`depNo`),
  CONSTRAINT `fk_Profeesors_Departments1` FOREIGN KEY (`depNo`) REFERENCES `departments` (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.profeesors:~0 rows (대략적) 내보내기

-- 테이블 university.register 구조 내보내기
CREATE TABLE IF NOT EXISTS `register` (
  `stdNo` char(8) NOT NULL,
  `lecNo` char(6) NOT NULL,
  `proNo` char(6) NOT NULL,
  `regAttenScore` tinyint DEFAULT NULL,
  `regMidScore` tinyint DEFAULT NULL,
  `regFinalScore` tinyint DEFAULT NULL,
  `regEtcScore` tinyint DEFAULT NULL,
  `regTotal` tinyint DEFAULT NULL,
  `regGrade` char(1) DEFAULT NULL,
  PRIMARY KEY (`stdNo`,`lecNo`,`proNo`),
  KEY `fk_table5_Students1_idx` (`stdNo`),
  KEY `fk_table5_Lecture1` (`lecNo`,`proNo`),
  CONSTRAINT `fk_table5_Lecture1` FOREIGN KEY (`lecNo`, `proNo`) REFERENCES `lectures` (`lecNo`, `proNo`),
  CONSTRAINT `fk_table5_Students1` FOREIGN KEY (`stdNo`) REFERENCES `students` (`stdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.register:~0 rows (대략적) 내보내기

-- 테이블 university.students 구조 내보내기
CREATE TABLE IF NOT EXISTS `students` (
  `stdNo` char(8) NOT NULL,
  `depNo` int NOT NULL,
  `proNo` char(6) NOT NULL,
  `stdName` varchar(20) NOT NULL,
  `stdJumin` char(14) NOT NULL,
  `stdHp` char(13) NOT NULL,
  `stdEmail` varchar(45) DEFAULT NULL,
  `stdAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`stdNo`),
  UNIQUE KEY `stdHp_UNIQUE` (`stdHp`),
  UNIQUE KEY `stdEmail_UNIQUE` (`stdEmail`),
  KEY `fk_Students_Profeesors_idx` (`proNo`),
  KEY `fk_Students_Departments1_idx` (`depNo`),
  CONSTRAINT `fk_Students_Departments1` FOREIGN KEY (`depNo`) REFERENCES `departments` (`depNo`),
  CONSTRAINT `fk_Students_Profeesors` FOREIGN KEY (`proNo`) REFERENCES `profeesors` (`proNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.students:~0 rows (대략적) 내보내기

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
