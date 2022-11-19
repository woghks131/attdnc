package gy.attdnc.admin.common.util;

public class PagingUtil {

	public static void putMySQLPagingLimit(DataMap dataMap, int page, int count) {
		dataMap.put("PAGE_START", count*(page-1));
		dataMap.put("PAGE_END", count);
		dataMap.put("PAGE", page);
		dataMap.put("PAGE_SIZE", count);
	}
}
