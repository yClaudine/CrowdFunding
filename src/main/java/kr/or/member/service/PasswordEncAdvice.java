package kr.or.member.service;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.member.vo.Member;

@Aspect
@Component
public class PasswordEncAdvice {

	@Autowired
	private SHA256Enc enc;
	
	@Pointcut(value="execution(* kr.or.member.service.MemberService.*Member(kr.or.member.vo.Member))")
	public void encPointcut() {}
	
	@Before(value="encPointcut()")
	public void encPassword(JoinPoint jp) {
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		Member m = (Member)args[0];
		String beforePw = m.getMemberPw();
		try {
			String encPw = enc.endData(beforePw);
			m.setMemberPw(encPw);
			System.out.println("암호화 비밀번호 :"+encPw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("암호화메소드" +methodName);
		System.out.println("암호화전 비밀번호"+beforePw);
	}
}
