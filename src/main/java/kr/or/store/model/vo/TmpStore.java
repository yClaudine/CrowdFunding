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
	private int stPrice;
	private int stCount;
	private int stDelivery;
	private String stReturn;
	private String stChange;
	private String stImg1;
	private String stImg2;
	private String stImg3;
	private String stImg4;
	private String stImg5;
}
