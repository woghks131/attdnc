package gy.attdnc.admin.common.util;

import java.util.Properties;

public class PropertyUtil {

	private static Properties prop;
	
	public static Properties getInstance() {
		if(prop == null) {
			prop = new Properties();
			try {
				ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
				prop.load(classLoader.getResourceAsStream("properties/config.properties"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return prop;
	}
	
	private PropertyUtil() {}
}
