package kr.or.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class StoreStar {
	private int starNo;
	private int storepayNo;
	private int storeNo;
	private String memberId;
	private String storeProduct;
	private String starDate;
	private int starScore;
	private String starContent;
	private int storeReportcount;
}
