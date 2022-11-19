package gy.attdnc.admin.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DateUtil {
	
	/**
	 * Date -> String 변환
	 * @param date
	 * @param format
	 * @return
	 * @throws Exception
	 */
	public static String formatDate(Date date, String format) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.getDefault());
		return sdf.format(date);
	}
	
	/**
	 * String -> Date 변환
	 * @param dateString
	 * @param format
	 * @return
	 * @throws Exception
	 */
	public static Date parseDate(String dateString, String format) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.getDefault());
		return sdf.parse(dateString);
	}

	public static String formatDayOfWeek(Date date) throws Exception {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

		switch (dayOfWeek) {
			case 1:
				return "일";
			case 2:
				return "월";
			case 3:
				return "화";
			case 4:
				return "수";
			case 5:
				return "목";
			case 6:
				return "금";
			case 7:
				return "토";
		}
		return null;
	}
}
