package com.kh.auction.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundAdvice {

	@Pointcut("execution(* com.kh.auction..*.*(..))")
	public void allPointcut() {}
	
	@Around("allPointcut()")
	public Object aroundLog(ProceedingJoinPoint proceeding) throws Throwable{
		System.out.println("[Around Advice의 before] 비즈니스 메서드 수행 전입니다.");
		StopWatch sw = new StopWatch();
		sw.start();

		Object result = proceeding.proceed();
		sw.stop();
		
		System.out.println("[Around Advice의 after]: 비즈니스 메서드 수행 후 입니다.");

		Signature sig = proceeding.getSignature();
		System.out.printf("[Around Advice의 after] %s.%s(%s) \n",proceeding.getTarget().getClass().getSimpleName()
				,sig.getName(),Arrays.deepToString(proceeding.getArgs()));
		System.out.println("[Around Advice의 after]"+proceeding.getSignature().getName()+"() 메서드 수행 시간:" + sw.getTotalTimeMillis()+"(ms)초");
		System.out.println("[Around Advice의 after]"+proceeding.getTarget().getClass().getName());
		
		return result;
	}
}
