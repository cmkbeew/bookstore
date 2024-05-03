ALTER TABLE tbl_bbs_qna ADD
CONSTRAINT `FK_tbl_bbs_qna_tbl_member` FOREIGN KEY (`member_idx`) REFERENCES `tbl_member` (`member_idx`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_bbs_review ADD
CONSTRAINT `FK_tbl_bbs_review_tbl_member` FOREIGN KEY (`member_idx`) REFERENCES `tbl_member` (`member_idx`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_bbs_review ADD
CONSTRAINT `FK_tbl_bbs_review_tbl_product` FOREIGN KEY (`product_idx`) REFERENCES `tbl_product` (`product_idx`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_cart ADD
CONSTRAINT `FK_tbl_cart_tbl_member` FOREIGN KEY (`member_idx`) REFERENCES `tbl_member` (`member_idx`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_order ADD
CONSTRAINT `FK_tbl_order_tbl_member` FOREIGN KEY (`member_idx`) REFERENCES `tbl_member` (`member_idx`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tbl_order ADD
CONSTRAINT `FK_tbl_order_tbl_order_item` FOREIGN KEY (`order_item_idx`) REFERENCES `tbl_order_item` (`order_item_idx`) ON DELETE CASCADE ON UPDATE CASCADE;