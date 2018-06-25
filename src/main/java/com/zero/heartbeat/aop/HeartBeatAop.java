package com.zero.heartbeat.aop;

import org.apache.catalina.session.StandardSessionFacade;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class HeartBeatAop {
	@Around("@annotation(com.zero.heartbeat.annotation.CheckSession)")
	public Object CheckSessionAop(ProceedingJoinPoint joinPoint) throws Throwable{
		StandardSessionFacade session = null;
		
        for ( Object o : joinPoint.getArgs() ){
        	System.out.println(o.getClass().getName() + " : " + o);
            if ( o instanceof StandardSessionFacade ) {
                session = (StandardSessionFacade)o;
            }
        }
        
		Object obj = session.getAttribute("loginSession");
		int member_sq = obj == null ? 0 : Integer.parseInt(obj.toString());
		
		if (member_sq == 0) {
			session.setAttribute("needLogin", "1");
			return "common/redirect";
		}
		
		return joinPoint.proceed();
	}
}
