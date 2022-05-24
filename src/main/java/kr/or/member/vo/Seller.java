package kr.or.member.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Seller {
	private int sellerNo;
	private String memberId;
	private String enNo;
	private String enPath;
	private String enType;
	private String enIntro;
	private String owner;
	private String photopath;
	private String position;
	private String address;
	private int authSeller;
	private String authMessage; 
	
}
