/**
 * 
 */
package org.fullstack4.bookstore.util;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 */
public class CookieUtil {
	public CookieUtil() {}
	
	public static void setCookies(HttpServletResponse resp, String name, String val, int expire
			, String domain, String path) {
		Cookie cookie = new Cookie(name,val);
		if( domain != null && !domain.isEmpty()) {
			cookie.setDomain(domain);			
		}
		cookie.setPath(path != null && !path.isEmpty() ? path : "/");
		cookie.setMaxAge(expire);
		resp.addCookie(cookie);
	}
	
	public static String getCookieInfo(HttpServletRequest req , String name) {
		String rtnCookie = "";
		Cookie[] cookies = req.getCookies();
		if ( cookies != null ) {
			for(Cookie c : cookies) {
				if( name.equals(c.getName())){
					rtnCookie= c.getValue();
					break;
				}
			}
		}
		return rtnCookie;
	}
	/* setDeleteCookie(response, "", "/", 0, 쿠키이름, ""); */
	public static void setDeleteCookie(HttpServletResponse resp, String name, String val, int expire
			, String domain, String path) {
		setCookies(resp ,name ,val ,expire ,domain ,path);
		
	}

}
