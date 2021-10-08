package com.toymarket.web;

import java.io.IOException;
import java.nio.file.AccessDeniedException;
import java.util.regex.Pattern;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CustomSessionFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		
		String ajaxHeader = "X-Requested-With";
		String ajaxHeaderValue = "XMLHttpRequest";
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		String currentURI = request.getRequestURI();
		String redirectURI = "/login";
		
		Pattern pattern = Pattern.compile(".+\\.(css|js|jpg|png|ico)(\\?.*)?");
		
		boolean isAjaxRequest = request.getHeader(ajaxHeader) != null && request.getHeader(ajaxHeader).equals(ajaxHeaderValue);
		boolean currentRequestIsStaticResource = pattern.matcher(currentURI).matches();
		boolean ajaxExcuteFilter = (currentURI.contains(".do") && !currentURI.contains("/login") && !currentURI.contains("/logout"));
		boolean generalExcuteFilter = currentURI.contains(".jsp") && !currentURI.contains("/login");
		
		if (isAjaxRequest) {
			String headerStr = request.getHeader("Access-Control-Request-Headers"); 
			if (!currentRequestIsStaticResource && ajaxExcuteFilter) {
				HttpSession session = request.getSession();
				if (session == null || session.getAttribute("LOGINED_USER_INFO") == null) {
					try {
						throw new AccessDeniedException("");
					} catch (AccessDeniedException e) {
						response.sendError(HttpServletResponse.SC_FORBIDDEN);
					}
				}
			}
		} else {
			if (!currentRequestIsStaticResource && generalExcuteFilter) {
				HttpSession session = request.getSession();
				if (session == null || session.getAttribute("LOGINED_USER_INFO") == null) {
					response.sendRedirect(redirectURI);
					return;
				}
			}
		}
		
		chain.doFilter(request, response);
	}
}	
