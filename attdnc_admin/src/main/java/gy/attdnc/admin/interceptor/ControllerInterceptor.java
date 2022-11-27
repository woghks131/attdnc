package gy.attdnc.admin.interceptor;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import gy.attdnc.admin.common.util.DataMap;
import gy.attdnc.admin.common.util.JSMessage;

public class ControllerInterceptor implements HandlerInterceptor {
	public static final String LOGIN_INFO = "loginInfo";
	public static final String BASE_INFO = "baseInfo";
	
	private final Logger logger = LoggerFactory.getLogger(getClass().getSimpleName());
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(calendar.getTime());
		
		logger.info("[" + date + "] " + request.getRequestURI() + " : " + request.getRemoteAddr());
		
		String rootPath = request.getContextPath();
		
//		if((rootPath+"/logout.do").equals(request.getRequestURI())) {
//			setLoginInfo(request, null);
//			JSMessage.goParentAlertURL("로그아웃 처리 되었습니다.", rootPath+"/login.do", response);
//			return false;
//		}
//		
//		DataMap loginInfo = getLoginInfo(request);
//		if(loginInfo == null) {
//			//로그인, 로그인요청 URL 일 경우 패스
//			if((rootPath+"/login.do").equals(request.getRequestURI()) || (rootPath+"/reqLogin.do").equals(request.getRequestURI())
//					||(rootPath+"/org/orgInfoList.do").equals(request.getRequestURI())
//					||(rootPath+"/org/orgOpcoList.do").equals(request.getRequestURI())
//					||(rootPath+"/org/orgAdmPwdSetting.do").equals(request.getRequestURI())) {
//				return true;
//				
//			}
//			
//			JSMessage.goParentAlertURL("로그아웃 되었습니다. 다시 로그인 해주세요.", rootPath+"/login.do", response);
//			return false;
//		} else {
//			//로그인되어 있을 경우 로그인 페이지 접근 시 바로 dashboard로 이동
//			if((rootPath+"/login.do").equals(request.getRequestURI())) {
//				JSMessage.goURL(rootPath+"/indexFrame.do", response);
//				return false;
//			}
//		}
		
		return true;
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object object, Exception e)
			throws Exception {		
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object object, ModelAndView mv) throws Exception {
		
	}
	
	/**
	 * Session의 로그인정보 가져오기
	 * @param request
	 * @return
	 */
	public static DataMap getLoginInfo(HttpServletRequest request) {
		Object loginInfoObj = request.getSession().getAttribute(LOGIN_INFO);
		if(loginInfoObj != null) {
			return (DataMap) loginInfoObj;
		} else {
			return null;
		}
	}
	
	/**
	 * Session에 로그인정보 저장
	 * @param request
	 * @param dataMap
	 */
	public static void setLoginInfo(HttpServletRequest request, DataMap dataMap) {
		request.getSession().setAttribute(LOGIN_INFO, dataMap);
	}
}
