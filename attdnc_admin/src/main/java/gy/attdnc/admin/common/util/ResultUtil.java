package gy.attdnc.admin.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import gy.attdnc.admin.common.exception.ResultException;

public class ResultUtil {
	private static final Logger logger = LoggerFactory.getLogger(ResultUtil.class.getSimpleName());
	
	public static final String KEY_RES_CD = "RES_CD";
	public static final String KEY_RES_MSG = "RES_MSG";
	
	public static final String SUCCESS = "000";
	public static final String UNKNOWN_ERROR = "999";
	
	public static void putSuccessInfo(DataMap dataMap) {
		if(!dataMap.containsKey(KEY_RES_CD)) {
			dataMap.put(KEY_RES_CD, SUCCESS);
		}
	}

	public static void putErrorInfo(Object requestMap, DataMap resultMap, Exception e) {
		
		if(e != null && e instanceof ResultException) {
			resultMap.put(KEY_RES_CD, ((ResultException)e).getCode());
			resultMap.put(KEY_RES_MSG, e.getMessage());
		} else {
			e.printStackTrace();
			resultMap.put(KEY_RES_CD, UNKNOWN_ERROR);
			resultMap.put(KEY_RES_MSG, "알수 없는 에러가 발생하였습니다.");
		}

		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(calendar.getTime());
		
		logger.info("##############ERROR [" + date + "] ##############");
		logger.info("REQUEST ### " + requestMap.toString());
		logger.info("RESULT  ### " + resultMap.toString());
		logger.info("########################################################");
	}
}
