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
		System.out.println("[Around Advice�� before] ����Ͻ� �޼��� ���� ���Դϴ�.");
		StopWatch sw = new StopWatch();
		sw.start();

		Object result = proceeding.proceed();
		sw.stop();
		
		System.out.println("[Around Advice�� after]: ����Ͻ� �޼��� ���� �� �Դϴ�.");

		Signature sig = proceeding.getSignature();
		System.out.printf("[Around Advice�� after] %s.%s(%s) \n",proceeding.getTarget().getClass().getSimpleName()
				,sig.getName(),Arrays.deepToString(proceeding.getArgs()));
		System.out.println("[Around Advice�� after]"+proceeding.getSignature().getName()+"() �޼��� ���� �ð�:" + sw.getTotalTimeMillis()+"(ms)��");
		System.out.println("[Around Advice�� after]"+proceeding.getTarget().getClass().getName());
		
		return result;
	}
}
