
CREATE DATABASE IF NOT EXISTS `bookstore` 
USE `bookstore`;


CREATE TABLE IF NOT EXISTS `tbl_bbs_data` (
  `data_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `title` varchar(200) DEFAULT NULL COMMENT '글제목',
  `content` text DEFAULT NULL COMMENT '글내용',
  `writer` varchar(50) DEFAULT NULL COMMENT '작성자',
  `org_file_name` varchar(500) DEFAULT NULL COMMENT '첨부파일',
  `save_file_name` varchar(500) DEFAULT NULL COMMENT '바뀐 첨부 파일',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '작성일',
  `modify_date` datetime DEFAULT current_timestamp() COMMENT '수정일',
  PRIMARY KEY (`data_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='자료실 게시판 테이블';


CREATE TABLE IF NOT EXISTS `tbl_bbs_faq` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `title` varchar(200) DEFAULT NULL COMMENT '글제목',
  `content` text DEFAULT NULL COMMENT '글내용',
  `writer` varchar(50) DEFAULT NULL COMMENT '작성자',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '작성일',
  `modify_date` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='faq 게시판 테이블';


CREATE TABLE IF NOT EXISTS `tbl_bbs_notice` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '제목',
  `content` text DEFAULT NULL COMMENT '글 내용',
  `writer` varchar(30) DEFAULT NULL COMMENT '작성자',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '작성일',
  `org_file_name` varchar(500) DEFAULT NULL COMMENT '첨부파일',
  `save_file_name` varchar(500) DEFAULT NULL COMMENT '바뀐 첨부 파일',
  `fix_state` int(1) NOT NULL DEFAULT 0 COMMENT '고정여부',
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='공지사항';


CREATE TABLE IF NOT EXISTS `tbl_bbs_qna` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `ref` int(11) NOT NULL DEFAULT 0 COMMENT '참고글 번호',
  `title` varchar(200) NOT NULL COMMENT '글제목',
  `content` text NOT NULL COMMENT '글내용',
  `writer` varchar(50) DEFAULT NULL COMMENT '작성자',
  `read_cnt` int(10) DEFAULT 0 COMMENT '조회수',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '작성일',
  `modify_date` datetime DEFAULT NULL COMMENT '수정일',
  `reply_state` char(3) DEFAULT 'N' COMMENT '답변 유무',
  `member_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='qna게시판테이블';


CREATE TABLE IF NOT EXISTS `tbl_bbs_review` (
  `review_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '리뷰글번호',
  `title` varchar(50) DEFAULT NULL COMMENT '리뷰제목',
  `content` text DEFAULT NULL COMMENT '리뷰내용',
  `writer` varchar(50) DEFAULT NULL COMMENT '작성자',
  `grade` double(7,0) DEFAULT NULL COMMENT '평점',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '작성일',
  `modify_date` datetime DEFAULT NULL COMMENT '수정일',
  `product_idx` int(11) DEFAULT NULL COMMENT '상품번호',
  `member_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`review_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='리뷰 게시판 테이블';


CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cart_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '카트 인덱스',
  `or_member_id` varchar(50) DEFAULT NULL COMMENT '주문자 아이디',
  `product_idx` int(11) DEFAULT 0 COMMENT '상품번호',
  `product_name` varchar(50) DEFAULT NULL COMMENT '상품이름',
  `product_cnt` int(11) NOT NULL DEFAULT 1 COMMENT '상품수량',
  `add_date` datetime DEFAULT current_timestamp() COMMENT '주문일자',
  `member_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='카트 테이블';


CREATE TABLE IF NOT EXISTS `tbl_instock` (
  `in_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '입고번호',
  `date` datetime DEFAULT current_timestamp() COMMENT '입고날짜',
  `product_idx` int(11) DEFAULT NULL COMMENT '상품코드',
  `product_cnt` int(11) DEFAULT NULL COMMENT '상품수량',
  PRIMARY KEY (`in_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='입고테이블';


CREATE TABLE IF NOT EXISTS `tbl_member` (
  `member_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원인덱스',
  `member_id` varchar(50) DEFAULT NULL COMMENT '아이디',
  `pwd` varchar(200) DEFAULT NULL COMMENT '비밀번호',
  `name` varchar(20) DEFAULT NULL COMMENT '이름',
  `addr1` varchar(100) DEFAULT NULL COMMENT '주소1',
  `addr2` varchar(100) DEFAULT NULL COMMENT '주소2',
  `zipcode` varchar(20) DEFAULT NULL COMMENT '우편번호',
  `phone_num` varchar(20) DEFAULT NULL COMMENT '휴대폰번호',
  `email` varchar(100) DEFAULT NULL COMMENT '이메일',
  `forever_yn` varchar(10) DEFAULT NULL COMMENT '평생회원여부',
  `option` varchar(10) DEFAULT NULL COMMENT '선택사항체크여부',
  `point` decimal(7,0) DEFAULT NULL COMMENT '충전포인트',
  `mileage` decimal(7,0) DEFAULT NULL COMMENT '마일리지',
  `member_state` varchar(10) DEFAULT 'Y' COMMENT '탈퇴여부',
  `join_state` char(3) DEFAULT 'N' COMMENT '가입여부',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '가입일',
  `leave_date` datetime DEFAULT NULL COMMENT '탈퇴일',
  PRIMARY KEY (`member_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='회원';


CREATE TABLE IF NOT EXISTS `tbl_order` (
  `order_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '결제번호',
  `pay_method` varchar(50) DEFAULT NULL COMMENT '결제수단',
  `delivery_company` varchar(50) DEFAULT NULL COMMENT '택배회사',
  `pay_price` int(11) DEFAULT NULL COMMENT '결제금액',
  `pay_date` datetime DEFAULT current_timestamp() COMMENT '결제일',
  `pay_cancel_date` datetime DEFAULT NULL COMMENT '결제취소일',
  `member_id` varchar(50) DEFAULT NULL COMMENT '주문회원 아이디',
  `name` varchar(50) DEFAULT NULL COMMENT '주문회원 이름',
  `phone_num` varchar(50) DEFAULT NULL COMMENT '주문회원 휴대폰번호',
  `email` varchar(50) DEFAULT NULL COMMENT '주문회원 이메일',
  `receiver_name` varchar(50) DEFAULT NULL COMMENT '수취자 이름',
  `receiver_phone_num` varchar(50) DEFAULT NULL COMMENT '수취자 휴대폰번호',
  `zipcode` varchar(20) DEFAULT NULL COMMENT '수취자 우편번호',
  `receiver_addr` varchar(50) DEFAULT NULL COMMENT '수취자 주소',
  `order_code` varchar(20) DEFAULT NULL COMMENT '주문 번호',
  `delivery_state` varchar(20) DEFAULT '배송전' COMMENT '배송 상태',
  `member_idx` int(11) DEFAULT NULL,
  `order_item_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='주문 게시판';


CREATE TABLE IF NOT EXISTS `tbl_order_item` (
  `order_item_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '카트 인덱스',
  `order_code` varchar(20) DEFAULT NULL COMMENT '주문 번호',
  `member_id` varchar(50) DEFAULT NULL COMMENT '주문자 아이디',
  `product_idx` int(11) DEFAULT 0 COMMENT '상품번호',
  `product_name` varchar(50) DEFAULT NULL COMMENT '상품이름',
  `price` int(11) DEFAULT NULL COMMENT '상품금액',
  `discount` int(11) DEFAULT NULL COMMENT '할인율',
  `discount_price` int(11) DEFAULT NULL COMMENT '할인적용금액',
  `product_cnt` int(11) DEFAULT 0 COMMENT '상품수량',
  `order_price` int(11) DEFAULT NULL COMMENT '상품주문금액',
  `order_date` datetime DEFAULT current_timestamp() COMMENT '주문일자',
  PRIMARY KEY (`order_item_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='카트 테이블';


CREATE TABLE IF NOT EXISTS `tbl_outstock` (
  `out_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '출고번호',
  `date` datetime DEFAULT current_timestamp() COMMENT '출고날짜',
  `product_idx` int(11) DEFAULT NULL COMMENT '상품코드',
  `product_cnt` int(11) DEFAULT NULL COMMENT '상품수량',
  `outstock_cnt` int(11) DEFAULT NULL COMMENT '출고가능수량',
  PRIMARY KEY (`out_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='출고테이블';


CREATE TABLE IF NOT EXISTS `tbl_product` (
  `product_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품코드',
  `product_name` varchar(50) NOT NULL COMMENT '상품명',
  `product_content` text DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL COMMENT '출판사',
  `author` varchar(50) NOT NULL COMMENT '저자',
  `page_cnt` int(11) DEFAULT 0 COMMENT '쪽수',
  `price` int(11) DEFAULT 0 COMMENT '가격',
  `publish_date` varchar(50) DEFAULT NULL COMMENT '출판일',
  `tax_yn` varchar(50) DEFAULT NULL COMMENT '소득공제여부',
  `type` varchar(50) DEFAULT NULL COMMENT '유형',
  `grade` varchar(50) DEFAULT NULL COMMENT '학년',
  `subject` varchar(20) DEFAULT NULL COMMENT '과목',
  `discount` int(11) DEFAULT NULL COMMENT '할인율',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '상품등록일',
  PRIMARY KEY (`product_idx`) 
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='상품 테이블';

