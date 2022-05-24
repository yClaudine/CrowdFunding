package kr.or.member.service;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;



@Component
public class SHA256Enc {
	
	public String endData(String data)throws Exception{
		
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		//매개변수로 받은 암호화 전 비밀번호를 bytes배열로 변환 
		byte[] beforePw = data.getBytes();
		//byte배열로 변환된 암호화 전 비밀번호를 sha로 암호화 
		mDigest.update(beforePw);
		byte[] encStr = mDigest.digest();
		//byte - > 1byte 로 정수표현 -> 2진수 8자리 ->표현할 수 있는 숫자갯수 2^8->256개 
		//0~255로 변환해서 사용 
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<encStr.length; i++) {
			byte tmp = encStr[i];
			String tmpText = Integer.toString((tmp & 0xff)+0x100,16).substring(1);
			sb.append(tmpText);
		}
		return sb.toString();
		
	}
}
