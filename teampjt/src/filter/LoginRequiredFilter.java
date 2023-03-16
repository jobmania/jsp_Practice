package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

//@WebFilter({"*.do","abc"})
public class LoginRequiredFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;

        // 요청시 로그인 상태가 아니면 로그인화면으로 다시보내버린다.
        if(request.getSession().getAttribute("username") != null){
            filterChain.doFilter(servletRequest,servletResponse);
        }else {
            request.setAttribute("error","로그인 해야지 작업 가능함");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(servletRequest,servletResponse);
        }

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
