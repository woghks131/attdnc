package gy.attdnc.admin.common.util;

public class ByteConvertUtil {

	public static String byteArrayToHexString(byte[] bytes) {
		char[] hexArray = "0123456789ABCDEF".toCharArray();
	    char[] hexChars = new char[bytes.length * 2];
	    for ( int j = 0; j < bytes.length; j++ ) {
	        int v = bytes[j] & 0xFF;
	        hexChars[j * 2] = hexArray[v >>> 4];
	        hexChars[j * 2 + 1] = hexArray[v & 0x0F];
	    }
	    return new String(hexChars);
	}
	
	public static byte[] hexStringToByteArray(String str) {
	    int len = str.length();
	    byte[] data = new byte[len / 2];
	    for (int i = 0; i < len; i += 2) {
	        data[i / 2] = (byte) ((Character.digit(str.charAt(i), 16) << 4)
	                             + Character.digit(str.charAt(i+1), 16));
	    }
	    return data;
	}
}
