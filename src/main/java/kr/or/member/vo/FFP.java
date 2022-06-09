package kr.or.member.vo;

import java.util.ArrayList;

import kr.or.fund.model.vo.Fund;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FFP {
	private ArrayList<Fund> fund;
	private String pagenation;
}
