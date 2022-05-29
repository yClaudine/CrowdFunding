package kr.or.store.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Data
public class TmpStore {
	private int stNo;
	private String memberId;
	private String stTitle;
	private String stCategory;
	private String stContent;
	private String stProduct;
	private String stProductcontent;
	private int stprice;
	private int stcount;
	private int stdelivery;
	private String streturn;
	private String stchange;
	private String stimg1;
	private String stimg2;
	private String stimg3;
	private String stimg4;
	private String stimg5;
}
