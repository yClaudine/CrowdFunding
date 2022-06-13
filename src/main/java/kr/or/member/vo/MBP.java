package kr.or.member.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MBP {
	private ArrayList<Myblog> list;
	private String pagenation;
	private int count;
 }
