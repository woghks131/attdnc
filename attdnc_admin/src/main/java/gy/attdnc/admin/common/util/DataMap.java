package gy.attdnc.admin.common.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class DataMap extends HashMap<String, Object> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 837928525243799617L;

	@SuppressWarnings("unchecked")
	public static DataMap getRequestParameterMap(HttpServletRequest request) throws Exception {
		DataMap dataMap = new DataMap();
		Map<String, Object> map = request.getParameterMap();
		Iterator<String> iterator = map.keySet().iterator();
		while(iterator.hasNext()) {
			String key = iterator.next();
			String[] values = (String[]) map.get(key);
			
			String value = "";
			
			for(int i=0; i<values.length; i++) {
				if(i > 0) {
					value += ",";
				}
				value += values[i];
			}
			
			dataMap.put(key, value);
		}
		
		return dataMap;
	}
	
	public String getString(String key) {
		Object value = get(key);
		if(value == null) {
			return null;
		}
		
		if(value instanceof String) {
			return (String) value;
		} else {
			return value.toString();
		}
	}
	
	public int getInt(String key) {
		return Integer.valueOf(getString(key));
	}
	
	public int getInt(String key, int defValue) {
		String value = getString(key);
		if(value == null || value.length() == 0) {
			return defValue;
		}
		
		try {
			return Integer.valueOf(getString(key));
		} catch(ClassCastException e) {
			e.printStackTrace();
		}
		
		return defValue;
	}
	
	public static DataMap convertDataMap(Map map) {
		DataMap result = new DataMap();
		result.putAll(map);
		return result;
	}

}
