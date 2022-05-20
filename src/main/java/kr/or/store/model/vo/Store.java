package kr.or.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Store {
	private int storeNo;
	private String memberId;
	private String storeTitle;
	private String storeCategory;
	private String storeContent;
	private String storeProduct;
	private String storeProductcontent;
	private int storePrice;
	private int storeCount;
	private int storeDelivery;
	private String storeReturn;
	private String storeChange;
	private int storeReportcount;
	private int storeWarning;
	private String storeImg1;
	private String storeImg2;
	private String storeImg3;
	private String storeImg4;
	private String storeImg5;
}
