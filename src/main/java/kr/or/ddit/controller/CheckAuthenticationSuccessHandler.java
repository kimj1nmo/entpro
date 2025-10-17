package kr.or.ddit.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Collection;

public class CheckAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        // 사용자의 역할을 확인
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

        // 'ROLE_COMPANY' 역할이 있으면 /companypage/main로 리다이렉트
        for (GrantedAuthority authority : authorities) {
            if ("ROLE_COMPANY".equals(authority.getAuthority())) {
                response.sendRedirect("companypage/main");
                return;
            }
        }
        // 'ROLE_MANAGER' 역할이 있으면 /managepage/main로 리다이렉트

        for (GrantedAuthority authority : authorities) {
            if ("ROLE_MANAGER".equals(authority.getAuthority())) {
                response.sendRedirect("managepage/manage/list");
                return;
            }
        }
        //  기본 페이지로 리다이렉트
        response.sendRedirect("/");
    }
}
