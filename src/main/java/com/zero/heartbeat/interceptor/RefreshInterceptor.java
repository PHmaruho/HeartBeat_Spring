package com.zero.heartbeat.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class RefreshInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// 최우일
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String r = request.getParameter("r") == null ? "" : request.getParameter("r");
		String c = request.getParameter("c") == null ? "" : request.getParameter("c");
		
		if (!r.equals("1") || r == "") {
			if (!c.equals("1") || c == "") {
				request.setAttribute("url", request.getRequestURI().replace("/heartbeat", ""));
				request.setAttribute("c", "1");
				request.getRequestDispatcher("/").forward(request, response);
				return false;
			}
		}
		
		return true;
	}
}
