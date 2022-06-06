package kr.or.member.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class pagiDm {

	private String pagination;
	private ArrayList<Dm> list;
	
}
