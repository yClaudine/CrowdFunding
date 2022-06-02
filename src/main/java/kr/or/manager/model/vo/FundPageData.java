package kr.or.manager.model.vo;

import java.util.ArrayList;

import kr.or.fund.model.vo.Fund;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FundPageData {
	private ArrayList<Fund> list;
	private String pageNavi;
}
